"
Font dictionary data comprising key-value pairs is represented in a compact tokenized format that is similar to that used to represent Type 1 charstrings.
Dictionary keys are encoded as 1- or 2-byte operators and dictionary values are encoded as variable-size numeric operands that represent either integer or real values.
An operator is preceded by the operand(s) that specify its value.
A DICT is simply a sequence of operand(s)/operator bytes concatenated together.
"
Class {
	#name : #CFFDict,
	#superclass : #Value,
	#instVars : [
		'operations'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFDict class >> fromBytes: aByteStream [
	| list args |
	list := OrderedCollection new.
	args := OrderedCollection new.
	[aByteStream atEnd] whileFalse: [
		| element |
		element := self readElementFrom: aByteStream.
		element respondsToArithmetic
			ifTrue: [args add: element]
			ifFalse: [
			list add: (CFFOperation operator: element operands: args).
			args := OrderedCollection new]].
	^self operations: list
]

{ #category : #accessing }
CFFDict class >> integerFrom: byteStream [
	"<Integer>"

	| b0 b1 b2 b3 b4 |
	b0 := byteStream next.
	(b0 between: 32 and: 246) ifTrue: [
		^b0 - 139].
	b1 := byteStream next.
	(b0 between: 247 and: 250) ifTrue: [
		^(b0 - 247) * 256 + b1 + 108].
	(b0 between: 251 and: 254) ifTrue: [
		^(b0 - 251) negated * 256 - b1 - 108].
	b2 := byteStream next.
	b0 = 28 ifTrue: [
		^(ByteReadStream bigEndianOn: (ByteArray
			with: b1
			with: b2)) nextShort].
	b0 = 29 ifTrue: [
		b3 := byteStream next.
		b4 := byteStream next.
		^(ByteReadStream bigEndianOn: (ByteArray
			with: b1
			with: b2
			with: b3
			with: b4)) nextLong].
	self error: 'no Integer operand'
]

{ #category : #specification }
CFFDict class >> localSpecification [
	<sequence: #operations>
]

{ #category : #'instance creation' }
CFFDict class >> operations: operationsArray [
	| inst |
	inst := self new.
	inst initializeOperations: operationsArray.
	^inst
]

{ #category : #accessing }
CFFDict class >> operatorFrom: byteStream [
	"<Operator>"

	| byte |
	byte := byteStream next.
	byte = 12 ifTrue: [
		^CFFTwoByteDictOperator value: byteStream next].
	^CFFDictOperator value: byte
]

{ #category : #accessing }
CFFDict class >> readElementFrom: byteStream [
	"<Operator | Number>"

	| byte |
	byte := byteStream peek.
	(byte between: 0 and: 21) ifTrue: [
		^self operatorFrom: byteStream].
	byte = 30 ifTrue: [
		^self realFrom: byteStream].
	^self integerFrom: byteStream
]

{ #category : #accessing }
CFFDict class >> realFrom: byteStream [
	"<Number>"

	^(self realStringFrom: byteStream) asNumber
]

{ #category : #accessing }
CFFDict class >> realStringFrom: byteStream [
	"<String>"

	| wst |
	byteStream next = 30 ifFalse: [
		^self error: 'no Real operand'].
	wst := String new writeStream.
	[
	| byte nibble1 nibble2 |
	byte := byteStream next.
	nibble1 := byte bitShift: -4.
	nibble1 = 16rF ifTrue: [
		^wst contents].
	wst nextPutAll: (self stringForRealNibble: nibble1).
	nibble2 := byte bitAnd: 16rF.
	nibble2 = 16rF ifTrue: [
		^wst contents].
	wst nextPutAll: (self stringForRealNibble: nibble2)] repeat
]

{ #category : #accessing }
CFFDict class >> stringForRealNibble: aNibble [
	"<String>"

	(aNibble between: 0 and: 9) ifTrue: [
		^aNibble printString].
	aNibble = 16rA ifTrue: [
		^'.'].
	aNibble = 16rB ifTrue: [
		^'e'].
	aNibble = 16rC ifTrue: [
		^'e-'].
	aNibble = 16rE ifTrue: [
		^'-'].
	aNibble = 16rD ifTrue: [
		self error: 'reserved Real nibble']
]

{ #category : #'initialize-release' }
CFFDict >> initializeOperations: operationsArray [
	(operationsArray notNil and: [
	operationsArray notEmpty]) ifTrue: [
			operations := (Array withAll: operationsArray) beImmutable].
	self beImmutable
]

{ #category : #accessing }
CFFDict >> operations [
	"<Array>"

	^operations ifNil: [#()]
]

{ #category : #printing }
CFFDict >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'operations' value: self operations).
	^printer printvalue: self arguments: args
]

"
The Type 2 Charstring Format, Adobe Technical Note #5177, 16 March 2000

The Type 2 format provides a method for compact encoding of glyph procedures in an outline font program. 
Type 2 charstrings must be used in a CFF (Compact Font Format) or OpenType font file to create a complete font program.
"
Class {
	#name : #CFFCharstring,
	#superclass : #Value,
	#instVars : [
		'bytes'
	],
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #'instance creation' }
CFFCharstring class >> bytes: bytesArray [
	| inst |
	inst := self new.
	inst initializeBytes: bytesArray.
	^inst
]

{ #category : #specification }
CFFCharstring class >> localSpecification [
	<sequence: #bytes>
]

{ #category : #accessing }
CFFCharstring >> bytes [
	"<Array>"

	^bytes ifNil: [#()]
]

{ #category : #'initialize-release' }
CFFCharstring >> initializeBytes: bytesArray [
	(bytesArray notNil and: [
	bytesArray notEmpty]) ifTrue: [
			bytes := (Array withAll: bytesArray) beImmutable].
	self beImmutable
]

{ #category : #reading }
CFFCharstring >> integerFrom: byteStream [
	"<Integer>"

	| b0 b1 |
	b0 := byteStream next.
	(b0 between: 32 and: 246) ifTrue: [
		^b0 - 139].
	b1 := byteStream next.
	(b0 between: 247 and: 250) ifTrue: [
		^(b0 - 247) * 256 + b1 + 108].
	(b0 between: 251 and: 254) ifTrue: [
		^(b0 - 251) negated * 256 - b1 - 108].
	self error: 'no Integer operand'
]

{ #category : #accessing }
CFFCharstring >> operations [
	"<SequenceableCollection of: Operation>"

	| operations args rst |
	operations := OrderedCollection new.
	args := OrderedCollection new.
	rst := self bytes readStream.
	[rst atEnd] whileFalse: [
		| element |
		element := self readElementFrom: rst.
		element respondsToArithmetic
			ifTrue: [args add: element]
			ifFalse: [
			operations add: (CFFOperation operator: element operands: args).
			args := OrderedCollection new]].
	^operations
]

{ #category : #reading }
CFFCharstring >> operatorFrom: byteStream [
	"<Operator>"

	| byte |
	byte := byteStream next.
	byte = 12 ifTrue: [
		^CFFTwoByteCharstringOperator value: byteStream next].
	^CFFCharstringOperator value: byte
]

{ #category : #printing }
CFFCharstring >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer array: 'bytes' value: self bytes).
	^printer printvalue: self arguments: args
]

{ #category : #reading }
CFFCharstring >> readElementFrom: byteStream [
	"<Operator | Number>"

	| byte |
	byte := byteStream peek.
	byte = 28 ifTrue: [
		^self shortIntFrom: byteStream].
	(byte between: 0 and: 31) ifTrue: [
		^self operatorFrom: byteStream].
	byte = 255 ifTrue: [
		^self signedFractionFrom: byteStream].
	^self integerFrom: byteStream
]

{ #category : #reading }
CFFCharstring >> shortIntFrom: byteStream [
	"<Integer>"

	byteStream next = 28 ifFalse: [
		^self error: 'no Integer operand'].
	^(ByteReadStream bigEndianOn: (byteStream next: 2)) nextShort
]

{ #category : #reading }
CFFCharstring >> signedFractionFrom: byteStream [
	"<Number>"

	| integer fraction rst |
	byteStream next = 255 ifFalse: [
		^self error: 'no Integer operand'].
	rst := ByteReadStream bigEndianOn: (byteStream next: 4).
	integer := rst nextShort.
	fraction := rst nextShort.
	^integer + (fraction / 256)
]

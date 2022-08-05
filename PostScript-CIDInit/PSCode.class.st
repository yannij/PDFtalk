"
One or more bytes representing a code point in a CMap

Knows how many bytes are used, even if they are all 0
"
Class {
	#name : #PSCode,
	#superclass : #PSMappingSource,
	#instVars : [
		'bytes'
	],
	#category : #'PostScript-CIDInit'
}

{ #category : #'instance creation' }
PSCode class >> bytes: bytesByteArray [
	| inst |
	inst := self new.
	inst initializeBytes: bytesByteArray.
	^inst
]

{ #category : #'instance creation' }
PSCode class >> fromInteger: anIntegerOrCode [
	| bytes rest |
	anIntegerOrCode class == self ifTrue: [
		^anIntegerOrCode].
	anIntegerOrCode negative ifTrue: [
		^self error: 'a code can only be created from a positive integer'].
	anIntegerOrCode isZero ifTrue: [
		^self bytes: #[0]].
	bytes := OrderedCollection new.
	rest := anIntegerOrCode.
	[rest > 0] whileTrue: [
		bytes add: (rest bitAnd: 255).
		rest := rest bitShift: -8].
	^self bytes: (ByteArray withAll: bytes reverse)
]

{ #category : #specification }
PSCode class >> localSpecification [
	<constant: #bytes class: #ByteArray comment: 'the bytes of the receiver - usually not more than 4'>
]

{ #category : #'instance creation' }
PSCode class >> withByte: anInteger [
	^self bytes: (ByteArray with: anInteger)
]

{ #category : #'instance creation' }
PSCode class >> withBytes: someBytes [
	^self bytes: (ByteArray withAll: someBytes)
]

{ #category : #comparing }
PSCode >> < aMappingSource [
	^aMappingSource greaterThanCode: self
]

{ #category : #comparing }
PSCode >> <= aMappingSource [
	^aMappingSource greaterThanOrEqualToCode: self
]

{ #category : #converting }
PSCode >> asCharacter [
	^self asInteger asCharacter
]

{ #category : #converting }
PSCode >> asInteger [
	^self bytes inject: 0 into: [:integer :byte | (integer bitShift: 8) bitOr: byte]
]

{ #category : #accessing }
PSCode >> bytes [
	"<ByteArray>
	the bytes of the receiver - usually not more than 4"

	^bytes
]

{ #category : #accessing }
PSCode >> first [
	^self
]

{ #category : #accessing }
PSCode >> firstByte [
	"<Integer[0..255]>"

	^self bytes first
]

{ #category : #comparing }
PSCode >> greaterThanCode: aCode [
	1 to: (self length min: aCode length) do: [:index |
		(self bytes at: index) ~= (aCode bytes at: index) ifTrue: [
			^(self bytes at: index) > (aCode bytes at: index)]].
	^self length > aCode length
]

{ #category : #comparing }
PSCode >> greaterThanOrEqualToCode: aCode [
	1 to: (self length min: aCode length) do: [:index |
		(self bytes at: index) ~= (aCode bytes at: index) ifTrue: [
			^(aCode bytes at: index) <= (self bytes at: index)]].
	^self length >= aCode length
]

{ #category : #testing }
PSCode >> includesCode: aCode [
	^self = aCode
]

{ #category : #'initialize-release' }
PSCode >> initializeBytes: bytesByteArray [
	bytes := bytesByteArray.
	self beImmutable
]

{ #category : #testing }
PSCode >> isAfterCode: aCode [
	"the length of the receiver must be the same as the length of aCode.
	Should not be called with different lengths"

	^((1 to: self length - 1) allSatisfy: [:index |
		(self bytes at: index) = (aCode bytes at: index)]) and: [
		self bytes last = (aCode bytes last + 1)]
]

{ #category : #testing }
PSCode >> isAfterRange: aRange [
	^aRange last isNext: self
]

{ #category : #testing }
PSCode >> isBefore: aMappingSource [	
	^self < aMappingSource first
]

{ #category : #testing }
PSCode >> isInRange: aRange [
	^aRange includesCode: self
]

{ #category : #testing }
PSCode >> isNext: aMappingSource [
	^aMappingSource isAfterCode: self
]

{ #category : #accessing }
PSCode >> last [
	^self
]

{ #category : #accessing }
PSCode >> length [
	^self bytes size
]

{ #category : #accessing }
PSCode >> mappingClass [
	^PSCharMapping
]

{ #category : #converting }
PSCode >> mappingFrom: aMappingSource [
	^aMappingSource mappingToCode: self
]

{ #category : #converting }
PSCode >> mappingsFrom: aMappingSource [
	^Array with: (self mappingFrom: aMappingSource)
]

{ #category : #accessing }
PSCode >> next [
	"<Code>
	the next code after the receiver"

	| pad next |
	pad := ByteArray new: self bytes size withAll: 0.
	next := self class fromInteger: self asInteger + 1.
	next bytes size = pad size ifTrue: [
		^next].
	^self class bytes: (pad , next bytes last: pad size)
]

{ #category : #accessing }
PSCode >> numberOfCodes [
	^1
]

{ #category : #accessing }
PSCode >> previous [
	"<Code>
	the code directly before the receiver"

	| pad next |
	pad := ByteArray new: self bytes size withAll: 0.
	next := self class fromInteger: self asInteger - 1.
	next bytes size = pad size ifTrue: [
		^next].
	^self class bytes: (pad , next bytes last: pad size)
]

{ #category : #printing }
PSCode >> printOn: aStream [
	aStream nextPut: $<.
	self bytes do: [:byte | aStream nextPutAll: byte printPostScriptHexByte].
	aStream nextPut: $>
]

{ #category : #printing }
PSCode >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'bytes' value: self bytes).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PSCode >> psMappedCharacter [
	"<Character>"

	^self asCharacter
]

{ #category : #converting }
PSCode >> to: aCode [
	^PSRange withFirst: self andLast: aCode
]

{ #category : #converting }
PSCode >> withByte: anInteger [
	^self class bytes: self bytes , (ByteArray with: anInteger)
]

{ #category : #converting }
PSCode >> withBytes: someBytes [
	^self class bytes: self bytes , (ByteArray withAll: someBytes)
]

{ #category : #converting }
PSCode >> withoutFirstByte [
	^self class bytes: (self bytes allButFirst: 1)
]

"
stream to read binary data

"
Class {
	#name : #ByteReadStream,
	#superclass : #ReadStream,
	#instVars : [
		'bigEndian'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #'instance creation' }
ByteReadStream class >> bigEndianOn: aByteArray [
	| inst |
	inst := self on: aByteArray.
	inst bigEndian: true.
	^inst
]

{ #category : #'instance creation' }
ByteReadStream class >> littleEndianOn: aByteArray [
	| inst |
	inst := self on: aByteArray.
	inst bigEndian: false.
	^inst
]

{ #category : #accessing }
ByteReadStream class >> systemIsBigEndian [
	^UninterpretedBytes isBigEndian
]

{ #category : #'accessing by position' }
ByteReadStream >> atPosition: anInteger do: oneArgumentBlock [
	"<Integer>"

	| old |
	old := self position.
	self position: anInteger - 1.
	^[oneArgumentBlock value: self] ensure: [self position: old]
]

{ #category : #accessing }
ByteReadStream >> bigEndian [
	"<Boolean>
	true iff big endian, false iff little endian"

	^bigEndian ifNil: [self class systemIsBigEndian]
]

{ #category : #accessing }
ByteReadStream >> bigEndian: aBoolean [
	bigEndian := aBoolean
]

{ #category : #'accessing by position' }
ByteReadStream >> longAt: anInteger [
	"<Integer>"

	^self atPosition: anInteger do: #nextLong
]

{ #category : #'accessing by position' }
ByteReadStream >> longLongAt: anInteger [
	"<Integer>"

	^self atPosition: anInteger do: #nextLongLong
]

{ #category : #'accessing stream' }
ByteReadStream >> nextBooleanByte [
	"<Boolean>"

	^(self nextOrError: 1) first isZero not
]

{ #category : #'accessing stream' }
ByteReadStream >> nextLong [
	"<Integer>"

	| rst b0 b1 b2 w h |
	rst := self nextLongBytes readStream.
	b0 := rst next.
	b1 := rst next.
	b2 := rst next.
	w := rst next.
	h := ((b0 bitAnd: 16r7F) - (b0 bitAnd: 16r80) bitShift: 8) + b1.
	b2 = 0 ifFalse: [
		w := (b2 bitShift: 8) + w].
	h = 0 ifFalse: [
		w := (h bitShift: 16) + w].
	^w
]

{ #category : #'accessing stream' }
ByteReadStream >> nextLongBytes [
	"<Array[4] of: Integer>
	in big endian format for internal use"

	| bytes |
	bytes := self nextOrError: 4.
	self bigEndian ifTrue: [
		^bytes].
	^bytes reverse
]

{ #category : #'accessing stream' }
ByteReadStream >> nextLongLong [
	"<Integer>"

	| rst b0 b1 b2 b3 b4 b5 b6 w h |
	rst := self nextLongLongBytes readStream.
	b0 := rst next.
	b1 := rst next.
	b2 := rst next.
	b3 := rst next.
	b4 := rst next.
	b5 := rst next.
	b6 := rst next.
	w := rst next.
	h := ((b0 bitAnd: 16r7F) - (b0 bitAnd: 16r80) bitShift: 8) + b1.
	b6 = 0 ifFalse: [
		w := (b6 bitShift: 8) + w].
	b5 = 0 ifFalse: [
		w := (b5 bitShift: 16) + w].
	b4 = 0 ifFalse: [
		w := (b4 bitShift: 24) + w].
	b3 = 0 ifFalse: [
		w := (b3 bitShift: 32) + w].
	b2 = 0 ifFalse: [
		w := (b2 bitShift: 40) + w].
	h = 0 ifFalse: [
		w := (h bitShift: 48) + w].
	^w
]

{ #category : #'accessing stream' }
ByteReadStream >> nextLongLongBytes [
	"<Array[8] of: Integer>
	in big endian format for internal use"

	| bytes |
	bytes := self nextOrError: 8.
	self bigEndian ifTrue: [
		^bytes].
	^bytes reverse
]

{ #category : #'accessing stream' }
ByteReadStream >> nextOrError: anInteger [
	"<Array of: Integer>
	raise IncompleteNextCountError when there are not enough elements available"
	
	^self next: anInteger
]

{ #category : #'accessing stream' }
ByteReadStream >> nextShort [
	"<Integer>"

	| word |
	word := self nextUnsignedShort.
	^(word bitAnd: 16r7FFF) - (word bitAnd: 16r8000)
]

{ #category : #'accessing stream' }
ByteReadStream >> nextString [
	"<ByteString>"

	^(self upTo: 0) asString
]

{ #category : #'accessing stream' }
ByteReadStream >> nextUnsignedLong [
	"<Integer>"

	| rst b0 b1 b2 w |
	rst := self nextLongBytes readStream.
	b0 := rst next.
	b1 := rst next.
	b2 := rst next.
	w := rst next.
	b2 = 0 ifFalse: [
		w := (b2 bitShift: 8) + w].
	b1 = 0 ifFalse: [
		w := (b1 bitShift: 16) + w].
	b0 = 0 ifFalse: [
		w := (b0 bitShift: 24) + w].
	^w
]

{ #category : #'accessing stream' }
ByteReadStream >> nextUnsignedShort [
	"<Integer>"

	| bytes byte1 byte2 |
	bytes := self nextOrError: 2.
	byte1 := bytes first.
	byte2 := bytes last.
	self bigEndian ifTrue: [
		^(byte1 bitShift: 8) + byte2].
	^(byte2 bitShift: 8) + byte1
]

{ #category : #'accessing by position' }
ByteReadStream >> shortAt: anInteger [
	"<Integer>"

	^self atPosition: anInteger do: #nextShort
]

{ #category : #'accessing by position' }
ByteReadStream >> unsignedLongAt: anInteger [
	"<Integer>"

	^self atPosition: anInteger do: #nextUnsignedLong
]

{ #category : #'accessing by position' }
ByteReadStream >> unsignedShortAt: anInteger [
	"<Integer>"

	^self atPosition: anInteger do: #nextUnsignedShort
]

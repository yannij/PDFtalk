"
stream to write binary data
"
Class {
	#name : #ByteWriteStream,
	#superclass : #WriteStream,
	#instVars : [
		'bigEndian'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #'instance creation' }
ByteWriteStream class >> bigEndianOn: aByteArray [
	| inst |
	inst := self on: aByteArray.
	inst bigEndian: true.
	^inst
]

{ #category : #'instance creation' }
ByteWriteStream class >> littleEndianOn: aByteArray [
	| inst |
	inst := self on: aByteArray.
	inst bigEndian: false.
	^inst
]

{ #category : #accessing }
ByteWriteStream class >> systemIsBigEndian [
	^UninterpretedBytes isBigEndian
]

{ #category : #accessing }
ByteWriteStream >> bigEndian [
	"<Boolean>
	true iff big endian, false iff little endian"

	^bigEndian ifNil: [self class systemIsBigEndian]
]

{ #category : #accessing }
ByteWriteStream >> bigEndian: aBoolean [
	bigEndian := aBoolean
]

{ #category : #accessing }
ByteWriteStream >> nextPutBooleanByte: aBoolean [
	self nextPut: (aBoolean
		ifTrue: [1]
		ifFalse: [0])
]

{ #category : #accessing }
ByteWriteStream >> nextPutLong: anInteger [
	| b0 b1 b2 b3 |
	b0 := anInteger bitShift: -24.
	b0 := (b0 bitAnd: 16r7F) - (b0 bitAnd: -16r80).
	b1 := (anInteger bitShift: -16) bitAnd: 16rFF.
	b2 := (anInteger bitShift: -8) bitAnd: 16rFF.
	b3 := anInteger bitAnd: 16rFF.
	self bigEndian ifTrue: [
		self nextPut: b0.
		self nextPut: b1.
		self nextPut: b2.
		^self nextPut: b3].
	self nextPut: b3.
	self nextPut: b2.
	self nextPut: b1.
	self nextPut: b0
]

{ #category : #accessing }
ByteWriteStream >> nextPutLongLong: anInteger [
	"bit representation of 64 bit negative numbers are differnt in VW and GS - dont use #bitShift:"
	
	| b0 b1 b2 b3 b4 b5 b6 b7 |
	b0 := anInteger // (2 raisedTo: 56).
	b0 := (b0 bitAnd: 16r7F) - (b0 bitAnd: -16r80).
	b1 := (anInteger // (2 raisedTo: 48)) bitAnd: 16rFF.
	b2 := (anInteger // (2 raisedTo: 40)) bitAnd: 16rFF.
	b3 := (anInteger // (2 raisedTo: 32)) bitAnd: 16rFF.
	b4 := (anInteger // (2 raisedTo: 24)) bitAnd: 16rFF.
	b5 := (anInteger // (2 raisedTo: 16)) bitAnd: 16rFF.
	b6 := (anInteger // (2 raisedTo: 8)) bitAnd: 16rFF.
	b7 := anInteger bitAnd: 16rFF.
	self bigEndian ifTrue: [
		self nextPut: b0.
		self nextPut: b1.
		self nextPut: b2.
		self nextPut: b3.
		self nextPut: b4.
		self nextPut: b5.
		self nextPut: b6.
		^self nextPut: b7].
	self nextPut: b7.
	self nextPut: b6.
	self nextPut: b5.
	self nextPut: b4.
	self nextPut: b3.
	self nextPut: b2.
	self nextPut: b1.
	self nextPut: b0
]

{ #category : #accessing }
ByteWriteStream >> nextPutShort: anInteger [
	self nextPutUnsignedShort: (anInteger bitAnd: 16r7FFF) - (anInteger bitAnd: -16r8000)
]

{ #category : #accessing }
ByteWriteStream >> nextPutString: aByteString [
	self
		nextPutAll: aByteString asByteArray;
		nextPut: 0
]

{ #category : #accessing }
ByteWriteStream >> nextPutUnsignedLong: anInteger [
	| b0 b1 b2 b3 |
	b0 := anInteger bitShift: -24.
	b1 := (anInteger bitShift: -16) bitAnd: 16rFF.
	b2 := (anInteger bitShift: -8) bitAnd: 16rFF.
	b3 := anInteger bitAnd: 16rFF.
	self bigEndian ifTrue: [
		self nextPut: b0.
		self nextPut: b1.
		self nextPut: b2.
		^self nextPut: b3].
	self nextPut: b3.
	self nextPut: b2.
	self nextPut: b1.
	self nextPut: b0
]

{ #category : #accessing }
ByteWriteStream >> nextPutUnsignedShort: anInteger [
	| b0 b1 |
	b0 := anInteger bitShift: -8.
	b1 := anInteger bitAnd: 16rFF.
	self bigEndian ifTrue: [
		self nextPut: b0.
		^self nextPut: b1].
	self nextPut: b1.
	self nextPut: b0
]

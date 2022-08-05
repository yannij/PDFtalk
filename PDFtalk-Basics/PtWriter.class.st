"
A stream to write PDF objects to a byte stream
"
Class {
	#name : #PtWriter,
	#superclass : #WriteStream,
	#category : #'PDFtalk-Basics'
}

{ #category : #'instance creation' }
PtWriter class >> new [
	^self on: ByteArray new
]

{ #category : #'character writing' }
PtWriter >> cr [
	self nextPutByte: 10
]

{ #category : #testing }
PtWriter >> hasUnbalancedParenthesis: aPDFString [
	| count rst |
	count := 0.
	rst := aPDFString content asString readStream.
	[rst atEnd] whileFalse: [
		| char |
		char := rst next.
		char = $( ifTrue: [
			count := count + 1].
		char = $) ifTrue: [
			count := count - 1.
			count negative ifTrue: [
				^true]]].
	^count isZero not
]

{ #category : #testing }
PtWriter >> nextPutByte: aByte [
	^self nextPut: aByte
]

{ #category : #testing }
PtWriter >> nextPutCharacter: aCharacter [
	self nextPutAll: (String with: aCharacter) convertToByteArray.
	^aCharacter
]

{ #category : #writing }
PtWriter >> nextPutHexString: aPDFString [
	self nextPutByte: $< asInteger.
	self nextPutAll: (PtHexStringEncoder encoded: aPDFString content asString).
	self nextPutByte: $> asInteger
]

{ #category : #writing }
PtWriter >> nextPutName: aPDFName [
	self nextPutByte: $/ asInteger.
	self nextPutNameWithoutSolidus: aPDFName
]

{ #category : #writing }
PtWriter >> nextPutNameWithoutSolidus: aPDFName [
	(aPDFName content isNil or: [
	aPDFName content isEmpty]) ifTrue: [
			^self].
	self nextPutAll: (PtNameEncoder encoded: aPDFName content asString)
]

{ #category : #writing }
PtWriter >> nextPutString: aPDFString [
	self nextPutByte: $( asInteger.
	aPDFString isEmpty ifFalse: [
		self nextPutAll: (PtStringEncoder encoded: aPDFString content asString)].
	self nextPutByte: $) asInteger
]

{ #category : #'character writing' }
PtWriter >> space [
	self nextPutByte: 32
]

{ #category : #'character writing' }
PtWriter >> tab [
	self nextPutByte: 9
]

{ #category : #writing }
PtWriter >> writeCrossReferenceSection: aCrossReferenceSection [
	self
		cr;
		nextPutAll: 'xref' asByteArray;
		cr.
	aCrossReferenceSection writePDFOn: self indent: 0
]

{ #category : #writing }
PtWriter >> writeStartxref: anInteger [
	"write the last lines of the PDF with the start position of the reference table"

	self
		cr;
		nextPutAll: 'startxref' asByteArray;
		cr;
		nextPutAll: anInteger printString asByteArray;
		cr;
		nextPutAll: '%%EOF' asByteArray
]

{ #category : #writing }
PtWriter >> writeTrailer: aTrailer [
	self
		cr;
		nextPutAll: 'trailer' asByteArray;
		cr.
	aTrailer writePDFOn: self indent: 0
]

{ #category : #writing }
PtWriter >> writeVersionHeader: aVersion [
	"write the first 2 lines of a PDF file with the PDF version of the objects.
	write binary data in the second line to cue readers that the file is binary."

	self nextPutByte: $% asInteger.
	aVersion writePDFOn: self indent: 0.
	self
		cr;
		nextPutByte: $% asInteger;
		nextPutAll: #[226 227 207 211];
		cr
]

"
A de- and en-coder for PDF Names (see PDF 32000_2008.pdf p.17)

Use String>>fromPdfName to convert from PDF to Smalltalk
Use String>>asPdfName to convert from Smalltalk to PDF
"
Class {
	#name : #PtNameEncoder,
	#superclass : #PDFEncoder,
	#category : #'PDFtalk-Basics'
}

{ #category : #reading }
PtNameEncoder >> nextCharacter [
	| char |
	char := stream next.
	char == $# ifFalse: [
		^char].
	^(self integerFrom: (stream next: 2) radix: 16) asCharacter
]

{ #category : #writing }
PtNameEncoder >> nextPut: aCharacter [
	"put the character equivalent to the PDF aCharacter onto aStream"

	| i |
	i := aCharacter asInteger.
	(aCharacter isPdfRegular and: [
	(i between: 16r21 and: 16r7E) and: [
	(aCharacter == $#) not]]) ifTrue: [
			^stream nextPut: i].
	stream nextPut: $# asInteger.
	stream nextPutAll: (aCharacter asInteger printStringRadix: 16) asByteArray
]

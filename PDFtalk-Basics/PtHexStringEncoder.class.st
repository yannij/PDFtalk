"
A de- and en-coder for PDF Hexadecimal Strings (see PDF 32000_2008.pdf p.16)

Use String>>fromPdfHexString to convert from PDF to Smalltalk
Use String>>asPdfHexString to convert from Smalltalk to PDF
"
Class {
	#name : #PtHexStringEncoder,
	#superclass : #PDFEncoder,
	#category : #'PDFtalk-Basics'
}

{ #category : #reading }
PtHexStringEncoder >> nextCharacter [
	| hex1 hexString |
	hex1 := (self nextHexFrom: stream) ifNil: [
		^nil].
	hexString := String
		with: hex1
		with: ((self nextHexFrom: stream) ifNil: [$0]).
	^(self integerFrom: hexString radix: 16) asCharacter
]

{ #category : #reading }
PtHexStringEncoder >> nextHexFrom: aStream [
	"<Character | nil>
	read until we find a valid hexadecimal character.
	nil iff at the end of the stream"

	| character |
	character := aStream next.
	character ifNil: [
		^nil].
	(#(8 9 10 12 13 32) includes: character asInteger) ifTrue: [
		^self nextHexFrom: aStream].
	(character isDigit or: [
	'abcdef' includes: character asLowercase]) ifTrue: [
			^character].
	^self unknownHexCharacter: character
]

{ #category : #writing }
PtHexStringEncoder >> nextPut: aCharacter [
	"put the character equivalent to the PDF aCharacter onto aStream"

	| string |
	(stream position > 63 and: [
	(stream position rem: 64) <= 1]) ifTrue: [
			stream nextPut: Character lf asInteger].
	string := aCharacter asInteger printStringRadix: 16.
	string size = 1 ifTrue: [
		string := '0' , string].
	stream nextPutAll: string asByteArray
]

{ #category : #reading }
PtHexStringEncoder >> unknownHexCharacter: aCharacter [
	(UnsupportedCharacterError new)
		messageText: aCharacter printString, ' is not a hexadecimal character';
		parameter: aCharacter;
		raiseSignal.
	^Character illegalCode asCharacter
]

"
A de- and en-coder for PDF Literal Strings (see PDF 32000_2008.pdf p.15)

Use String>>fromPdfString to convert from PDF to Smalltalk
Use String>>asPdfString to convert from Smalltalk to PDF
"
Class {
	#name : #PtStringEncoder,
	#superclass : #PDFEncoder,
	#instVars : [
		'quoteParenthesis'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #reading }
PtStringEncoder >> characterFormOctal: octalString [
	"<Character>"

	^(self integerFrom: octalString radix: 8) asCharacter
]

{ #category : #testing }
PtStringEncoder >> hasUnbalancedParenthesis: aString [
	| count rst |
	count := 0.
	rst := aString readStream.
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

{ #category : #reading }
PtStringEncoder >> nextCharacter [
	| character |
	character := stream next.
	character ifNil: [
		^nil].
	character == $\ ifTrue: [
		^self nextQuotedCharacterFrom: stream].
	^character
]

{ #category : #reading }
PtStringEncoder >> nextOctalCharacterWith: firstDigit from: aStream [
	| secondDigit |
	(aStream peek ifNil: [false] ifNotNil: [:c | c isDigit]) ifFalse: [
		^self characterFormOctal: (String with: firstDigit)].
	secondDigit := aStream next.
	(aStream peek ifNil: [false] ifNotNil: [:c | c isDigit]) ifFalse: [
		^self characterFormOctal: (String
			with: firstDigit
			with: secondDigit)].
	^self characterFormOctal: (String
		with: firstDigit
		with: secondDigit
		with: aStream next)
]

{ #category : #writing }
PtStringEncoder >> nextPut: aCharacter [
	"put the character equivalent to the PDF aCharacter onto aStream"

	| i |
	i := aCharacter asInteger.
	(i between: 32 and: 127) ifTrue: [
		(self shouldQuote: aCharacter) ifTrue: [
			stream nextPut: $\ asInteger].
		^stream nextPut: i].
	(#(8 9 10 12) includes: i) ifTrue: [
		^stream nextPut: i].
	i = 13 ifTrue: [
		^stream nextPut: 10].
	self putOctal: i
]

{ #category : #reading }
PtStringEncoder >> nextQuotedCharacterFrom: aStream [
	"we just read a quote (\). Decifer the following"

	| character |
	character := aStream next.
	character == Character cr ifTrue: [
		^nil].
	character == Character lf ifTrue: [
		^nil].
	character == $n ifTrue: [
		^Character lf].
	character == $r ifTrue: [
		^Character lf].
	character == $t ifTrue: [
		^Character tab].
	character == $b ifTrue: [
		^Character backspace].
	character == $f ifTrue: [
		^Character newPage].
	('()\' includes: character) ifTrue: [
		^character].
	character isDigit ifTrue: [
		^self nextOctalCharacterWith: character from: aStream].
	"ignore backslash without known directive"
	aStream skip: -1.
	^nil
]

{ #category : #writing }
PtStringEncoder >> noEncodingFor: aCharacter [
	(UnsupportedCharacterError new)
		messageText: (#errNoCharacter << #dialogs >> 'No character available') asString , ' for character value ' , aCharacter asInteger printString;
		character: aCharacter;
		raiseSignal.
	^Character illegalCode asCharacter
]

{ #category : #writing }
PtStringEncoder >> putOctal: integer [
	| numberString |
	(integer between: 0 and: 255) ifFalse: [
		^self noEncodingFor: integer asCharacter].
	numberString := integer printStringRadix: 8.
	stream nextPut: $\ asInteger.
	3 - numberString size timesRepeat: [stream nextPut: $0 asInteger].
	stream nextPutAll: numberString asByteArray
]

{ #category : #accessing }
PtStringEncoder >> quoteParenthesis [
	^quoteParenthesis ifNil: [false]
]

{ #category : #accessing }
PtStringEncoder >> quoteParenthesis: aBoolean [
	quoteParenthesis := aBoolean
]

{ #category : #writing }
PtStringEncoder >> setupWriteStreamFor: aString [
	super setupWriteStreamFor: aString.
	self quoteParenthesis: (self hasUnbalancedParenthesis: aString)
]

{ #category : #testing }
PtStringEncoder >> shouldQuote: aCharacter [
	^aCharacter = $\ or: [
	self quoteParenthesis and: [
	'()' includes: aCharacter]]
]

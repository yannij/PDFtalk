Extension { #name : #Number }

{ #category : #'*PDFtalk-Parsing-reading' }
Number class >> readPDFNumberFrom: aStream [
	"<Number>
	the sign has been consumed already"

	| integer digits numerator denominator |
	integer := (self readDigitsFrom: aStream) inject: 0 into: [:number :digit | number * 10 + digit].
	(aStream peekFor: $.) ifFalse: [
		^integer].
	digits := self readDigitsFrom: aStream.
	numerator := digits inject: 0 into: [:number :digit | number * 10 + digit].
	denominator := 10 raisedTo: digits size.
	^integer + (numerator / denominator)
]

{ #category : #'*PDFtalk-Parsing-reading' }
Number class >> readPDFSyntaxFrom: aStream [
	"<Number>
	a decimal number"

	| negative number |
	aStream peekFor: $+.
	negative := aStream peekFor: $-.
	number := self readPDFNumberFrom: aStream.
	negative ifTrue: [
		^number negated].
	^number
]

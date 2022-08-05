Extension { #name : #Number }

{ #category : #'*PostScript-converting' }
Number >> asPostScriptInteger [
	^self truncated
]

{ #category : #'*PostScript-converting' }
Number >> asPostScriptReal [
	^self
]

{ #category : #'*PostScript-converting' }
Number >> asPostScriptString [
	^self printPostScript
]

{ #category : #'*PostScript-reading' }
Number class >> digitFor: aCharacter base: aBase [
	"<Integer>
	anInteger is between 2 and 36"

	| digit |
	digit := self radixDigitFor: aCharacter.
	digit >= aBase ifTrue: [
		self error: aCharacter printString , ' is not a valid digit for base ' , aBase printString].
	^digit
]

{ #category : #'*PostScript-printing' }
Number >> postScriptEpsilon [
	"Nonzero real values closest to the next integer (approximate).
Values closer than these are automatically converted to the integer."
	"Float fmin is 1.4013e-45"
 
	^1.175d-38
]

{ #category : #'*PostScript-comparing' }
Number >> postScriptGreaterEqual: aNumber [
	^self >= aNumber
]

{ #category : #'*PostScript-comparing' }
Number >> postScriptGreaterThan: aNumber [
	^self > aNumber
]

{ #category : #'*PostScript-reading' }
Number class >> postScriptIntegerFrom: aString base: aBase [
	"<Integer>
	anInteger is between 2 and 36"

	^(aString asArray collect: [:char | self digitFor: char base: aBase]) inject: 0 into: [:number :digit |
		number * aBase + digit]
]

{ #category : #'*PostScript-comparing' }
Number >> postScriptLessEqual: aNumber [
	^self <= aNumber
]

{ #category : #'*PostScript-comparing' }
Number >> postScriptLessThan: aNumber [
	^self < aNumber
]

{ #category : #'*PostScript-printing' }
Number >> postScriptSignificantDecimals [
	"Significant decimal digits of precision (approximate)."

	^8
]

{ #category : #'*PostScript-accessing' }
Number >> postScriptType [
	^#realtype
]

{ #category : #'*PostScript-printing' }
Number >> printPostScriptOn: aStream [
	| integer fraction rounded precision |
	self abs < self postScriptEpsilon ifTrue: [
		aStream nextPut: $0.
		^self].
	self negative ifTrue: [
		| wst string |
		wst := String new writeStream.
		self negated printPostScriptOn: wst.
		string := wst contents.
		string = '0' ifTrue: [
			aStream nextPut: $0.
			^self].
		aStream nextPut: $-.
		aStream nextPutAll: string.
		^self].
	integer := self truncated.
	integer printPostScriptOn: aStream.
	fraction := self - integer.
	precision := 10 raisedTo: self postScriptSignificantDecimals.
	rounded := (fraction * precision) rounded.
	rounded strictlyPositive ifTrue: [
		aStream nextPut: $..
		rounded / precision writeFractionDecimalsOn: aStream]
]

{ #category : #'*PostScript-reading' }
Number class >> radixDigitFor: aCharacter [
	| code |
	code := aCharacter asInteger.
	(code between: $0 asInteger and: $9 asInteger) ifTrue: [
		^code - $0 asInteger].
	(code between: $a asInteger and: $z asInteger) ifTrue: [
		^code - $a asInteger + 10].
	(code between: $A asInteger and: $Z asInteger) ifTrue: [
		^code - $A asInteger + 10].
	self error: 'illegal character for a radix number'
]

{ #category : #'*PostScript-reading' }
Number class >> readDigitsFrom: aStream [
	"<SequenceableCollection on: Integer[0..9]>
	read all decimal digits off aStream"

	| wst zeroCode |
	wst := Array new writeStream.
	zeroCode := $0 asInteger.
	[aStream atEnd] whileFalse: [
		(aStream peek between: $0 and: $9)
			ifTrue: [
			wst nextPut: aStream next asInteger - zeroCode]
			ifFalse: [
			^wst contents]].
	^wst contents
]

{ #category : #'*PostScript-reading' }
Number class >> readPostScriptNumberFrom: aStream [
	"<Number | nil>
	the sign has been consumed already"

	| number |
	number := (self readDigitsFrom: aStream) inject: 0 into: [:num :digit | num * 10 + digit].
	aStream atEnd ifTrue: [
		^number].
	(aStream peekFor: $#) ifTrue: [
		^self postScriptIntegerFrom: aStream upToEnd base: number].
	(aStream peekFor: $.) ifTrue: [
		| digits numerator denominator |
		digits := self readDigitsFrom: aStream.
		numerator := digits inject: 0 into: [:num :digit | num * 10 + digit].
		denominator := 10 raisedTo: digits size.
		number := number + (numerator / denominator).
		aStream atEnd ifTrue: [
			^number]].
	('eE' includes: aStream peek) ifTrue: [
		| exponent |
		aStream next.
		exponent := self readPostScriptSyntaxFrom: aStream.
		exponent ifNil: [
			^nil].
		^number * (10 raisedTo: exponent)].
	^nil
]

{ #category : #'*PostScript-reading' }
Number class >> readPostScriptSyntaxFrom: aStream [
	"<Number>
	a decimal number"

	| negative number |
	aStream peekFor: $+.
	negative := aStream peekFor: $-.
	number := self readPostScriptNumberFrom: aStream.
	negative ifTrue: [
		^number negated].
	^number
]

{ #category : #'*PostScript-printing' }
Number >> writeFractionDecimalsOn: aStream [
	| tenfold digit |
	self strictlyPositive ifFalse: [
		^self].
	tenfold := self * 10.
	digit := tenfold truncated.
	aStream nextPut: ($0 asInteger + digit) asCharacter.
	tenfold - digit writeFractionDecimalsOn: aStream
]

"
KernPair specifies the kerning between two characters.

Instance Variables:
	firstCharacter		<Symbol>	description of firstCharacter
	secondCharacter	<Symbol>	description of secondCharacter
	kerning				<Point>		description of kerning
"
Class {
	#name : #PtFKernPair,
	#superclass : #Object,
	#instVars : [
		'firstCharacter',
		'secondCharacter',
		'kerning'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #private }
PtFKernPair >> codeFromHex: hex [
	"like <hex1>"

	| rst |
	rst := hex readStream.
	rst next = $< ifFalse: [self error: 'not a hex character'].
	^rst upTo: $>
]

{ #category : #accessing }
PtFKernPair >> firstCharacter [
	^firstCharacter
]

{ #category : #accessing }
PtFKernPair >> firstCharacter: anObject [
	firstCharacter := anObject
]

{ #category : #testing }
PtFKernPair >> isValid [
	^firstCharacter notNil and: [
	secondCharacter notNil]
]

{ #category : #private }
PtFKernPair >> kP: line [
	"KP name1 name2 numberx numbery
Name of the first character in the kerning pair followed by the name of the second character followed by the kerning vector specified as an (x, y) pair. The kerning vector is the amount by which to move the second character relative to the first character to position it properly. The kerning vector is specified in the standard character coordinate system. As with all metrics, in order to use this vector it is necessary to scale it by (current point size)/1000."

	| tokens |
	tokens := self tokensFrom: line.
	firstCharacter := (tokens at: 1) asSymbol.
	secondCharacter := (tokens at: 2) asSymbol.
	kerning := (tokens at: 3) asNumber @ (tokens at: 4) asNumber
]

{ #category : #private }
PtFKernPair >> kPH: line [
	"KPH <hex1> <hex2> numberx numbery
Same as KP, but the byte strings needed to generate the characters are given, rather than the names. hex1 and hex2 are hexadecimal values, enclosed in angle brackets."

	| tokens |
	tokens := self tokensFrom: line.
	firstCharacter := self codeFromHex: (tokens at: 1).
	secondCharacter := self codeFromHex: (tokens at: 2).
	kerning := (tokens at: 3) asNumber @ (tokens at: 4) asNumber
]

{ #category : #private }
PtFKernPair >> kPX: line [
	"KPX name1 name2 numberx
Name of the first character in the kerning pair followed by the name of the second character followed by the kerning amount in the x direction (y is zero). The kerning amount is specified in the units of the character coordinate system."

	| tokens |
	tokens := self tokensFrom: line.
	firstCharacter := (tokens at: 1) asSymbol.
	secondCharacter := (tokens at: 2) asSymbol.
	kerning := self kerning x: (tokens at: 3) asNumber
]

{ #category : #private }
PtFKernPair >> kPY: line [
	"KPY name1 name2 numbery
Same as KPX, but in the y direction (x is zero)."

	| tokens |
	tokens := self tokensFrom: line.
	firstCharacter := (tokens at: 1) asSymbol.
	secondCharacter := (tokens at: 2) asSymbol.
	kerning := self kerning y: (tokens at: 3) asNumber
]

{ #category : #accessing }
PtFKernPair >> kerning [
	^kerning ifNil: [
		0@0]
]

{ #category : #accessing }
PtFKernPair >> kerning: anObject [
	kerning := anObject
]

{ #category : #accessing }
PtFKernPair >> secondCharacter [
	^secondCharacter
]

{ #category : #accessing }
PtFKernPair >> secondCharacter: anObject [
	secondCharacter := anObject
]

{ #category : #private }
PtFKernPair >> tokensFrom: aString [
	^aString substrings: ' '
]

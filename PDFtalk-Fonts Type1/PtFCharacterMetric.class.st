"
Each character’s metrics are represented as a list of keys and values separated by semicolons, contained on one line. The characters are sorted by numerically ascending character code. Characters not encoded follow the encoded characters and are identified by character codes of –1. Byte codes for which no character is defined are not listed. Example: A character metric data line might look like this: 
C 102 ; WX 333 ; N f ; B 20 0 383 682 ; L i fi ; L l fl ;
This section appears in the AFM file only. It is optional.
"
Class {
	#name : #PtFCharacterMetric,
	#superclass : #Object,
	#instVars : [
		'c',
		'w',
		'n',
		'b',
		'l'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #converting }
PtFCharacterMetric >> asCharacter [
	"<Character | nil>"

	^PSCharacterNames characterNamed: self n
]

{ #category : #converting }
PtFCharacterMetric >> asString [
	^String with: self asCharacter
]

{ #category : #accessing }
PtFCharacterMetric >> b [
	"<Rectangle>"
	"(Optional.) Character bounding box where llx, lly, urx, and ury are all numbers. If a character makes no marks on the page (for example, the space character), this field reads B 0 0 0 0, and these values are not considered when computing the FontBBox."

	^b
]

{ #category : #private }
PtFCharacterMetric >> b: aString [
	| numbers llx lly urx ury |
	numbers := (self tokensFrom: aString) collect: #asNumber.
	llx := numbers at: 1.
	lly := numbers at: 2.
	urx := numbers at: 3.
	ury := numbers at: 4.
	b := llx @ lly corner: urx @ ury
]

{ #category : #accessing }
PtFCharacterMetric >> c [
	"<Integer>"
	"Decimal value of default character code (-1 if not encoded).
(Either C or CH is required.)"

	^c ifNil: [
		-1]
]

{ #category : #private }
PtFCharacterMetric >> c: aString [
	c := aString asNumber
]

{ #category : #private }
PtFCharacterMetric >> ch: aString [
	"Same as C, but the character code is given in hexadecimal.
Example: <84AF>.
(Either C or CH is required.)"

	c := ('16r', aString) asNumber
]

{ #category : #accessing }
PtFCharacterMetric >> code [
	self c = -1 ifTrue: [
		^nil].
	^self c
]

{ #category : #testing }
PtFCharacterMetric >> isValid [
	^n notNil or: [
	(self c = -1) not]
]

{ #category : #accessing }
PtFCharacterMetric >> l [
	"<Dictionary key: Symbol value: Symbol)>"
	"L successor ligature
(Optional.) Ligature sequence where successor and ligature are both names. The current character may join with the character named successor to form the character named ligature. Note that characters can have more than one such entry. (See example above.)"

	^l ifNil: [
		l := Dictionary new]
]

{ #category : #private }
PtFCharacterMetric >> l: aString [
	| tokens |
	tokens := self tokensFrom: aString.
	self l at: tokens first asSymbol put: tokens last asSymbol
]

{ #category : #accessing }
PtFCharacterMetric >> leftSideBearing [
	"<Number> in font space"

	^self b origin x
]

{ #category : #accessing }
PtFCharacterMetric >> n [
	"<Symbol>"
	"(Optional.) PostScript language character name."

	^n ifNil: [
		#'']
]

{ #category : #private }
PtFCharacterMetric >> n: aString [
	n := aString asSymbol
]

{ #category : #accessing }
PtFCharacterMetric >> name [
	^'/' , self n asString
]

{ #category : #accessing }
PtFCharacterMetric >> postScriptName [
	"<Symbol>"

	^self n
]

{ #category : #printing }
PtFCharacterMetric >> printOn: stream [
	stream nextPutAll: self name
]

{ #category : #private }
PtFCharacterMetric >> tokensFrom: aString [
	^aString substrings: ' '
]

{ #category : #accessing }
PtFCharacterMetric >> unicode [
	"<Integer>
	System code for this character. Can be two byte big"

	^self asCharacter ifNil: [Character illegalCode] ifNotNil: [:char | char asInteger]
]

{ #category : #accessing }
PtFCharacterMetric >> w [
	"<Point>"

	^w ifNil: [0@0]
]

{ #category : #private }
PtFCharacterMetric >> w0: aString [
	"(Optional.) Character width vector (x, y) for writing direction 0."

	| tokens |
	tokens := self tokensFrom: aString.
	w := tokens first asNumber -> tokens last asNumber
]

{ #category : #private }
PtFCharacterMetric >> w0X: aString [
	"(Optional.) Character width in x for writing direction 0. y is 0."

	w := self w x: aString asNumber
]

{ #category : #private }
PtFCharacterMetric >> w0Y: aString [
	"(Optional.) Character width in y for writing direction 0. x is 0."

	w := self w y: aString asNumber
]

{ #category : #private }
PtFCharacterMetric >> w1: aString [
	"(Optional.) Character width vector (x, y) for writing direction 1."

	self error: 'vertical direction is not supported so far'
]

{ #category : #private }
PtFCharacterMetric >> w1X: aString [
	"(Optional.) Character width in x for writing direction 1. y is 0."

	self error: 'vertical direction is not supported so far'
]

{ #category : #private }
PtFCharacterMetric >> w1Y: aString [
	"(Optional.) Character width in y for writing direction 1. x is 0."

	self error: 'vertical direction is not supported so far'
]

{ #category : #private }
PtFCharacterMetric >> w: aString [
	| tokens |
	tokens := self tokensFrom: aString.
	w := tokens first asNumber -> tokens last asNumber
]

{ #category : #private }
PtFCharacterMetric >> wX: aString [
	w := self w x: aString asNumber
]

{ #category : #private }
PtFCharacterMetric >> wY: aString [
	w := self w y: aString asNumber
]

{ #category : #accessing }
PtFCharacterMetric >> width [
	"<Number>"

	^self w x
]

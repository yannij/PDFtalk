"
Private DICT

The names of the Private DICT operators are, where possible, the same as the corresponding Type 1 dict keys.
"
Class {
	#name : #CFFPrivateDict,
	#superclass : #CFFDict,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #accessing }
CFFPrivateDict >> blueFuzz [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 11] ifNone: [
		^1].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> blueScale [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 9] ifNone: [
		^0.039625].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> blueShift [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 10] ifNone: [
		^7].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> blueValues [
	"<delta>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 6] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFPrivateDict >> defaultWidthX [
	"<Number>
The defaultWidthX and nominalWidthX operators supply width values for glyphs.
If a glyph width equals the defaultWidthX value it can be omitted from the charstring, otherwise the glyph width is computed by adding the charstring width to nominalWidthX value.
If nominalWidthX is carefully chosen the bulk of the widths in the charstrings can be reduced from 2-byte to single-byte numbers thereby saving space."

	| op |
	op := self operations detect: [:operation | operation isSimple: 20] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> expansionFactor [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 18] ifNone: [
		^0.06].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> familyBlues [
	"<delta>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 8] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFPrivateDict >> familyOtherBlues [
	"<delta>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 9] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFPrivateDict >> forceBold [
	"<Boolean>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 14] ifNone: [
		^false].
	^op operands first = 1
]

{ #category : #accessing }
CFFPrivateDict >> initialRandomSeed [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 19] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> languageGroup [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 17] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> nominalWidthX [
	"<Number>
The defaultWidthX and nominalWidthX operators supply width values for glyphs.
If a glyph width equals the defaultWidthX value it can be omitted from the charstring, otherwise the glyph width is computed by adding the charstring width to nominalWidthX value.
If nominalWidthX is carefully chosen the bulk of the widths in the charstrings can be reduced from 2-byte to single-byte numbers thereby saving space."

	| op |
	op := self operations detect: [:operation | operation isSimple: 21] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> otherBlues [
	"<delta>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 7] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFPrivateDict >> stdHW [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 10] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> stdVW [
	"<Number>"

	| op |
	op := self operations detect: [:operation | operation isSimple: 11] ifNone: [
		^0].
	^op operands first
]

{ #category : #accessing }
CFFPrivateDict >> stemSnapH [
	"<delta>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 12] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFPrivateDict >> stemSnapV [
	"<delta>"

	| op |
	op := self operations detect: [:operation | operation isExtended: 13] ifNone: [
		^#()].
	^op operands
]

{ #category : #accessing }
CFFPrivateDict >> subrs [
	"<Number>
	Offset (self) to local subrs"

	| op |
	op := self operations detect: [:operation | operation isSimple: 19] ifNone: [
		^0].
	^op operands first
]

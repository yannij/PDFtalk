"
This table establishes the memory requirements for this font. Fonts with CFF data must use Version 0.5 of this table, specifying only the numGlyphs field. Fonts with TrueType outlines must use Version 1.0 of this table, where all data is required.
"
Class {
	#name : #PtOTMaxp,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTMaxp class >> tag [
	^'maxp'
]

{ #category : #accessing }
PtOTMaxp >> numGlyphs [
	"USHORT 	The number of glyphs in the font."

	^self bytes unsignedShortAt: 5
]

{ #category : #accessing }
PtOTMaxp >> version [
	"Fixed 	Table version number
		0x00005000 for version 0.5 	(Note the difference in the representation of a non-zero fractional part, in Fixed numbers.)
		0x00010000 for version 1.0."

	| major minor |
	major := self bytes unsignedShortAt: 1.
	minor := self bytes unsignedShortAt: 3.
	(major isZero and: [
	minor = 16r5000]) ifTrue: [
			^0.5].
	(major = 1 and: [
	minor isZero]) ifTrue: [
			^1.0].
	^self error: 'invalid version number'
]

"
This table contains additional information needed to use TrueType or OpenType fonts on PostScript printers. This includes data for the FontInfo dictionary entry and the PostScript names of all the glyphs. For more information about PostScript names, see the Adobe document Unicode and Glyph Names.

Versions 1.0, 2.0, and 2.5 refer to TrueType fonts and OpenType fonts with TrueType data. OpenType fonts with TrueType data may also use Version 3.0. OpenType fonts with CFF data use Version 3.0 only.

"
Class {
	#name : #PtOTPost,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTPost class >> tag [
	^'post'
]

{ #category : #accessing }
PtOTPost >> isFixedPitch [
	"<Boolean>"
	"ULONG 	isFixedPitch 	Set to 0 if the font is proportionally spaced, non-zero if the font is not proportionally spaced (i.e. monospaced)."

	^(self bytes unsignedLongAt: 13) isZero not
]

{ #category : #accessing }
PtOTPost >> italicAngle [
	"<Number>"
	"Fixed 	italicAngle 	Italic angle in counter-clockwise degrees from the vertical. 
						Zero for upright text, negative for text that leans to the right (forward)."

	^(self bytes longAt: 5) / 16r10000
]

{ #category : #accessing }
PtOTPost >> maxMemType1 [
	"<Integer>"
	"ULONG 	maxMemType1 		Maximum memory usage when an OpenType font is downloaded as a Type 1 font."

	^self bytes unsignedLongAt: 29
]

{ #category : #accessing }
PtOTPost >> maxMemType42 [
	"<Integer>"
	"ULONG 	maxMemType42 		Maximum memory usage when an OpenType font is downloaded."

	^self bytes unsignedLongAt: 21
]

{ #category : #accessing }
PtOTPost >> minMemType1 [
	"<Integer>"
	"ULONG 	minMemType1 		Minimum memory usage when an OpenType font is downloaded as a Type 1 font."

	^self bytes unsignedLongAt: 25
]

{ #category : #accessing }
PtOTPost >> minMemType42 [
	"<Integer>"
	"ULONG 	minMemType42 		Minimum memory usage when an OpenType font is downloaded."

	^self bytes unsignedLongAt: 17
]

{ #category : #accessing }
PtOTPost >> psUnderlinePosition [
	^self underlinePosition - (self underlineThickness / 2)
]

{ #category : #accessing }
PtOTPost >> underlinePosition [
	"<Integer>"
	"FWord 	underlinePosition
This is the suggested distance of the top of the underline from the baseline (negative values indicate below baseline).
The PostScript definition of this FontInfo dictionary key (the y coordinate of the center of the stroke) is not used for historical reasons. The value of the PostScript key may be calculated by subtracting half the underlineThickness from the value of this field."

	^self bytes shortAt: 9
]

{ #category : #accessing }
PtOTPost >> underlineThickness [
	"<Integer>"
	"FWord 	underlineThickness 		Suggested values for the underline thickness."

	^self bytes shortAt: 11
]

{ #category : #accessing }
PtOTPost >> versionMajor [
	"Fixed 	Table version number 	0x00010000 for version 1.0."

	^self bytes unsignedShortAt: 1
]

{ #category : #accessing }
PtOTPost >> versionMinor [
	"Fixed 	Table version number 	0x00010000 for version 1.0."

	^self bytes unsignedShortAt: 3
]

"
This table gives global information about the font. The bounding box values should be computed using only glyphs that have contours. Glyphs with no contours should be ignored for the purposes of these calculations.

"
Class {
	#name : #PtOTHead,
	#superclass : #PtOTTable,
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTHead class >> tag [
	^'head'
]

{ #category : #accessing }
PtOTHead >> checkSumAdjustment [
	"ULONG 	checkSumAdjustment 	To compute: set it to 0, sum the entire font as ULONG, then store 0xB1B0AFBA - sum."

	^self bytes unsignedLongAt: 9
]

{ #category : #accessing }
PtOTHead >> created [
	"<Timestamp>"
	"LONGDATETIME 	created 	Number of seconds since 12:00 midnight that started January 1st 1904 in GMT/UTC time zone. 64-bit integer"

	^Timestamp fromOpenTypeLongDateTime: (self bytes longLongAt: 21)
]

{ #category : #accessing }
PtOTHead >> flags [
	"USHORT 	flags 	
Bit 0: Baseline for font at y=0;
Bit 1: Left sidebearing point at x=0;
Bit 2: Instructions may depend on point size;
Bit 3: Force ppem to integer values for all internal scaler math; may use fractional ppem sizes if this bit is clear;
Bit 4: Instructions may alter advance width (the advance widths might not scale linearly);
Bits 5-10: These should be set according to Apple's specification . However, they are not implemented in OpenType.
Bit 11: Font data is ‘lossless’ as a results of having been subjected to optimizing transformation and/or compression (such as e.g. compression mechanisms defined by ISO/IEC 14496-18, MicroType Express, WOFF 2.0 or similar) where the original font functionality and features are retained but the binary compatibility between input and output font files is not guaranteed. As a result of the applied transform, the ‘DSIG’ Table may also be invalidated.
Bit 12: Font converted (produce compatible metrics)
Bit 13: Font optimized for ClearType™. Note, fonts that rely on embedded bitmaps (EBDT) for rendering should not be considered optimized for ClearType, and therefore should keep this bit cleared.
Bit 14: Last Resort font. If set, indicates that the glyphs encoded in the cmap subtables are simply generic symbolic representations of code point ranges and don’t truly represent support for those code points. If unset, indicates that the glyphs encoded in the cmap subtables represent proper support for those code points.
Bit 15: Reserved, set to 0 "

	^self bytes unsignedShortAt: 17
]

{ #category : #accessing }
PtOTHead >> fontBBox [
	^self xMin @ self yMin corner: self xMax @ self yMax
]

{ #category : #accessing }
PtOTHead >> fontDirectionHint [
	"SHORT 	fontDirectionHint 	Deprecated (Set to 2).
0: Fully mixed directional glyphs;
1: Only strongly left to right;
2: Like 1 but also contains neutrals;
-1: Only strongly right to left;
-2: Like -1 but also contains neutrals. 1"

	^self bytes shortAt: 49
]

{ #category : #accessing }
PtOTHead >> glyphDataFormat [
	"SHORT 	glyphDataFormat 	0 for current format."

	^self bytes shortAt: 53
]

{ #category : #accessing }
PtOTHead >> indexToLocFormat [
	"SHORT 	indexToLocFormat 	0 for short offsets, 1 for long."

	^self bytes shortAt: 51
]

{ #category : #accessing }
PtOTHead >> lowestRecPPEM [
	"USHORT 	lowestRecPPEM 	Smallest readable size in pixels."

	^self bytes unsignedShortAt: 47
]

{ #category : #accessing }
PtOTHead >> macStyle [
	"USHORT 	macStyle 	
Bit 0: Bold (if set to 1);
Bit 1: Italic (if set to 1)
Bit 2: Underline (if set to 1)
Bit 3: Outline (if set to 1)
Bit 4: Shadow (if set to 1)
Bit 5: Condensed (if set to 1)
Bit 6: Extended (if set to 1)
Bits 7-15: Reserved (set to 0)."

	^self bytes unsignedShortAt: 45
]

{ #category : #accessing }
PtOTHead >> magicNumber [
	"ULONG 	magicNumber 	Set to 0x5F0F3CF5."

	^self bytes unsignedLongAt: 13
]

{ #category : #accessing }
PtOTHead >> modified [
	"<Timestamp>"
	"LONGDATETIME 	modified 	Number of seconds since 12:00 midnight that started January 1st 1904 in GMT/UTC time zone. 64-bit integer"

	^Timestamp fromOpenTypeLongDateTime: (self bytes longLongAt: 29)
]

{ #category : #accessing }
PtOTHead >> unitsPerEm [
	"USHORT 	unitsPerEm 	Valid range is from 16 to 16384. This value should be a power of 2 for fonts that have TrueType outlines."

	^self bytes unsignedShortAt: 19
]

{ #category : #accessing }
PtOTHead >> xMax [
	"SHORT 	xMax 	For all glyph bounding boxes."

	^self bytes shortAt: 41
]

{ #category : #accessing }
PtOTHead >> xMin [
	"SHORT 	xMin 	For all glyph bounding boxes."

	^self bytes shortAt: 37
]

{ #category : #accessing }
PtOTHead >> yMax [
	"SHORT 	yMax 	For all glyph bounding boxes."

	^self bytes shortAt: 43
]

{ #category : #accessing }
PtOTHead >> yMin [
	"SHORT 	yMin 	For all glyph bounding boxes."

	^self bytes shortAt: 39
]

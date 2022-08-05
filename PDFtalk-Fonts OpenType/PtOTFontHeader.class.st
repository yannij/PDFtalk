"
head - Font Header

This table gives global information about the font. The bounding box values should be computed using only glyphs that have contours. Glyphs with no contours should be ignored for the purposes of these calculations.
"
Class {
	#name : #PtOTFontHeader,
	#superclass : #Value,
	#instVars : [
		'version',
		'fontRevision',
		'checkSumAdjustment',
		'flags',
		'unitsPerEm',
		'created',
		'modified',
		'glyphBBox',
		'macStyle',
		'lowestRecPPEM',
		'fontDirectionHint',
		'indexToLocFormat',
		'glyphDataFormat'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #'instance creation' }
PtOTFontHeader class >> fromBytes: aByteArray [
	| rst version fontRevision checkSumAdjustment |
	rst := ByteReadStream bigEndianOn: aByteArray.
	version := rst nextOpenTypeFixedVersion.
	fontRevision := rst nextOpenTypeFixed.
	checkSumAdjustment := rst nextUnsignedLong.
	rst nextUnsignedLong = self magicNumber ifFalse: [
		self error: 'magicNumber is not correct'].
	^self
		version: version
		fontRevision: fontRevision
		checkSumAdjustment: checkSumAdjustment
		flags: rst nextUnsignedShort
		unitsPerEm: rst nextUnsignedShort
		created: rst nextOpenTypeLongDateTime
		modified: rst nextOpenTypeLongDateTime
		glyphBBox: (rst nextShort @ rst nextShort corner: rst nextShort @ rst nextShort)
		macStyle: rst nextUnsignedShort
		lowestRecPPEM: rst nextUnsignedShort
		fontDirectionHint: rst nextShort
		indexToLocFormat: rst nextShort
		glyphDataFormat: rst nextShort
]

{ #category : #specification }
PtOTFontHeader class >> localSpecification [
	<constant: #version class: #FixedPoint comment: 'should be 1.0'>
	<constant: #fontRevision class: #FixedPoint comment: 'Set by font manufacturer'>
	<constant: #checkSumAdjustment class: #Integer>
	<constant: #flags class: #Integer comment: 'Bit 0: Baseline for font at y=0;
Bit 1: Left sidebearing point at x=0;
Bit 2: Instructions may depend on point size;
Bit 3: Force ppem to integer values for all internal scaler math; may use fractional ppem sizes if this bit is clear;
Bit 4: Instructions may alter advance width (the advance widths might not scale linearly);
Bits 5-10: These should be set according to Apple''s specification . However, they are not implemented in OpenType.
Bit 11: Font data is ‘lossless’ as a results of having been subjected to optimizing transformation and/or compression (such as e.g. compression mechanisms defined by ISO/IEC 14496-18, MicroType Express, WOFF 2.0 or similar) where the original font functionality and features are retained but the binary compatibility between input and output font files is not guaranteed. As a result of the applied transform, the ‘DSIG’ Table may also be invalidated.
Bit 12: Font converted (produce compatible metrics)
Bit 13: Font optimized for ClearType™. Note, fonts that rely on embedded bitmaps (EBDT) for rendering should not be considered optimized for ClearType, and therefore should keep this bit cleared.
Bit 14: Last Resort font. If set, indicates that the glyphs encoded in the cmap subtables are simply generic symbolic representations of code point ranges and don’t truly represent support for those code points. If unset, indicates that the glyphs encoded in the cmap subtables represent proper support for those code points.
Bit 15: Reserved, set to 0 '>
	<constant: #unitsPerEm class: #Integer comment: 'Valid range is from 16 to 16384. This value should be a power of 2 for fonts that have TrueType outlines.'>
	<constant: #created class: #Timestamp>
	<constant: #modified class: #Timestamp>
	<constant: #glyphBBox class: #Rectangle comment: 'For all glyph bounding boxes.'>
	<constant: #macStyle class: #Integer comment: 'Bit 0: Bold (if set to 1);
Bit 1: Italic (if set to 1)
Bit 2: Underline (if set to 1)
Bit 3: Outline (if set to 1)
Bit 4: Shadow (if set to 1)
Bit 5: Condensed (if set to 1)
Bit 6: Extended (if set to 1)
Bits 7-15: Reserved (set to 0).
Note that the macStyle bits must agree with the ''OS/2'' table fsSelection bits. The fsSelection bits are used over the macStyle bits in Microsoft Windows. The PANOSE values and ''post'' table values are ignored for determining bold or italic fonts.'>
	<constant: #lowestRecPPEM class: #Integer comment: 'Smallest readable size in pixels.'>
	<constant: #fontDirectionHint class: #Integer comment: 'Deprecated (Set to 2).
0: Fully mixed directional glyphs;
1: Only strongly left to right;
2: Like 1 but also contains neutrals;
-1: Only strongly right to left;
-2: Like -1 but also contains neutrals.'>
	<constant: #indexToLocFormat class: #Integer comment: '0 for short offsets, 1 for long.'>
	<constant: #glyphDataFormat class: #Integer comment: '0 for current format.'>
]

{ #category : #'instance creation' }
PtOTFontHeader class >> magicNumber [
	^16r5F0F3CF5
]

{ #category : #'instance creation' }
PtOTFontHeader class >> version: versionFixedPoint fontRevision: fontRevisionFixedPoint checkSumAdjustment: checkSumAdjustmentInteger flags: flagsInteger unitsPerEm: unitsPerEmInteger created: createdTimestamp modified: modifiedTimestamp glyphBBox: glyphBBoxRectangle macStyle: macStyleInteger lowestRecPPEM: lowestRecPPEMInteger fontDirectionHint: fontDirectionHintInteger indexToLocFormat: indexToLocFormatInteger glyphDataFormat: glyphDataFormatInteger [
	| inst |
	inst := self new.
	inst
		initializeVersion: versionFixedPoint
		fontRevision: fontRevisionFixedPoint
		checkSumAdjustment: checkSumAdjustmentInteger
		flags: flagsInteger
		unitsPerEm: unitsPerEmInteger
		created: createdTimestamp
		modified: modifiedTimestamp
		glyphBBox: glyphBBoxRectangle
		macStyle: macStyleInteger
		lowestRecPPEM: lowestRecPPEMInteger
		fontDirectionHint: fontDirectionHintInteger
		indexToLocFormat: indexToLocFormatInteger
		glyphDataFormat: glyphDataFormatInteger.
	^inst
]

{ #category : #converting }
PtOTFontHeader >> asBytes [
	"<ByteArray>"

	| wst |
	wst := ByteWriteStream bigEndianOn: (ByteArray new: 54).
	wst nextPutOpenTypeFixedVersion: self version.
	wst nextPutOpenTypeFixed: self fontRevision.
	wst nextPutUnsignedLong: self checkSumAdjustment.
	wst nextPutUnsignedLong: self class magicNumber.
	wst nextPutUnsignedShort: self flags.
	wst nextPutUnsignedShort: self unitsPerEm.
	wst nextPutOpenTypeLongDateTime: self created.
	wst nextPutOpenTypeLongDateTime: self modified.
	wst nextPutShort: self glyphBBox origin x.
	wst nextPutShort: self glyphBBox origin y.
	wst nextPutShort: self glyphBBox corner x.
	wst nextPutShort: self glyphBBox corner y.
	wst nextPutUnsignedShort: self macStyle.
	wst nextPutUnsignedShort: self lowestRecPPEM.
	wst nextPutShort: self fontDirectionHint.
	wst nextPutShort: self indexToLocFormat.
	wst nextPutShort: self glyphDataFormat.
	^wst contents
]

{ #category : #accessing }
PtOTFontHeader >> checkSumAdjustment [
	"<Integer>"

	^checkSumAdjustment
]

{ #category : #accessing }
PtOTFontHeader >> created [
	"<Timestamp>"

	^created
]

{ #category : #accessing }
PtOTFontHeader >> flags [
	"<Integer>
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

	^flags
]

{ #category : #accessing }
PtOTFontHeader >> fontBBox [
	"<Rectangle>"

	^self glyphBBox
]

{ #category : #accessing }
PtOTFontHeader >> fontDirectionHint [
	"<Integer>
	Deprecated (Set to 2).
0: Fully mixed directional glyphs;
1: Only strongly left to right;
2: Like 1 but also contains neutrals;
-1: Only strongly right to left;
-2: Like -1 but also contains neutrals."

	^fontDirectionHint
]

{ #category : #accessing }
PtOTFontHeader >> fontRevision [
	"<FixedPoint>
	Set by font manufacturer"

	^fontRevision
]

{ #category : #accessing }
PtOTFontHeader >> glyphBBox [
	"<Rectangle>
	For all glyph bounding boxes."

	^glyphBBox
]

{ #category : #accessing }
PtOTFontHeader >> glyphDataFormat [
	"<Integer>
	0 for current format."

	^glyphDataFormat
]

{ #category : #accessing }
PtOTFontHeader >> indexToLocFormat [
	"<Integer>
	0 for short offsets, 1 for long."

	^indexToLocFormat
]

{ #category : #'initialize-release' }
PtOTFontHeader >> initializeVersion: versionFixedPoint fontRevision: fontRevisionFixedPoint checkSumAdjustment: checkSumAdjustmentInteger flags: flagsInteger unitsPerEm: unitsPerEmInteger created: createdTimestamp modified: modifiedTimestamp glyphBBox: glyphBBoxRectangle macStyle: macStyleInteger lowestRecPPEM: lowestRecPPEMInteger fontDirectionHint: fontDirectionHintInteger indexToLocFormat: indexToLocFormatInteger glyphDataFormat: glyphDataFormatInteger [
	version := versionFixedPoint.
	fontRevision := fontRevisionFixedPoint.
	checkSumAdjustment := checkSumAdjustmentInteger.
	flags := flagsInteger.
	unitsPerEm := unitsPerEmInteger.
	created := createdTimestamp.
	modified := modifiedTimestamp.
	glyphBBox := glyphBBoxRectangle.
	macStyle := macStyleInteger.
	lowestRecPPEM := lowestRecPPEMInteger.
	fontDirectionHint := fontDirectionHintInteger.
	indexToLocFormat := indexToLocFormatInteger.
	glyphDataFormat := glyphDataFormatInteger.
	self beImmutable
]

{ #category : #accessing }
PtOTFontHeader >> lowestRecPPEM [
	"<Integer>
	Smallest readable size in pixels."

	^lowestRecPPEM
]

{ #category : #accessing }
PtOTFontHeader >> macStyle [
	"<Integer>
	Bit 0: Bold (if set to 1);
Bit 1: Italic (if set to 1)
Bit 2: Underline (if set to 1)
Bit 3: Outline (if set to 1)
Bit 4: Shadow (if set to 1)
Bit 5: Condensed (if set to 1)
Bit 6: Extended (if set to 1)
Bits 7-15: Reserved (set to 0).
Note that the macStyle bits must agree with the 'OS/2' table fsSelection bits. The fsSelection bits are used over the macStyle bits in Microsoft Windows. The PANOSE values and 'post' table values are ignored for determining bold or italic fonts."

	^macStyle
]

{ #category : #accessing }
PtOTFontHeader >> modified [
	"<Timestamp>"

	^modified
]

{ #category : #printing }
PtOTFontHeader >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'version' value: self version).
	args add: (printer constant: 'fontRevision' value: self fontRevision).
	args add: (printer constant: 'checkSumAdjustment' value: self checkSumAdjustment).
	args add: (printer constant: 'flags' value: self flags).
	args add: (printer constant: 'unitsPerEm' value: self unitsPerEm).
	args add: (printer constant: 'created' value: self created).
	args add: (printer constant: 'modified' value: self modified).
	args add: (printer constant: 'glyphBBox' value: self glyphBBox).
	args add: (printer constant: 'macStyle' value: self macStyle).
	args add: (printer constant: 'lowestRecPPEM' value: self lowestRecPPEM).
	args add: (printer constant: 'fontDirectionHint' value: self fontDirectionHint).
	args add: (printer constant: 'indexToLocFormat' value: self indexToLocFormat).
	args add: (printer constant: 'glyphDataFormat' value: self glyphDataFormat).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTFontHeader >> unitsPerEm [
	"<Integer>
	Valid range is from 16 to 16384. This value should be a power of 2 for fonts that have TrueType outlines."

	^unitsPerEm
]

{ #category : #accessing }
PtOTFontHeader >> version [
	"<FixedPoint>
	should be 1.0"

	^version
]

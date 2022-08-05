"
AdobeFontMetric represents the contents of an PostScript Type-1 Font Metric file (AFM).
Only base fonts (Type-1) for now. No composite fonts (Type-0) in ACFM or CID.
Also no master fonts in AMFM.

All variables are privately set from the file, but publicly read as their proper Smalltalk values.

Reference:
Adobe Font Metrics File
Format Specification
	Version 4.1
	7 October 1998
		Adobe Systems Incorporated
		Adobe Developer Technologies
		345 Park Avenue
		San Jose, CA 95110
		http://partners.adobe.com/
			PN LPS5004
"
Class {
	#name : #PtFAdobeFontMetric,
	#superclass : #Object,
	#instVars : [
		'font',
		'fileFormatVersion',
		'comment',
		'metricsSets',
		'fontName',
		'fullName',
		'familyName',
		'fontBBox',
		'weight',
		'version',
		'notice',
		'encodingScheme',
		'characterSet',
		'characters',
		'isBaseFont',
		'vVector',
		'isFixedV',
		'capHeight',
		'xHeight',
		'ascender',
		'descender',
		'stdHW',
		'stdVW',
		'directions',
		'charMetricsSize',
		'charMetrics',
		'trackKern',
		'kernPairsSize',
		'kernPairs',
		'composites'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #parsing }
PtFAdobeFontMetric class >> fromAfm: readstream [
	"self fromAfm: SmallCharts.Süddeutsche.HelveticaNeueBoldCond afmString readStream"

	| inst |
	inst := self new.
	[	inst initializeFromAfm: readstream
	] ensure: [readstream close].
	(inst fontName isNil or: [
	inst fontBBox isNil]) ifTrue: [
		^nil].
	^inst
]

{ #category : #accessing }
PtFAdobeFontMetric >> addComposite: composite [
	self composites add: composite
]

{ #category : #accessing }
PtFAdobeFontMetric >> addKernPair: kernPair [
	self kernPairs add: kernPair
]

{ #category : #accessing }
PtFAdobeFontMetric >> addTrackKern: kernPair [
	self trackKern add: kernPair
]

{ #category : #attributes }
PtFAdobeFontMetric >> ascender [
	"<Number>"
	"(Optional.) For roman font programs: usually the y-value of the top of the lowercase d. If this font program contains no lowercase d, this keyword might be missing or number might be 0."

	^ascender ifNil: [0]
]

{ #category : #private }
PtFAdobeFontMetric >> ascender: aString [
	ascender := aString asNumber
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> byteEncoder [
	"<ByteCharacterEncoder>"

	self encodingScheme = 'AdobeStandardEncoding' ifTrue: [
		^PtFFont standardEncoder].
	self encodingScheme = 'WinAnsiEncoding' ifTrue: [
		^PtFFont winAnsiEncoder].
	self encodingScheme = 'FontSpecific' ifTrue: [
		^PtFFont winAnsiEncoder]
]

{ #category : #attributes }
PtFAdobeFontMetric >> capHeight [
	"<Number>"
	"(Optional.) Usually the y-value of the top of the capital H. If this font program contains no capital H, this keyword might be missing or number might be 0."

	^capHeight ifNil: [0]
]

{ #category : #private }
PtFAdobeFontMetric >> capHeight: aString [
	capHeight := aString asNumber
]

{ #category : #accessing }
PtFAdobeFontMetric >> charMetricAt: index [
	"<CharMetric | nil>"

	^self charMetrics detect: [:cm |
		cm c = index
	] ifNone: [
		nil]
]

{ #category : #accessing }
PtFAdobeFontMetric >> charMetricNamed: symbol [
	"<CharMetric>"

	^self charMetrics detect: [:cm |
		cm n = symbol
	] ifNone: [
		nil]
]

{ #category : #accessing }
PtFAdobeFontMetric >> charMetrics [
	"<Collection of: CharMetric>"

	^charMetrics ifNil: [charMetrics := OrderedCollection new: self charMetricsSize]
]

{ #category : #attributes }
PtFAdobeFontMetric >> charMetricsSize [
	"<Integer>"

	^charMetricsSize ifNil: [
		200]
]

{ #category : #private }
PtFAdobeFontMetric >> charMetricsSize: aString [
	aString isEmpty ifTrue: [^self].
	charMetricsSize := aString asNumber
]

{ #category : #attributes }
PtFAdobeFontMetric >> charWidth [
	^self direction charWidth
]

{ #category : #private }
PtFAdobeFontMetric >> charWidth: aString [
	self direction charWidth: aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> characterSet [
	"<String>"
	"(Optional.) String describing the character set (glyph complement) of this font program.
Examples: AdobeStandardLatin; AdobeStandardCyrillic"

	^characterSet
]

{ #category : #private }
PtFAdobeFontMetric >> characterSet: aString [
	characterSet := aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> characters [
	"<Integer>"
	"(Optional.) The number of characters defined in this font program."

	^characters
]

{ #category : #private }
PtFAdobeFontMetric >> characters: aString [
	characters := aString asNumber
]

{ #category : #attributes }
PtFAdobeFontMetric >> comment [
	"<String>
	may have multiple lines: one for each comment statement"

	^comment ifNil: [
		String new]
]

{ #category : #private }
PtFAdobeFontMetric >> comment: aString [
	comment := self comment , (self comment isEmpty ifTrue: [''] ifFalse: ['
']), aString
]

{ #category : #accessing }
PtFAdobeFontMetric >> composites [
	"<Collection of: Object>"
	"The composite character data section also appears only in AFM files. It is optional. Composite characters are new characters made up of characters already existing in the font program, such as accented characters. Character metric information for composite characters is found in the Character Metrics section of the AFM file.
Although most PostScript language font programs available from Adobe Systems include a rather extensive set of composite characters, some applications might want to generate their own. This section provides the data necessary for accurate positioning of the individual pieces. All units are expressed in the standard 1000 unit-per-font-scale-factor character
coordinate system. 
StartComposites integer
EndComposites
(Required if composite character data are present.) integer indicates how many pairs to expect. The data for each composite character is represented as a list of keys and values separated by semicolons. Each composite character gets one line of description. The following are the standard keys:
CC name integer
The composite character name followed by the number of parts that comprise the composite.
PCC name deltax deltay
One of the parts of the composite character. The character name is given followed by the x and y displacement from the origin. A composite character line might look like this
CC Aacute 2; PCC A 0 0; PCC acute 194 214;"

	^composites ifNil: [
		composites := OrderedCollection new]
]

{ #category : #private }
PtFAdobeFontMetric >> compositesSize: aString [
	aString isEmpty ifTrue: [^self].
	aString asNumber
]

{ #category : #attributes }
PtFAdobeFontMetric >> descender [
	"<Number>"
	"(Optional.) For roman font programs: typically the y-value of the bottom of the lowercase p. If this font program contains no lowercase p, this keyword might be missing or number might be 0."

	^descender ifNil: [0]
]

{ #category : #private }
PtFAdobeFontMetric >> descender: aString [
	descender := aString asNumber
]

{ #category : #accessing }
PtFAdobeFontMetric >> direction [
	"<DirectionalFontMetric>
	horizontal only"
	"(Optional if MetricsSets 0, required otherwise.) integer is 0, 1, or 2. Encloses the metrics for writing direction integer. StartDirection 2 implies that the metrics for both writing directions are the same. If MetricsSets 0 was specified or implied, StartDirection ... EndDirection can be omitted, and StartDirection 0 is implied."

	^self directions at: self metricsSets
]

{ #category : #accessing }
PtFAdobeFontMetric >> directions [
	"<Dictionary key: Integer[0 1 2] value: DirectionalFontMetric>
	0 = horizontal only
	1 = vertical only
	2 = both"

	^directions ifNil: [
		| dict |
		dict := Dictionary new.
		dict at: 0 put: PtFDirectionalFontMetric new.
		directions := dict]
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> encodedCharMetrics [
	^self charMetrics reject: [:charMetric | charMetric c = -1]
]

{ #category : #attributes }
PtFAdobeFontMetric >> encodingScheme [
	"<String>"
	"(Optional.) String indicating the default encoding vector for this font program. Common ones are AdobeStandardEncoding and JIS12-88-CFEncoding. Special font programs might state FontSpecific."

	^encodingScheme
]

{ #category : #private }
PtFAdobeFontMetric >> encodingScheme: aString [
	encodingScheme := aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> familyName [
	"<String>
	(Optional.) The name of the typeface family to which the font belongs."

	^familyName ifNil: [
		self fontName copyUpTo: $-]
]

{ #category : #private }
PtFAdobeFontMetric >> familyName: aString [
	familyName := aString
]

{ #category : #private }
PtFAdobeFontMetric >> fileFormatVersion: aString [
	fileFormatVersion := aString
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> firstChar [
	"<Integer>"

	self newEncoder decoder withIndexDo: [:char :i |
		char asInteger = Character illegalCode ifFalse: [
			^i - 1]].
	^self error: 'no character'
]

{ #category : #accessing }
PtFAdobeFontMetric >> font [
	"<FontClass>"

	^font
]

{ #category : #accessing }
PtFAdobeFontMetric >> font: aFont [
	font := aFont
]

{ #category : #attributes }
PtFAdobeFontMetric >> fontBBox [
	"<Rectangle>
	(Required.) Four numbers giving the lower left corner and the upper right corner of the font bounding box, in the sequence llx lly urx ury.
Note
The bounding box given here is that of the flattened paths, not the Bézier curve descriptions. These values were specified to be integers in version 3.0 and before, but with the addition of multiple master fonts, the use of “numbers” is allowed."

	^fontBBox
]

{ #category : #private }
PtFAdobeFontMetric >> fontBBox: aString [
	| numbers llx lly urx ury |
	numbers := (self tokensFrom: aString) collect: #asNumber.
	llx := numbers at: 1.
	lly := numbers at: 2.
	urx := numbers at: 3.
	ury := numbers at: 4.
	fontBBox := llx @ lly corner: urx @ ury
]

{ #category : #attributes }
PtFAdobeFontMetric >> fontName [
	"<String>"
	"(Required.) Name of the font program as presented to the PostScript language findfont operator."

	^fontName
]

{ #category : #private }
PtFAdobeFontMetric >> fontName: aString [
	fontName := aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> fullName [
	"<String>
	(Optional.) The full text name of the font."

	^fullName
]

{ #category : #private }
PtFAdobeFontMetric >> fullName: aString [
	fullName := aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> headroom [
	"<Number>
	the distance between ascend to upper bound of the fontBBox"

	^self fontBBox corner y - self ascender
]

{ #category : #'initialize-release' }
PtFAdobeFontMetric >> initializeFromAfm: readstream [
	PtFAfmParser parseFrom: readstream into: self
]

{ #category : #attributes }
PtFAdobeFontMetric >> isFixedPitch [
	^self direction isFixedPitch
]

{ #category : #private }
PtFAdobeFontMetric >> isFixedPitch: aString [
	self direction isFixedPitch: aString
]

{ #category : #testing }
PtFAdobeFontMetric >> isItalic [
	^self italicAngle isZero not
]

{ #category : #attributes }
PtFAdobeFontMetric >> italicAngle [
	"<Number>"

	^self direction italicAngle
]

{ #category : #private }
PtFAdobeFontMetric >> italicAngle: aString [
	self direction italicAngle: aString
]

{ #category : #private }
PtFAdobeFontMetric >> kernDataSize: aString [
	"ignore"

	aString isEmpty ifTrue: [^self]
]

{ #category : #accessing }
PtFAdobeFontMetric >> kernPairs [
	"<Collection of: KernPair>"
	"The pair-wise kerning data is surrounded by the keywords:
StartKernPairs integer
EndKernPairs
StartKernPairs0 integer
EndKernPairs
StartKernPairs1 integer
EndKernPairs
(Required if pair-wise kerning data are present.) integer indicates the number of pairs to expect. StartKernPairs and StartKernPairs0 denote writing direction 0; StartKernPairs1 denotes writing direction 1. An AFM file can contain pair-wise kerning data for more than one writing direction, each delimited by the StartKernPairs0 or StartKernPairs1 ... EndKernPairs. There is one kerning pair per line. Each line begins with a keyword of the form KP, KPH, KPX, or KPY."

	^kernPairs ifNil: [
		kernPairs := OrderedCollection new: self kernPairsSize]
]

{ #category : #attributes }
PtFAdobeFontMetric >> kernPairsSize [
	"<Integer>"

	^kernPairsSize ifNil: [
		100]
]

{ #category : #private }
PtFAdobeFontMetric >> kernPairsSize: aString [
	aString isEmpty ifTrue: [^self].
	kernPairsSize := aString asNumber
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> lastChar [
	"<Integer>"

	self newEncoder decoder reverse withIndexDo: [:char :i |
		char asInteger = Character illegalCode ifFalse: [
			^256 - i]].
	^self error: 'no character'
]

{ #category : #attributes }
PtFAdobeFontMetric >> metricsSets [
	"<Integer[0 1 2]>
	0 = writing directions 0 only
	1 = writing directions 1 only
	2 = both"

	^metricsSets ifNil: [0]
]

{ #category : #private }
PtFAdobeFontMetric >> metricsSets: aString [
	metricsSets := aString asNumber.
	metricsSets = 0 ifFalse: [
		self error: 'only horizontal direction supported so far']
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> newEncoder [
	"<CharacterMapper>
	Encoder with the font-specified mapping.
	unencoded characters are not treated"

	| encoder |
	encoder := PtCharacterMap new.
	self encodedCharMetrics do: [:charMetric |
		charMetric asCharacter ifNotNil: [:character |
			(self platformEncoder encode: character) = Character illegalCode ifFalse: [
				encoder encode: character as: charMetric c]]].
	^encoder
]

{ #category : #attributes }
PtFAdobeFontMetric >> notice [
	"<String>"
	"(Optional.) Font name trademark or copyright notice."

	^notice
]

{ #category : #private }
PtFAdobeFontMetric >> notice: aString [
	notice := aString
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> platformEncoder [
	^Locale current defaultStreamEncoder
]

{ #category : #accessing }
PtFAdobeFontMetric >> postScriptName [
	"<String>
	the name as used by PostScript and PDF"

	^self fontName
]

{ #category : #accessing }
PtFAdobeFontMetric >> stdHW [
	"<Number>"
	"(Optional). This number specifies the dominant width of horizontal stems (measured vertically in character space units)."

	^stdHW ifNil: [0]
]

{ #category : #accessing }
PtFAdobeFontMetric >> stdHW: aString [
	stdHW := aString asNumber
]

{ #category : #accessing }
PtFAdobeFontMetric >> stdVW [
	"<Number>"
	"(Optional). This number specifies the dominant with of vertical stems (measured horizontally in character space units)."

	^stdVW ifNil: [0]
]

{ #category : #accessing }
PtFAdobeFontMetric >> stdVW: aString [
	stdVW := aString asNumber
]

{ #category : #accessing }
PtFAdobeFontMetric >> stemV [
	"<Number>"

	^stdVW ifNil: [
		| wc |
		wc := self weightNumber / 65.
		^(wc * wc + 50) rounded]
]

{ #category : #private }
PtFAdobeFontMetric >> tokensFrom: aString [
	^aString substrings: ' '
]

{ #category : #accessing }
PtFAdobeFontMetric >> trackKern [
	"<Collection of: String>"
	"Track kerning may be specified for those writing directions mentioned by MetricsSets. The track kerning data is surrounded by the keywords:
StartTrackKern integer
EndTrackKern
(Required if track kerning data are present.) integer indicates how many different sets of track kerning data are present.
Normally track kerning is provided in different degrees of tightness. Within a track (a degree of tightness), the amount to decrease (or possibly increase) the amount of space between characters increases (or possibly decreases) with the point size of the font (for example, for tight track kerning, the amount to decrease the space between characters at 6 point might be 0.1 points and at 72 point it might be 3.78 points). These distances are measured along the width of the characters: parallel to the x-axis for horizontal writing directions and parallel to the y-axis for vertical writing directions. The data itself begins with the keyword TrackKern and is followed by the track kerning information
TrackKern degree min-ptsize min-kern max-ptsize max-kern The degree is an integer where increasingly negative degrees represent tighter track kerning and increasingly positive degrees represent looser track kerning. min-ptsize, min-kern, max-ptsize, and max-kern are all numbers. Since the track kerning is a linear function, the minimum and maximum cutoff
values (point sizes) are provided, along with the amount to track kern by, at the point size.
The kerning amounts are given relative to the point size. From those four values, the track kerning function can be derived. The track kerning function is a linear function. The equation for the line is determined from the data provided and, therefore, the track kerning values for any point size can be determined. The track kerning values for any point size below/above the minimum/maximum point size are constant (the minimum kerning amount/ maximum kerning amount)."

	^trackKern ifNil: [
		trackKern := OrderedCollection new]
]

{ #category : #private }
PtFAdobeFontMetric >> trackKernSize: aString [
	aString isEmpty ifTrue: [^self].
	aString asNumber
]

{ #category : #attributes }
PtFAdobeFontMetric >> underlinePosition [
	^self direction underlinePosition
]

{ #category : #private }
PtFAdobeFontMetric >> underlinePosition: aString [
	self direction underlinePosition: aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> underlineThickness [
	^self direction underlineThickness
]

{ #category : #private }
PtFAdobeFontMetric >> underlineThickness: aString [
	self direction underlineThickness: aString
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> unencodedCharMetrics [
	^self charMetrics select: [:charMetric | charMetric c = -1]
]

{ #category : #attributes }
PtFAdobeFontMetric >> version [
	"<String>"
	"(Optional.) Font program version identifier. Matches the string found in the FontInfo dictionary of the font program itself."

	^version
]

{ #category : #private }
PtFAdobeFontMetric >> version: aString [
	version := aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> weight [
	"<String>
	(Optional.) Weight of the font."

	^weight
]

{ #category : #private }
PtFAdobeFontMetric >> weight: aString [
	weight := aString
]

{ #category : #attributes }
PtFAdobeFontMetric >> weightNumber [
	"<Integer [1..999]>
	(Optional.) Weight of the font."

	| dict |
	dict := Dictionary new.
	dict at: 'thin' put: 100.
	dict at: 'extralight' put: 200.
	dict at: 'ultralight' put: 200.
	dict at: 'light' put: 300.
	dict at: 'normal' put: 400.
	dict at: 'regular' put: 400.
	dict at: 'book' put: 400.
	dict at: 'medium' put: 500.
	dict at: 'roman' put: 500.
	dict at: 'semibold' put: 600.
	dict at: 'demibold' put: 600.
	dict at: 'demi' put: 600.
	dict at: 'bold' put: 700.
	dict at: 'extra bold' put: 800.
	dict at: 'extrabold' put: 800.
	dict at: 'ultrabold' put: 800.
	dict at: 'heavy' put: 900.
	dict at: 'black' put: 900.
	dict at: 'extrablack' put: 950.
	dict at: 'ultrablack' put: 950.
	^dict at: self weight asLowercase ifAbsent: [400]
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> widths [
	"<Array of: Integer>
	lastChar - firstChar + 1 widths"

	^(self firstChar to: self lastChar) collect: [:i |
		| m |
		m := self charMetricAt: i.
		m ifNil: [0] ifNotNil: [m width]]
]

{ #category : #'accessing encoding' }
PtFAdobeFontMetric >> widths256 [
	"<Array of: Integer>
	256 widths"

	^(0 to: 255) collect: [:i |
		(self charMetricAt: i) ifNotNil: [:metric | metric width] ifNil: [0]]
]

{ #category : #attributes }
PtFAdobeFontMetric >> xHeight [
	"<Number>"
	"(Optional.) Typically the y-value of the top of the lowercase x. If this font program contains no lowercase x, this keyword might be missing or number might be 0."

	^xHeight ifNil: [0]
]

{ #category : #private }
PtFAdobeFontMetric >> xHeight: aString [
	xHeight := aString asNumber
]

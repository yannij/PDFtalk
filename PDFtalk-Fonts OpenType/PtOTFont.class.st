"
holds an OpenType font content
The data types are used in the OpenType font file. All OpenType fonts use Motorola-style byte ordering (Big Endian).

(see http://www.microsoft.com/typography/otspec/default.htm for specifications)

"
Class {
	#name : #PtOTFont,
	#superclass : #PtFFont,
	#instVars : [
		'filename',
		'fileContent',
		'sfntVersion',
		'numTables',
		'searchRange',
		'entrySelector',
		'rangeShift',
		'tables',
		'glyphs',
		'tabularGlyphIds',
		'header',
		'tabularVariants',
		'tabularSuffix'
	],
	#classInstVars : [
		'installed'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #'instance creation' }
PtOTFont class >> file: fileString contents: aByteArray [
	^self filename: fileString content: aByteArray
]

{ #category : #'instance creation' }
PtOTFont class >> filename: fileString content: aFileContentByteArray [
	| inst |
	inst := self new.
	inst initializeFilename: fileString content: aFileContentByteArray.
	^inst
]

{ #category : #'instance creation' }
PtOTFont class >> newFromFile: aFilename [
	^self filename: aFilename tail content: aFilename contentsOfEntireBinaryFile
]

{ #category : #'accessing metrics' }
PtOTFont >> ascender [
	^self os2 typoAscender
]

{ #category : #testing }
PtOTFont >> canDisplayCharacter: aCharacter [
	^(self glyphIndexAtUnicode: aCharacter asInteger) notNil
]

{ #category : #testing }
PtOTFont >> canDisplayUnencodedGlyphs [
	^true
]

{ #category : #'accessing metrics' }
PtOTFont >> capHeight [
	^self os2 capHeight
]

{ #category : #accessing }
PtOTFont >> cff [
	"<Cff>"

	^self tables at: 'CFF '
]

{ #category : #accessing }
PtOTFont >> characterGlyphs [
	^self glyphs allButFirst: 1
]

{ #category : #accessing }
PtOTFont >> cmap [
	^self tables at: 'cmap'
]

{ #category : #accessing }
PtOTFont >> codeForGlyph: aGlyphId [
	^self cmap codeForGlyph: aGlyphId
]

{ #category : #accessing }
PtOTFont >> createGlyphs [
	"<Array of: Glyph>"

	| cffFont sids hMetrics list |
	cffFont := self font.
	sids := cffFont charset sids.
	hMetrics := self hMetrics.
	list := OrderedCollection new: self numGlyphs.
	cffFont charStrings withIndexDo: [:charString :index |
		| id sid string code hMetric |
		id := index - 1.
		sid := sids at: index.
		string := cffFont stringAt: sid.
		code := self codeForGlyph: id.
		code = Character illegalCode ifTrue: [
			code := nil].
		hMetric := hMetrics at: index.
		list add: (Glyph id: id name: string asSymbol charString: charString code: code hMetric: hMetric)].
	^list asArray
]

{ #category : #'accessing metrics' }
PtOTFont >> descender [
	^self os2 typoDescender
]

{ #category : #accessing }
PtOTFont >> entrySelector [
	"<Integer>
	Log2(maximum power of 2 <= numTables)."

	^entrySelector
]

{ #category : #accessing }
PtOTFont >> faceName [
	^self familyName
]

{ #category : #accessing }
PtOTFont >> familyName [
	"<String>"

	^self nameAt: 1
]

{ #category : #accessing }
PtOTFont >> fileContent [
	"<ByteArray>"

	^fileContent
]

{ #category : #accessing }
PtOTFont >> filename [
	"<String>
	the file name of the Windows font file"

	^filename
]

{ #category : #accessing }
PtOTFont >> font [
	^self cff fontSet fonts first
]

{ #category : #'accessing metrics' }
PtOTFont >> fontBBox [
	^self header fontBBox
]

{ #category : #accessing }
PtOTFont >> forceBold [
	"<Boolean>"

	^self cff forceBold
]

{ #category : #accessing }
PtOTFont >> glyphIndexAtUnicode: aUnicodeInteger [
	"<Integer | nil>"

	^self cmap glyphIndexAtUnicode: aUnicodeInteger
]

{ #category : #accessing }
PtOTFont >> glyphNamed: aString [
	"<Glyph | nil>"

	| symbol |
	symbol := aString asSymbol.
	^self glyphs detect: [:glyph | glyph name = symbol] ifNone: [nil]
]

{ #category : #accessing }
PtOTFont >> glyphOrNilAtUnicode: aUnicodeInteger [
	^(self glyphIndexAtUnicode: aUnicodeInteger) ifNotNil: [:gid | self glyphs at: gid + 1]
]

{ #category : #accessing }
PtOTFont >> glyphs [
	^glyphs ifNil: [glyphs := self createGlyphs]
]

{ #category : #'accessing metrics' }
PtOTFont >> hMetrics [
	"<Array of: HorMetric>
	Horizontal metrics."

	^self hmtx hMetrics
]

{ #category : #testing }
PtOTFont >> hasTabularGlyphs [
	^self tabularGlyphIds notEmpty
]

{ #category : #accessing }
PtOTFont >> head [
	^self tables at: 'head'
]

{ #category : #accessing }
PtOTFont >> header [
	^header ifNil: [header := PtOTFontHeader fromBytes: self head contents]
]

{ #category : #accessing }
PtOTFont >> hhea [
	^self tables at: 'hhea'
]

{ #category : #accessing }
PtOTFont >> hmtx [
	^self tables at: 'hmtx'
]

{ #category : #'initialize-release' }
PtOTFont >> initializeFilename: fileString content: aFileContentByteArray [
	filename := fileString.
	fileContent := aFileContentByteArray.
	self initializeFromBytes
]

{ #category : #'initialize-release' }
PtOTFont >> initializeFromBytes [
	| rst head |
	rst := self fileContent readStream.
	sfntVersion := (rst next: 4) asString.
	head := ByteReadStream bigEndianOn: (rst next: 8).
	numTables := head nextUnsignedShort.
	searchRange := head nextUnsignedShort.
	entrySelector := head nextUnsignedShort.
	rangeShift := head nextUnsignedShort.
	tables := Valuemap new.
	self numTables timesRepeat: [
		| table |
		table := PtOTTable newFor: self from: rst.
		self tables at: table tag put: table]
]

{ #category : #testing }
PtOTFont >> isFixedPitch [
	^self post isFixedPitch
]

{ #category : #testing }
PtOTFont >> isItalic [
	^self os2 isItalic
]

{ #category : #testing }
PtOTFont >> isScreenFontInstalled [
	"is the font used on this machine?"

	^self isUsedOnScreen
]

{ #category : #accessing }
PtOTFont >> italicAngle [
	^self post italicAngle
]

{ #category : #'accessing metrics' }
PtOTFont >> leftSideBearingOfUnicode: unicode [
	^(self glyphAtUnicode: unicode) leftSideBearing
]

{ #category : #accessing }
PtOTFont >> maxp [
	^self tables at: 'maxp'
]

{ #category : #accessing }
PtOTFont >> nameAt: nameId [
	"<String | nil>"

	^self nameTable nameAt: nameId
]

{ #category : #accessing }
PtOTFont >> nameOfGlyph: aGlyphId [
	"<String>"

	^self cff nameOfGlyph: aGlyphId
]

{ #category : #accessing }
PtOTFont >> nameTable [
	^self tables at: 'name'
]

{ #category : #accessing }
PtOTFont >> notdefGlyph [
	"<Glyph>
	glyph for undefined character codes"

	^self glyphs first
]

{ #category : #accessing }
PtOTFont >> numGlyphs [
	"<Integer>
	Number of glyphs."

	^self maxp numGlyphs
]

{ #category : #accessing }
PtOTFont >> numTables [
	"<Integer>
	Number of tables."

	^numTables
]

{ #category : #accessing }
PtOTFont >> numberOfHMetrics [
	"<Integer>
	Number of horizontal metrics."

	^self hhea numberOfHMetrics
]

{ #category : #accessing }
PtOTFont >> os2 [
	^self tables at: 'OS/2'
]

{ #category : #accessing }
PtOTFont >> pdfFlags [
	| flags |
	flags := super pdfFlags.
	self forceBold ifTrue: [
		flags := flags bitOr: 2r01000000000000000000].
	^flags
]

{ #category : #accessing }
PtOTFont >> platformTable [
	"<CmapSubtable"

	^self cmap platformTable
]

{ #category : #accessing }
PtOTFont >> post [
	^self tables at: 'post'
]

{ #category : #accessing }
PtOTFont >> postScriptName [
	^self nameAt: 6
]

{ #category : #printing }
PtOTFont >> printOn: stream [
	stream
		nextPutAll: 'OpenTypePS(';
		nextPutAll: self postScriptName;
		nextPut: $)
]

{ #category : #printing }
PtOTFont >> printvalueWith: printer [
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'sfntVersion' value: self sfntVersion).
	args add: (printer constant: 'numTables' value: self numTables).
	args add: (printer constant: 'searchRange' value: self searchRange).
	args add: (printer constant: 'entrySelector' value: self entrySelector).
	args add: (printer constant: 'rangeShift' value: self rangeShift).
	args add: (printer dictionary: 'tables' value: self tables).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtOTFont >> rangeShift [
	"<Integer>
	NumTables x 16-searchRange."

	^rangeShift
]

{ #category : #accessing }
PtOTFont >> searchRange [
	"<Integer>
	(Maximum power of 2 <= numTables) x 16."

	^searchRange
]

{ #category : #accessing }
PtOTFont >> setWidth [
	^self os2 widthClass / 10.0
]

{ #category : #accessing }
PtOTFont >> sfntVersion [
	"<String> (Fixed ??!)
	0x00010000 for version 1.0
	OpenType fonts that contain TrueType outlines should use the value of 1.0 for the sfnt version. OpenType fonts containing CFF data should use the tag 'OTTO' as the sfnt version number.
	NOTE: The Apple specification for TrueType fonts allows for 'true' and 'typ1' for sfnt version. These version tags should not be used for fonts which contain OpenType tables."

	^sfntVersion
]

{ #category : #'accessing metrics' }
PtOTFont >> stemV [
	^self os2 stemV
]

{ #category : #accessing }
PtOTFont >> tables [
	"<Dictionary key: String value: OpenTypeTable>"

	^tables ifNil: [Dictionary new beImmutable]
]

{ #category : #accessing }
PtOTFont >> tables: aDictionary [
	tables := aDictionary
]

{ #category : #accessing }
PtOTFont >> tabularGlyphIds [
	"<SequenceableCollection of: Integer>
	cached GIDs"

	^tabularGlyphIds ifNil: [
		tabularGlyphIds := (0 to: self numGlyphs - 1) select: [:gid |
			'*.' , self tabularSuffix match: (self nameOfGlyph: gid)]]
]

{ #category : #accessing }
PtOTFont >> tabularSuffix [
	"<String>"

	^tabularSuffix ifNil: [
		| oneGlyph |
		oneGlyph := self glyphAtUnicode: $1 asInteger.
		tabularSuffix := self tabularSuffixes
			detect: [:suffix |
			(self glyphNamed: oneGlyph name , '.' , suffix) notNil]
			ifNone: [
			'']]
]

{ #category : #accessing }
PtOTFont >> tabularSuffixes [
	^#('tab' 'lt' 'fitted' 'tf' 'lftab')
]

{ #category : #accessing }
PtOTFont >> tabularVariantAt: aGlyph ifAbsent: absentBlock [
	"<Glyph>"

	^self tabularVariants at: aGlyph ifAbsent: absentBlock
]

{ #category : #accessing }
PtOTFont >> tabularVariantAt: aGlyph put: aTabularGlyph [
	"<Glyph>"

	^self tabularVariants at: aGlyph put: aTabularGlyph
]

{ #category : #accessing }
PtOTFont >> tabularVariantOf: aGlyph [
	"<Glyph | nil>
	Preliminary - This should make use of the GDEF table of the font"

	| tabular |
	aGlyph ifNil: [
		^nil].
	tabular := self tabularVariantOrGlyph: aGlyph.
	tabular = aGlyph ifTrue: [
		^nil].
	^tabular
]

{ #category : #accessing }
PtOTFont >> tabularVariantOrGlyph: aGlyph [
	"<Glyph>
	the variant or aGlyph if not found.
	Adds the lookup to the cache of tabular variant for speed.
	
	Preliminary - This should make use of the GDEF table of the font"

	aGlyph ifNil: [
		^nil].
	^self tabularVariantAt: aGlyph ifAbsent: [
		| glyph possibleName suffix |
		glyph := aGlyph.
		suffix := self tabularSuffix.
		suffix isEmpty ifTrue: [
			^self tabularVariantAt: aGlyph put: glyph].
		possibleName := aGlyph name , '.' , suffix.
		(self glyphNamed: possibleName)
			ifNil: [
			| altGlyphs |
			altGlyphs := ((self tabularSuffixes copyWithout: suffix) collect: [:altSuffix |
				self glyphNamed: aGlyph name , '.' , altSuffix]) select: #notNil.
			altGlyphs notEmpty ifTrue: [
				glyph := altGlyphs first]]
			ifNotNil: [:tabGlyph |
			glyph := tabGlyph].
		self tabularVariantAt: aGlyph put: glyph]
]

{ #category : #accessing }
PtOTFont >> tabularVariants [
	"<Dictionary key: Glyph value: Glyph>"

	^tabularVariants ifNil: [tabularVariants := Dictionary new]
]

{ #category : #accessing }
PtOTFont >> undefinedGlyph [
	^self glyphs first
]

{ #category : #'accessing metrics' }
PtOTFont >> underlinePosition [
	^self post psUnderlinePosition
]

{ #category : #'accessing metrics' }
PtOTFont >> underlineThickness [
	^self post underlineThickness
]

{ #category : #'accessing metrics' }
PtOTFont >> unitsPerEm [
	"<Integer>
	Valid range is from 16 to 16384. This value should be a power of 2 for fonts that have TrueType outlines"

	^self header unitsPerEm
]

{ #category : #accessing }
PtOTFont >> weight [
	^self os2 weightClass
]

{ #category : #'accessing metrics' }
PtOTFont >> widthOfUndefinedGlyph [
	^self notdefGlyph width
]

{ #category : #'accessing metrics' }
PtOTFont >> widths [
	"<Array of: Integer>"

	^self hMetrics collect: #advanceWidth
]

{ #category : #'accessing metrics' }
PtOTFont >> xHeight [
	^self os2 xHeight
]

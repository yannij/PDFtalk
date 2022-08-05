"
superclass of all font types

defines the common protocol for all fonts to be used with PDF
"
Class {
	#name : #PtFFont,
	#superclass : #Object,
	#instVars : [
		'useAlternativeFont'
	],
	#classVars : [
		'LoadedFonts'
	],
	#category : #'PDFtalk-Fonts Basics'
}

{ #category : #accessing }
PtFFont class >> definedFontKeys [
	"<SequenceableCollection of: Symbol>
	the keys of the defined fonts in this class.
	The returned values can be used as argument in #setFont:size: of the PDF.Renderer"
	"PDFtalk.Fonts.OpenType.Font definedFontKeys"
	"CustomFont definedFontKeys"
	"StandardFont definedFontKeys"

	^((Pragma allNamed: #font: in: self class) collect: [:pragma | pragma arguments first]) sorted
]

{ #category : #accessing }
PtFFont class >> definedNamedFonts [
	"<Dictionary key: (Symbol | String) value: Font>"

	| dict |
	dict := Dictionary new.
	self fontClasses do: [:class |
		(Pragma allNamed: #font: in: class class) do: [:pragma |
			dict at: pragma arguments first ifAbsentPut: [
				class perform: pragma methodSelector]]].
	^dict
]

{ #category : #accessing }
PtFFont class >> fontAt: aSymbolOrFilenameString [
	"<Font>
	the loaded instance registered at aSymbolOrFilenameString.
	An error is raised when the font was not found"

	^self loadedFonts at: aSymbolOrFilenameString ifAbsent: [
		PtFFontNotFound raiseSignal: aSymbolOrFilenameString , ' was not found']
]

{ #category : #accessing }
PtFFont class >> fontAt: aSymbolOrFilenameString ifAbsent: aBlock [
	"<Font | nil>
	the loaded instance registered at aSymbol"

	^self loadedFonts at: aSymbolOrFilenameString ifAbsent: aBlock
]

{ #category : #accessing }
PtFFont class >> fontAt: aSymbolOrFilenameString ifAbsentPut: aBlock [
	^self loadedFonts at: aSymbolOrFilenameString ifAbsentPut: aBlock
]

{ #category : #accessing }
PtFFont class >> fontAt: aSymbolOrFilenameString put: aFont [
	^self loadedFonts at: aSymbolOrFilenameString put: aFont
]

{ #category : #accessing }
PtFFont class >> fontClasses [
	"<SequenceableCollection of: Font class>"

	^PtFFont withAllSubclasses
]

{ #category : #accessing }
PtFFont class >> loadedFonts [
	"<Dictionary key: (Symbol | String) value: Font>
	the registry of loaded fonts.
	The key is either a Symbol or a filename (for an OpenType font) when loaded from the application"
	"Font loadedFonts"
	"Font reloadFonts"

	^LoadedFonts ifNil: [
		| dictionary total model done |
		dictionary := self definedNamedFonts.
		total := dictionary size.
		model := 0.0 asValue.
		self triggerEvent: #installing:model: with: total with: model.
		total := total asFloat.
		done := 0.0.
		dictionary do: [:font |
			font install.
			done := done + 1.0.
			model value: done / total].
		self triggerEvent: #fontsInstalled.
		LoadedFonts := dictionary]
]

{ #category : #'accessing encoders' }
PtFFont class >> macRomanEncoder [
	^PDF macRomanEncoder
]

{ #category : #'accessing encoders' }
PtFFont class >> pdfDocEncoder [
	^PDF pdfDocEncoder
]

{ #category : #pragmas }
PtFFont class >> pragmas [
	<pragmas: #class>
	^#(#font:)
]

{ #category : #'accessing encoders' }
PtFFont class >> standardEncoder [
	^PDF standardEncoder
]

{ #category : #'accessing encoders' }
PtFFont class >> winAnsiEncoder [
	^PDF winAnsiEncoder
]

{ #category : #'accessing metrics' }
PtFFont >> ascender [
	"<Integer>
	For roman font programs: usually the y-value of the top of the lowercase d"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> ascenderInTextSpace [
	"<Number>
	For roman font programs: usually the y-value of the top of the lowercase d"

	^self ascender / self unitsPerEm
]

{ #category : #testing }
PtFFont >> canDisplayCharacter: aCharacter [
	"<Boolean>
	does the receiver have a glyph for the character?"

	^self subclassResponsibility
]

{ #category : #testing }
PtFFont >> canDisplayUnencodedGlyphs [
	^false
]

{ #category : #'accessing metrics' }
PtFFont >> capHeight [
	"<Integer>
	(Optional.) Usually the y-value of the top of the capital H. If this font program contains no capital H, this keyword might be missing or number might be 0."

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> capHeightInTextSpace [
	"<Number>
	(Optional.) Usually the y-value of the top of the capital H. If this font program contains no capital H, this keyword might be missing or number might be 0."

	^self capHeight / self unitsPerEm
]

{ #category : #accessing }
PtFFont >> characterAt: index [
	"<Character>"

	index = Character illegalCode ifTrue: [
		^Character illegalCode asCharacter].
	self fontbody ifNil: [
		^Character illegalCode asCharacter].
	^self fontbody encoder decode: index
]

{ #category : #accessing }
PtFFont >> characterCodeOf: aCharacter [
	"<Integer [0..255]>"

	self fontbody ifNil: [
		^Character illegalCode].
	^self fontbody encoder encode: aCharacter
]

{ #category : #accessing }
PtFFont >> characterGlyphs [
	"<SequenceableCollection of: (Glyph | CharacterMetric)>
	all glyphs without .notdef"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> descender [
	"<Integer>
	For roman font programs: typically the y-value of the bottom of the lowercase p.
	Usually a negative number"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> descenderInTextSpace [
	"<Number>
	For roman font programs: typically the y-value of the bottom of the lowercase p.
	Usually a negative number"

	^self descender / self unitsPerEm
]

{ #category : #actions }
PtFFont >> doUseAlternativeFont [
	useAlternativeFont := true
]

{ #category : #actions }
PtFFont >> dontUseAlternativeFont [
	useAlternativeFont := false
]

{ #category : #accessing }
PtFFont >> faceName [
	"<String>
	the name of the font face, normally without suffixes like »-Bold«, »-Italic« etc.
	Used in a windows LOGFONT"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFFont >> familyName [
	"<String>
	the font family"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFFont >> filename [
	"<String>
	the file name of the Windows font file"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> fontBBox [
	"<Rectangle>
	in the native glyph space (see unitsPerEm)"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> fontBBoxInStandardGlyphSpace [
	"<Rectangle>
	normalized for Em = 1000"

	| box |
	box := self fontBBox.
	^(self inStandardGlyphSpace: box origin) corner: (self inStandardGlyphSpace: box corner)
]

{ #category : #'accessing metrics' }
PtFFont >> fontBBoxInTextSpace [
	"<Rectangle>"

	| bbox unitsPerEm |
	bbox := self fontBBox.
	unitsPerEm := self unitsPerEm.
	^bbox origin / unitsPerEm corner: bbox corner / unitsPerEm
]

{ #category : #accessing }
PtFFont >> fontbody [
	"<FontBody | nil>"

	^[PtFFontBody named: self postScriptName] on: KeyNotFound do: [:ex | nil]
]

{ #category : #accessing }
PtFFont >> glyphAtUnicode: aUnicodeInteger [
	"<Glyph>
	the glyph for aUnicodeInteger.
	When there is no glyph available, the .notdef glyph is returned"

	^(self glyphOrNilAtUnicode: aUnicodeInteger) ifNil: [self undefinedGlyph]
]

{ #category : #accessing }
PtFFont >> glyphForTabular: aCharacter [
	"<Glyph | nil>"

	^(self tabularGlyphFor: aCharacter) ifNil: [self glyphAtUnicode: aCharacter asInteger]
]

{ #category : #accessing }
PtFFont >> glyphOrNilAtUnicode: aUnicodeInteger [
	"<Glyph | nil>
	the glyph for aUnicodeInteger.
	When there is no glyph available, nil is returned"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFFont >> glyphs [
	"<Array of: Glyph>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFFont >> glyphsFor: aString [
	"<SequenceableCollection of Glyph>"

	| dict |
	dict := IdentityDictionary new.
	aString asSet do: [:char | dict at: char put: (self glyphAtUnicode: char asInteger)].
	^aString asOrderedCollection collect: [:char | dict at: char]
]

{ #category : #'accessing metrics' }
PtFFont >> headroom [
	"<Number>
	the distance between ascend to upper bound of the fontBBox"

	^self fontBBox corner y - self ascender
]

{ #category : #'accessing metrics' }
PtFFont >> headroomInTextSpace [
	"<Number>
	the distance between ascend to upper bound of the fontBBox"

	^self fontBBoxInTextSpace corner y - self ascenderInTextSpace
]

{ #category : #'accessing metrics' }
PtFFont >> inStandardGlyphSpace: aNumber [
	"<Integer>
	Integer scaled to a standard 1000 x 1000 glyph box"

	^(aNumber * 1000 / self unitsPerEm) rounded
]

{ #category : #'initialize-release' }
PtFFont >> install [
	"install the font in the Smalltalk system and return it"

	PtFFontBody installFromFont: self.
	^self
]

{ #category : #testing }
PtFFont >> isFixedPitch [
	^self subclassResponsibility
]

{ #category : #testing }
PtFFont >> isItalic [
	^self subclassResponsibility
]

{ #category : #testing }
PtFFont >> isScreenFontInstalled [
	[ComposedText withText: 'Example' style: self screenFont] on: NoMatchingFontError do: [:ex |
		^false].
	^true
]

{ #category : #accessing }
PtFFont >> italicAngle [
	"<Number>"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> leftSideBearingOfUnicode: unicode [
	"<Number> in font space"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFFont >> pdfFlags [
	"<Integer>"
	"The value of the Flags entry in a font descriptor shall be an unsigned 32-bit integer containing flags specifying various characteristics of the font. 
Bit positions within the flag word are numbered from 1 (low-order) to 32 (high-order). 
The table shows the meanings of the flags; all undefined flag bits are reserved and shall be set to 0 by conforming writers.

Bit 		Name			Meaning
1		FixedPitch 		All glyphs have the same width (as opposed to proportional or variable-pitch fonts, which have different widths).
2		Serif 			Glyphs have serifs, which are short strokes drawn at an angle on the top and bottom of glyph stems. 
						(Sans serif fonts do not have serifs.)
3		Symbolic 		Font contains glyphs outside the Adobe standard Latin character set. 
						This flag and the Nonsymbolic flag shall not both be set or both be clear.
4		Script 			Glyphs resemble cursive handwriting.
6		Nonsymbolic 	Font uses the Adobe standard Latin character set or a subset of it.
7		Italic 			Glyphs have dominant vertical strokes that are slanted.
17 		AllCap 			Font contains no lowercase letters; typically used for display purposes, such as for titles or headlines.
18		SmallCap 		Font contains both uppercase and lowercase letters. 
						The uppercase letters are similar to those in the regular version of the same typeface family. 
						The glyphs for the lowercase letters have the same shapes as the corresponding uppercase letters, 
						but they are sized and their proportions adjusted so that they have the same size and stroke weight 
						as lowercase glyphs in the same typeface family.
19		ForceBold 		See description after Note 1 in this sub-clause."

	| flags |
	flags := 0.
	self isFixedPitch ifTrue: [
		flags := flags bitOr: 1].
	true "non-symbolic" ifTrue: [
		flags := flags bitOr: 2r0100000].
	self isItalic ifTrue: [
		flags := flags bitOr: 2r01000000].
	^flags
]

{ #category : #accessing }
PtFFont >> postScriptName [
	"<String>
	the name as used by PostScript and PDF"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFFont >> screenFamilyName [
	"<String>
	the font family for the screen FontDescription"

	self usingAlternativeFont ifTrue: [
		^'arial'].
	^self familyName
]

{ #category : #accessing }
PtFFont >> screenFont [
	"<VariableSizeTextAttributes>"
	^VariableSizeTextAttributes defaultFontQuery: self screenFontDescription
]

{ #category : #accessing }
PtFFont >> screenFontDescription [
	| fd |
	fd := FontDescription new.
	fd family: self screenFamilyName.
	fd setWidth: self setWidth.
	fd boldness: self weight / 1000.0.
	fd italic: self isItalic.
	fd fixedWidth: self isFixedPitch.
	^fd
]

{ #category : #accessing }
PtFFont >> setWidth [
	"<Number [0..1]>
	The relative width of the characters in the font.
	0.5 is normal, smaller is condensed, larger is wider"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> stemV [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> stringWidthOf: aString at: fontSize [
	"<Number> in unscaled text space
	Still here for compatibility"

	^(self unitWidthOfGlyphs: (self glyphsFor: aString)) * fontSize
]

{ #category : #accessing }
PtFFont >> stringWithoutUnprintableCharacters: aString [
	"<String>"

	^aString select: [:char | self canDisplayCharacter: char]
]

{ #category : #accessing }
PtFFont >> tabularGlyphFor: aCharacter [
	"<Glyph | nil>"

	^self tabularVariantOf: (self glyphAtUnicode: aCharacter asInteger)
]

{ #category : #accessing }
PtFFont >> tabularGlyphsFor: aString [
	"<SequenceableCollection of Glyph>"

	^(self glyphsFor: aString) collect: [:glyph | self tabularVariantOrGlyph: glyph]
]

{ #category : #accessing }
PtFFont >> tabularVariantOf: aGlyph [
	"<Glyph | nil>
	only OpenType and others supports tabular variants, Type1 does not"

	^nil
]

{ #category : #accessing }
PtFFont >> tabularVariantOrGlyph: aGlyph [
	"<Glyph>
	the variant or aGlyph if not found"

	^aGlyph
]

{ #category : #accessing }
PtFFont >> undefinedGlyph [
	"<Glyph>
	the glyph for an undefined character (.notdef)"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> underlinePosition [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> underlinePositionInTextSpace [
	"<Number>"

	^self underlinePosition / self unitsPerEm
]

{ #category : #'accessing metrics' }
PtFFont >> underlineThickness [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> underlineThicknessInTextSpace [
	"<Number>"

	^self underlineThickness / self unitsPerEm
]

{ #category : #'accessing metrics' }
PtFFont >> unitWidthOfGlyphs: stringGlyphs [
	"<Number> in unscaled text space for font size 1"

	| widths |
	widths := stringGlyphs collect: [:glyph | self widthOfGlyphInTextSpace: glyph].
	^widths inject: 0 into: [:sum :w | sum + w]
]

{ #category : #'accessing metrics' }
PtFFont >> unitsPerEm [
	"<Integer>
	The box width and height in which a glyph is described using integer values.
	Usually 1000 => 1000 x 1000 box"

	^1000
]

{ #category : #actions }
PtFFont >> useOnScreen [
	"tell the system to use the receiver as screen font.
	Install the font if possible"

	^self
]

{ #category : #testing }
PtFFont >> usingAlternativeFont [
	"<Boolean>"

	^useAlternativeFont ifNil: [useAlternativeFont := false]
]

{ #category : #accessing }
PtFFont >> weight [
	"<Integer>
	WORD: The weight of the font in the range 0 through 1000. For example, 400 is roman and 700 is bold. If this value is zero, a default weight is used"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> widthOfGlyph: aGlyphOrCharMetricOrNil [
	"<Number> in glyph units"

	aGlyphOrCharMetricOrNil ifNil: [
		^self widthOfUndefinedGlyph].
	^aGlyphOrCharMetricOrNil width
]

{ #category : #'accessing metrics' }
PtFFont >> widthOfGlyphInTextSpace: aGlyphOrCharMetricOrNil [
	"<Number> in unscaled text space"

	^(self widthOfGlyph: aGlyphOrCharMetricOrNil) / self unitsPerEm
]

{ #category : #'accessing metrics' }
PtFFont >> widthOfString: aString [
	"<Number> in unscaled text space"

	^self unitWidthOfGlyphs: (self glyphsFor: aString)
]

{ #category : #'accessing metrics' }
PtFFont >> widthOfUndefinedGlyph [
	"<Number> in font units"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> xHeight [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #'accessing metrics' }
PtFFont >> xHeightInTextSpace [
	"<Number>"

	^self xHeight / self unitsPerEm
]

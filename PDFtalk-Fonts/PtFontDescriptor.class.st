"
PDF FontDescriptor as defined in PDF 32000_2008.pdf pp. 281.

A font descriptor specifies metrics and other attributes of a simple font or a CIDFont as a whole, as distinct from the metrics of individual glyphs.
These font metrics provide information that enables a conforming reader to synthesize a substitute font or select a similar font when the font program is unavailable.
The font descriptor may also be used to embed the font program in the PDF file.

Font descriptors shall not be used with Type 0 fonts. Beginning with PDF 1.5, font descriptors may be used with Type 3 fonts.

A font descriptor is a dictionary whose entries specify various font attributes. 
All integer values shall be units in glyph space.
"
Class {
	#name : #PtFontDescriptor,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtFontDescriptor class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #FontDescriptor
		supertype: #Dictionary
		section: '9.8'
		documentation: 'A font descriptor specifies metrics and other attributes of a simple font or a CIDFont as a whole, as distinct from the metrics of individual glyphs.
These font metrics provide information that enables a conforming reader to synthesize a substitute font or select a similar font when the font program is unavailable.
The font descriptor may also be used to embed the font program in the PDF file.

Font descriptors shall not be used with Type 0 fonts. Beginning with PDF 1.5, font descriptors may be used with Type 3 fonts.

A font descriptor is a dictionary whose entries specify various font attributes. 
All integer values shall be units in glyph space.'
]

{ #category : #'accessing entries' }
PtFontDescriptor >> Ascent [
	<type: #Number>
	<required>
	<attribute: 8 documentation: '(Required, except for Type 3 fonts) 
The maximum height above the baseline reached by glyphs in this font. 
The height of glyphs for accented characters shall be excluded.'>
	^self objectAt: #Ascent
]

{ #category : #'accessing entries' }
PtFontDescriptor >> AvgWidth [
	<type: #Number>
	<attribute: 15 documentation: 'The average width of glyphs in the font.'>
	^self objectAt: #AvgWidth ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> CIDSet [
	<type: #Stream>
	<attribute: 25 documentation: '(meaningful only in CIDFonts) 
A stream identifying which CIDs are present in the CIDFont file. If this entry is present, the CIDFont shall contain only a subset of the glyphs in the character collection defined by the CIDSystemInfo dictionary. If it is absent, the only indication of a CIDFont subset shall be the subset tag in the FontName entry.
The stream’s data shall be organized as a table of bits indexed by CID. The bits shall be stored in bytes with the high-order bit first. Each bit shall correspond to a CID. The most significant bit of the first byte shall correspond to CID 0, the next bit to CID 1, and so on.'>
	^self objectAt: #CIDSet ifAbsent: [PtPDF Stream empty]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> CapHeight [
	<type: #Number>
	<required>
	<attribute: 11 documentation: '(Required for fonts that have Latin characters, except for Type 3 fonts)
The vertical coordinate of the top of flat capital letters, measured from the baseline.'>
	^self objectAt: #CapHeight
]

{ #category : #'accessing entries' }
PtFontDescriptor >> CharSet [
	<type: #String>
	<version: 1 dot: 1>
	<attribute: 21 documentation: '(meaningful only in Type 1 fonts) 
A string listing the character names defined in a font subset. 
The names in this string shall be in PDF syntax—that is, each name preceded by a slash (/). 
The names may appear in any order. 
The name .notdef shall be omitted; it shall exist in the font subset. 
If this entry is absent, the only indication of a font subset shall be the subset tag in the FontName entry.'>
	^self objectAt: #CharSet ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> Descent [
	<type: #Number>
	<required>
	<attribute: 9 documentation: '(Required, except for Type 3 fonts) 
The maximum depth below the baseline reached by glyphs in this font. 
The value shall be a negative number.'>
	^self objectAt: #Descent
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FD [
	<type: #Dictionary>
	<attribute: 24 documentation: '(meaningful only in CIDFonts) 
A dictionary whose keys identify a class of glyphs in a CIDFont. Each value shall be a dictionary containing entries that shall override the corresponding values in the main font descriptor dictionary for that class of glyphs.'>
	^self objectAt: #FD ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> Flags [
	<type: #Integer>
	<required>
	<attribute: 5 documentation: 'A collection of flags defining various characteristics of the font.'>
	^self objectAt: #Flags
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontBBox [
	<type: #Rectangle>
	<required>
	<attribute: 6 documentation: '(Required, except for Type 3 fonts) 
A rectangle, expressed in the glyph coordinate system, that shall specify the font bounding box. 
This should be the smallest rectangle enclosing the shape that would result if all of the glyphs of the font were placed with their origins coincident and then filled.'>
	^self objectAt: #FontBBox
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontFamily [
	<type: #String>
	<version: 1 dot: 5>
	<attribute: 2 documentation: '(should be used for Type 3 fonts in Tagged PDF documents)
A byte string specifying the preferred font family name.
EXAMPLE 1
For the font Times Bold Italic, the FontFamily is Times.'>
	^self objectAt: #FontFamily
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontFile [
	<type: #Stream>
	<attribute: 18 documentation: 'A stream containing a Type 1 font program.'>
	^self objectAt: #FontFile ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontFile2 [
	<type: #Stream>
	<version: 1 dot: 1>
	<attribute: 19 documentation: 'A stream containing a TrueType font program.'>
	^self objectAt: #FontFile2 ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontFile3 [
	<type: #Stream>
	<version: 1 dot: 2>
	<attribute: 20 documentation: 'A stream containing a font program whose format is specified by the Subtype entry in the stream dictionary'>
	^self objectAt: #FontFile3 ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontName [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The PostScript name of the font.
This name shall be the same as the value of BaseFont in the font or CIDFont dictionary that refers to this font descriptor.'>
	^self objectAt: #FontName
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontStretch [
	<type: #Name>
	<version: 1 dot: 5>
	<attribute: 3 documentation: '(should be used for Type 3 fonts in Tagged PDF documents) 
The font stretch value. It shall be one of these names (ordered from narrowest to widest): 
	UltraCondensed, 
	ExtraCondensed, 
	Condensed, 
	SemiCondensed, 
	Normal, 
	SemiExpanded, 
	Expanded, 
	ExtraExpanded or 
	UltraExpanded.
The specific interpretation of these values varies from font to font.
EXAMPLE 2
Condensed in one font may appear most similar to Normal in another.'>
	^self objectAt: #FontStretch
]

{ #category : #'accessing entries' }
PtFontDescriptor >> FontWeight [
	<type: #Number>
	<version: 1 dot: 5>
	<attribute: 4 documentation: '(should be used for Type 3 fonts in Tagged PDF documents) 
The weight (thickness) component of the fully-qualified font name or font specifier. 
The possible values shall be 100, 200, 300, 400, 500, 600, 700, 800, or 900, where each number indicates a weight that is at least as dark as its predecessor. 
A value of 400 shall indicate a normal weight; 700 shall indicate bold.
The specific interpretation of these values varies from font to font.
EXAMPLE 3
300 in one font may appear most similar to 500 in another.'>
	^self objectAt: #FontWeight
]

{ #category : #'accessing entries' }
PtFontDescriptor >> ItalicAngle [
	<type: #Number>
	<required>
	<attribute: 7 documentation: 'The angle, expressed in degrees counterclockwise from the vertical, of the dominant vertical strokes of the font.
EXAMPLE 4
The 9-o’clock position is 90 degrees, and the 3-o’clock position is –90 degrees.
The value shall be negative for fonts that slope to the right, as almost all italic fonts do.'>
	^self objectAt: #ItalicAngle
]

{ #category : #'accessing entries' }
PtFontDescriptor >> Lang [
	<type: #Name>
	<version: 1 dot: 5>
	<attribute: 23 documentation: '(meaningful only in CIDFonts) 
A name specifying the language of the font, which may be used for encodings where the language is not implied by the encoding itself. The value shall be one of the codes defined by Internet RFC 3066, Tags for the Identification of Languages or (PDF 1.0) 2-character language codes defined by ISO 639. If this entry is absent, the language shall be considered to be unknown.'>
	^self objectAt: #Lang ifAbsent: [(PtPDF classAt: #Name) empty]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> Leading [
	<type: #Number>
	<attribute: 10 documentation: 'The spacing between baselines of consecutive lines of text.'>
	^self objectAt: #Leading ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> MaxWidth [
	<type: #Number>
	<attribute: 16 documentation: 'The maximum width of glyphs in the font.'>
	^self objectAt: #MaxWidth ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> MissingWidth [
	<type: #Number>
	<attribute: 17 documentation: 'The width to use for character codes whose widths are not specified in a font dictionary’s Widths array.
This shall have a predictable effect only if all such codes map to glyphs whose actual widths are the same as the value of the MissingWidth entry.'>
	^self objectAt: #MissingWidth ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> StemH [
	<type: #Number>
	<attribute: 14 documentation: 'The thickness, measured vertically, of the dominant horizontal stems of glyphs in the font.'>
	^self objectAt: #StemH ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> StemV [
	<type: #Number>
	<required>
	<attribute: 13 documentation: '(Required, except for Type 3 fonts) 
The thickness, measured horizontally, of the dominant vertical stems of glyphs in the font.'>
	^self objectAt: #StemV
]

{ #category : #'accessing entries' }
PtFontDescriptor >> Style [
	<type: #Dictionary>
	<attribute: 22 documentation: '(meaningful only in CIDFonts) 
A dictionary containing entries that describe the style of the glyphs in the font'>
	^self objectAt: #Style ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFontDescriptor >> XHeight [
	<type: #Number>
	<attribute: 12 documentation: 'The font’s x height: the vertical coordinate of the top of flat nonascending lowercase letters (like the letter x), measured from the baseline, in fonts that have Latin characters.'>
	^self objectAt: #XHeight ifAbsent: [0 asPDF]
]

"
PDF Type3 Font as defined in PDF 32000_2008.pdf, clause 9.6.5, pp. 258.

Type 3 fonts differ from the other fonts supported by PDF. 
A Type 3 font dictionary defines the font; 
font dictionaries for other fonts simply contain information about the font and refer to a separate font program for the actual glyph descriptions. 
In Type 3 fonts, glyphs shall be defined by streams of PDF graphics operators. 
These streams shall be associated with glyph names. 
A separate encoding entry shall map character codes to the appropriate glyph names for the glyphs.

NOTE 1		Type 3 fonts are more flexible than Type 1 fonts because the glyph descriptions may contain arbitrary PDF graphics operators. 
			However, Type 3 fonts have no hinting mechanism for improving output at small sizes or low resolutions.
"
Class {
	#name : #PtType3,
	#superclass : #PtFont,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtType3 class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Type3
		supertype: #Font
		section: '9.6.5'
		documentation: 'Type 3 fonts differ from the other fonts supported by PDF. 
A Type 3 font dictionary defines the font; 
font dictionaries for other fonts simply contain information about the font and refer to a separate font program for the actual glyph descriptions. 
In Type 3 fonts, glyphs shall be defined by streams of PDF graphics operators. 
These streams shall be associated with glyph names. 
A separate encoding entry shall map character codes to the appropriate glyph names for the glyphs.

NOTE 1		Type 3 fonts are more flexible than Type 1 fonts because the glyph descriptions may contain arbitrary PDF graphics operators. 
			However, Type 3 fonts have no hinting mechanism for improving output at small sizes or low resolutions.'
]

{ #category : #'accessing entries' }
PtType3 >> CharProcs [
	<typeDictionaryOf: #Contents>
	<required>
	<attribute: 4 documentation: 'A dictionary in which each key shall be a glyph name and the value associated with that key shall be a content stream that constructs and paints the glyph for that character.
The stream shall include as its first operator either d0 or d1, followed by operators describing one or more graphics objects, which may include path, text, or image objects.'>
	^self objectAt: #CharProcs
]

{ #category : #'accessing entries' }
PtType3 >> Encoding [
	<type: #Name>
	<type: #Dictionary>
	<required>
	<attribute: 5 documentation: 'An encoding dictionary whose Differences array shall specify the complete character encoding for this font.'>
	^self objectAt: #Encoding
]

{ #category : #'accessing entries' }
PtType3 >> FirstChar [
	<type: #Integer>
	<required>
	<attribute: 6 documentation: 'The first character code defined in the font’s Widths array.'>
	^self objectAt: #FirstChar
]

{ #category : #'accessing entries' }
PtType3 >> FontBBox [
	<type: #Rectangle>
	<required>
	<attribute: 2 documentation: 'A rectangle expressed in the glyph coordinate system, specifying the font bounding box.
This is the smallest rectangle enclosing the shape that would result if all of the glyphs of the font were placed with their origins coincident and then filled.

If all four elements of the rectangle are zero, a conforming reader shall make no assumptions about glyph sizes based on the font bounding box.
If any element is nonzero, the font bounding box shall be accurate.
If any glyph’s marks fall outside this bounding box, incorrect behavior may result.'>
	^self objectAt: #FontBBox
]

{ #category : #'accessing entries' }
PtType3 >> FontDescriptor [
	<typeIndirect: #FontDescriptor>
	<attribute: 9 documentation: '(Required in Tagged PDF documents; shall be an indirect reference)
A font descriptor describing the font’s default metrics other than its glyph widths.'>
	^self objectAt: #FontDescriptor
]

{ #category : #'accessing entries' }
PtType3 >> FontMatrix [
	<typeArrayOf: #Number>
	<required>
	<attribute: 3 documentation: 'An array of six numbers specifying the font matrix, mapping glyph space to text space.

NOTE	A common practice is to define glyphs in terms of a 1000-unit glyph coordinate system, in which case the font matrix is [0.001 0 0 0.001 0 0].'>
	^self objectAt: #FontMatrix
]

{ #category : #'accessing entries' }
PtType3 >> LastChar [
	<type: #Integer>
	<required>
	<attribute: 7 documentation: 'The last character code defined in the font’s Widths array.'>
	^self objectAt: #LastChar
]

{ #category : #'accessing entries' }
PtType3 >> Name [
	<type: #Name>
	<attribute: 1 documentation: '(Required in PDF 1.0; optional otherwise)

The name by which this font is referenced in the Font subdictionary of the current resource dictionary.

This entry is obsolete and should not be used.'>
	^self objectAt: #Name
]

{ #category : #'accessing entries' }
PtType3 >> Resources [
	<type: #Resources>
	<version: 1 dot: 2>
	<attribute: 10 documentation: '(Optional but should be used)
A list of the named resources, such as fonts and images, required by the glyph descriptions in this font.
If any glyph descriptions refer to named resources but this dictionary is absent, the names shall be looked up in the resource dictionary of the page on which the font is used.'>
	^self objectAt: #Resources ifAbsent: [(PtPDF classAt: #Resources) new]
]

{ #category : #'accessing entries' }
PtType3 >> ToUnicode [
	<type: #ToUnicodeCMap>
	<version: 1 dot: 2>
	<attribute: 11 documentation: 'A stream containing a CMap file that maps character codes to Unicode values.'>
	^self objectAt: #ToUnicode
]

{ #category : #'accessing entries' }
PtType3 >> Widths [
	<typeArrayOf: #Number>
	<required>
	<attribute: 8 documentation: '(should be an indirect reference)
An array of (LastChar − FirstChar + 1) widths, each element being the glyph width for the character code that equals FirstChar plus the array index.
For character codes outside the range FirstChar to LastChar, the width shall be 0.
These widths shall be interpreted in glyph space as specified by FontMatrix (unlike the widths of a Type 1 font, which are in thousandths of a unit of text space).

If FontMatrix specifies a rotation, only the horizontal component of the transformed width shall be used.
That is, the resulting displacement shall be horizontal in text space, as is the case for all simple fonts.'>
	^self objectAt: #Widths
]

{ #category : #accessing }
PtType3 >> stringWidth: aContentString [
	^aContentString content inject: 0 into: [:width :characterCode | width + (self widthAt: characterCode)]
]

{ #category : #accessing }
PtType3 >> widthAt: aCharacterCode [
	| index |
	index := aCharacterCode - self FirstChar asSmalltalkValue + 1.
	(index between: 1 and: self Widths size) ifFalse: [
		"illegal character"
		^0].
	^(self FontMatrix transformed: (self Widths at: index) asSmalltalkValue @ 0) x * 1000
]

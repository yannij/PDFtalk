"
PDF Standard Type 1 Fonts as defined in PDF 32000_2008.pdf, clause 9.6.2.2, pp. 256.

The PostScript names of 14 Type 1 fonts, known as the standard 14 fonts, are as follows: Times-Roman, Helvetica, Courier, Symbol, Times-Bold, Helvetica-Bold, Courier-Bold, ZapfDingbats, Times-Italic, Helvetica-Oblique, Courier-Oblique, Times-BoldItalic, Helvetica-BoldOblique, Courier-BoldOblique

These fonts, or their font metrics and suitable substitution fonts, shall be available to the conforming reader
"
Class {
	#name : #PtStandardFont,
	#superclass : #PtType1,
	#instVars : [
		'standardWidths'
	],
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtStandardFont class >> fontNames [
	^#(#'Times-Roman' #Helvetica #Courier #Symbol #'Times-Bold' #'Helvetica-Bold' #'Courier-Bold' #ZapfDingbats #'Times-Italic' #'Helvetica-Oblique' #'Courier-Oblique' #'Times-BoldItalic' #'Helvetica-BoldOblique' #'Courier-BoldOblique')
]

{ #category : #testing }
PtStandardFont class >> isClassForDictionary: aDictionary [
	| subtypeEntry |
	subtypeEntry := aDictionary at: #Subtype ifAbsent: [
		^false].
	^self subtype asPDF = subtypeEntry asPDF and: [
	(aDictionary hasKey: #BaseFont) and: [
	self fontNames includes: (aDictionary at: #BaseFont) asSmalltalkValue]]
]

{ #category : #accessing }
PtStandardFont class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #StandardFont
		supertype: #Font
		section: '9.6.2.2'
		documentation: 'The PostScript names of 14 Type 1 fonts, known as the standard 14 fonts, are as follows: Times-Roman, Helvetica, Courier, Symbol, Times-Bold, Helvetica-Bold, Courier-Bold, ZapfDingbats, Times-Italic, Helvetica-Oblique, Courier-Oblique, Times-BoldItalic, Helvetica-BoldOblique, Courier-BoldOblique

These fonts, or their font metrics and suitable substitution fonts, shall be available to the conforming reader'
]

{ #category : #accessing }
PtStandardFont class >> subtype [
	^#Type1
]

{ #category : #'accessing entries' }
PtStandardFont >> FirstChar [
	<type: #Integer>
	<attribute: 1 documentation: 'The first character code defined in the font’s Widths array.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #FirstChar ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtStandardFont >> FontDescriptor [
	<typeIndirect: #FontDescriptor>
	<attribute: 4 documentation: 'A font descriptor describing the font’s metrics other than its glyph widths (see 9.8, "Font Descriptors"”\).
For the standard 14 fonts, the entries FirstChar, LastChar, Widths, and FontDescriptor shall either all be present or all be absent.
Ordinarily, these dictionary keys may be absent; specifying them enables a standard font to be overridden.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #FontDescriptor ifAbsent: [self font pdfFontDescriptor]
]

{ #category : #'accessing entries' }
PtStandardFont >> LastChar [
	<type: #Integer>
	<attribute: 2 documentation: 'The last character code defined in the font’s Widths array.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>
	^self objectAt: #LastChar ifAbsent: [255 asPDF]
]

{ #category : #'accessing entries' }
PtStandardFont >> Widths [
	<typeArrayOf: #Number>
	<attribute: 3
	documentation: '(indirect reference preferred)

An array of (LastChar - FirstChar + 1) widths, each element being the glyph width for the character code that equals FirstChar plus the array index.
For character codes outside the range FirstChar to LastChar, the value of MissingWidth from the FontDescriptor entry for this font shall be used.
The glyph widths shall be measured in units in which 1000 units correspond to 1 unit in text space.
These widths shall be consistent with the actual widths given in the font program.

Beginning with PDF 1.5, the special treatment given to the standard 14 fonts is deprecated.
Conforming writers should represent all fonts using a complete font descriptor.
For backwards capability, conforming readers shall still provide the special treatment identified for the standard 14 fonts.'>

	^self objectAt: #Widths ifAbsent: [self standardWidths]
]

{ #category : #accessing }
PtStandardFont >> font [
	"<Font>
	the real font"

	^PtFFont fontAt: self BaseFont asSmalltalkValue
]

{ #category : #accessing }
PtStandardFont >> metrics [
	"<AdobeFontMetric> compatible to FontDescriptor"

	^self font metrics
]

{ #category : #accessing }
PtStandardFont >> standardWidths [
	^standardWidths ifNil: [standardWidths := self metrics widths256 asPDF]
]

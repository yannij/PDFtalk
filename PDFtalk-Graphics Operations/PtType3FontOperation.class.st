"
PDF Type 3 Font Operator as defined in PDF 32000_2008.pdf, section 9.6.5, pp. 260.

Type 3 fonts differ from the other fonts supported by PDF. 
A Type 3 font dictionary defines the font; font dictionaries for other fonts simply contain information about the font and 
refer to a separate font program for the actual glyph descriptions. 
In Type 3 fonts, glyphs shall be defined by streams of PDF graphics operators. 
These streams shall be associated with glyph names. 
A separate encoding entry shall map character codes to the appropriate glyph names for the glyphs.

NOTE 1		Type 3 fonts are more flexible than Type 1 fonts because the glyph descriptions may contain arbitrary PDF graphics operators. 
			However, Type 3 fonts have no hinting mechanism for improving output at small sizes or low resolutions.
"
Class {
	#name : #PtType3FontOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

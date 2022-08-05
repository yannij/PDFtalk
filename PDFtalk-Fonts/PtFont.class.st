"
PDF Font as defined in PDF 32000_2008.pdf, clause 9.5, pp. 253.

A font shall be represented in PDF as a dictionary specifying the type of font, its PostScript name, its encoding, 
and information that can be used to provide a substitute when the font program is not available. 
Optionally, the font program may be embedded as a stream object in the PDF file.

The font types are distinguished by the Subtype entry in the font dictionary. 
Type 0 fonts are called composite fonts; other types of fonts are called simple fonts. 
In addition to fonts, PDF supports two classes of font-related objects, called CIDFonts and CMaps. 
CIDFonts, like fonts, are collections of glyphs; however, a CIDFont shall not be used directly but only as a component of a Type 0 font.
"
Class {
	#name : #PtFont,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Fonts'
}

{ #category : #'instance creation' }
PtFont class >> empty [
	| inst |
	inst := super empty.
	inst at: #Subtype put: self subtype.
	^inst
]

{ #category : #testing }
PtFont class >> isClassForDictionary: aDictionary [
	| subtypeEntry |
	subtypeEntry := aDictionary at: #Subtype ifAbsent: [
		^false].
	^self subtype asPDF = subtypeEntry asPDF
]

{ #category : #accessing }
PtFont class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Font
		supertype: #Dictionary
		section: '9.5'
		documentation: 'A font shall be represented in PDF as a dictionary specifying the type of font, its PostScript name, its encoding, 
and information that can be used to provide a substitute when the font program is not available. 
Optionally, the font program may be embedded as a stream object in the PDF file.

The font types are distinguished by the Subtype entry in the font dictionary. 
Type 0 fonts are called composite fonts; other types of fonts are called simple fonts. 
In addition to fonts, PDF supports two classes of font-related objects, called CIDFonts and CMaps. 
CIDFonts, like fonts, are collections of glyphs; however, a CIDFont shall not be used directly but only as a component of a Type 0 font.'
]

{ #category : #accessing }
PtFont class >> resourcePrefix [
	^'F'
]

{ #category : #accessing }
PtFont class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#Font
]

{ #category : #accessing }
PtFont class >> subtype [
	"<Symbol>
	subtype entry"

	^self name
]

{ #category : #accessing }
PtFont class >> type [
	^#Font
]

{ #category : #accessing }
PtFont >> FontDescriptor [
	"<FontDescriptor>"
	
	^self subclassResponsibility
]

{ #category : #'accessing entries' }
PtFont >> Subtype [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The type of font'>
	^self objectAt: #Subtype
]

{ #category : #accessing }
PtFont >> decodedString: aByteArray [
	"<String>
	normal Smalltalk string with unicode characters"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PtFont >> stringWidth: aString [
	"<Number> in glyph space"

	^self subclassResponsibility
]

{ #category : #accessing }
PtFont >> widthAt: aCodeOrIndexInteger [
	"<Number> in glyph space"

	^self subclassResponsibility
]

"
Objects of PDF Font Data structures (PDF 32000_2008.pdf clause 9.5, pp. 253)

A font shall be represented in PDF as a dictionary specifying the type of font, its PostScript name, its encoding, and information that can be used to provide a substitute when the font program is not available. Optionally, the font program may be embedded as a stream object in the PDF file.
"
Class {
	#name : #AboutPDFtalkFonts,
	#superclass : #Object,
	#category : #'PDFtalk-Fonts'
}

{ #category : #properties }
AboutPDFtalkFonts class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkFonts class >> creationTime [
	^'21.06.2022 08:32:12'
]

{ #category : #properties }
AboutPDFtalkFonts class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkFonts class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkFonts class >> source [
	^'Package [PDFtalk Fonts](2.5.0.2,chaider)'
]

{ #category : #properties }
AboutPDFtalkFonts class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkFonts class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkFonts class >> sourceTime [
	^'05.07.2021 06:18:20'
]

{ #category : #properties }
AboutPDFtalkFonts class >> targetSmalltalk [
	^'Pharo 10.0'
]

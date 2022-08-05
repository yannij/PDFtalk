"
""The Compact Font Format Specification"", Adobe Technical Note #5176.

This document describes the specification of a font format that is suitable for compactly representing one or more Type 1 or CID-keyed fonts. 
Unlike previous Type 1 and CID-keyed font formats, CFF allows multiple fonts to be stored together in a unit called a FontSet. 
Principal space savings are a result of using a compact binary representation for most of the information, sharing of common data between fonts, and defaulting frequently occurring data.

The CFF format is designed to be used in conjunction with Type 2 charstrings for the character description procedures (see Adobe Technical Note #5177: “The Type 2 Charstring Format”).
The design supports the embedding of PostScript® language code which permits additional flexibility and extensibility of the format when used in printer environments.
"
Class {
	#name : #AboutPDFtalkFontsCompactFontFormat,
	#superclass : #Object,
	#category : #'PDFtalk-Fonts CompactFontFormat'
}

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> creationTime [
	^'21.06.2022 08:32:11'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> source [
	^'Package [PDFtalk Fonts CompactFontFormat](2.2.0.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> sourceTime [
	^'06.08.2019 07:38:40'
]

{ #category : #properties }
AboutPDFtalkFontsCompactFontFormat class >> targetSmalltalk [
	^'Pharo 10.0'
]

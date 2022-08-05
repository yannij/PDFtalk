"
Font support for PDF
"
Class {
	#name : #AboutPDFtalkFontsBundle,
	#superclass : #Object,
	#category : #'PDFtalk-Fonts Bundle'
}

{ #category : #properties }
AboutPDFtalkFontsBundle class >> components [
	^(OrderedCollection new: 6)
		add: #Package -> 'PostScript CIDInit';
		add: #Package -> 'PDFtalk Fonts Basics';
		add: #Package -> 'PDFtalk Fonts Type1';
		add: #Package -> 'PDFtalk Fonts CompactFontFormat';
		add: #Package -> 'PDFtalk Fonts OpenType';
		add: #Package -> 'PDFtalk Fonts';
		yourself
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> creationTime [
	^'21.06.2022 08:32:12'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> source [
	^'Bundle {PDFtalk Fonts}(2.5.5.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> sourceTime [
	^'21.06.2022 04:50:06'
]

{ #category : #properties }
AboutPDFtalkFontsBundle class >> targetSmalltalk [
	^'Pharo 10.0'
]

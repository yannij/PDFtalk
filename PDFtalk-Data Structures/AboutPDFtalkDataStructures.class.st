"
PDF Common Data Structures as defined in PDF 32000_2008.pdf section 7.9 and 7.10, pp. 84

As mentioned at the beginning of this clause, there are some general-purpose data structures that are built from the basic object types described in 7.3, ""Objects,"" and are used in many places throughout PDF. This sub-clause describes data structures for text strings, dates, rectangles, name trees, and number trees.

"
Class {
	#name : #AboutPDFtalkDataStructures,
	#superclass : #Object,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #properties }
AboutPDFtalkDataStructures class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> creationTime [
	^'21.06.2022 08:32:08'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> source [
	^'Package [PDFtalk Data Structures](2.3.4.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> sourceTime [
	^'17.09.2020 22:06:26'
]

{ #category : #properties }
AboutPDFtalkDataStructures class >> targetSmalltalk [
	^'Pharo 10.0'
]

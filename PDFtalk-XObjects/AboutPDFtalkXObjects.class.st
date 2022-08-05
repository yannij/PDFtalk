"
PDF External Objects as defined in PDF 32000_2008.pdf, section 8.8, pp. 201.

An external object (commonly called an XObject) is a graphics object whose contents are defined by a self-contained stream, 
separate from the content stream in which it is used. 
There are three types of external objects:
	•	An image XObject represents a sampled visual image such as a photograph.
	•	A form XObject is a self-contained description of an arbitrary sequence of graphics objects.
	•	A PostScript XObject contains a fragment of code expressed in the PostScript page description language. 
		PostScript XObjects should not be used.

Two further categories of external objects, group XObjects and reference XObjects (both PDF 1.4), 
are actually specialized types of form XObjects with additional properties.

Any XObject can be painted as part of another content stream by means of the Do operator. 
This operator applies to any type of XObject—image, form, or PostScript. 
The syntax is the same in all cases, although details of the operator’s behaviour differ depending on the type.

"
Class {
	#name : #AboutPDFtalkXObjects,
	#superclass : #Object,
	#category : #'PDFtalk-XObjects'
}

{ #category : #properties }
AboutPDFtalkXObjects class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> creationTime [
	^'21.06.2022 08:32:13'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkXObjects class >> source [
	^'Package [PDFtalk XObjects](2.3.4.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> sourceTime [
	^'27.09.2020 18:55:25'
]

{ #category : #properties }
AboutPDFtalkXObjects class >> targetSmalltalk [
	^'Pharo 10.0'
]

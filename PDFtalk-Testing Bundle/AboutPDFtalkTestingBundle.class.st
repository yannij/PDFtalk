"
Tests and test recources for PDF
"
Class {
	#name : #AboutPDFtalkTestingBundle,
	#superclass : #Object,
	#category : #'PDFtalk-Testing Bundle'
}

{ #category : #properties }
AboutPDFtalkTestingBundle class >> components [
	^(OrderedCollection new: 5)
		add: #Package -> 'PDFtalk test resources';
		add: #Package -> 'PostScript Testing';
		add: #Package -> 'PostScript CIDInit Testing';
		add: #Package -> 'PDFtalk Fonts tests';
		add: #Package -> 'PDFtalk tests';
		yourself
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> creationTime [
	^'21.06.2022 08:32:19'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> developmentPrerequisites [
	^#(#(#any 'PostScript' '') #(#any 'PDFtalk' '') #(#any 'SUnitToo' '') #(#any 'AT Profiling UI' ''))
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> packageName [
	^'PDFtalk Testing'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> parcelName [
	^'PDFtalkTesting'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> prerequisiteDescriptions [
	^#(#(#name 'PostScript' #componentType #package) #(#name 'PDFtalk' #componentType #bundle) #(#name 'SUnitToo') #(#name 'AT Profiling UI' #componentType #package))
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> prerequisiteParcels [
	^#(#('PostScript' '') #('PDFtalk' '') #('SUnitToo' '') #('AT Profiling UI' ''))
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> source [
	^'Bundle {PDFtalk Testing}(2.5.3.3,chaider)'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> sourceTime [
	^'15.05.2022 13:29:38'
]

{ #category : #properties }
AboutPDFtalkTestingBundle class >> targetSmalltalk [
	^'Pharo 10.0'
]

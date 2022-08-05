"
Values are simple immutable literal objects.

Tests for Values.

Includes conformance tests for all leaf classes of Value.
"
Class {
	#name : #AboutValuesTesting,
	#superclass : #Object,
	#category : #'Values-Testing'
}

{ #category : #properties }
AboutValuesTesting class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutValuesTesting class >> creationTime [
	^'21.06.2022 08:32:16'
]

{ #category : #properties }
AboutValuesTesting class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutValuesTesting class >> developmentPrerequisites [
	^#(#(#any 'SUnitToo' ''))
]

{ #category : #properties }
AboutValuesTesting class >> prerequisiteDescriptions [
	^#(#(#name 'SUnitToo' #componentType #package))
]

{ #category : #properties }
AboutValuesTesting class >> prerequisiteParcels [
	^#(#('SUnitToo' ''))
]

{ #category : #properties }
AboutValuesTesting class >> source [
	^'Package [Values Testing](3.0.2.0,chaider)'
]

{ #category : #properties }
AboutValuesTesting class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutValuesTesting class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutValuesTesting class >> sourceTime [
	^'21.06.2022 04:25:37'
]

{ #category : #properties }
AboutValuesTesting class >> targetSmalltalk [
	^'Pharo 10.0'
]

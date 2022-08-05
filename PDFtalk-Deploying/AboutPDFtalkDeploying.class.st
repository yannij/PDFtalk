"
Code for deploying the library in a runtime environment

resetting and priming global variables
hints for the runtime packager about dynamic references
"
Class {
	#name : #AboutPDFtalkDeploying,
	#superclass : #Object,
	#category : #'PDFtalk-Deploying'
}

{ #category : #properties }
AboutPDFtalkDeploying class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> creationTime [
	^'21.06.2022 08:32:16'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkDeploying class >> source [
	^'Package [PDFtalk Deploying](2.3.5.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> sourceTime [
	^'05.01.2021 16:30:17'
]

{ #category : #properties }
AboutPDFtalkDeploying class >> targetSmalltalk [
	^'Pharo 10.0'
]

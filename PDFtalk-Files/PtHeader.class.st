"
PDF File Header as defined in PDF 32000_2008.pdf pp. 40.
"
Class {
	#name : #PtHeader,
	#superclass : #PtFileEntity,
	#instVars : [
		'version'
	],
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtHeader class >> version: aVersion [
	| inst |
	inst := self new.
	inst initializeVersion: aVersion.
	^inst
]

{ #category : #comparing }
PtHeader >> = anObject [
	^self class = anObject class and: [
	self version = anObject version]
]

{ #category : #comparing }
PtHeader >> hash [
	^self version hash
]

{ #category : #'initialize-release' }
PtHeader >> initializeVersion: aVersion [
	version := aVersion
]

{ #category : #accessing }
PtHeader >> version [
	"<Version>"

	^version
]

{ #category : #writing }
PtHeader >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutByte: $% asInteger.
	self version writePDFOn: aWriter indent: 0
]

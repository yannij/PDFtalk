"
the identity function
"
Class {
	#name : #PtIdentity,
	#superclass : #PtName,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtIdentity class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Identity
		supertype: #Function
		version: #(1 2)
		section: '7.10'
		documentation: 'the identity function'
]

{ #category : #accessing }
PtIdentity >> content [
	^#Identity
]

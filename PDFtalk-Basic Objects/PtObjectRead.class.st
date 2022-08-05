"
Announced when an object was read from the stream.

Includes the reference and the object
"
Class {
	#name : #PtObjectRead,
	#superclass : #Announcement,
	#instVars : [
		'reference',
		'object'
	],
	#category : #'PDFtalk-Basic Objects'
}

{ #category : #'instance creation' }
PtObjectRead class >> reference: aReference object: aPDFObject [
	| inst |
	inst := self new.
	inst initializeReference: aReference object: aPDFObject.
	^inst
]

{ #category : #'initialize-release' }
PtObjectRead >> initializeReference: aReference object: aPDFObject [
	reference := aReference.
	object := aPDFObject
]

{ #category : #accessing }
PtObjectRead >> object [
	"<PDFObject>"

	^object
]

{ #category : #accessing }
PtObjectRead >> reference [
	"<Reference>"

	^reference
]

"
XObject
"
Class {
	#name : #PtExternalGraphicsObject,
	#superclass : #PtPicture,
	#instVars : [
		'resource'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtExternalGraphicsObject class >> operations: someOperations state: aGraphicsState resource: aPDFObject [

	| inst |
	inst := self new.
	inst
		initializeOperations: someOperations
		state: aGraphicsState
		resource: aPDFObject.
	^inst
]

{ #category : #'initialize-release' }
PtExternalGraphicsObject >> initializeOperations: someOperations state: aGraphicsState resource: aPDFObject [
	self initializeOperations: someOperations state: aGraphicsState.
	resource := aPDFObject
]

{ #category : #accessing }
PtExternalGraphicsObject >> resource [
	^resource
]

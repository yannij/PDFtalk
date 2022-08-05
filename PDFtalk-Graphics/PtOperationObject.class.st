"
simple wrapper for a single operator.

May contain a resolved resource
"
Class {
	#name : #PtOperationObject,
	#superclass : #PtGraphicelement,
	#instVars : [
		'redundant',
		'resource'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtOperationObject class >> operations: someOperations state: aGraphicsState resource: aPDFObject [
	| inst |
	inst := self new.
	inst initializeOperations: someOperations state: aGraphicsState resource: aPDFObject.
	^inst
]

{ #category : #'initialize-release' }
PtOperationObject >> initializeOperations: someOperations state: aGraphicsState resource: aPDFObject [
	self initializeOperations: someOperations state: aGraphicsState.
	resource := aPDFObject
]

{ #category : #printing }
PtOperationObject >> printOn: stream [
	stream
		nextPutAll: self class name asString;
		nextPut: $(.
	self operations do: [:op | stream nextPutAll: op printString] separatedBy: [
		stream space].
	stream nextPut: $)
]

{ #category : #accessing }
PtOperationObject >> redundant [
	"<Boolean>"

	^redundant ifNil: [false]
]

{ #category : #accessing }
PtOperationObject >> redundant: aBoolean [

	redundant := aBoolean
]

{ #category : #accessing }
PtOperationObject >> resource [
	^resource
]

{ #category : #accessing }
PtOperationObject >> string [
	^''
]

"
The graphics of a page

The graphic operations and aggregated graphical objects.

It knows the page (or form) to have access to the resources
"
Class {
	#name : #PtContentGraphics,
	#superclass : #Object,
	#instVars : [
		'container',
		'operations',
		'graphics'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtContentGraphics class >> on: aPageOrForm [
	| inst |
	inst := self new.
	inst initializeContainer: aPageOrForm operations: nil.
	^inst
]

{ #category : #'instance creation' }
PtContentGraphics class >> on: aType3Font operations: someOperations [
	| inst |
	inst := self new.
	inst initializeContainer: aType3Font operations: someOperations.
	^inst
]

{ #category : #accessing }
PtContentGraphics class >> pdfVersion [
	^PtVersion pdf1_0
]

{ #category : #accessing }
PtContentGraphics >> container [
	"<Page | FormXObject>
	including contents and resources"

	^container
]

{ #category : #accessing }
PtContentGraphics >> graphics [
	"<Array of: Graphicelement>"

	^graphics ifNil: [
		| processor |
		processor := PtContentProcessor newWithResources: self resources.
		processor processOperations: self operations.
		graphics := processor currentContext objects]
]

{ #category : #accessing }
PtContentGraphics >> graphicsOperations [
	^self graphics
]

{ #category : #'initialize-release' }
PtContentGraphics >> initializeContainer: aPageOrForm operations: someOperations [
	container := aPageOrForm.
	operations := someOperations
]

{ #category : #testing }
PtContentGraphics >> isComputed [
	^graphics notNil
]

{ #category : #accessing }
PtContentGraphics >> operations [
	"<Array of: Operation>"

	^operations ifNil: [operations := self readOperations]
]

{ #category : #printing }
PtContentGraphics >> printOn: stream [
	stream
		nextPutAll: self class name;
		nextPut: $[;
		nextPutAll: self operations size printString.
	self isComputed ifTrue: [
		stream
			nextPut: $,;
			nextPutAll: self graphics size printString].
	stream nextPut: $]
]

{ #category : #actions }
PtContentGraphics >> readOperations [
	"<Array of: Operation>"

	^(PtContentParser onString: self container contentString) readOperations
]

{ #category : #accessing }
PtContentGraphics >> resources [
	"<Resources>"

	^self container Resources
]

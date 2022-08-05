"
A path painting operation with a list of path construction operations and an optional clipping path operation
"
Class {
	#name : #PtDrawing,
	#superclass : #PtGraphicelement,
	#instVars : [
		'clipping',
		'painting',
		'intersections'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #actions }
PtDrawing >> addClipping: aClippingPathOperator [
	clipping := aClippingPathOperator
]

{ #category : #actions }
PtDrawing >> addPainting: aPathPaintingOperator [

	painting := aPathPaintingOperator
]

{ #category : #actions }
PtDrawing >> addToPath: aPathConstructionOperator [
	self operations add: aPathConstructionOperator
]

{ #category : #accessing }
PtDrawing >> allOperations [
	| list |
	list := self operations asOrderedCollection.
	self clipping ifNotNil: [:operator | list add: operator].
	list add: self painting.
	^list
]

{ #category : #accessing }
PtDrawing >> clipping [
	"<ClippingPathOperation | nil>
	modifies the clipping path of the graphics state AFTER the path has been painted"

	^clipping
]

{ #category : #'initialize-release' }
PtDrawing >> initializeFrom: aPathObject [
	operations := aPathObject operations.
	state := aPathObject state.
	clipping := aPathObject clipping.
	painting := aPathObject painting.
	intersections := aPathObject intersections
]

{ #category : #copying }
PtDrawing >> intersectedBy: aPath [
	"<PathObject>"
	
	| copy |
	copy := self copy.
	copy intersections add: aPath.
	^copy
]

{ #category : #accessing }
PtDrawing >> intersections [
	"<SequenceableCollection of: PathObject>
	the receiver is clipped by the paths in #intersections starting with the first (oldest). 
	Used for the clipping path of the graphics state"

	^intersections ifNil: [intersections := OrderedCollection new]
]

{ #category : #testing }
PtDrawing >> isClipping [
	^self clipping notNil
]

{ #category : #testing }
PtDrawing >> isFilling [
	^self painting isFilling
]

{ #category : #testing }
PtDrawing >> isOnlyClipping [
	"no drawing"

	^self isClipping and: [
	self painting isOnlyClipping]
]

{ #category : #testing }
PtDrawing >> isStroking [
	^self painting isStroking
]

{ #category : #accessing }
PtDrawing >> lineWidth [
	"<Number>"

	^self state lineWidth asSmalltalkValue
]

{ #category : #accessing }
PtDrawing >> painting [
	"<PathPaintingOperator>"

	^painting
]

{ #category : #converting }
PtDrawing >> points [
	| points |
	points := OrderedCollection new.
	self operations do: [:op | points addAll: op points].
	^points
]

{ #category : #printing }
PtDrawing >> printOn: stream [
	stream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: (self isClipping
			ifTrue: ['-']
			ifFalse: ['']);
		nextPutAll: self painting printString;
		nextPut: $)
]

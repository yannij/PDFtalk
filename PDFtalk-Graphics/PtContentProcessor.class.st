"
Processes content stream operations and updates the graphics state

Operations are processed sequentially one after the other.
1. an Operation is wrapped with an OperationObject with the current graphics state
2. the OperationObject is executed and changes the state of the processor 

The state consists of
- graphicsState :: all settings effecting drawing operations
- graphicsStateStack :: save and restore state
- contextStack :: one of IsolatedContext, TextContext, MarkedContext or InlineImageContext
- currentPath :: lines and rectangles
- currentFont :: active font from the resources
"
Class {
	#name : #PtContentProcessor,
	#superclass : #Object,
	#instVars : [
		'graphicsState',
		'graphicsStateStack',
		'contextStack',
		'currentPath',
		'resources',
		'currentFont'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtContentProcessor class >> newWithResources: aResources [
	| inst |
	inst := self new.
	inst initializeResources: aResources.
	^inst
]

{ #category : #'actions operations' }
PtContentProcessor >> addBeginImageData: aBeginImageData [
	self addObject: aBeginImageData
]

{ #category : #'actions operations' }
PtContentProcessor >> addBeginInlineImage: aBeginInlineImage [
	self pushCollector: PtInlineImageContext new
]

{ #category : #'actions operations' }
PtContentProcessor >> addBeginMarkedContent: aBeginMarkedContent [
	self pushCollector: (PtMarkedContext tag: aBeginMarkedContent operands first)
]

{ #category : #'actions operations' }
PtContentProcessor >> addBeginMarkedContentWithProperties: aBeginMarkedContentWithProperties [
	self pushCollector: (PtMarkedContext
		tag: aBeginMarkedContentWithProperties operands first
		properties: aBeginMarkedContentWithProperties operands last)
]

{ #category : #'actions operations' }
PtContentProcessor >> addBeginText [
	self pushCollector: PtTextContext new.
	self graphicsState at: #textMatrix put: nil.
	self graphicsState at: #textLineMatrix put: nil
]

{ #category : #'actions operations' }
PtContentProcessor >> addClippingPathOperation: aClippingPathOperation [
	self currentPath addClipping: aClippingPathOperation
]

{ #category : #'actions operations' }
PtContentProcessor >> addColourOperation: aColourOperation [
	| object |
	object := self newOperationObjectOn: aColourOperation.
	aColourOperation modify: self with: object resource.
	object redundant: object state = self graphicsState.
	self addObject: object
]

{ #category : #'actions operations' }
PtContentProcessor >> addEndInlineImage: anEndInlineImage [
	self addObject: anEndInlineImage.
	self addGraphic: (PtInlineImage operations: self popCollector objects state: self graphicsState)
]

{ #category : #'actions operations' }
PtContentProcessor >> addEndMarkedContent [
	self addObject: self popCollector
]

{ #category : #'actions operations' }
PtContentProcessor >> addEndText [
	self graphicsState at: #textMatrix put: nil.
	self graphicsState at: #textLineMatrix put: nil.
	self addObject: self popCollector
]

{ #category : #actions }
PtContentProcessor >> addGraphic: aGraphic [
	self addObject: aGraphic
]

{ #category : #'actions operations' }
PtContentProcessor >> addGraphicsStateOperation: aGraphicsStateOperation [
	| object |
	object := self newOperationObjectOn: aGraphicsStateOperation.
	aGraphicsStateOperation modify: self with: object resource.
	object redundant: object state = self graphicsState.
	self addObject: object
]

{ #category : #actions }
PtContentProcessor >> addObject: aGraphicsObject [
	self currentContext addObject: aGraphicsObject
]

{ #category : #'actions operations' }
PtContentProcessor >> addOperation: anOperation [
	self addObject: (self newOperationObjectOn: anOperation)
]

{ #category : #'actions operations' }
PtContentProcessor >> addPathConstructionOperation: aPathConstructionOperation [
	self currentPath addToPath: aPathConstructionOperation
]

{ #category : #'actions operations' }
PtContentProcessor >> addPathPaintingOperation: aPathPaintingOperation [
	| specificPath |
	self currentPath addPainting: aPathPaintingOperation.
	self currentPath setRelevantStateFrom: self graphicsState.
	specificPath := self currentPathObject.
	self addGraphic: specificPath.
	specificPath clipping ifNotNil: [
		self setClippingPathIntersecting: specificPath].
	self resetCurrentPath
]

{ #category : #'actions operations' }
PtContentProcessor >> addRestoreState [
	self graphicsState: self graphicsStateStack removeLast key.
	self addObject: self popCollector
]

{ #category : #'actions operations' }
PtContentProcessor >> addSaveStateAt: indexInteger [
	self pushCollector: PtIsolatedContext new.
	self graphicsStateStack addLast: self graphicsState copy -> indexInteger
]

{ #category : #'actions operations' }
PtContentProcessor >> addTextPositioningOperation: aTextPositioningOperation [
	| object |
	object := self newOperationObjectOn: aTextPositioningOperation.
	aTextPositioningOperation modify: self with: object resource.
	self addObject: object
]

{ #category : #'actions operations' }
PtContentProcessor >> addTextShowingOperation: aTextShowingOperation [
	| object |
	object := PtTextspan
		operations: (Array with: aTextShowingOperation)
		state: self graphicsState
		font: self currentFont.
	aTextShowingOperation modify: self with: object resource.
	self addGraphic: object
]

{ #category : #'actions operations' }
PtContentProcessor >> addTextStateOperation: aTextStateOperation [
	| object |
	object := self newOperationObjectOn: aTextStateOperation.
	aTextStateOperation modify: self with: object resource.
	object redundant: object state = self graphicsState.
	self addObject: object
]

{ #category : #'actions operations' }
PtContentProcessor >> addXObjectOperation: anXObjectOperation [
	self addGraphic: (PtExternalGraphicsObject
		operations: (Array with: anXObjectOperation)
		state: self graphicsState
		resource: (anXObjectOperation resourceIn: self))
]

{ #category : #accessing }
PtContentProcessor >> contextStack [
	"<OrderedCollection of: Context>
	Stack of open contexts. The current context is on top"

	^contextStack ifNil: [contextStack := OrderedCollection with: PtContext new]
]

{ #category : #accessing }
PtContentProcessor >> currentContext [
	"<Context>
	the context to interpreting the operators"

	^self contextStack last
]

{ #category : #accessing }
PtContentProcessor >> currentFont [
	"<Font> asValue"

	^currentFont
]

{ #category : #accessing }
PtContentProcessor >> currentFont: aFont [
	currentFont := aFont
]

{ #category : #accessing }
PtContentProcessor >> currentPath [
	"<SeqenceableCollection of: PathConstructionOperator>"

	^currentPath ifNil: [currentPath := PtDrawing new]
]

{ #category : #'actions operations' }
PtContentProcessor >> currentPathObject [
	"<Drawing>
	the path object to be constructed"

	^self currentPath
]

{ #category : #accessing }
PtContentProcessor >> graphicsState [
	"<GraphicsState>"

	^graphicsState ifNil: [graphicsState := PtGraphicsState new]
]

{ #category : #accessing }
PtContentProcessor >> graphicsState: aGraphicsState [
	graphicsState := aGraphicsState
]

{ #category : #accessing }
PtContentProcessor >> graphicsStateStack [
	"<SequenceableCollection of: GraphicsState>"

	^graphicsStateStack ifNil: [graphicsStateStack := OrderedCollection new]
]

{ #category : #'initialize-release' }
PtContentProcessor >> initializeResources: aResources [
	resources := aResources
]

{ #category : #accessing }
PtContentProcessor >> newOperationObjectOn: anOperation [
	^PtOperationObject
		operations: (Array with: anOperation)
		state: self graphicsState
		resource: (anOperation resourceIn: self)
]

{ #category : #actions }
PtContentProcessor >> popCollector [
	"<GraphicsCollector>"
	
	^self contextStack removeLast
]

{ #category : #processing }
PtContentProcessor >> processOperations: someOperations [
	"processes someOperations and leaves the state after.
	The currentContext contains all operations nested in their contexts"

	someOperations withIndexDo: [:operation :index | operation processWith: self at: index]
]

{ #category : #actions }
PtContentProcessor >> pushCollector: aGraphicsCollector [
	self contextStack addLast: aGraphicsCollector
]

{ #category : #actions }
PtContentProcessor >> resetCurrentPath [
	currentPath := nil
]

{ #category : #accessing }
PtContentProcessor >> resources [
	"<Resources>"

	^resources
]

{ #category : #actions }
PtContentProcessor >> setClippingPathIntersecting: aPath [
	| newClippingPath |
	newClippingPath := self graphicsState clippingPath ifNil: [aPath] ifNotNil: [:clippingPath |
		clippingPath intersectedBy: aPath].
	self graphicsState at: #clippingPath put: newClippingPath
]

"
Basic graphical object which has all context to reproduce itself

This includes always the graphicsState before the operator is applied

For drawings, this includes also the currentPath and other information
"
Class {
	#name : #PtGraphicelement,
	#superclass : #PtGraphic,
	#instVars : [
		'operations',
		'state'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtGraphicelement class >> operations: someOperations state: aGraphicsState [

	| inst |
	inst := self new.
	inst initializeOperations: someOperations state: aGraphicsState.
	^inst
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> allGraphicsStates [
	^self generalGraphicsStates , self colorGraphicsStates , self lineGraphicsStates , self textGraphicsStates , self transparencyGraphicsStates , self deviceDependendGraphicsStates
]

{ #category : #accessing }
PtGraphicelement >> allOperations [
	^self operations
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> colorGraphicsStates [
	^#(#colorSpaceStroking #colorSpaceNonstroking #colorStroking #colorNonstroking #renderingIntent)
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> deviceDependendGraphicsStates [
	^#(#overprintStroking #overprintNonstroking #overprintMode #blackGeneration #undercolorRemoval #transfer #halftone #flatness #smoothness)
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> generalGraphicsStates [
	^#(#CTM #clippingPath)
]

{ #category : #accessing }
PtGraphicelement >> graphicsStateAttributes [
	"the graphics state"

	^self state graphicsStateAttributes
]

{ #category : #'initialize-release' }
PtGraphicelement >> initializeOperations: someOperations state: aGraphicsState [

	operations := someOperations.
	state := aGraphicsState copy beImmutable
]

{ #category : #testing }
PtGraphicelement >> isClipping [
	^false
]

{ #category : #testing }
PtGraphicelement >> isOnlyClipping [
	^false
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> lineGraphicsStates [
	^#(#lineWidth #lineCap #lineJoin #miterLimit #dashPattern #strokeAdjustment)
]

{ #category : #accessing }
PtGraphicelement >> operation [
	^self operations first
]

{ #category : #accessing }
PtGraphicelement >> operations [
	"<SequenceableCollection of: Operation>
	the sequence of operations which make up the receiver"

	^operations ifNil: [operations := OrderedCollection new]
]

{ #category : #accessing }
PtGraphicelement >> pdfVersion [
	^self operations inject: PtVersion pdf1_0 into: [:max :op | max max: op pdfVersion]
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> relevantGraphicsStates [
	^self allGraphicsStates
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> relevantStateFrom: aGraphicsState [
	"<GraphicsState>
	pick only the applicable state items"

	^aGraphicsState class on: (self relevantStateMapFrom: aGraphicsState)
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> relevantStateMapFrom: aGraphicsState [
	"<Valuemap>
	pick only the applicable state items
	The order is given by the order of the #relevantGraphicsStates"

	^self relevantGraphicsStates inject: Valuemap new into: [:map :symbol |
		(aGraphicsState hasKey: symbol) ifTrue: [
			map at: symbol put: (aGraphicsState at: symbol)].
		map]
]

{ #category : #accessing }
PtGraphicelement >> resource [
	^nil
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> setRelevantStateFrom: aGraphicsState [
	"pick only the applicable state items"

	state := self relevantStateFrom: aGraphicsState
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> state [
	"<GraphicsState>
	the state before the object is rendered"

	^state ifNil: [PtGraphicsState new]
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> textGraphicsStates [
	^#(#characterSpacing #wordSpacing #horizontalScaling #leading #textFont #textFontSize #textRenderingMode #textRise #textKnockout #textMatrix #textLineMatrix)
]

{ #category : #'accessing GraphicsState' }
PtGraphicelement >> transparencyGraphicsStates [
	^#(#alphaConstantStroking #alphaConstantNonstroking #alphaSource #blendMode #softMask)
]

{ #category : #writing }
PtGraphicelement >> writePDFOn: aWriter indent: anInteger [
	self allOperations do: [:object | object writePDFOn: aWriter indent: anInteger] separatedBy: [
		aWriter cr]
]

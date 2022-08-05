"
renders contents on a page
"
Class {
	#name : #PtPageRenderer,
	#superclass : #PtRenderer,
	#category : #'PDFtalk-Rendering'
}

{ #category : #'instance creation' }
PtPageRenderer class >> appendTo: aPage colorspace: aColourSpace [
	| inst |
	inst := self new.
	inst initializeProduct: aPage colorspace: aColourSpace.
	^inst
]

{ #category : #actions }
PtPageRenderer >> addAnnotation: anAnnot [
	self product at: #Annots put: (self product Annots with: anAnnot)
]

{ #category : #actions }
PtPageRenderer >> addContents [
	| contents |
	contents := (PtPDF classAt: #Contents) on: Dictionary new internal: self contentSource.
	contents filter: #FlateDecode.
	self product at: #Contents put: contents newReference
]

{ #category : #rendering }
PtPageRenderer >> addTransparencyPageAttributesWithColorspace: aColorspace [
	"one may want to add /I (isolated) or /K (knock out) attributes"

	self product at: #Group ifAbsentPut: [
		| attr |
		attr := (PtPDF classAt: #TransparencyGroupAttributes) empty.
		attr at: #CS put: aColorspace.
		attr]
]

{ #category : #actions }
PtPageRenderer >> append: oneArgumentBlock [
	oneArgumentBlock value: self.
	self appendContents.
	self finishProduct
]

{ #category : #actions }
PtPageRenderer >> appendContents [
	| contents oldContentsRef newContents |
	contents := PtContents on: Valuemap new internal: self contentSource.
	contents filter: #FlateDecode.
	oldContentsRef := self product at: #Contents.
	newContents := (oldContentsRef referent isKindOf: PtPDF Array)
		ifTrue: [
		oldContentsRef referent with: contents newReference]
		ifFalse: [
		Array
			with: oldContentsRef
			with: contents newReference].
	self product at: #Contents put: newContents
]

{ #category : #'initialize-release' }
PtPageRenderer >> initializeProduct: pageToAppendTo colorspace: aColourSpace [
	product := pageToAppendTo.
	colorspace := aColourSpace
]

{ #category : #accessing }
PtPageRenderer >> pageRenderer [
	^self
]

{ #category : #actions }
PtPageRenderer >> setupBounds [
	self product at: #MediaBox put: self bounds.
	self product at: #TrimBox put: self bounds
]

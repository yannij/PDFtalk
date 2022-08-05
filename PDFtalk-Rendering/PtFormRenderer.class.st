"
renders contents on a form
"
Class {
	#name : #PtFormRenderer,
	#superclass : #PtRenderer,
	#instVars : [
		'parent'
	],
	#category : #'PDFtalk-Rendering'
}

{ #category : #'instance creation' }
PtFormRenderer class >> newOn: aGroup bounds: aRectangle colorspace: aColourSpace in: aPageRenderer [
	| inst |
	inst := self new.
	inst
		initializeGroup: aGroup
		bounds: aRectangle
		colorspace: aColourSpace
		parent: aPageRenderer.
	^inst
]

{ #category : #actions }
PtFormRenderer >> addContents [
	self product contents: self contentSource
]

{ #category : #rendering }
PtFormRenderer >> addTransparencyPageAttributesWithColorspace: aColorspace [
	self parent addTransparencyPageAttributesWithColorspace: aColorspace
]

{ #category : #accessing }
PtFormRenderer >> idForFont: loadedFont [
	"the pdf font of the parent is used - with the same ID"

	^self idsAtFonts at: loadedFont ifAbsentPut: [
		| idInParent |
		idInParent := self parent idForFont: loadedFont.
		self resources fonts at: idInParent put: (self parent resources fonts at: idInParent).
		idInParent]
]

{ #category : #'initialize-release' }
PtFormRenderer >> initializeGroup: aGroup bounds: aRectangle colorspace: aColourSpace parent: aPageRenderer [
	self initializeProduct: aGroup bounds: aRectangle colorspace: aColourSpace.
	parent := aPageRenderer
]

{ #category : #accessing }
PtFormRenderer >> pageRenderer [
	^self parent pageRenderer
]

{ #category : #accessing }
PtFormRenderer >> parent [
	"<Renderer>"

	^parent
]

{ #category : #actions }
PtFormRenderer >> setupBounds [
	self product at: #BBox put: self bounds
]

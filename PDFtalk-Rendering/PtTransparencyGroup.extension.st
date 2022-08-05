Extension { #name : #PtTransparencyGroup }

{ #category : #'*PDFtalk-Rendering-instance creation' }
PtTransparencyGroup class >> newInBounds: aRectangle colorspace: aColourSpace in: aRenderer render: oneArgumentBlock [
	| renderer |
	aRenderer addTransparencyPageAttributesWithColorspace: aColourSpace.
	renderer := PtFormRenderer
		newOn: self empty
		bounds: aRectangle
		colorspace: aColourSpace
		in: aRenderer.
	renderer product at: #Group put: (PtPDF classAt: #TransparencyGroupAttributes) empty.
	renderer render: oneArgumentBlock.
	^renderer product
]

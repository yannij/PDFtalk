Extension { #name : #PtPage }

{ #category : #'*PDFtalk-Rendering-instance creation' }
PtPage class >> newInBounds: aRectangle colorspace: aColourSpace render: oneArgumentBlock [
	| renderer |
	renderer := PtPageRenderer newOn: self empty bounds: aRectangle colorspace: aColourSpace.
	renderer render: oneArgumentBlock.
	^renderer product
]

{ #category : #'*PDFtalk-Rendering-actions' }
PtPage >> withColorspace: aColourSpace append: oneArgumentBlock [
	(PtPageRenderer appendTo: self colorspace: aColourSpace) append: oneArgumentBlock
]

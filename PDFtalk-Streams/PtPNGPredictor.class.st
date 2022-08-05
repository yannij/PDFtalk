"
PNG Predictors as defined in http://www.w3.org/TR/PNG/#9Filters.
A nice description can be found at http://www.libpng.org/pub/png/book/LCH-png-chapter.pdf
"
Class {
	#name : #PtPNGPredictor,
	#superclass : #PtPredictor,
	#instVars : [
		'offsetLeft'
	],
	#category : #'PDFtalk-Streams'
}

{ #category : #'instance creation' }
PtPNGPredictor class >> offsetLeft: anInteger [
	"implemented this way for easier testing"

	| inst |
	inst := self new.
	inst initializeOffsetLeft: anInteger.
	^inst
]

{ #category : #'instance creation' }
PtPNGPredictor class >> subclassFor: anInteger [
	^self subclasses detect: [:subclass | subclass type = anInteger]
]

{ #category : #accessing }
PtPNGPredictor class >> type [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #'initialize-release' }
PtPNGPredictor >> initializeOffsetLeft: anInteger [
	offsetLeft := anInteger
]

{ #category : #accessing }
PtPNGPredictor >> offsetLeft [
	"<Integer>
	the distance to the left pixel in number of bytes"

	^offsetLeft ifNil: [1]
]

{ #category : #filtering }
PtPNGPredictor >> predict: aByteArray withUpperRow: upperByteArray [
	"<ByteArray>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtPNGPredictor >> type [
	^self class type
]

{ #category : #filtering }
PtPNGPredictor >> unpredict: filteredByteArray withUpperRow: upperReconstructedByteArray [
	"<ByteArray>"

	^self subclassResponsibility
]

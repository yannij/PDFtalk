"
Each byte is unchanged.
"
Class {
	#name : #PtNoPredictor,
	#superclass : #PtPNGPredictor,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtNoPredictor class >> type [
	^0
]

{ #category : #filtering }
PtNoPredictor >> predict: aByteArray withUpperRow: upperByteArray [
	^aByteArray copy
]

{ #category : #filtering }
PtNoPredictor >> unpredict: filteredByteArray withUpperRow: upperReconstructedByteArray [
	^filteredByteArray copy
]

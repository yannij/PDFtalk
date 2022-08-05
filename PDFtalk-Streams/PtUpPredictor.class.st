"
Each byte is replaced with the difference between it and the byte above it (in the previous row, as it was before filtering).
"
Class {
	#name : #PtUpPredictor,
	#superclass : #PtPNGPredictor,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtUpPredictor class >> type [
	^2
]

{ #category : #filtering }
PtUpPredictor >> predict: aByteArray withUpperRow: upperByteArray [
	"<ByteArray>"

	| filtered |
	filtered := ByteArray new: aByteArray size.
	1 to: aByteArray size do: [:index |
		| output |
		output := (aByteArray at: index) - (upperByteArray at: index).
		filtered at: index put: output \\ 256].
	^filtered
]

{ #category : #filtering }
PtUpPredictor >> unpredict: filteredByteArray withUpperRow: upperReconstructedByteArray [
	| reconstructed |
	reconstructed := ByteArray new: filteredByteArray size.
	1 to: filteredByteArray size do: [:index |
		| output |
		output := (filteredByteArray at: index) + (upperReconstructedByteArray at: index).
		reconstructed at: index put: output \\ 256].
	^reconstructed
]

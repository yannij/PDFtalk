"
Each byte is replaced with the difference between it and the average of the corresponding bytes to its left and above it, truncating any fractional part.
"
Class {
	#name : #PtAveragePredictor,
	#superclass : #PtPNGPredictor,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtAveragePredictor class >> type [
	^3
]

{ #category : #filtering }
PtAveragePredictor >> predict: aByteArray withUpperRow: upperByteArray [
	"<ByteArray>"

	| filtered |
	filtered := ByteArray new: aByteArray size.
	1 to: aByteArray size do: [:index |
		| indexLeft a b output |
		indexLeft := index - self offsetLeft.
		a := indexLeft strictlyPositive
			ifTrue: [aByteArray at: indexLeft]
			ifFalse: [0].
		b := upperByteArray at: index.
		output := (aByteArray at: index) - ((a + b) // 2).
		filtered at: index put: output \\ 256].
	^filtered
]

{ #category : #filtering }
PtAveragePredictor >> unpredict: filteredByteArray withUpperRow: upperReconstructedByteArray [
	"<ByteArray>"

	| reconstructed |
	reconstructed := ByteArray new: filteredByteArray size.
	1 to: filteredByteArray size do: [:index |
		| indexLeft a b output |
		indexLeft := index - self offsetLeft.
		a := indexLeft strictlyPositive
			ifTrue: [reconstructed at: indexLeft]
			ifFalse: [0].
		b := upperReconstructedByteArray at: index.
		output := (filteredByteArray at: index) + ((a + b) // 2).
		reconstructed at: index put: output \\ 256].
	^reconstructed
]

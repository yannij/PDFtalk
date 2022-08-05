"
Each byte is replaced with the difference between it and the ``corresponding byte'' to its left.
"
Class {
	#name : #PtSubPredictor,
	#superclass : #PtPNGPredictor,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtSubPredictor class >> type [
	^1
]

{ #category : #filtering }
PtSubPredictor >> predict: aByteArray withUpperRow: upperByteArray [
	"<ByteArray>"

	| filtered |
	filtered := ByteArray new: aByteArray size.
	1 to: aByteArray size do: [:index |
		| indexLeft a output |
		indexLeft := index - self offsetLeft.
		a := indexLeft strictlyPositive
			ifTrue: [aByteArray at: indexLeft]
			ifFalse: [0].
		output := (aByteArray at: index) - a.
		filtered at: index put: output \\ 256].
	^filtered
]

{ #category : #filtering }
PtSubPredictor >> unpredict: filteredByteArray withUpperRow: upperReconstructedByteArray [
	"<ByteArray>"

	| reconstructed |
	reconstructed := ByteArray new: filteredByteArray size.
	1 to: filteredByteArray size do: [:index |
		| indexLeft a output |
		indexLeft := index - self offsetLeft.
		a := indexLeft strictlyPositive
			ifTrue: [reconstructed at: indexLeft]
			ifFalse: [0].
		output := (filteredByteArray at: index) + a.
		reconstructed at: index put: output \\ 256].
	^reconstructed
]

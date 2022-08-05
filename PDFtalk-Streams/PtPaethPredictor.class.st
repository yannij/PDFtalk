"
Each byte is replaced with the difference between it and the Paeth predictor of the corresponding bytes to its left, above it, and to its upper left.
"
Class {
	#name : #PtPaethPredictor,
	#superclass : #PtPNGPredictor,
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtPaethPredictor class >> type [
	^4
]

{ #category : #filtering }
PtPaethPredictor >> a: a b: b c: c [
	| p pa pb pc |
	p := a + b - c.
	pa := (p - a) abs.
	pb := (p - b) abs.
	pc := (p - c) abs.
	(pa <= pb and: [
	pa <= pc]) ifTrue: [
			^a].
	pb <= pc ifTrue: [
		^b].
	^c
]

{ #category : #filtering }
PtPaethPredictor >> predict: aByteArray withUpperRow: upperByteArray [
	"<ByteArray>"

	| filtered |
	filtered := ByteArray new: aByteArray size.
	1 to: aByteArray size do: [:index |
		| indexLeft a b c output |
		b := upperByteArray at: index.
		indexLeft := index - self offsetLeft.
		indexLeft strictlyPositive
			ifTrue: [
			a := aByteArray at: indexLeft.
			c := upperByteArray at: indexLeft]
			ifFalse: [
			a := c := 0].
		output := (aByteArray at: index) - (self a: a b: b c: c).
		filtered at: index put: output \\ 256].
	^filtered
]

{ #category : #filtering }
PtPaethPredictor >> unpredict: filteredByteArray withUpperRow: upperReconstructedByteArray [
	"<ByteArray>"

	| reconstructed |
	reconstructed := ByteArray new: filteredByteArray size.
	1 to: filteredByteArray size do: [:index |
		| indexLeft a b c output |
		b := upperReconstructedByteArray at: index.
		indexLeft := index - self offsetLeft.
		indexLeft strictlyPositive
			ifTrue: [
			a := reconstructed at: indexLeft.
			c := upperReconstructedByteArray at: indexLeft]
			ifFalse: [
			a := c := 0].
		output := (filteredByteArray at: index) + (self a: a b: b c: c).
		reconstructed at: index put: output \\ 256].
	^reconstructed
]

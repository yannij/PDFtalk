"
Fill the path, using the even-odd rule to determine the region to fill
"
Class {
	#name : #PtFillEvenOdd,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFillEvenOdd class >> documentation [
	^'Fill the path, using the even-odd rule to determine the region to fill'
]

{ #category : #accessing }
PtFillEvenOdd class >> operatorName [
	^#'f*'
]

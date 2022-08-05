"
Fill and then stroke the path, using the even-odd rule to determine the region to fill. 
This operator shall produce the same result as B, except that the path is filled as if with f* instead of f
"
Class {
	#name : #PtFillEvenOddAndStroke,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFillEvenOddAndStroke class >> documentation [
	^'Fill and then stroke the path, using the even-odd rule to determine the region to fill. This operator shall produce the same result as B, except that the path is filled as if with f* instead of f'
]

{ #category : #accessing }
PtFillEvenOddAndStroke class >> operatorName [
	^#'B*'
]

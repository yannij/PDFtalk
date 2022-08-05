"
Modify the current clipping path by intersecting it with the current path, 
using the even-odd rule to determine which regions lie inside the clipping path.

"
Class {
	#name : #PtClipEvenOdd,
	#superclass : #PtClippingPathOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtClipEvenOdd class >> documentation [
	^'Modify the current clipping path by intersecting it with the current path, using the even-odd rule to determine which regions lie inside the clipping path'
]

{ #category : #accessing }
PtClipEvenOdd class >> operatorName [
	^#'W*'
]

{ #category : #accessing }
PtClipEvenOdd >> rule [
	^#EvenOdd
]

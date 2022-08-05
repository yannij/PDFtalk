"
Close, fill, and then stroke the path, using the even-odd rule to determine the region to fill. 
This operator shall have the same effect as the sequence h B*
"
Class {
	#name : #PtFillEvenOddAndStrokeClosed,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFillEvenOddAndStrokeClosed class >> documentation [
	^'Close, fill, and then stroke the path, using the even-odd rule to determine the region to fill. This operator shall have the same effect as the sequence h B*'
]

{ #category : #accessing }
PtFillEvenOddAndStrokeClosed class >> operatorName [
	^#'b*'
]

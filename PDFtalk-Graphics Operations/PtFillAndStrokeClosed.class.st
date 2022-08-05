"
Close, fill, and then stroke the path, using the nonzero winding number rule to determine the region to fill. 
This operator shall have the same effect as the sequence h B
"
Class {
	#name : #PtFillAndStrokeClosed,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtFillAndStrokeClosed class >> documentation [
	^'Close, fill, and then stroke the path, using the nonzero winding number rule to determine the region to fill. This operator shall have the same effect as the sequence h B'
]

{ #category : #accessing }
PtFillAndStrokeClosed class >> operatorName [
	^#b
]

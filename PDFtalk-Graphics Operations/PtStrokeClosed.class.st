"
Close and stroke the path. 
This operator shall have the same effect as the sequence h S
"
Class {
	#name : #PtStrokeClosed,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtStrokeClosed class >> documentation [
	^'Close and stroke the path. This operator shall have the same effect as the sequence h S'
]

{ #category : #accessing }
PtStrokeClosed class >> operatorName [
	^#s
]

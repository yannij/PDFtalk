"
End the path object without filling or stroking it. 
This operator shall be a path-painting no-op, used primarily for the side effect of changing the current clipping path
"
Class {
	#name : #PtEndPath,
	#superclass : #PtPathPaintingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtEndPath class >> documentation [
	^'End the path object without filling or stroking it. This operator shall be a path-painting no-op, used primarily for the side effect of changing the current clipping path'
]

{ #category : #accessing }
PtEndPath class >> operatorName [
	^#n
]

{ #category : #testing }
PtEndPath >> isOnlyClipping [
	^true
]

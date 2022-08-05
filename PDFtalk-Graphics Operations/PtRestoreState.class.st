"
Restore the graphics state by removing the most recently saved state from the stack and making it the current state
"
Class {
	#name : #PtRestoreState,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtRestoreState class >> documentation [
	^'Restore the graphics state by removing the most recently saved state from the stack and making it the current state'
]

{ #category : #accessing }
PtRestoreState class >> operatorName [
	^#Q
]

{ #category : #actions }
PtRestoreState >> processWith: aProcessor at: indexInteger [
	aProcessor addRestoreState
]

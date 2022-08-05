"
Save the current graphics state on the graphics state stack
"
Class {
	#name : #PtSaveState,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSaveState class >> documentation [
	^'Save the current graphics state on the graphics state stack'
]

{ #category : #accessing }
PtSaveState class >> end [
	^PtRestoreState
]

{ #category : #accessing }
PtSaveState class >> operatorName [
	^#q
]

{ #category : #actions }
PtSaveState >> processWith: aProcessor at: indexInteger [
	aProcessor addSaveStateAt: indexInteger
]

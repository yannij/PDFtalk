"
End a text object, discarding the text matrix
"
Class {
	#name : #PtEndText,
	#superclass : #PtTextObjectOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtEndText class >> documentation [
	^'End a text object, discarding the text matrix'
]

{ #category : #accessing }
PtEndText class >> operatorName [
	^#ET
]

{ #category : #actions }
PtEndText >> processWith: aProcessor at: indexInteger [
	aProcessor addEndText
]

"
Begin a text object, initializing the text matrix, Tm, and the text line matrix, Tlm, to the identity matrix. 
Text objects shall not be nested; a second BT shall not appear before an ET
"
Class {
	#name : #PtBeginText,
	#superclass : #PtTextObjectOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtBeginText class >> documentation [
	^'Begin a text object, initializing the text matrix, Tm, and the text line matrix, Tlm, to the identity matrix. Text objects shall not be nested; a second BT shall not appear before an ET'
]

{ #category : #accessing }
PtBeginText class >> end [
	^PtEndText
]

{ #category : #accessing }
PtBeginText class >> operatorName [
	^#BT
]

{ #category : #actions }
PtBeginText >> processWith: aProcessor at: indexInteger [
	aProcessor addBeginText
]

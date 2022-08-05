"
Show a text string
"
Class {
	#name : #PtShowText,
	#superclass : #PtTextShowingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtShowText class >> documentation [
	^'Show a text string'
]

{ #category : #accessing }
PtShowText class >> operandTypes [
	^#(#('string' String))
]

{ #category : #accessing }
PtShowText class >> operatorName [
	^#Tj
]

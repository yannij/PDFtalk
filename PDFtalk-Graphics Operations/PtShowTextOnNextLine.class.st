"
Move to the next line and show a text string. 
This operator shall have the same effect as the code
	T*
	string Tj
"
Class {
	#name : #PtShowTextOnNextLine,
	#superclass : #PtTextShowingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtShowTextOnNextLine class >> documentation [
	^'Move to the next line and show a text string. This operator shall have the same effect as the code
	T*
	string Tj'
]

{ #category : #accessing }
PtShowTextOnNextLine class >> operandTypes [
	^#(#('string' String))
]

{ #category : #accessing }
PtShowTextOnNextLine class >> operatorName [
	^#''''
]

{ #category : #actions }
PtShowTextOnNextLine >> modify: aProcessor with: aResource [
	aProcessor graphicsState nextLineBy: 0 @ aProcessor graphicsState leading content negated.
	super modify: aProcessor with: aResource
]

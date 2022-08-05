"
Set the text rendering mode, Tmode, to render. 
Initial value: 0
"
Class {
	#name : #PtTextRenderingMode,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtTextRenderingMode class >> documentation [
	^'Set the text rendering mode, Tmode, to render. Initial value: 0'
]

{ #category : #accessing }
PtTextRenderingMode class >> operandTypes [
	^#(#('render' Integer))
]

{ #category : #accessing }
PtTextRenderingMode class >> operatorName [
	^#Tr
]

{ #category : #actions }
PtTextRenderingMode >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #textRenderingMode put: self operands first
]

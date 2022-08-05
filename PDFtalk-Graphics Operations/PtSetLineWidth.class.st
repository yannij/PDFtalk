"
Set the line width in the graphics state
"
Class {
	#name : #PtSetLineWidth,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetLineWidth class >> documentation [
	^'Set the line width in the graphics state'
]

{ #category : #accessing }
PtSetLineWidth class >> operandTypes [
	^#(#('lineWidth' Number))
]

{ #category : #accessing }
PtSetLineWidth class >> operatorName [
	^#w
]

{ #category : #actions }
PtSetLineWidth >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #lineWidth put: self operands first
]

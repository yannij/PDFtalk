"
Set the line join style in the graphics state
"
Class {
	#name : #PtSetJoin,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetJoin class >> documentation [
	^'Set the line join style in the graphics state'
]

{ #category : #accessing }
PtSetJoin class >> operandTypes [
	^#(#('lineJoin' Number))
]

{ #category : #accessing }
PtSetJoin class >> operatorName [
	^#j
]

{ #category : #actions }
PtSetJoin >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #lineJoin put: self operands first
]

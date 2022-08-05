"
Set the line cap style in the graphics state
"
Class {
	#name : #PtSetCap,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetCap class >> documentation [
	^'Set the line cap style in the graphics state'
]

{ #category : #accessing }
PtSetCap class >> operandTypes [
	^#(#('lineCap' Number))
]

{ #category : #accessing }
PtSetCap class >> operatorName [
	^#J
]

{ #category : #actions }
PtSetCap >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #lineCap put: self operands first
]

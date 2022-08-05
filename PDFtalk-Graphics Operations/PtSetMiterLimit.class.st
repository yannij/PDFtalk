"
Set the miter limit in the graphics state
"
Class {
	#name : #PtSetMiterLimit,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetMiterLimit class >> documentation [
	^'Set the miter limit in the graphics state'
]

{ #category : #accessing }
PtSetMiterLimit class >> operandTypes [
	^#(#('miterLimit' Number))
]

{ #category : #accessing }
PtSetMiterLimit class >> operatorName [
	^#M
]

{ #category : #actions }
PtSetMiterLimit >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #miterLimit put: self operands first
]

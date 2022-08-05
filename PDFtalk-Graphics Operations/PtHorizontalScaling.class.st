"
Set the horizontal scaling, Th, to (scale ÷ 100). 
scale shall be a number specifying the percentage of the normal width. 
Initial value: 100 (normal width)
"
Class {
	#name : #PtHorizontalScaling,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtHorizontalScaling class >> documentation [
	^'Set the horizontal scaling, Th, to (scale ÷ 100). scale shall be a number specifying the percentage of the normal width. Initial value: 100 (normal width)'
]

{ #category : #accessing }
PtHorizontalScaling class >> operandTypes [
	^#(#('scale' Number))
]

{ #category : #accessing }
PtHorizontalScaling class >> operatorName [
	^#Tz
]

{ #category : #actions }
PtHorizontalScaling >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #horizontalScaling put: self operands first
]

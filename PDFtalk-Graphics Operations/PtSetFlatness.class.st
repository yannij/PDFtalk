"
Set the flatness tolerance in the graphics state. 
flatness is a number in the range 0 to 100; 
a value of 0 shall specify the output device’s default flatness tolerance
"
Class {
	#name : #PtSetFlatness,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetFlatness class >> documentation [
	^'Set the flatness tolerance in the graphics state. flatness is a number in the range 0 to 100; a value of 0 shall specify the output device’s default flatness tolerance'
]

{ #category : #accessing }
PtSetFlatness class >> operandTypes [
	^#(#('flatness' Integer))
]

{ #category : #accessing }
PtSetFlatness class >> operatorName [
	^#i
]

{ #category : #actions }
PtSetFlatness >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #flatness put: self operands first
]

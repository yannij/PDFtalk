"
Modify the current transformation matrix (CTM) by concatenating the specified matrix. 
Although the operands specify a matrix, they shall be written as six separate numbers, not as an array.
"
Class {
	#name : #PtConcatenateMatrix,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtConcatenateMatrix class >> documentation [
	^'Modify the current transformation matrix (CTM) by concatenating the specified matrix. Although the operands specify a matrix, they shall be written as six separate numbers, not as an array'
]

{ #category : #accessing }
PtConcatenateMatrix class >> operandTypes [
	^#(#('a' Number) #('b' Number) #('c' Number) #('d' Number) #('e' Number) #('f' Number))
]

{ #category : #accessing }
PtConcatenateMatrix class >> operatorName [
	^#cm
]

{ #category : #actions }
PtConcatenateMatrix >> modify: aProcessor with: aResource [
	aProcessor graphicsState
		at: #CTM
		put: (aProcessor graphicsState CTM concatenatedWith: ((PtPDF classAt: #Matrix) on: self operands))
]

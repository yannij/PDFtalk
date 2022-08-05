"
Set the text matrix, Tm, and the text line matrix, Tlm.
                    [ a b 0 ]
Tm := Tlm := [ c d 0 ]
                    [ e f 1 ]
The operands shall all be numbers, and the initial value for Tm and Tlm shall be the identity matrix, [1 0 0 1 0 0]. 
Although the operands specify a matrix, they shall be passed to Tm as six separate numbers, not as an array.

The matrix specified by the operands shall not be concatenated onto the current text matrix, but shall replace it

"
Class {
	#name : #PtSetTextMatrix,
	#superclass : #PtTextPositioningOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetTextMatrix class >> documentation [
	^'Set the text matrix, Tm, and the text line matrix, Tlm.
                     [ a b 0 ]
Tm := Tlm := [ c d 0 ]
                     [ e f 1 ]
The operands shall all be numbers, and the initial value for Tm and Tlm shall be the identity matrix, [1 0 0 1 0 0]. Although the operands specify a matrix, they shall be passed to Tm as six separate numbers, not as an array.

The matrix specified by the operands shall not be concatenated onto the current text matrix, but shall replace it'
]

{ #category : #accessing }
PtSetTextMatrix class >> operandTypes [
	^#(#('a' Number) #('b' Number) #('c' Number) #('d' Number) #('e' Number) #('f' Number))
]

{ #category : #accessing }
PtSetTextMatrix class >> operatorName [
	^#Tm
]

{ #category : #actions }
PtSetTextMatrix >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #textMatrix put: ((PtPDF classAt: #Matrix) on: self operands).
	aProcessor graphicsState at: #textLineMatrix put: aProcessor graphicsState textMatrix
]

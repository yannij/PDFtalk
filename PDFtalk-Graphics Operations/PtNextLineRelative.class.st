"
Move to the start of the next line, offset from the start of the current line by (tx, ty). 
tx and ty shall denote numbers expressed in unscaled text space units. 
More precisely, this operator shall perform these assignments:
                    [ 1  0  0 ]
Tm := Tlm := [  0  1  0 ] * Tlm
                    [ tx ty 1 ]

"
Class {
	#name : #PtNextLineRelative,
	#superclass : #PtTextPositioningOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtNextLineRelative class >> documentation [
	^'Move to the start of the next line, offset from the start of the current line by (tx, ty). tx and ty shall denote numbers expressed in unscaled text space units. More precisely, this operator shall perform these assignments
                     [ 1  0  0 ]
Tm := Tlm := [ 0  1  0 ] * Tlm
                     [ tx ty 1 ]'
]

{ #category : #accessing }
PtNextLineRelative class >> operandTypes [
	^#(#('x' Number) #('y' Number))
]

{ #category : #accessing }
PtNextLineRelative class >> operatorName [
	^#Td
]

{ #category : #actions }
PtNextLineRelative >> modify: aProcessor with: aResource [
	aProcessor graphicsState nextLineBy: self operands first asSmalltalkValue @ self operands last asSmalltalkValue
]

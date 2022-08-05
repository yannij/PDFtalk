"
Set the text rise, Trise, to rise, which shall be a number expressed in unscaled text space units. 
Initial value: 0
"
Class {
	#name : #PtTextRise,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtTextRise class >> documentation [
	^'Set the text rise, Trise, to rise, which shall be a number expressed in unscaled text space units. Initial value: 0'
]

{ #category : #accessing }
PtTextRise class >> operandTypes [
	^#(#('rise' Number))
]

{ #category : #accessing }
PtTextRise class >> operatorName [
	^#Ts
]

{ #category : #actions }
PtTextRise >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #textRise put: self operands first
]

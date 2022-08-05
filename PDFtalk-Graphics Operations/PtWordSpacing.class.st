"
Set the word spacing, Tw, to wordSpace, which shall be a number expressed in unscaled text space units. 
Word spacing shall be used by the Tj, TJ, and ' operators. 
Initial value: 0

"
Class {
	#name : #PtWordSpacing,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtWordSpacing class >> documentation [
	^'Set the word spacing, Tw, to wordSpace, which shall be a number expressed in unscaled text space units. Word spacing shall be used by the Tj, TJ, and '' operators. Initial value: 0'
]

{ #category : #accessing }
PtWordSpacing class >> operandTypes [
	^#(#('wordSpace' Number))
]

{ #category : #accessing }
PtWordSpacing class >> operatorName [
	^#Tw
]

{ #category : #actions }
PtWordSpacing >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #wordSpacing put: self operands first
]

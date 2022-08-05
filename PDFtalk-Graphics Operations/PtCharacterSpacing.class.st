"
Set the character spacing, Tc, to charSpace, which shall be a number expressed in unscaled text space units. 
Character spacing shall be used by the Tj, TJ, and ' operators. 
Initial value: 0

"
Class {
	#name : #PtCharacterSpacing,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtCharacterSpacing class >> documentation [
	^'Set the character spacing, Tc, to charSpace, which shall be a number expressed in unscaled text space units. Character spacing shall be used by the Tj, TJ, and '' operators. Initial value: 0'
]

{ #category : #accessing }
PtCharacterSpacing class >> operandTypes [
	^#(#('charSpace' Number))
]

{ #category : #accessing }
PtCharacterSpacing class >> operatorName [
	^#Tc
]

{ #category : #actions }
PtCharacterSpacing >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #characterSpacing put: self operands first
]

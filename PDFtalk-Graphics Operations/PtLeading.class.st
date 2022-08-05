"
Set the text leading, Tl, to leading, which shall be a number expressed in unscaled text space units. 
Text leading shall be used only by the T*, ', and  operators. 
Initial value: 0

"
Class {
	#name : #PtLeading,
	#superclass : #PtTextStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtLeading class >> documentation [
	^'Set the text leading, Tl, to leading, which shall be a number expressed in unscaled text space units. Text leading shall be used only by the T*, '', and " operators. Initial value: 0'
]

{ #category : #accessing }
PtLeading class >> operandTypes [
	^#(#('leading' Number))
]

{ #category : #accessing }
PtLeading class >> operatorName [
	^#TL
]

{ #category : #actions }
PtLeading >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #leading put: self operands first
]

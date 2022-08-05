"
Set the line dash pattern in the graphics state
"
Class {
	#name : #PtSetDash,
	#superclass : #PtGraphicsStateOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetDash class >> documentation [
	^'Set the line dash pattern in the graphics state'
]

{ #category : #accessing }
PtSetDash class >> operandTypes [
	^#(#('dashArray' #Array) #('dashPhase' #Number))
]

{ #category : #accessing }
PtSetDash class >> operatorName [
	^#d
]

{ #category : #actions }
PtSetDash >> modify: aProcessor with: aResource [
	aProcessor graphicsState
		at: #dashPattern
		put: ((PtPDF classAt: #Dash) array: self operands first offset: self operands last)
]

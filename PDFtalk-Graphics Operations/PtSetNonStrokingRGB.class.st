"
Same as RG but used for nonstroking operations.
"
Class {
	#name : #PtSetNonStrokingRGB,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetNonStrokingRGB class >> documentation [
	^'Same as RG but used for nonstroking operations'
]

{ #category : #accessing }
PtSetNonStrokingRGB class >> operandTypes [
	^#(#('r' Number) #('g' Number) #('b' Number))
]

{ #category : #accessing }
PtSetNonStrokingRGB class >> operatorName [
	^#rg
]

{ #category : #actions }
PtSetNonStrokingRGB >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorSpaceNonstroking put: (PtPDF classAt: #DeviceRGB) new.
	aProcessor graphicsState at: #colorNonstroking put: self operands
]

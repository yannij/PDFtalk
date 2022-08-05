"
Set the stroking colour space to DeviceRGB (or the DefaultRGB colour space) and set the colour to use for stroking operations. 
Each operand shall be a number between 0.0 (minimum intensity) and 1.0 (maximum intensity).
"
Class {
	#name : #PtSetStrokingRGB,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetStrokingRGB class >> documentation [
	^'Set the stroking colour space to DeviceRGB (or the DefaultRGB colour space) and set the colour to use for stroking operations. Each operand shall be a number between 0.0 (minimum intensity) and 1.0 (maximum intensity)'
]

{ #category : #accessing }
PtSetStrokingRGB class >> operandTypes [
	^#(#('r' Number) #('g' Number) #('b' Number))
]

{ #category : #accessing }
PtSetStrokingRGB class >> operatorName [
	^#RG
]

{ #category : #actions }
PtSetStrokingRGB >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorSpaceStroking put: (PtPDF classAt: #DeviceRGB) new.
	aProcessor graphicsState at: #colorStroking put: self operands
]

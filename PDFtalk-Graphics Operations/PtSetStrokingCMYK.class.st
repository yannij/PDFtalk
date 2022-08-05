"
Set the stroking colour space to DeviceCMYK (or the DefaultCMYK colour space) and set the colour to use for stroking operations. 
Each operand shall be a number between 0.0 (zero concentration) and 1.0 (maximum concentration). 
The behaviour of this operator is affected by the overprint mode.
"
Class {
	#name : #PtSetStrokingCMYK,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetStrokingCMYK class >> documentation [
	^'Set the stroking colour space to DeviceCMYK (or the DefaultCMYK colour space) and set the colour to use for stroking operations. Each operand shall be a number between 0.0 (zero concentration) and 1.0 (maximum concentration). The behaviour of this operator is affected by the overprint mode'
]

{ #category : #accessing }
PtSetStrokingCMYK class >> operandTypes [
	^#(#('c' #Number) #('m' #Number) #('y' #Number) #('k' #Number))
]

{ #category : #accessing }
PtSetStrokingCMYK class >> operatorName [
	^#K
]

{ #category : #actions }
PtSetStrokingCMYK >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorSpaceStroking put: (PtPDF classAt: #DeviceCMYK) new.
	aProcessor graphicsState at: #colorStroking put: self operands
]

"
Same as K but used for nonstroking operations.
"
Class {
	#name : #PtSetNonStrokingCMYK,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetNonStrokingCMYK class >> documentation [
	^'Same as K but used for nonstroking operations'
]

{ #category : #accessing }
PtSetNonStrokingCMYK class >> operandTypes [
	^#(#('c' #Number) #('m' #Number) #('y' #Number) #('k' #Number))
]

{ #category : #accessing }
PtSetNonStrokingCMYK class >> operatorName [
	^#k
]

{ #category : #actions }
PtSetNonStrokingCMYK >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorSpaceNonstroking put: (PtPDF classAt: #DeviceCMYK) new.
	aProcessor graphicsState at: #colorNonstroking put: self operands
]

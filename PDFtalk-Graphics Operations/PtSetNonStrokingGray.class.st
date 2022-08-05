"
Same as G but used for nonstroking operations.
"
Class {
	#name : #PtSetNonStrokingGray,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetNonStrokingGray class >> documentation [
	^'Same as G but used for nonstroking operations'
]

{ #category : #accessing }
PtSetNonStrokingGray class >> operandTypes [
	^#(#('gray' Number))
]

{ #category : #accessing }
PtSetNonStrokingGray class >> operatorName [
	^#g
]

{ #category : #actions }
PtSetNonStrokingGray >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorSpaceNonstroking put: (PtPDF classAt: #DeviceGray) new.
	aProcessor graphicsState at: #colorNonstroking put: self operands
]

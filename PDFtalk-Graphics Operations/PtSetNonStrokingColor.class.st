"
Same as SC but used for nonstroking operations.
"
Class {
	#name : #PtSetNonStrokingColor,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetNonStrokingColor class >> documentation [
	^'Same as SC but used for nonstroking operations'
]

{ #category : #accessing }
PtSetNonStrokingColor class >> operandTypes [
	^#(#('cn' Number))
]

{ #category : #accessing }
PtSetNonStrokingColor class >> operatorName [
	^#sc
]

{ #category : #accessing }
PtSetNonStrokingColor class >> pdfVersion [
	^PtVersion pdf1_1
]

{ #category : #actions }
PtSetNonStrokingColor >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorNonstroking put: self operands
]

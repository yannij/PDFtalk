"
Same as SCN but used for nonstroking operations.
"
Class {
	#name : #PtSetNonStrokingColorSpecial,
	#superclass : #PtColourOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtSetNonStrokingColorSpecial class >> documentation [
	^'Same as SCN but used for nonstroking operations'
]

{ #category : #accessing }
PtSetNonStrokingColorSpecial class >> operandTypes [
	^#(#('cn' Number) #('name' Number))
]

{ #category : #accessing }
PtSetNonStrokingColorSpecial class >> operatorName [
	^#scn
]

{ #category : #accessing }
PtSetNonStrokingColorSpecial class >> pdfVersion [
	^PtVersion pdf1_2
]

{ #category : #actions }
PtSetNonStrokingColorSpecial >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #colorNonstroking put: self operands
]

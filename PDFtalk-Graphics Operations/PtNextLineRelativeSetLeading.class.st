"
Move to the start of the next line, offset from the start of the current line by (tx, ty). 
As a side effect, this operator shall set the leading parameter in the text state. 
This operator shall have the same effect as this code:
	-ty TL
	tx ty Td
"
Class {
	#name : #PtNextLineRelativeSetLeading,
	#superclass : #PtTextPositioningOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtNextLineRelativeSetLeading class >> documentation [
	^'Move to the start of the next line, offset from the start of the current line by (tx, ty). As a side effect, this operator shall set the leading parameter in the text state. This operator shall have the same effect as this code:
	-ty TL
	tx ty Td'
]

{ #category : #accessing }
PtNextLineRelativeSetLeading class >> operandTypes [
	^#(#('x' Number) #('y' Number))
]

{ #category : #accessing }
PtNextLineRelativeSetLeading class >> operatorName [
	^#TD
]

{ #category : #actions }
PtNextLineRelativeSetLeading >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #leading put: self operands last content negated.
	aProcessor graphicsState nextLineBy: self operands first content @ self operands last content
]

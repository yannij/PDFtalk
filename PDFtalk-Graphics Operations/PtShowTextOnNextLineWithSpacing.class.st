"
Move to the next line and show a text string, using aw as the word spacing and ac as the character spacing 
(setting the corresponding parameters in the text state). 
aw and ac shall be numbers expressed in unscaled text space units. 
This operator shall have the same effect as this code:
	aw Tw
	ac Tc
	string '
"
Class {
	#name : #PtShowTextOnNextLineWithSpacing,
	#superclass : #PtTextShowingOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #accessing }
PtShowTextOnNextLineWithSpacing class >> documentation [
	^'Move to the next line and show a text string, using aw as the word spacing and ac as the character spacing (setting the corresponding parameters in the text state). aw and ac shall be numbers expressed in unscaled text space units. This operator shall have the same effect as this code:
	aw Tw
	ac Tc
	string '''
]

{ #category : #accessing }
PtShowTextOnNextLineWithSpacing class >> operandTypes [
	^#(#('aw' Number) #('ac' Number) #('string' String))
]

{ #category : #accessing }
PtShowTextOnNextLineWithSpacing class >> operatorName [
	^#'"'
]

{ #category : #actions }
PtShowTextOnNextLineWithSpacing >> modify: aProcessor with: aResource [
	aProcessor graphicsState at: #wordSpacing put: self operands first.
	aProcessor graphicsState at: #characterSpacing put: (self operands at: 2).
	aProcessor graphicsState nextLineBy: 0 @ aProcessor graphicsState leading content negated.
	super modify: aProcessor with: aResource
]

{ #category : #accessing }
PtShowTextOnNextLineWithSpacing >> stringOperand [
	^self operands last
]

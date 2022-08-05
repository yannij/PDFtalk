"
PDF Colour Operators as defined in PDF 32000_2008.pdf, section 8.6.8, pp. 171.

The PDF operators that control colour spaces and colour values. 
Also colour-related is the graphics state operator ri. 
Colour operators may appear at the page description level or inside text objects.
"
Class {
	#name : #PtColourOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtColourOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addColourOperation: self
]

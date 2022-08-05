"
PDF Text Positioning Operator as defined in PDF 32000_2008.pdf, section 9.4.2, pp. 249.

Text space is the coordinate system in which text is shown. 
It shall be defined by the text matrix, Tm, and the text state parameters Tfs, Th, and Trise, 
which together shall determine the transformation from text space to user space. 
Specifically, the origin of the first glyph shown by a text-showing operator shall be placed at the origin of text space. 
If text space has been translated, scaled, or rotated, then the position, size, or orientation of the glyph in user space shall be correspondingly altered.

The text-positioning operators shall only appear within text objects.
"
Class {
	#name : #PtTextPositioningOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtTextPositioningOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addTextPositioningOperation: self
]

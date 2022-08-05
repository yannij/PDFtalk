"
PDF Graphics State Operators as defined in PDF 32000_2008.pdf, section 8.4.4, pp. 127.

Operators that set the values of parameters in the graphics state.
"
Class {
	#name : #PtGraphicsStateOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtGraphicsStateOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addGraphicsStateOperation: self
]

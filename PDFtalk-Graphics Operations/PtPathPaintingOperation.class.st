"
PDF Path-Painting Operators as defined in PDF 32000_2008.pdf, section 8.5.3, pp. 134.

The path-painting operators end a path object, causing it to be painted on the current page in the manner that the operator specifies. 
The principal path-painting operators shall be S (for stroking) and f (for filling). 
Variants of these operators combine stroking and filling in a single operation or apply different rules for determining the area to be filled.
"
Class {
	#name : #PtPathPaintingOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #testing }
PtPathPaintingOperation >> isOnlyClipping [
	^false
]

{ #category : #actions }
PtPathPaintingOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addPathPaintingOperation: self
]

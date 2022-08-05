"
PDF Path Construction Operators as defined in PDF 32000_2008.pdf, section 8.5.2, pp. 132.

A page description shall begin with an empty path and shall build up its definition by invoking one or more path construction operators to add segments to it. 
The path construction operators may be invoked in any sequence, but the first one invoked shall be m or re to begin a new subpath. 
The path definition may conclude with the application of a path-painting operator such as S, f, or b; 
this operator may optionally be preceded by one of the clipping path operators W or W*.

NOTE
Note that the path construction operators do not place any marks on the page; only the painting operators do that. 
A path definition is not complete until a path-painting operator has been applied to it.

The path currently under construction is called the current path. In PDF (unlike PostScript), 
the current path is not part of the graphics state and is not saved and restored along with the other graphics state parameters. 
PDF paths shall be strictly internal objects with no explicit representation. 
After the current path has been painted, it shall become no longer defined; 
there is then no current path until a new one is begun with the m or re operator.

The trailing endpoint of the segment most recently added to the current path is referred to as the current point.
If the current path is empty, the current point shall be undefined. 
Most operators that add a segment to the current path start at the current point; if the current point is undefined, an error shall be generated.

All operands shall be numbers denoting coordinates in user space.
"
Class {
	#name : #PtPathConstructionOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtPathConstructionOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addPathConstructionOperation: self
]

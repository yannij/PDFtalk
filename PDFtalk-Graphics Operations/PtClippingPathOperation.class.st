"
PDF Graphics State Operators as defined in PDF 32000_2008.pdf, section 8.5.4, pp. 137.

The graphics state shall contain a current clipping path that limits the regions of the page affected by painting operators. 
The closed subpaths of this path shall define the area that can be painted. 
Marks falling inside this area shall be applied to the page; those falling outside it shall not be.

In the context of the transparent imaging model (PDF 1.4), the current clipping path constrains an object’s shape). 
The effective shape is the intersection of the object’s intrinsic shape with the clipping path; the source shape value shall be 0.0 outside this intersection. 
Similarly, the shape of a transparency group (defined as the union of the shapes of its constituent objects) shall be influenced both 
by the clipping path in effect when each of the objects is painted and by the one in effect at the time the group’s results are painted onto its backdrop.

The initial clipping path shall include the entire page. 
A clipping path operator (W or W*) may appear after the last path construction operator and before the path-painting operator that terminates a path object. 
Although the clipping path operator appears before the painting operator, it shall not alter the clipping path at the point where it appears. 
Rather, it shall modify the effect of the succeeding painting operator. 
After the path has been painted, the clipping path in the graphics state shall be set to the intersection of the current clipping path and the newly constructed path.

NOTE 1
In addition to path objects, text objects may also be used for clipping.

The n operator is a no-op path-painting operator; it shall cause no marks to be placed on the page, 
but can be used with a clipping path operator to establish a new clipping path. 
That is, after a path has been constructed, the sequence W n shall intersect that path with the current clipping path and shall establish a new clipping path.

NOTE 2
There is no way to enlarge the current clipping path or to set a new clipping path without reference to the current one. 
However, since the clipping path is part of the graphics state, its effect can be localized to 
specific graphics objects by enclosing the modification of the clipping path and the painting of those objects between a pair of q and Q operators. 
Execution of the Q operator causes the clipping path to revert to the value that was saved by the q operator before the clipping path was modified.
"
Class {
	#name : #PtClippingPathOperation,
	#superclass : #PtOperation,
	#category : #'PDFtalk-Graphics Operations'
}

{ #category : #actions }
PtClippingPathOperation >> processWith: aProcessor at: indexInteger [
	aProcessor addClippingPathOperation: self
]

{ #category : #accessing }
PtClippingPathOperation >> rule [
	"<Symbol>"

	^self subclassResponsibility
]

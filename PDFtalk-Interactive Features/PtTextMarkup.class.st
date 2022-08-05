"
PDF Text Markup Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.10, pp. 403.

Text markup annotations shall appear as highlights, underlines, strikeouts, or jagged (“squiggly”) underlines in the text of a document.
When opened, they shall display a pop-up window containing the text of the associated note.

"
Class {
	#name : #PtTextMarkup,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #'accessing entries' }
PtTextMarkup >> QuadPoints [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of 8 × n numbers specifying the coordinates of nquadrilaterals in default user space.
Each quadrilateral shall encompasses a word or group of contiguous words in the text underlying the annotation.
The coordinates for each quadrilateral shall be given in the order
	x1 y1 x2 y2 x3 y3 x4 y4
specifying the quadrilateral’s four vertices in counterclockwise order.
The text shall be oriented with respect to the edge connecting points (x1, y1) and (x2, y2).
The annotation dictionary’s AP entry, if present, shall take precedence over QuadPoints.'>
	^self objectAt: #QuadPoints ifAbsent: [#() asPDF]
]

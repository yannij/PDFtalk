"
PDF Link Annotation as defined in PDF 32000_2008.pdf, section 12.5.6.5, pp. 394.

A link annotation represents either a hypertext link to a destination elsewhere in the document or an action to be performed
"
Class {
	#name : #PtLinkAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtLinkAnnotation class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #LinkAnnotation
		supertype: #Annot
		section: '12.5.6.5'
		documentation: 'A link annotation represents either a hypertext link to a destination elsewhere in the document or an action to be performed'
]

{ #category : #accessing }
PtLinkAnnotation class >> subtype [
	^#Link
]

{ #category : #'accessing entries' }
PtLinkAnnotation >> A [
	<type: #Action>
	<version: 1 dot: 1>
	<attribute: 1 documentation: 'An action that shall be performed when the link annotation is activated'>
	^self objectAt: #A ifAbsent: [(PtPDF classAt: #Action) empty]
]

{ #category : #'accessing entries' }
PtLinkAnnotation >> BS [
	<type: #BorderStyle>
	<version: 1 dot: 6>
	<attribute: 6 documentation: 'A border style dictionary specifying the line width and dash pattern to be used in drawing the annotation’s border.
The annotation dictionary’s AP entry, if present, takes precedence over the BS entry'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtLinkAnnotation >> Dest [
	<type: #Destination>
	<type: #Name>
	<type: #String>
	<attribute: 2 documentation: '(not permitted if an A entry is present)
A destination that shall be displayed when the annotation is activated'>
	^self objectAt: #Dest ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtLinkAnnotation >> H [
	<type: #Name>
	<version: 1 dot: 2>
	<attribute: 3 documentation: 'The annotation’s highlighting mode, the visual effect that shall be used when the mouse button is pressed or held down inside its active area:
	N 	(None) 		No highlighting.
	I 	(Invert) 	Invert the contents of the annotation rectangle.
	OI 	(Outline) 	Invert the annotation’s border.
	P 	(Push) 		Display the annotation as if it were being pushed below the surface of the page'>
	^self objectAt: #H ifAbsent: [#I asPDF]
]

{ #category : #'accessing entries' }
PtLinkAnnotation >> PA [
	<type: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 4 documentation: 'A URI action formerly associated with this annotation.
When Web Capture changes an annotation from a URI to a go-to action, it uses this entry to save the data from the original URI action so that it can be changed back in case the target page for the go-to action is subsequently deleted'>
	^self objectAt: #PA ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtLinkAnnotation >> QuadPoints [
	<typeArrayOf: #Number>
	<version: 1 dot: 6>
	<attribute: 5 documentation: 'An array of 8 × n numbers specifying the coordinates of n quadrilaterals in default user space that comprise the region in which the link should be activated.
The coordinates for each quadrilateral are given in the order
	x1 y1 x2 y2 x3 y3 x4 y4
specifying the four vertices of the quadrilateral in counterclockwise order.
For orientation purposes, such as when applying an underline border style, the bottom of a quadrilateral is the line formed by (x1, y1)and (x2, y2).

If this entry is not present or the conforming reader does not recognize it, the region specified by the Rect entry should be used.
QuadPoints shall be ignored if any coordinate in the array lies outside the region specified by Rect'>
	^self objectAt: #QuadPoints ifAbsent: [#() asPDF]
]

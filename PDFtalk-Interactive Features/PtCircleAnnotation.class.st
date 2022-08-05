"
PDF Square and Circle Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.8, pp. 401.

Square and circle annotations shall display, respectively, a rectangle or an ellipse on the page.
When opened, they shall display a pop-up window containing the text of the associated note.
The rectangle or ellipse shall be inscribed within the annotation rectangle defined by the annotation dictionary’s Rect entry.

Despite the names square and circle, the width and height of the annotation rectangle need not be equal.

"
Class {
	#name : #PtCircleAnnotation,
	#superclass : #PtSquareCircle,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtCircleAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CircleAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.8'
		documentation: 'Square and circle annotations shall display, respectively, a rectangle or an ellipse on the page.
When opened, they shall display a pop-up window containing the text of the associated note.
The rectangle or ellipse shall be inscribed within the annotation rectangle defined by the annotation dictionary’s Rect entry.

Despite the names square and circle, the width and height of the annotation rectangle need not be equal.'
]

{ #category : #accessing }
PtCircleAnnotation class >> subtype [
	^#Circle
]

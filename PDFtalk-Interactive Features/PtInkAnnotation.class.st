"
PDF Ink Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.13, pp. 405.

An ink annotation represents a freehand “scribble” composed of one or more disjoint paths.
When opened, it shall display a pop-up window containing the text of the associated note.
"
Class {
	#name : #PtInkAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtInkAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #InkAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.13'
		documentation: 'An ink annotation represents a freehand “scribble” composed of one or more disjoint paths.
When opened, it shall display a pop-up window containing the text of the associated note.'
]

{ #category : #accessing }
PtInkAnnotation class >> subtype [
	^#Ink
]

{ #category : #'accessing entries' }
PtInkAnnotation >> BS [
	<type: #BorderStyle>
	<attribute: 2 documentation: 'A border style dictionary specifying the line width and dash pattern that shall be used in drawing the paths.
The annotation dictionary’s AP entry, if present, shall take precedence over the InkList and BS entries.'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtInkAnnotation >> InkList [
	<typeArrayOf: #Array>
	<required>
	<attribute: 1 documentation: 'An array of n arrays, each representing a stroked path.
Each array shall be a series of alternating horizontal and vertical coordinates in default user space, specifying points along the path.
When drawn, the points shall be connected by straight lines or curves in an implementation-dependent way.'>
	^self objectAt: #InkList ifAbsent: [#() asPDF]
]

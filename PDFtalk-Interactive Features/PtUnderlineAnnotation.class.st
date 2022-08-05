"
PDF Text Markup Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.10, pp. 403.

Text markup annotations shall appear as highlights, underlines, strikeouts, or jagged (“squiggly”) underlines in the text of a document.
When opened, they shall display a pop-up window containing the text of the associated note.

"
Class {
	#name : #PtUnderlineAnnotation,
	#superclass : #PtTextMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtUnderlineAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #UnderlineAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.10'
		documentation: 'Text markup annotations shall appear as highlights, underlines, strikeouts, or jagged (“squiggly”) underlines in the text of a document.
When opened, they shall display a pop-up window containing the text of the associated note.'
]

{ #category : #accessing }
PtUnderlineAnnotation class >> subtype [
	^#Underline
]

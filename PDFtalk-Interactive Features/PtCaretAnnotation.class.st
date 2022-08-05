"
PDF Caret Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.11, pp. 404.

A caret annotation is a visual symbol that indicates the presence of text edits.
"
Class {
	#name : #PtCaretAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtCaretAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CaretAnnotation
		supertype: #Annot
		version: #(1 5)
		section: '12.5.6.11'
		documentation: 'A caret annotation is a visual symbol that indicates the presence of text edits.'
]

{ #category : #accessing }
PtCaretAnnotation class >> subtype [
	^#Caret
]

{ #category : #'accessing entries' }
PtCaretAnnotation >> RD [
	<type: #Rectangle>
	<attribute: 1 documentation: 'A set of four numbers that shall describe the numerical differences between two rectangles: the Rect entry of the annotation and the actual boundaries of the underlying caret.
Such a difference can occur.
When a paragraph symbol specified by Sy is displayed along with the caret.

The four numbers shall correspond to the differences in default user space between the left, top, right, and bottom coordinates of Rect and those of the caret, respectively.
Each value shall be greater than or equal to 0.
The sum of the top and bottom differences shall be less than the height of Rect, and the sum of the left and right differences shall be less than the width of Rect.'>
	^self objectAt: #RD ifAbsent: [(PtPDF classAt: #Rectangle) new]
]

{ #category : #'accessing entries' }
PtCaretAnnotation >> Sy [
	<type: #Name>
	<attribute: 2 documentation: 'A name specifying a symbol that shall be associated with the caret:
	P		A new paragraph symbol (¶) should be associated with the caret.
	None	No symbol should be associated with the caret.'>
	^self objectAt: #Sy ifAbsent: [#None asPDF]
]

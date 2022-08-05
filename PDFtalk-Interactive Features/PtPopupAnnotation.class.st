"
PDF Pop-up Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.14, pp. 405.

A pop-up annotation displays text in a pop-up window for entry and editing.
It shall not appear alone but is associated with a markup annotation, its parent annotation, and shall be used for editing the parent’s text.
It shall have no appearance stream or associated actions of its own and shall be identified by the Popup entry in the parent’s annotation dictionary.
"
Class {
	#name : #PtPopupAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtPopupAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PopupAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.14'
		documentation: 'A pop-up annotation displays text in a pop-up window for entry and editing.
It shall not appear alone but is associated with a markup annotation, its parent annotation, and shall be used for editing the parent’s text.
It shall have no appearance stream or associated actions of its own and shall be identified by the Popup entry in the parent’s annotation dictionary.'
]

{ #category : #accessing }
PtPopupAnnotation class >> subtype [
	^#Popup
]

{ #category : #'accessing entries' }
PtPopupAnnotation >> Open [
	<type: #Boolean>
	<attribute: 2 documentation: 'A flag specifying whether the pop-up annotation shall initially be displayed open.'>
	^self objectAt: #Open ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtPopupAnnotation >> Parent [
	<typeIndirect: #Annot>
	<attribute: 1 documentation: 'The parent annotation with which this pop-up annotation shall be associated.
If this entry is present, the parent annotation’s Contents, M, C, and T entries shall override those of the pop-up annotation itself.'>
	^self objectAt: #Parent ifAbsent: [(PtPDF classAt: #Annot) empty]
]

"
PDF Screen Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.18, pp. 407.

A screen annotation specifies a region of a page upon which media clips may be played.
It also serves as an object from which actions can be triggered.
"
Class {
	#name : #PtScreenAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtScreenAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ScreenAnnotation
		supertype: #Annot
		version: #(1 5)
		section: '12.5.6.18'
		documentation: 'A screen annotation specifies a region of a page upon which media clips may be played.
It also serves as an object from which actions can be triggered.'
]

{ #category : #accessing }
PtScreenAnnotation class >> subtype [
	^#Screen
]

{ #category : #'accessing entries' }
PtScreenAnnotation >> A [
	<type: #Action>
	<attribute: 3 documentation: 'An action that shall be performed when the annotation is activated.'>
	^self objectAt: #A ifAbsent: [(PtPDF classAt: #Action) empty]
]

{ #category : #'accessing entries' }
PtScreenAnnotation >> AA [
	<type: #Dictionary>
	<attribute: 4 documentation: 'An additional-actions dictionary defining the screen annotation’s behaviour in response to various trigger events.'>
	^self objectAt: #AA ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtScreenAnnotation >> MK [
	<type: #AppearanceCharacteristics>
	<attribute: 2 documentation: 'An appearance characteristics dictionary.
The I entry of this dictionary provides the icon used in generating the appearance referred to by the screen annotation’s AP entry.'>
	^self objectAt: #MK ifAbsent: [(PtPDF classAt: #AppearanceCharacteristics) empty]
]

{ #category : #'accessing entries' }
PtScreenAnnotation >> T [
	<type: #String>
	<attribute: 1 documentation: 'The title of the screen annotation.'>
	^self objectAt: #T ifAbsent: ['' asPDF]
]

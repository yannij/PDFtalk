"
PDF Widget Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.19, pp. 408.

Interactive forms use widget annotations to represent the appearance of fields and to manage user interactions.
As a convenience, when a field has only a single associated widget annotation, the contents of the field dictionary and the annotation dictionary may be merged into a single dictionary containing entries that pertain to both a field and an annotation.

	NOTE	This presents no ambiguity, since the contents of the two kinds of dictionaries do not conflict.
"
Class {
	#name : #PtWidgetAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtWidgetAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #WidgetAnnotation
		supertype: #Annot
		version: #(1 2)
		section: '12.5.6.19'
		documentation: 'Interactive forms use widget annotations to represent the appearance of fields and to manage user interactions.
As a convenience, when a field has only a single associated widget annotation, the contents of the field dictionary and the annotation dictionary may be merged into a single dictionary containing entries that pertain to both a field and an annotation.

	NOTE	This presents no ambiguity, since the contents of the two kinds of dictionaries do not conflict.'
]

{ #category : #accessing }
PtWidgetAnnotation class >> subtype [
	^#Widget
]

{ #category : #'accessing entries' }
PtWidgetAnnotation >> A [
	<type: #Action>
	<version: 1 dot: 1>
	<attribute: 3 documentation: 'An action that shall be performed when the annotation is activated.'>
	^self objectAt: #A ifAbsent: [(PtPDF classAt: #Action) empty]
]

{ #category : #'accessing entries' }
PtWidgetAnnotation >> AA [
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 4 documentation: 'An additional-actions dictionary defining the screen annotation’s behaviour in response to various trigger events.'>
	^self objectAt: #AA ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtWidgetAnnotation >> BS [
	<type: #BorderStyle>
	<version: 1 dot: 2>
	<attribute: 5 documentation: 'A border style dictionary specifying the width and dash pattern that shall be used in drawing the annotation’s border.
The annotation dictionary’s AP entry, if present, shall take precedence over the L and BS entries.'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtWidgetAnnotation >> H [
	<type: #Name>
	<attribute: 1 documentation: 'The annotation’s highlighting mode, the visual effect that shall be used when the mouse button is pressed or held down inside its active area:
	N 	(None) No highlighting.
	I 	(Invert) Invert the contents of the annotation rectangle.
	O 	(Outline) Invert the annotation’s border.
	P 	(Push) Display the annotation’s down appearance, if any.
		If no down appearance is defined, the contents of the annotation rectangle shall be offset to appear as if it were being pushed below the surface of the page.
	T 	(Toggle) Same as P (which is preferred).
A highlighting mode other than P shall override any down appearance defined for the annotation.'>
	^self objectAt: #H ifAbsent: [#I asPDF]
]

{ #category : #'accessing entries' }
PtWidgetAnnotation >> MK [
	<type: #AppearanceCharacteristics>
	<attribute: 2 documentation: 'An appearance characteristics dictionary that shall be used in constructing a dynamic appearance stream specifying the annotation’s visual presentation on the page.
The name MK for this entry is of historical significance only and has no direct meaning.'>
	^self objectAt: #MK ifAbsent: [(PtPDF classAt: #AppearanceCharacteristics) empty]
]

{ #category : #'accessing entries' }
PtWidgetAnnotation >> Parent [
	<typeIndirect: #Dictionary>
	<attribute: 6 documentation: '(Required if this widget annotation is one of multiple children in a field; absent otherwise)
An indirect reference to the widget annotation’s parent field.
A widget annotation may have at most one parent; that is, it can be included in the Kids array of at most one field.'>
	^self objectAt: #Parent ifAbsent: [PtPDF Dictionary empty]
]

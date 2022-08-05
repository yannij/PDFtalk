"
PDF Free Text Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.6, pp. 395.

A free text annotation displays text directly on the page.
Unlike an ordinary text annotation, a free text annotation has no open or closed state; instead of being displayed in a pop-up window, the text shall be always visible.

"
Class {
	#name : #PtFreeTextAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtFreeTextAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FreeTextAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.6'
		documentation: 'A free text annotation displays text directly on the page.
Unlike an ordinary text annotation, a free text annotation has no open or closed state; instead of being displayed in a pop-up window, the text shall be always visible.'
]

{ #category : #accessing }
PtFreeTextAnnotation class >> subtype [
	^#FreeText
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> BE [
	<type: #BorderEffect>
	<version: 1 dot: 6>
	<attribute: 7 documentation: 'A border effect dictionary used in conjunction with the border style dictionary specified by the BS entry.'>
	^self objectAt: #BE ifAbsent: [(PtPDF classAt: #BorderEffect) empty]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> BS [
	<type: #BorderStyle>
	<version: 1 dot: 6>
	<attribute: 9 documentation: 'A border style dictionary specifying the line width and dash pattern that shall be used in drawing the annotation’s border.
The annotation dictionary’s AP entry, if present, takes precedence over the BS entry'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> CL [
	<typeArrayOf: #Number>
	<version: 1 dot: 6>
	<attribute: 5 documentation: '(meaningful only if IT is FreeTextCallout)
An array of four or six numbers specifying a callout line attached to the free text annotation.
Six numbers [ x1 y1 x2 y2 x3 y3 ] represent the starting, knee point, and ending coordinates of the line in default user space.
Four numbers [ x1 y1 x2 y2 ] represent the starting and ending coordinates of the line.'>
	^self objectAt: #CL ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> DA [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'The default appearance string that shall be used in formatting the text.
The annotation dictionary’s AP entry, if present, shall take precedence over the DA entry'>
	^self objectAt: #DA ifAbsent: [PtPDF String empty]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> DS [
	<type: #String>
	<version: 1 dot: 5>
	<attribute: 4 documentation: 'A default style string.'>
	^self objectAt: #DS ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> IT [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 6 documentation: 'A name describing the intent of the free text annotation.
The following values shall be valid:
	FreeText				The annotation is intended to function as a plain free-text annotation.
							A plain free-text annotation is also known as a text box comment.
	FreeTextCallout		The annotation is intended to function as a callout.
							The callout is associated with an area on the page through the callout line specified in CL.
	FreeTextTypeWriter	The annotation is intended to function as a click-to-type or typewriter object and no callout line is drawn.'>
	^self objectAt: #IT ifAbsent: [#FreeText asPDF]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> LE [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 10 documentation: '(Optional; meaningful only if CL is present)
A name specifying the line ending style that shall be used in drawing the callout line specified in CL.
The name shall specify the line ending style for the endpoint defined by the pairs of coordinates (x1, y1).'>
	^self objectAt: #LE ifAbsent: [#None asPDF]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> Q [
	<type: #Integer>
	<version: 1 dot: 4>
	<attribute: 2 documentation: 'A code specifying the form of quadding (justification) that shall be used in displaying the annotation’s text:
	0	Left-justified
	1	Centered
	2	Right-justified.'>
	^self objectAt: #Q ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> RC [
	<type: #String>
	<type: #Textstream>
	<version: 1 dot: 5>
	<attribute: 3 documentation: 'A rich text string that shall be used to generate the appearance of the annotation.'>
	^self objectAt: #RC ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtFreeTextAnnotation >> RD [
	<type: #Rectangle>
	<version: 1 dot: 6>
	<attribute: 8 documentation: 'A set of four numbers describing the numerical differences between two rectangles: the Rect entry of the annotation and a rectangle contained within that rectangle.
The inner rectangle is where the annotation’s text should be displayed.
Any border styles and/or border effects specified by BS and BE entries, respectively, shall be applied to the border of the inner rectangle.

The four numbers correspond to the differences in default user space between the left, top, right, and bottom coordinates of Rect and those of the inner rectangle, respectively.
Each value shall be greater than or equal to 0. The sum of the top and bottom differences shall be less than the height of Rect, and the sum of the left and right differences shall be less than the width of Rect.'>
	^self objectAt: #RD ifAbsent: [(PtPDF classAt: #Rectangle) new]
]

"
PDF Redaction Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.23, pp. 412.

A redaction annotation identifies content that is intended to be removed from the document.
The intent of redaction annotations is to enable the following process:
	a)	Content identification. A user applies redact annotations that specify the pieces or regions of content that should be removed.
		Up until the next step is performed, the user can see, move and redefine these annotations.
	b)	Content removal. The user instructs the viewer application to apply the redact annotations, after which the content in the area specified by the redact annotations is removed.
		In the removed content’s place, some marking appears to indicate the area has been redacted.
		Also, the redact annotations are removed from the PDF document.

Redaction annotations provide a mechanism for the first step in the redaction process (content identification).
This allows content to be marked for redaction in a non-destructive way, thus enabling a review process for evaluating potential redactions prior to removing the specified content.

Redaction annotations shall provide enough information to be used in the second phase of the redaction process (content removal).
This phase is application-specific and requires the conforming reader to remove all content identified by the redaction annotation, as well as the annotation itself.
"
Class {
	#name : #PtRedactAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtRedactAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #RedactAnnotation
		supertype: #Annot
		version: #(1 7)
		section: '12.5.6.23'
		documentation: 'A redaction annotation identifies content that is intended to be removed from the document.
The intent of redaction annotations is to enable the following process:
	a)	Content identification. A user applies redact annotations that specify the pieces or regions of content that should be removed.
		Up until the next step is performed, the user can see, move and redefine these annotations.
	b)	Content removal. The user instructs the viewer application to apply the redact annotations, after which the content in the area specified by the redact annotations is removed.
		In the removed content’s place, some marking appears to indicate the area has been redacted.
		Also, the redact annotations are removed from the PDF document.

Redaction annotations provide a mechanism for the first step in the redaction process (content identification).
This allows content to be marked for redaction in a non-destructive way, thus enabling a review process for evaluating potential redactions prior to removing the specified content.

Redaction annotations shall provide enough information to be used in the second phase of the redaction process (content removal).
This phase is application-specific and requires the conforming reader to remove all content identified by the redaction annotation, as well as the annotation itself.'
]

{ #category : #accessing }
PtRedactAnnotation class >> subtype [
	^#Redact
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> DA [
	<type: #String>
	<attribute: 6 documentation: '(Required if OverlayText is present, ignored otherwise)
The appearance string to be used in formatting the overlay text when it is drawn after the affected content has been removed.
This entry is ignored if the RO entry is present.'>
	^self objectAt: #DA ifAbsent: [PtPDF String empty]
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> IC [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of three numbers in the range 0.0 to 1.0 specifying the components, in the DeviceRGB colour space, of the interior colour with which to fill the redacted region after the affected content has been removed.
If this entry is absent, the interior of the redaction region is left transparent.
This entry is ignored if the RO entry is present.'>
	^self objectAt: #IC ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> OverlayText [
	<type: #String>
	<attribute: 4 documentation: 'A text string specifying the overlay text that should be drawn over the redacted region after the affected content has been removed.
This entry is ignored if the RO entry is present.'>
	^self objectAt: #OverlayText ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> Q [
	<type: #Integer>
	<attribute: 7 documentation: 'A code specifying the form of quadding (justification) to be used in laying out the overlay text:
	0	Left-justified
	1	Centered
	2	Right-justified
This entry is ignored if the RO entry is present.'>
	^self objectAt: #Q ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> QuadPoints [
	<typeArrayOf: #Number>
	<attribute: 1 documentation: 'An array of 8 x n numbers specifying the coordinates of n quadrilaterals in default user space.
If present, these quadrilaterals denote the content region that is intended to be removed.
If this entry is not present, the Rect entry denotes the content region that is intended to be removed.'>
	^self objectAt: #QuadPoints ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> RO [
	<type: #FormXObject>
	<attribute: 3 documentation: 'A form XObject specifying the overlay appearance for this redaction annotation.
After this redaction is applied and the affected content has been removed, the overlay appearance should be drawn such that its origin lines up with the lower-left corner of the annotation rectangle.
This form XObject is not necessarily related to other annotation appearances, and may or may not be present in the AP dictionary.
This entry takes precedence over the IC, OverlayText, DA, and Q entries.'>
	^self objectAt: #RO ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtRedactAnnotation >> Repeat [
	<type: #Boolean>
	<attribute: 5 documentation: 'If true, then the text specified by OverlayText should be repeated to fill the redacted region after the affected content has been removed.
This entry is ignored if the RO entry is present.'>
	^self objectAt: #Repeat ifAbsent: [false]
]

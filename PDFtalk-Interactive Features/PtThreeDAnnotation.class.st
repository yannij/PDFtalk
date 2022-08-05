"
PDF 3D Annotations as defined in PDF 32000_2008.pdf, section 13.6.2, pp. 512.

3D annotations are the means by which 3D artwork shall be represented in a PDF document.

In addition to these entries, a 3D annotation shall provide an appearance stream in its AP entry that has a normal appearance (the N entry).
This appearance may be used by applications that do not support 3D annotations and by all applications for the initial display of the annotation.
"
Class {
	#name : #PtThreeDAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtThreeDAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ThreeDAnnotation
		supertype: #Annot
		version: #(1 6)
		section: '13.6.2'
		documentation: '3D annotations are the means by which 3D artwork shall be represented in a PDF document.
In addition to these entries, a 3D annotation shall provide an appearance stream in its AP entry that has a normal appearance (the N entry).
This appearance may be used by applications that do not support 3D annotations and by all applications for the initial display of the annotation.'
]

{ #category : #accessing }
PtThreeDAnnotation class >> subtype [
	^#'3D'
]

{ #category : #'accessing entries' }
PtThreeDAnnotation >> ThreeDA [
	<type: #ThreeDActivation>
	<attribute: 3 documentation: 'An activation dictionary that defines the times at which the annotation shall be activated and deactivated and the state of the 3D artwork instance at those times.
Default value: an activation dictionary containing default values for all its entries.'>
	^self objectAt: #'3DA' ifAbsent: [(PtPDF classAt: #ThreeDActivation) empty]
]

{ #category : #'accessing entries' }
PtThreeDAnnotation >> ThreeDB [
	<type: #Rectangle>
	<attribute: 5 documentation: 'The 3D view box, which is the rectangular area in which the 3D artwork shall be drawn.
It shall be within the rectangle specified by the annotation’s Rect entry and shall be expressed in the annotation’s target coordinate system.

Default value: the annotation’s Rect entry, expressed in the target coordinate system.
This value is [ -w/2 -h/2 w/2 h/2 ], where w and h are the width and height, respectively, of Rect.'>
	^self objectAt: #'3DB' ifAbsent: [(PtPDF classAt: #Rectangle) empty]
]

{ #category : #'accessing entries' }
PtThreeDAnnotation >> ThreeDD [
	<type: #Stream>
	<type: #Dictionary>
	<required>
	<attribute: 1 documentation: 'A 3D stream or 3D reference dictionary that specifies the 3D artwork to be shown.'>
	^self objectAt: #'3DD' ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtThreeDAnnotation >> ThreeDI [
	<type: #Boolean>
	<attribute: 4 documentation: 'A flag indicating the primary use of the 3D annotation.
If true, it is intended to be interactive; if false, it is intended to be manipulated programmatically, as with a JavaScript animation.
Conforming readers may present different user interface controls for interactive 3D annotations (for example, to rotate, pan, or zoom the artwork) than for those managed by a script or other mechanism.'>
	^self objectAt: #'3DI' ifAbsent: [true]
]

{ #category : #'accessing entries' }
PtThreeDAnnotation >> ThreeDV [
	<type: #Dictionary>
	<type: #Integer>
	<type: #String>
	<type: #Name>
	<attribute: 2 documentation: 'An object that specifies the default initial view of the 3D artwork that shall be used when the annotation is activated.
It may be either a 3D view dictionary or one of the following types specifying an element in the VA array in the 3D stream:
	•	An integer specifying an index into the VA array.
	•	A text string matching the IN entry in one of the views in the VAarray.
	•	A name that indicates the first (F), last (L), or default (D) entries in the VA array.
Default value: the default view in the 3D stream object specified by 3DD.'>
	^self objectAt: #'3DV' ifAbsent: [PtPDF Dictionary empty]
]

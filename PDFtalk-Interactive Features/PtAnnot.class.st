"
PDF Annotation dictionary as defined in PDF 32000_2008.pdf, section 12.5.2, pp. 382.

The optional Annots entry in a page object holds an array of annotation dictionaries, each representing an annotation associated with the given page.
The dictionary may contain additional entries specific to a particular annotation type.
A given annotation dictionary shall be referenced from the Annots array of only one page.
This requirement applies only to the annotation dictionary itself, not to subsidiary objects, which may be shared among multiple annotations.
"
Class {
	#name : #PtAnnot,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #'instance creation' }
PtAnnot class >> empty [
	| inst |
	inst := super empty.
	inst at: #Subtype put: self subtype.
	^inst
]

{ #category : #testing }
PtAnnot class >> isClassForDictionary: aDictionary [
	| subtypeEntry |
	subtypeEntry := aDictionary at: #Subtype ifAbsent: [
		^false].
	self == (PtPDF classAt: #Annot) ifTrue: [
		^super isClassForDictionary: aDictionary].
	^self subtype asPDF = subtypeEntry asPDF
]

{ #category : #accessing }
PtAnnot class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Annot
		supertype: #Dictionary
		section: '12.5.1'
		documentation: 'The optional Annots entry in a page object holds an array of annotation dictionaries, each representing an annotation associated with the given page.
The dictionary may contain additional entries specific to a particular annotation type.
A given annotation dictionary shall be referenced from the Annots array of only one page.
This requirement applies only to the annotation dictionary itself, not to subsidiary objects, which may be shared among multiple annotations.'
]

{ #category : #accessing }
PtAnnot class >> subtype [
	"<Symbol>
	subtype entry"

	^#''
]

{ #category : #accessing }
PtAnnot class >> type [
	^#Annot
]

{ #category : #'accessing entries' }
PtAnnot >> AP [
	<type: #Appearance>
	<version: 1 dot: 2>
	<attribute: 9 documentation: 'An appearance dictionary specifying how the annotation shall be presented visually on the page.
Individual annotation handlers may ignore this entry and provide their own appearances'>
	^self objectAt: #AP ifAbsent: [(PtPDF classAt: #Appearance) empty]
]

{ #category : #'accessing entries' }
PtAnnot >> AS [
	<type: #Name>
	<version: 1 dot: 2>
	<attribute: 10 documentation: '(Required if the appearance dictionary AP contains one or more subdictionaries)
The annotation’s appearance state, which selects the applicable appearance stream from an appearance subdictionary'>
	^self objectAt: #AS ifAbsent: [(PtPDF classAt: #Name) empty]
]

{ #category : #'accessing entries' }
PtAnnot >> Border [
	<type: #Array>
	<attribute: 11 documentation: 'An array specifying the characteristics of the annotation’s border, which shall be drawn as a rounded rectangle.
(PDF 1.0)
The array consists of three numbers defining the horizontal corner radius, vertical corner radius, and border width, all in default user space units.
If the corner radii are 0, the border has square (not rounded) corners; if the border width is 0, no border is drawn.
(PDF 1.1)
The array may have a fourth element, an optional dash array defining a pattern of dashes and gaps that shall be used in drawing the border.
The dash array shall be specified in the same format as in the line dash pattern parameter of the graphics state.
EXAMPLE
A Border value of [0 0 1 [3 2]] specifies a border 1 unit wide, with square corners, drawn with 3-unit dashes alternating with 2-unit gaps.
NOTE (PDF 1.2)
The dictionaries for some annotation types (such as free text and polygon annotations) can include the BS entry.
That entry specifies a border style dictionary that has more settings than the array specified for the Border entry.
If an annotation dictionary includes the BS entry, then the Border entry is ignored.'>
	^self objectAt: #Border ifAbsent: [#(0 0 1) asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> C [
	<typeArrayOf: #Number>
	<version: 1 dot: 1>
	<attribute: 12 documentation: 'An array of numbers in the range 0.0 to 1.0, representing a colour used for the following purposes:
The background of the annotation’s icon when closed
The title bar of the annotation’s pop-up window
The border of a link annotation
The number of array elements determines the colour space in which the colour shall be defined:
0 No colour; transparent
1 DeviceGray
3 DeviceRGB
4 DeviceCMYK'>
	^self objectAt: #C ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> Contents [
	<type: #String>
	<attribute: 4 documentation: 'Text that shall be displayed for the annotation or, if this type of annotation does not display text, an alternate description of the annotation’s contents in human-readable form.
In either case, this text is useful when extracting the document’s contents in support of accessibility to users with disabilities or for other purposes'>
	^self objectAt: #Contents ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> F [
	<type: #Integer>
	<version: 1 dot: 1>
	<attribute: 8 documentation: 'A set of flags specifying various characteristics of the annotation.
The value is an integer interpreted as one-bit flags specifying various characteristics of the annotation.
Bit positions within the flag word shall be numbered from low-order to high-order, with the lowest-order bit numbered 1.
All other bits of the integer shall be set to 0.

Bit position		Name				Meaning
	1			Invisible			If set, do not display the annotation if it does not belong to one of the standard annotation types and no annotation handler is available.
									If clear, display such an unknown annotation using an appearance stream specified by its appearance dictionary, if any.
	2			Hidden 			(PDF 1.2) If set, do not display or print the annotation or allow it to interact with the user, regardless of its annotation type or whether an annotation handler is available.
									NOTE In cases where screen space is limited, the ability to hide and show annotations selectively can be used in combination with appearance streams to display auxiliary pop-up information similar in function to online help systems.
	3			Print 				(PDF 1.2) If set, print the annotation when the page is printed.
									If clear, never print the annotation, regardless of whether it is displayed on the screen.
									NOTE This can be useful for annotations representing interactive pushbuttons, which would serve no meaningful purpose on the printed page.
	4			NoZoom 			(PDF 1.3) If set, do not scale the annotation’s appearance to match the magnification of the page.
									The location of the annotation on the page (defined by the upper-left corner of its annotation rectangle) shall remain fixed, regardless of the page magnification.
	5			NoRotate 			(PDF 1.3) If set, do not rotate the annotation’s appearance to match the rotation of the page.
									The upper-left corner of the annotation rectangle shall remain in a fixed location on the page, regardless of the page rotation.
	6			NoView 			(PDF 1.3) If set, do not display the annotation on the screen or allow it to interact with the user.
									The annotation may be printed (depending on the setting of the Print flag) but should be considered hidden for purposes of on-screen display and user interaction.
	7			ReadOnly 			(PDF 1.3) If set, do not allow the annotation to interact with the user.
									The annotation may be displayed or printed (depending on the settings of the NoView and Print flags) but should not respond to mouse clicks or change its appearance in response to mouse motions.
									This flag shall be ignored for widget annotations; its function is subsumed by the ReadOnly flag of the associated form field.
	8			Locked 			(PDF 1.4) If set, do not allow the annotation to be deleted or its properties (including position and size) to be modified by the user.
									However, this flag does not restrict changes to the annotation’s contents, such as the value of a form field.
	9			ToggleNoView 	(PDF 1.5) If set, invert the interpretation of the NoView flag for certain events.
									NOTE A typical use is to have an annotation that appears only when a mouse cursor is held over it.
	10			LockedContents 	(PDF 1.7) If set, do not allow the contents of the annotation to be modified by the user.
									This flag does not restrict deletion of the annotation or changes to other annotation properties, such as position and size.'>
	^self objectAt: #F ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> M [
	<type: #Date>
	<type: #String>
	<version: 1 dot: 1>
	<attribute: 7 documentation: 'The date and time when the annotation was most recently modified.
The format should be a date string, “Dates,” but conforming readers shall accept and display a string in any format'>
	^self objectAt: #M ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> NM [
	<type: #String>
	<version: 1 dot: 4>
	<attribute: 6 documentation: 'The annotation name, a text string uniquely identifying it among all the annotations on its page'>
	^self objectAt: #NM ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> OC [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 14 documentation: 'An optional content group or optional content membership dictionary specifying the optional content properties for the annotation.
Before the annotation is drawn, its visibility shall be determined based on this entry as well as the annotation flags specified in the F entry.
If it is determined to be invisible, the annotation shall be skipped, as if it were not in the document'>
	^self objectAt: #OC ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtAnnot >> P [
	<typeIndirect: #Page>
	<version: 1 dot: 3>
	<attribute: 5 documentation: '(Optional except as noted below; not used in FDF files)
An indirect reference to the page object with which this annotation is associated.
This entry shall be present in screen annotations associated with rendition actions (PDF 1.5).'>
	^self objectAt: #P ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtAnnot >> Rect [
	<type: #Rectangle>
	<required>
	<attribute: 3 documentation: 'The annotation rectangle, defining the location of the annotation on the page in default user space units.

The annotation’s position shall be determined by the coordinates of the upper-left corner of its annotation rectangle.
When the default user space is scaled or rotated, the positions of the other three corners of the annotation rectangle are different in the altered user space than they were in the original user space.
The conforming reader shall perform this alteration automatically.
However, it shall not actually change the annotation’s Rect entry, which continues to describe the annotation’s relationship with the unscaled, unrotated user space.'>
	^self objectAt: #Rect
]

{ #category : #'accessing entries' }
PtAnnot >> StructParent [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 13 documentation: '(Required if the annotation is a structural content item)
The integer key of the annotation’s entry in the structural parent tree'>
	^self objectAt: #StructParent ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtAnnot >> Subtype [
	<type: #Name>
	<required>
	<attribute: 2 documentation: 'The type of annotation that this dictionary describes'>
	^self objectAt: #Subtype
]

{ #category : #'accessing entries' }
PtAnnot >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Annot asPDF]
]

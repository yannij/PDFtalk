"
PDF Line Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.7, pp. 397.

The purpose of a line annotation is to display a single straight line on the page.
When opened, it shall display a pop-up window containing the text of the associated note.
"
Class {
	#name : #PtLineAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtLineAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #LineAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.7'
		documentation: 'The purpose of a line annotation is to display a single straight line on the page.
When opened, it shall display a pop-up window containing the text of the associated note.'
]

{ #category : #accessing }
PtLineAnnotation class >> subtype [
	^#Line
]

{ #category : #'accessing entries' }
PtLineAnnotation >> BS [
	<type: #BorderStyle>
	<version: 1 dot: 6>
	<attribute: 2 documentation: 'A border style dictionary specifying the line width and dash pattern that shall be used in drawing the line.
The annotation dictionary’s AP entry, if present, takes precedence over the L and BS entries.'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> CO [
	<typeArrayOf: #Number>
	<version: 1 dot: 7>
	<attribute: 12 documentation: '(meaningful only if Cap is true)
An array of two numbers that shall specify the offset of the caption text from its normal position.
The first value shall be the horizontal offset along the annotation line from its midpoint, with a positive value indicating offset to the right and a negative value indicating offset to the left.
The second value shall be the vertical offset perpendicular to the annotation line, with a positive value indicating a shift up and a negative value indicating a shift down.'>
	^self objectAt: #CO ifAbsent: [#(0 0) asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> CP [
	<type: #Name>
	<version: 1 dot: 7>
	<attribute: 10 documentation: 'A name describing the annotation’s caption positioning.
Valid values are /Inline, meaning the caption shall be centered inside the line, and /Top, meaning the caption shall be on top of the line.'>
	^self objectAt: #CP ifAbsent: [#Inline asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> Cap [
	<type: #Boolean>
	<version: 1 dot: 6>
	<attribute: 7 documentation: 'If true, the text specified by the Contents or RC entries shall be replicated as a caption in the appearance of the line.
The text shall be rendered in a manner appropriate to the content, taking into account factors such as writing direction.'>
	^self objectAt: #Cap ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> IC [
	<typeArrayOf: #Number>
	<version: 1 dot: 4>
	<attribute: 4 documentation: 'An array of numbers in the range 0.0 to 1.0 specifying the interior color that shall be used to fill the annotation’s line endings.
The number of array elements shall determine the colour space in which the colour is defined:
	0	No colour; transparent
	1	DeviceGray
	3	DeviceRGB
	4	DeviceCMYK'>
	^self objectAt: #IC ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> IT [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 8 documentation: 'A name describing the intent of the line annotation.
Valid values shall be LineArrow, which means that the annotation is intended to function as an arrow, and LineDimension, which means that the annotation is intended to function as a dimension line.'>
	^self objectAt: #IT ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> L [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of four numbers, [x1 y1 x2 y2], specifying the starting and ending coordinates of the line in default user space.
If the LL entry is present, this value shall represent the endpoints of the leader lines rather than the endpoints of the line itself.'>
	^self objectAt: #L
]

{ #category : #'accessing entries' }
PtLineAnnotation >> LE [
	<typeArrayOf: #Name>
	<version: 1 dot: 4>
	<attribute: 3 documentation: 'An array of two names specifying the line ending styles that shall be used in drawing the line.
The first and second elements of the array shall specify the line ending styles for the endpoints defined, respectively, by the first and second pairs of coordinates, (x1, y1)and (x2, y2), in the L array.
The possible values are:
	/Square /Circle /Diamond /OpenArrow /ClosedArrow /None /Butt /ROpenArrow /RClosedArrow /Slash.'>
	^self objectAt: #LE ifAbsent: [#(#None #None) asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> LL [
	<type: #Number>
	<version: 1 dot: 6>
	<attribute: 5 documentation: '(Required if LLE is present, otherwise optional)
The length of leader lines in default user space that extend from each endpoint of the line perpendicular to the line itself.
A positive value shall mean that the leader lines appear in the direction that is clockwise when traversing the line from its starting point to its ending point (as specified by L); a negative value shall indicate the opposite direction.'>
	^self objectAt: #LL ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> LLE [
	<type: #Number>
	<version: 1 dot: 6>
	<attribute: 6 documentation: 'A non-negative number that shall represents the length of leader line extensions that extend from the line proper 180 degrees from the leader lines.'>
	^self objectAt: #LLE ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> LLO [
	<type: #Number>
	<version: 1 dot: 7>
	<attribute: 9 documentation: 'A non-negative number that shall represent the length of the leader line offset, which is the amount of empty space between the endpoints of the annotation and the beginning of the leader lines.'>
	^self objectAt: #LLO ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtLineAnnotation >> Measure [
	<type: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 11 documentation: 'A measure dictionary that shall specify the scale and units that apply to the line annotation.'>
	^self objectAt: #Measure ifAbsent: [PtPDF Dictionary empty]
]

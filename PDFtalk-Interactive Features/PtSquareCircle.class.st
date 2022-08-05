"
PDF Square and Circle Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.8, pp. 401.

Square and circle annotations shall display, respectively, a rectangle or an ellipse on the page.
When opened, they shall display a pop-up window containing the text of the associated note.
The rectangle or ellipse shall be inscribed within the annotation rectangle defined by the annotation dictionary’s Rect entry.

Despite the names square and circle, the width and height of the annotation rectangle need not be equal.

"
Class {
	#name : #PtSquareCircle,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #'accessing entries' }
PtSquareCircle >> BE [
	<type: #BorderEffect>
	<version: 1 dot: 5>
	<attribute: 3 documentation: 'A border effect dictionary describing an effect applied to the border described by the BS entry.'>
	^self objectAt: #BE ifAbsent: [(PtPDF classAt: #BorderEffect) empty]
]

{ #category : #'accessing entries' }
PtSquareCircle >> BS [
	<type: #BorderStyle>
	<attribute: 1 documentation: 'A border style dictionary specifying the line width and dash pattern that shall be used in drawing the rectangle or ellipse.
The annotation dictionary’s AP entry, if present, takes precedence over the Rect and BS entries.'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtSquareCircle >> IC [
	<typeArrayOf: #Number>
	<version: 1 dot: 4>
	<attribute: 2 documentation: 'An array of numbers that shall be in the range 0.0 to 1.0 and shall specify the interior color with which to fill the annotation’s rectangle or ellipse.
The number of array elements determines the colour space in which the colour shall be defined:
	0	No colour; transparent
	1	DeviceGray
	3	DeviceRGB
	4	DeviceCMYK'>
	^self objectAt: #IC ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtSquareCircle >> RD [
	<type: #Rectangle>
	<version: 1 dot: 5>
	<attribute: 4 documentation: 'A set of four numbers that shall describe the numerical differences between two rectangles: the Rect entry of the annotation and the actual boundaries of the underlying square or circle.
Such a difference may occur in situations where a border effect (described by BE) causes the size of the Rect to increase beyond that of the square or circle.

The four numbers shall correspond to the differences in default user space between the left, top, right, and bottom coordinates of Rect and those of the square or circle, respectively.
Each value shall be greater than or equal to 0.
The sum of the top and bottom differences shall be less than the height of Rect, and the sum of the left and right differences shall be less than the width of Rect.'>
	^self objectAt: #RD ifAbsent: [(PtPDF classAt: #Rectangle) new]
]

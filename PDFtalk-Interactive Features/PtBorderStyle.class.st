"
PDF border style dictionary as defined in PDF 32000_2008.pdf, section 12.5.4, pp. 386.

An annotation may optionally be surrounded by a border when displayed or printed.
If present, the border shall be drawn completely inside the annotation rectangle.
In PDF 1.1, the characteristics of the border shall be specified by the Border entry in the annotation dictionary.
Beginning with PDF 1.2, the border characteristics for some types of annotations may instead be specified in a border style dictionary designated by the annotation’s BS entry.
Such dictionaries may also be used to specify the width and dash pattern for the lines drawn by line, square, circle, and ink annotations.
If neither the Border nor the BS entry is present, the border shall be drawn as a solid line with a width of 1 point.
"
Class {
	#name : #PtBorderStyle,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtBorderStyle class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #BorderStyle
		supertype: #Dictionary
		version: #(1 2)
		section: '12.5.4'
		documentation: 'n annotation may optionally be surrounded by a border when displayed or printed.
If present, the border shall be drawn completely inside the annotation rectangle.
In PDF 1.1, the characteristics of the border shall be specified by the Border entry in the annotation dictionary.
Beginning with PDF 1.2, the border characteristics for some types of annotations may instead be specified in a border style dictionary designated by the annotation’s BS entry.
Such dictionaries may also be used to specify the width and dash pattern for the lines drawn by line, square, circle, and ink annotations.
If neither the Border nor the BS entry is present, the border shall be drawn as a solid line with a width of 1 point.'
]

{ #category : #accessing }
PtBorderStyle class >> type [
	^#Border
]

{ #category : #'accessing entries' }
PtBorderStyle >> D [
	<typeArrayOf: #Number>
	<attribute: 4 documentation: 'A dash array defining a pattern of dashes and gaps that shall be used in drawing a dashed border (border style D in the S entry).
The dash array shall be specified in the same format as in the line dash pattern parameter of the graphics state.
The dash phase is not specified and shall be assumed to be 0.
EXAMPLE A D entry of [3 2] specifies a border drawn with 3-point dashes alternating with 2-point gaps.'>
	^self objectAt: #D ifAbsent: [#(3) asPDF]
]

{ #category : #'accessing entries' }
PtBorderStyle >> S [
	<type: #Name>
	<attribute: 3 documentation: 'The border style:
	S 	(Solid) A solid rectangle surrounding the annotation.
	D 	(Dashed) A dashed rectangle surrounding the annotation. The dash pattern may be specified by the D entry.
	B 	(Beveled) A simulated embossed rectangle that appears to be raised above the surface of the page.
	I 	(Inset) A simulated engraved rectangle that appears to be recessed below the surface of the page.
	U 	(Underline) A single line along the bottom of the annotation rectangle.
A conforming reader shall tolerate other border styles that it does not recognize and shall use the default value.'>
	^self objectAt: #S ifAbsent: [#S asPDF]
]

{ #category : #'accessing entries' }
PtBorderStyle >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Border asPDF]
]

{ #category : #'accessing entries' }
PtBorderStyle >> W [
	<type: #Number>
	<attribute: 2 documentation: 'The border width in points. If this value is 0, no border shall drawn.'>
	^self objectAt: #W ifAbsent: [1 asPDF]
]

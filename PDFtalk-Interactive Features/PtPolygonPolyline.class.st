"
PDF Polygon and Polyline Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.9, pp. 402.

Polygon annotations display closed polygons on the page.
Such polygons may have any number of vertices connected by straight lines.
Polyline annotations are similar to polygons, except that the first and last vertex are not implicitly connected.

"
Class {
	#name : #PtPolygonPolyline,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #'accessing entries' }
PtPolygonPolyline >> BS [
	<type: #BorderStyle>
	<attribute: 2 documentation: 'A border style dictionary specifying the width and dash pattern that shall be used in drawing the line.
The annotation dictionary’s AP entry, if present, shall take precedence over the Vertices and BS entries.'>
	^self objectAt: #BS ifAbsent: [(PtPDF classAt: #BorderStyle) empty]
]

{ #category : #'accessing entries' }
PtPolygonPolyline >> IC [
	<typeArrayOf: #Number>
	<version: 1 dot: 4>
	<attribute: 3 documentation: 'An array of numbers that shall be in the range 0.0 to 1.0 and shall specify the interior color with which to fill the annotation’s line endings.
The number of array elements determines the colour space in which the colour shall be defined:
	0	No colour; transparent
	1	DeviceGray
	3	DeviceRGB
	4	DeviceCMYK'>
	^self objectAt: #IC ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtPolygonPolyline >> IT [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 4 documentation: 'A name that shall describe the intent of the polygon or polyline annotation.
The following values shall bevalid:
	PolygonCloud						The annotation is intended to function as a cloud object.
	PolyLineDimension 	(PDF 1.7) 	The polyline annotation is intended to function as a dimension.
	PolygonDimension 	(PDF 1.7) 	The polygon annotation is intended to function as a dimension.'>
	^self objectAt: #IT ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPolygonPolyline >> Measure [
	<type: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 5 documentation: 'A measure dictionary that shall specify the scale and units that apply to the annotation.'>
	^self objectAt: #Measure ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPolygonPolyline >> Vertices [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of numbers specifying the width and dash pattern that shall represent the alternating horizontal and vertical coordinates, respectively, of each vertex, in default user space.'>
	^self objectAt: #Vertices ifAbsent: [#() asPDF]
]

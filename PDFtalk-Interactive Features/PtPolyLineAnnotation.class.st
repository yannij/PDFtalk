"
PDF Polygon and Polyline Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.9, pp. 402.

Polygon annotations display closed polygons on the page.
Such polygons may have any number of vertices connected by straight lines.
Polyline annotations are similar to polygons, except that the first and last vertex are not implicitly connected.

"
Class {
	#name : #PtPolyLineAnnotation,
	#superclass : #PtPolygonPolyline,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtPolyLineAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PolyLineAnnotation
		supertype: #Annot
		version: #(1 5)
		section: '12.5.6.9'
		documentation: 'Polygon annotations display closed polygons on the page.
Such polygons may have any number of vertices connected by straight lines.
Polyline annotations are similar to polygons, except that the first and last vertex are not implicitly connected.'
]

{ #category : #accessing }
PtPolyLineAnnotation class >> subtype [
	^#PolyLine
]

{ #category : #'accessing entries' }
PtPolyLineAnnotation >> LE [
	<typeArrayOf: #Name>
	<attribute: 1 documentation: 'An array of two names that shall specify the line ending styles.
The first and second elements of the array shall specify the line ending styles for the endpoints defined, respectively, by the first and last pairs of coordinates in the Vertices array.
The possible values are:
	/Square /Circle /Diamond /OpenArrow /ClosedArrow /None /Butt /ROpenArrow /RClosedArrow /Slash.'>
	^self objectAt: #LE ifAbsent: [#(#None #None) asPDF]
]

"
PDF Polygon and Polyline Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.9, pp. 402.

Polygon annotations display closed polygons on the page.
Such polygons may have any number of vertices connected by straight lines.
Polyline annotations are similar to polygons, except that the first and last vertex are not implicitly connected.

"
Class {
	#name : #PtPolygonAnnotation,
	#superclass : #PtPolygonPolyline,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtPolygonAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PolygonAnnotation
		supertype: #Annot
		version: #(1 5)
		section: '12.5.6.9'
		documentation: 'Polygon annotations display closed polygons on the page.
Such polygons may have any number of vertices connected by straight lines.
Polyline annotations are similar to polygons, except that the first and last vertex are not implicitly connected.'
]

{ #category : #accessing }
PtPolygonAnnotation class >> subtype [
	^#Polygon
]

{ #category : #'accessing entries' }
PtPolygonAnnotation >> BE [
	<type: #BorderEffect>
	<attribute: 1 documentation: 'A border effect dictionary that shall describe an effect applied to the border described by the BS entry.'>
	^self objectAt: #BE ifAbsent: [(PtPDF classAt: #BorderEffect) empty]
]

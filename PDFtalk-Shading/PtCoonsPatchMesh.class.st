"
PDF Shading as defined in PDF 32000_2008.pdf pp. 194.

Type 6 shadings (Coons patch meshes) are constructed from one or more colour patches, each bounded by four cubic Bézier curves.
Degenerate Bézier curves are allowed and are useful for certain graphical effects.
At least one complete patch shall be specified.
A Coons patch generally has two independent aspects:
- Colours are specified for each corner of the unit square, and bilinear interpolation is used to fill in colours over the entire unit square.
- Coordinates are mapped from the unit square into a four-sided patch whose sides are not necessarily linear.
The mapping is continuous: the corners of the unit square map to corners of the patch and the sides of the unit square map to sides of the patch.
"
Class {
	#name : #PtCoonsPatchMesh,
	#superclass : #PtShadingStream,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtCoonsPatchMesh class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CoonsPatchMesh
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.7'
		documentation: 'Type 6 shadings (Coons patch meshes) are constructed from one or more colour patches, each bounded by four cubic Bézier curves.
Degenerate Bézier curves are allowed and are useful for certain graphical effects.
At least one complete patch shall be specified.
A Coons patch generally has two independent aspects:
- Colours are specified for each corner of the unit square, and bilinear interpolation is used to fill in colours over the entire unit square.
- Coordinates are mapped from the unit square into a four-sided patch whose sides are not necessarily linear.
The mapping is continuous: the corners of the unit square map to corners of the patch and the sides of the unit square map to sides of the patch.'
]

{ #category : #accessing }
PtCoonsPatchMesh class >> shadingType [
	^6
]

{ #category : #'accessing entries' }
PtCoonsPatchMesh >> BitsPerFlag [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of bits used to represent the edge flag for each vertex.
The value of BitsPerFlag shall be 2, 4, or 8, but only the least significant 2 bits in each flag value shall beused.
The value for the edge flag shall be 0, 1, 2 and 3.'>
	^self objectAt: #BitsPerFlag
]

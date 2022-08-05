"
PDF Shading as defined in PDF 32000_2008.pdf pp. 189.

Type 4 shadings (free-form Gouraud-shaded triangle meshes) are commonly used to represent complex coloured and shaded three-dimensional shapes.
The area to be shaded is defined by a path composed entirely of triangles.
The colour at each vertex of the triangles is specified, and a technique known as Gouraud interpolation is used to colour the interiors.
The interpolation functions defining the shading may be linear or nonlinear.
"
Class {
	#name : #PtFreeFormGouraudShadedMesh,
	#superclass : #PtShadingStream,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtFreeFormGouraudShadedMesh class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FreeFormGouraudShadedMesh
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.5'
		documentation: 'Type 4 shadings (free-form Gouraud-shaded triangle meshes) are commonly used to represent complex coloured and shaded three-dimensional shapes.
The area to be shaded is defined by a path composed entirely of triangles.
The colour at each vertex of the triangles is specified, and a technique known as Gouraud interpolation is used to colour the interiors.
The interpolation functions defining the shading may be linear or nonlinear.'
]

{ #category : #accessing }
PtFreeFormGouraudShadedMesh class >> shadingType [
	^4
]

{ #category : #'accessing entries' }
PtFreeFormGouraudShadedMesh >> BitsPerFlag [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of bits used to represent the edge flag for each vertex.
The value of BitsPerFlag shall be 2, 4, or 8, but only the least significant 2 bits in each flag value shall beused.
The value for the edge flag shall be 0, 1, or 2.'>
	^self objectAt: #BitsPerFlag
]

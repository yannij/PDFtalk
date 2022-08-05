"
PDF Shading as defined in PDF 32000_2008.pdf pp. 192.

Type 5 shadings (lattice-form Gouraud-shaded triangle meshes) are similar to type 4, but instead of using free-form geometry, their vertices are arranged in a pseudorectangular lattice, which is topologically equivalent to a rectangular grid.
The vertices are organized into rows, which need not be geometrically linear.
"
Class {
	#name : #PtLatticeFormGouraudShadedMesh,
	#superclass : #PtShadingStream,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtLatticeFormGouraudShadedMesh class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #LatticeFormGouraudShadedMesh
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.6.'
		documentation: 'Type 5 shadings (lattice-form Gouraud-shaded triangle meshes) are similar to type 4, but instead of using free-form geometry, their vertices are arranged in a pseudorectangular lattice, which is topologically equivalent to a rectangular grid.
The vertices are organized into rows, which need not be geometrically linear.'
]

{ #category : #accessing }
PtLatticeFormGouraudShadedMesh class >> shadingType [
	^5
]

{ #category : #'accessing entries' }
PtLatticeFormGouraudShadedMesh >> VerticesPerRow [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of vertices in each row of the lattice; the value shall be greater than or equal to 2.
The number of rows need not be specified.'>
	^self objectAt: #VerticesPerRow
]

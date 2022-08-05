"
PDF Shading as defined in PDF 32000_2008.pdf pp. 198.

Type 7 shadings (tensor-product patch meshes) are identical to type 6, except that they are based on a bicubic tensor-product patch defined by 16 control points instead of the 12 control points that define a Coons patch.
The shading dictionaries representing the two patch types differ only in the value of the ShadingType entry and in the number of control points specified for each patch in the data stream.

NOTE	Although the Coons patch is more concise and easier to use, the tensor-product patch affords greater control over colour mapping
"
Class {
	#name : #PtTensorProductPatchMesh,
	#superclass : #PtShadingStream,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtTensorProductPatchMesh class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #TensorProductPatchMesh
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.8'
		documentation: 'Type 7 shadings (tensor-product patch meshes) are identical to type 6, except that they are based on a bicubic tensor-product patch defined by 16 control points instead of the 12 control points that define a Coons patch.
The shading dictionaries representing the two patch types differ only in the value of the ShadingType entry and in the number of control points specified for each patch in the data stream.'
]

{ #category : #accessing }
PtTensorProductPatchMesh class >> shadingType [
	^7
]

{ #category : #'accessing entries' }
PtTensorProductPatchMesh >> BitsPerFlag [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of bits used to represent the edge flag for each vertex.
The value of BitsPerFlag shall be 2, 4, or 8, but only the least significant 2 bits in each flag value shall beused.
The value for the edge flag shall be 0, 1, 2 and 3.'>
	^self objectAt: #BitsPerFlag
]

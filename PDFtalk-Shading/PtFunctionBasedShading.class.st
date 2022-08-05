"
PDF Shading as defined in PDF 32000_2008.pdf pp. 185.

In Type 1 (function-based) shadings, the colour at every point in the domain is defined by a specified mathematical function.
The function need not be smooth or continuous.
This type is the most general of the available shading types and is useful for shadings that cannot be adequately described with any of the other types.

This type of shading shall not be used with an Indexed colour space.

"
Class {
	#name : #PtFunctionBasedShading,
	#superclass : #PtShadingDictionary,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtFunctionBasedShading class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FunctionBasedShading
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.2'
		documentation: 'In Type 1 (function-based) shadings, the colour at every point in the domain is defined by a specified mathematical function.
The function need not be smooth or continuous.
This type is the most general of the available shading types and is useful for shadings that cannot be adequately described with any of the other types.

This type of shading shall not be used with an Indexed colour space.'
]

{ #category : #accessing }
PtFunctionBasedShading class >> shadingType [
	^1
]

{ #category : #'accessing entries' }
PtFunctionBasedShading >> Domain [
	<typeArrayOf: #Number>
	<attribute: 1 documentation: 'An array of four numbers [xmin xmax ymin ymax] specifying the rectangular domain of coordinates over which the colour function(s) are defined.'>
	^self objectAt: #Domain ifAbsent: [#(0.0 1.0 0.0 1.0) asPDF]
]

{ #category : #'accessing entries' }
PtFunctionBasedShading >> Function [
	<type: #Function>
	<required>
	<attribute: 3 documentation: 'A 2-in, n-out function or an array of n 2-in, 1-out functions (where n is the number of colour components in the shading dictionary’s colour space).
Each function’s domain shall be a superset of that of the shading dictionary.
If the value returned by the function for a given colour component is out of range, it shall be adjusted to the nearest valid value.'>
	^self objectAt: #Function
]

{ #category : #'accessing entries' }
PtFunctionBasedShading >> Matrix [
	<type: #Matrix>
	<attribute: 2 documentation: 'An array of six numbers specifying a transformation matrix mapping the coordinate space specified by the Domain entry into the shading’s target coordinate space.

NOTE	To map the domain rectangle [0.0 1.0 0.0 1.0] to a 1-inch square with lower-left corner at coordinates (100, 100) in default user space, the Matrix value would be [72 0 0 72 100 100].'>
	^self objectAt: #Matrix ifAbsent: [(PtPDF classAt: #Matrix) identity]
]

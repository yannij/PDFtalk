"
PDF Shading as defined in PDF 32000_2008.pdf pp. 185.

Type 2 (axial) shadings define a colour blend that varies along a linear axis between two endpoints and extends indefinitely perpendicular to that axis. The shading may optionally be extended beyond either or both endpoints by continuing the boundary colours indefinitely.

This type of shading shall not be used with an Indexed colour space.
"
Class {
	#name : #PtAxialShading,
	#superclass : #PtShadingDictionary,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtAxialShading class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #AxialShading
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.3'
		documentation: 'Type 2 (axial) shadings define a colour blend that varies along a linear axis between two endpoints and extends indefinitely perpendicular to that axis. The shading may optionally be extended beyond either or both endpoints by continuing the boundary colours indefinitely.

This type of shading shall not be used with an Indexed colour space.'
]

{ #category : #accessing }
PtAxialShading class >> shadingType [
	^2
]

{ #category : #'accessing entries' }
PtAxialShading >> Coords [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of four numbers [x0 y0 x1 y1] specifying the starting and ending coordinates of the axis, expressed in the shading’s target coordinate space.'>
	^self objectAt: #Coords
]

{ #category : #'accessing entries' }
PtAxialShading >> Domain [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of two numbers [t0 t1] specifying the limiting values of a parametric variable t.
The variable is considered to vary linearly between these two values as the colour gradient varies between the starting and ending points of the axis.
The variable t becomes the input argument to the colour function(s).'>
	^self objectAt: #Domain ifAbsent: [#(0.0 1.0) asPDF]
]

{ #category : #'accessing entries' }
PtAxialShading >> Extend [
	<typeArrayOf: #Boolean>
	<attribute: 4 documentation: 'An array of two boolean values specifying whether to extend the shading beyond the starting and ending points of the axis, respectively.'>
	^self objectAt: #Extend ifAbsent: [#(false false) asPDF]
]

{ #category : #'accessing entries' }
PtAxialShading >> Function [
	<type: #Function>
	<required>
	<attribute: 3 documentation: 'A 1-in, n-out function or an array of n 1-in, 1-out functions (where n is the number of colour components in the shading dictionary’s colour space).
The function(s) shall be called with values of the parametric variable t in the domain defined by the Domain entry.
Each function’s domain shall be a superset of that of the shading dictionary.
If the value returned by the function for a given colour component is out of range, it shall be adjusted to the nearest valid value.'>
	^self objectAt: #Function
]

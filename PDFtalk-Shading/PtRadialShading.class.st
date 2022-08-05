"
PDF Shading as defined in PDF 32000_2008.pdf pp. 187.

Type 3 (radial) shadings define a colour blend that varies between two circles.
Shadings of this type are commonly used to depict three-dimensional spheres and cones.

This type of shading shall not be used with an Indexed colour space.

"
Class {
	#name : #PtRadialShading,
	#superclass : #PtShadingDictionary,
	#category : #'PDFtalk-Shading'
}

{ #category : #accessing }
PtRadialShading class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #RadialShading
		supertype: #Shading
		version: #(1 3)
		section: '8.7.4.5.4'
		documentation: 'Type 3 (radial) shadings define a colour blend that varies between two circles.
Shadings of this type are commonly used to depict three-dimensional spheres and cones.

This type of shading shall not be used with an Indexed colour space.
'
]

{ #category : #accessing }
PtRadialShading class >> shadingType [
	^3
]

{ #category : #'accessing entries' }
PtRadialShading >> Coords [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of six numbers [x0 y0 r0 x1 y1 r1] specifying the centres and radii of the starting and ending circles, expressed in the shading’s target coordinate space.
The radii r0 and r1 shall both be greater than or equal to 0.
If one radius is 0, the corresponding circle shall be treated as a point; if both are 0, nothing shall be painted.'>
	^self objectAt: #Coords
]

{ #category : #'accessing entries' }
PtRadialShading >> Domain [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of two numbers [t0 t1] specifying the limiting values of a parametric variable t.
The variable is considered to vary linearly between these two values as the colour gradient varies between the starting and ending circles.
The variable t becomes the input argument to the colour function(s).'>
	^self objectAt: #Domain ifAbsent: [#(0.0 1.0) asPDF]
]

{ #category : #'accessing entries' }
PtRadialShading >> Extend [
	<typeArrayOf: #Boolean>
	<attribute: 4 documentation: 'An array of two boolean values specifying whether to extend the shading beyond the starting and ending circles, respectively.'>
	^self objectAt: #Extend ifAbsent: [#(false false) asPDF]
]

{ #category : #'accessing entries' }
PtRadialShading >> Function [
	<type: #Function>
	<required>
	<attribute: 3 documentation: 'A 1-in, n-out function or an array of n 1-in, 1-out functions (where n is the number of colour components in the shading dictionary’s colour space).
The function(s) shall be called with values of the parametric variable t in the domain defined by the shading dictionary’s Domain entry.
Each function’s domain shall be a superset of that of the shading dictionary.
If the value returned by the function for a given colour component is out of range, it shall be adjusted to the nearest valid value.'>
	^self objectAt: #Function
]

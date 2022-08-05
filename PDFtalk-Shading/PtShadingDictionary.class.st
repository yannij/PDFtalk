"
PDF Shading as defined in PDF 32000_2008.pdf pp. 182.

A shading dictionary specifies details of a particular gradient fill, including the type of shading to be used, the geometry of the area to be shaded, and the geometry of the gradient fill.
See ShadingStream

"
Class {
	#name : #PtShadingDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Shading'
}

{ #category : #'instance creation' }
PtShadingDictionary class >> empty [
	| inst |
	inst := self new.
	inst at: #ShadingType put: self shadingType.
	^inst
]

{ #category : #testing }
PtShadingDictionary class >> isClassForDictionary: aDictionary [
	| typeEntry |
	typeEntry := aDictionary at: #ShadingType ifAbsent: [
		^false].
	^self shadingType asPDF = typeEntry
]

{ #category : #accessing }
PtShadingDictionary class >> resourcePrefix [
	^'Sh'
]

{ #category : #accessing }
PtShadingDictionary class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#Shading
]

{ #category : #accessing }
PtShadingDictionary class >> shadingType [
	"<Integer>
	-1 never matches"

	^-1
]

{ #category : #'accessing entries' }
PtShadingDictionary >> AntiAlias [
	<type: #Boolean>
	<attribute: 5 documentation: 'A flag indicating whether to filter the shading function to prevent aliasing artifacts.
NOTE	The shading operators sample shading functions at a rate determined by the resolution of the output device.
Aliasing can occur if the function is not smooth—that is, if it has a high spatial frequency relative to the sampling rate.
Anti-aliasing can be computationally expensive and is usually unnecessary, since most shading functions are smooth enough or are sampled at a high enough frequency to avoid aliasing effects.
Anti-aliasing may not be implemented on some output devices, in which case this flag is ignored.'>
	^self objectAt: #AntiAlias ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtShadingDictionary >> BBox [
	<type: #Rectangle>
	<attribute: 4 documentation: 'An array of four numbers giving the left, bottom, right, and top coordinates, respectively, of the shading’s bounding box.
The coordinates shall be interpreted in the shading’s target coordinate space.
If present, this bounding box shall be applied as a temporary clipping boundary when the shading is painted, in addition to the current clipping path and any other clipping boundaries in effect at that time.'>
	^self objectAt: #BBox ifAbsent: [(PtPDF classAt: #Rectangle) new]
]

{ #category : #'accessing entries' }
PtShadingDictionary >> Background [
	<typeArrayOf: #Number>
	<attribute: 3 documentation: 'An array of colour components appropriate to the colour space, specifying a single background colour value.
If present, this colour shall be used, before any painting operation involving the shading, to fill those portions of the area to be painted that lie outside the bounds of the shading object.
NOTE	In the opaque imaging model, the effect is as if the painting operation were performed twice: first with the background colour and then with the shading.
NOTE	The background colour is applied only when the shading is used as part of a shading pattern, not when it is painted directly with the sh operator.'>
	^self objectAt: #Background ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtShadingDictionary >> ColorSpace [
	<type: #ColourSpace>
	<required>
	<attribute: 2 documentation: 'The colour space in which colour values shall be expressed. This may be any device, CIE-based, or special colour space except a Pattern space.'>
	^self objectAt: #ColorSpace
]

{ #category : #'accessing entries' }
PtShadingDictionary >> ShadingType [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The shading type:
1 Function-based shading
2 Axial shading
3 Radial shading
4 Free-form Gouraud-shaded triangle mesh
5 Lattice-form Gouraud-shaded triangle mesh
6 Coons patch mesh
7 Tensor-product patch mesh'>
	^self objectAt: #ShadingType
]

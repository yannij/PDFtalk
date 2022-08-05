"
PDF Pattern Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.2, pp. 156.

A Pattern colour space (PDF 1.2) specifies that an area is to be painted with a pattern rather than a single colour. 
The pattern shall be either a tiling pattern (type 1) or a shading pattern (type 2).
"
Class {
	#name : #PtPattern,
	#superclass : #PtSpecialColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtPattern class >> numberOfAttributes [
	^1
]

{ #category : #accessing }
PtPattern class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Pattern
		supertype: #ColourSpace
		version: #(1 2)
		section: '8.6.6.2'
		documentation: 'A Pattern colour space specifies that an area is to be painted with a pattern rather than a single colour. 
The pattern shall be either a tiling pattern (type 1) or a shading pattern (type 2).'
]

{ #category : #accessing }
PtPattern >> alternativeDeviceColorspace [
	^self error: 'Pattern do not have an alternate color space'
]

{ #category : #accessing }
PtPattern >> decodeArrayMax: aNumber [
	PtTypeError raiseSignal: 'Not permitted with images'.
	^nil
]

{ #category : #accessing }
PtPattern >> defaultDecodeArray [
	PtTypeError raiseSignal: 'Not permitted with images'.
	^#() asPDF
]

{ #category : #accessing }
PtPattern >> numberOfComponents [
	^0
]

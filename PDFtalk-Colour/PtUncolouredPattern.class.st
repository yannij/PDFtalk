"
PDF Uncoloured Tiling Patterns as defined in PDF 32000_2008.pdf, section 8.7.3.3, pp. 178.

An uncoloured tiling pattern is a pattern that has no inherent colour: the colour shall be specified separately whenever the pattern is used.
It provides a way to tile different regions of the page with pattern cells having the same shape but different colours.
This type of pattern shall be identified by a pattern type of 1 and a paint type of 2 in the pattern dictionary.
The pattern’s content stream shall not explicitly specify any colours; it may paint an image mask but no other kind of image.

A Pattern colour space representing an uncoloured tiling pattern shall have a parameter: an object identifying the underlying colour space in which the actual colour of the pattern shall be specified.
The underlying colour space shall be given as the second element of the array that defines the Pattern colour space.

"
Class {
	#name : #PtUncolouredPattern,
	#superclass : #PtSpecialColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtUncolouredPattern class >> numberOfAttributes [
	^2
]

{ #category : #accessing }
PtUncolouredPattern class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #UncolouredPattern
		supertype: #ColourSpace
		version: #(1 2)
		section: '8.7.3.3'
		documentation: 'An uncoloured tiling pattern is a pattern that has no inherent colour: the colour shall be specified separately whenever the pattern is used.
It provides a way to tile different regions of the page with pattern cells having the same shape but different colours.
This type of pattern shall be identified by a pattern type of 1 and a paint type of 2 in the pattern dictionary.
The pattern’s content stream shall not explicitly specify any colours; it may paint an image mask but no other kind of image.

A Pattern colour space representing an uncoloured tiling pattern shall have a parameter: an object identifying the underlying colour space in which the actual colour of the pattern shall be specified.
The underlying colour space shall be given as the second element of the array that defines the Pattern colour space.'
]

{ #category : #accessing }
PtUncolouredPattern class >> type [
	^#Pattern
]

{ #category : #accessing }
PtUncolouredPattern >> alternativeDeviceColorspace [
	^self error: 'Pattern do not have an alternate color space'
]

{ #category : #accessing }
PtUncolouredPattern >> decodeArrayMax: aNumber [
	PtTypeError raiseSignal: 'Not permitted with images'.
	^nil
]

{ #category : #accessing }
PtUncolouredPattern >> defaultDecodeArray [
	PtTypeError raiseSignal: 'Not permitted with images'.
	^#() asPDF
]

{ #category : #accessing }
PtUncolouredPattern >> numberOfComponents [
	^0
]

{ #category : #'accessing entries' }
PtUncolouredPattern >> underlyingColourSpace [
	<type: #ColourSpace>
	<required>
	<attribute: 2 documentation: 'A Pattern colour space representing an uncoloured tiling pattern shall have a parameter: an object identifying the underlying colour space in which the actual colour of the pattern shall be specified. The underlying colour space shall be given as the second element of the array that defines the Pattern colour space.'>
	^self objectAt: 2
]

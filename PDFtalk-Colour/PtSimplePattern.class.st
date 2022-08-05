"
An UncolouredPattern without arguments as it appears in a color space resource dictionary
"
Class {
	#name : #PtSimplePattern,
	#superclass : #PtName,
	#category : #'PDFtalk-Colour'
}

{ #category : #testing }
PtSimplePattern class >> isClassForName: aName [
	^self type = aName asSmalltalkValue
]

{ #category : #accessing }
PtSimplePattern class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #SimplePattern
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
PtSimplePattern class >> type [
	^#Pattern
]

{ #category : #accessing }
PtSimplePattern >> content [
	^#Pattern
]

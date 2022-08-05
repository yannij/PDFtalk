"
PDF CalGray Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.2, pp. 145.

A CalGray colour space (PDF 1.1) is a special case of a single-component CIE-based colour space, known as a CIE-based A colour space. 
This type of space is the one-dimensional (and usually achromatic) analog of CIE-based ABC spaces. 
Colour values in a CIE-based A space shall have a single component, arbitrarily named A.
"
Class {
	#name : #PtCalGray,
	#superclass : #PtCIEColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtCalGray class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CalGray
		supertype: #CIEColourSpace
		version: #(1 1)
		section: '8.6.5.2'
		documentation: 'A CalGray colour space is a special case of a single-component CIE-based colour space, known as a CIE-based A colour space. 
This type of space is the one-dimensional (and usually achromatic) analog of CIE-based ABC spaces. 
Colour values in a CIE-based A space shall have a single component, arbitrarily named A.'
]

{ #category : #accessing }
PtCalGray >> alternativeDeviceColorspace [
	^(PtPDF classAt: #DeviceGray) empty
]

{ #category : #accessing }
PtCalGray >> defaultDecodeArray [
	^#(0.0 1.0) asPDF
]

{ #category : #'accessing entries' }
PtCalGray >> dictionary [
	<type: #CalGrayColourSpaceDictionary>
	<required>
	<attribute: 2 documentation: 'A dictionary containing parameters that further characterize the space. The entries in this dictionary have specific interpretations that depend on the colour space; some entries are required and some are optional.'>
	^self objectAt: 2
]

{ #category : #accessing }
PtCalGray >> initialColourValues [
	^#(0.0)
]

{ #category : #accessing }
PtCalGray >> numberOfComponents [
	^1
]

{ #category : #accessing }
PtCalGray >> procSet [
	^#ImageB
]

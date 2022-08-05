"
PDF CalRGB Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.3, pp. 146.

A CalRGB colour space is a CIE-based ABC colour space with only one transformation stage instead of two. 
In this type of space, A, B, and C represent calibrated red, green, and blue colour values. 
These three colour components shall be in the range 0.0 to 1.0; 
component values falling outside that range shall be adjusted to the nearest valid value without error indication. 
The decoding functions are gamma functions whose coefficients shall be specified by the Gamma entry in the colour space dictionary. 
The transformation matrix shall be defined by the dictionary’s Matrix entry. 
Since there is no second transformation stage, “Decode LMN” and “Matrix LMN” shall be implicitly taken to be identity transformations.
"
Class {
	#name : #PtCalRGB,
	#superclass : #PtCIEColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtCalRGB class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CalRGB
		supertype: #CIEColourSpace
		version: #(1 1)
		section: '8.6.5.3'
		documentation: 'A CalRGB colour space is a CIE-based ABC colour space with only one transformation stage instead of two. 
In this type of space, A, B, and C represent calibrated red, green, and blue colour values. 
These three colour components shall be in the range 0.0 to 1.0; 
component values falling outside that range shall be adjusted to the nearest valid value without error indication. 
The decoding functions are gamma functions whose coefficients shall be specified by the Gamma entry in the colour space dictionary. 
The transformation matrix shall be defined by the dictionary’s Matrix entry. 
Since there is no second transformation stage, “Decode LMN” and “Matrix LMN” shall be implicitly taken to be identity transformations.'
]

{ #category : #accessing }
PtCalRGB >> alternativeDeviceColorspace [
	^(PtPDF classAt: #DeviceRGB) empty
]

{ #category : #accessing }
PtCalRGB >> defaultDecodeArray [
	^#(0.0 1.0 0.0 1.0 0.0 1.0) asPDF
]

{ #category : #'accessing entries' }
PtCalRGB >> dictionary [
	<type: #CalRGBColourSpaceDictionary>
	<required>
	<attribute: 2 documentation: 'A dictionary containing parameters that further characterize the space. The entries in this dictionary have specific interpretations that depend on the colour space; some entries are required and some are optional.'>
	^self objectAt: 2
]

{ #category : #accessing }
PtCalRGB >> initialColourValues [
	^#(0.0 0.0 0.0)
]

{ #category : #accessing }
PtCalRGB >> numberOfComponents [
	^3
]

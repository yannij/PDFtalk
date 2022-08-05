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
	#name : #PtCalRGBColourSpaceDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtCalRGBColourSpaceDictionary class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CalRGBColourSpaceDictionary
		supertype: #Dictionary
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

{ #category : #'accessing entries' }
PtCalRGBColourSpaceDictionary >> BlackPoint [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of three numbers [XB YB ZB] specifying the tristimulus value, in the CIE 1931 XYZ space, of the diffuse black point.
All three of these numbers shall be non-negative'>
	^self objectAt: #BlackPoint ifAbsent: [#(0.0 0.0 0.0) asPDF]
]

{ #category : #'accessing entries' }
PtCalRGBColourSpaceDictionary >> Gamma [
	<typeArrayOf: #Number>
	<attribute: 3 documentation: 'An array of three numbers [GR GG GB] specifying the gamma for the red, green, and blue (A, B, and C) components of the colour space'>
	^self objectAt: #Gamma ifAbsent: [#(1.0 1.0 1.0) asPDF]
]

{ #category : #'accessing entries' }
PtCalRGBColourSpaceDictionary >> Matrix [
	<typeArrayOf: #Number>
	<attribute: 4 documentation: 'An array of nine numbers [XA YA ZA XB YB ZB XC YC ZC] specifying the linear interpretation of the decoded A, B, and C components of the colour space with respect to the final XYZ representation.
Default value: the identity matrix [1 0 0 0 1 0 0 0 1].'>
	^self objectAt: #Matrix ifAbsent: [#(1 0 0 0 1 0 0 0 1) asPDF]
]

{ #category : #'accessing entries' }
PtCalRGBColourSpaceDictionary >> WhitePoint [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of three numbers [XW YW ZW] specifying the tristimulus value, in the CIE 1931 XYZ space, of the diffuse white point.
The numbers XW and ZW shall be positive, and YW shall be equal to 1.0'>
	^self objectAt: #WhitePoint
]

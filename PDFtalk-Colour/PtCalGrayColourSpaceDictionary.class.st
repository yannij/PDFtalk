"
PDF CalGray Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.2, pp. 145.

A CalGray colour space (PDF 1.1) is a special case of a single-component CIE-based colour space, known as a CIE-based A colour space. 
This type of space is the one-dimensional (and usually achromatic) analog of CIE-based ABC spaces. 
Colour values in a CIE-based A space shall have a single component, arbitrarily named A.
"
Class {
	#name : #PtCalGrayColourSpaceDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtCalGrayColourSpaceDictionary class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CalGrayColourSpaceDictionary
		supertype: #Dictionary
		version: #(1 1)
		section: '8.6.5.2'
		documentation: 'A CalGray colour space (PDF 1.1) is a special case of a single-component CIE-based colour space, known as a CIE-based A colour space. 
This type of space is the one-dimensional (and usually achromatic) analog of CIE-based ABC spaces. 
Colour values in a CIE-based A space shall have a single component, arbitrarily named A.'
]

{ #category : #'accessing entries' }
PtCalGrayColourSpaceDictionary >> BlackPoint [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of three numbers [XB YB ZB] specifying the tristimulus value, in the CIE 1931 XYZ space, of the diffuse black point.
All three of these numbers shall be non-negative'>
	^self objectAt: #BlackPoint ifAbsent: [#(0.0 0.0 0.0) asPDF]
]

{ #category : #'accessing entries' }
PtCalGrayColourSpaceDictionary >> Gamma [
	<type: #Number>
	<attribute: 3 documentation: 'A number G defining the gamma for the gray (A)component.
G shall be positive and is generally greater than or equal to 1'>
	^self objectAt: #Gamma ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtCalGrayColourSpaceDictionary >> WhitePoint [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of three numbers [XW YW ZW] specifying the tristimulus value, in the CIE 1931 XYZ space, of the diffuse white point.
The numbers XW and ZW shall be positive, and YW shall be equal to 1.0.'>
	^self objectAt: #WhitePoint
]

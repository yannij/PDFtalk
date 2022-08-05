"
PDF Lab Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.4, pp. 148.

A Lab colour space is a CIE-based ABC colour space with two transformation stages. 
In this type of space, A, B, and C represent the L*, a*, and b* components of a CIE 1976 L*a*b* space. 
The range of the first (L*) component shall be 0 to 100; 
the ranges of the second and third (a* and b*) components shall be defined by the Range entry in the colour space dictionary.

"
Class {
	#name : #PtLabColourSpaceDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtLabColourSpaceDictionary class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #LabColourSpaceDictionary
		supertype: #Dictionary
		section: '8.6.5.4'
		documentation: '
A Lab colour space is a CIE-based ABC colour space with two transformation stages. 
In this type of space, A, B, and C represent the L*, a*, and b* components of a CIE 1976 L*a*b* space. 
The range of the first (L*) component shall be 0 to 100; 
the ranges of the second and third (a* and b*) components shall be defined by the Range entry in the colour space dictionary.'
]

{ #category : #'accessing entries' }
PtLabColourSpaceDictionary >> BlackPoint [
	<typeArrayOf: #Number>
	<attribute: 2 documentation: 'An array of three numbers [XB YB ZB] that shall specify the tristimulus value, in the CIE 1931 XYZ space, of the diffuse black point.
All three of these numbers shall be non-negative'>
	^self objectAt: #BlackPoint ifAbsent: [#(0.0 0.0 0.0) asPDF]
]

{ #category : #'accessing entries' }
PtLabColourSpaceDictionary >> Range [
	<typeArrayOf: #Number>
	<attribute: 3 documentation: 'An array of four numbers [amin amax bmin bmax] that shall specify the range of valid values for the a* and b* (B and C) components of the colour space—that is,
	amin <= a* <= amax
and
	bmin <= b* <= bmax
Component values falling outside the specified range shall be adjusted to the nearest valid value without error indication.'>
	^self objectAt: #Range ifAbsent: [#(-100 100 -100 100) asPDF]
]

{ #category : #'accessing entries' }
PtLabColourSpaceDictionary >> WhitePoint [
	<typeArrayOf: #Number>
	<required>
	<attribute: 1 documentation: 'An array of three numbers [XW YW ZW] that shall specify the tristimulus value, in the CIE 1931 XYZ space, of the diffuse white point.
The numbers XW and ZW shall be positive, and YW shall be 1.0.'>
	^self objectAt: #WhitePoint
]

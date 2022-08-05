"
PDF Lab Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.4, pp. 148.

A Lab colour space is a CIE-based ABC colour space with two transformation stages. 
In this type of space, A, B, and C represent the L*, a*, and b* components of a CIE 1976 L*a*b* space. 
The range of the first (L*) component shall be 0 to 100; 
the ranges of the second and third (a* and b*) components shall be defined by the Range entry in the colour space dictionary.
"
Class {
	#name : #PtLab,
	#superclass : #PtCIEColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtLab class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Lab
		supertype: #CIEColourSpace
		version: #(1 1)
		section: '8.6.5.4'
		documentation: 'A Lab colour space is a CIE-based ABC colour space with two transformation stages. 
In this type of space, A, B, and C represent the L*, a*, and b* components of a CIE 1976 L*a*b* space. 
The range of the first (L*) component shall be 0 to 100; 
the ranges of the second and third (a* and b*) components shall be defined by the Range entry in the colour space dictionary.'
]

{ #category : #accessing }
PtLab >> alternativeDeviceColorspace [
	"this is wrong... must be computed..."
	
	^(PtPDF classAt: #DeviceRGB) empty
]

{ #category : #accessing }
PtLab >> defaultDecodeArray [
	^#(0 100) asPDF , self dictionary Range
]

{ #category : #'accessing entries' }
PtLab >> dictionary [
	<type: #LabColourSpaceDictionary>
	<required>
	<attribute: 2 documentation: 'A dictionary containing parameters that further characterize the space. The entries in this dictionary have specific interpretations that depend on the colour space; some entries are required and some are optional.'>
	^self objectAt: 2
]

{ #category : #accessing }
PtLab >> initialColourValues [
	"the initial colour shall have all components equal to 0.0 unless that falls outside the intervals specified by the space’s Range entry, in which case the nearest valid value shall be substituted."

	^#(0.0 0.0 0.0)
]

{ #category : #accessing }
PtLab >> numberOfComponents [
	^3
]

"
PDF Colour Space Families as defined in PDF 32000_2008.pdf, section 8.6.3, pp. 139.

Colour spaces are classified into colour space families. 
Spaces within a family share the same general characteristics; 
they shall be distinguished by parameter values supplied at the time the space is specified. 
The families fall into three broad categories:

	•	Device colour spaces directly specify colours or shades of gray that the output device shall produce. 
		They provide a variety of colour specification methods, including grayscale, RGB (red-green-blue), and CMYK(cyan-magenta-yellow-black), 
		corresponding to the colour space families DeviceGray, DeviceRGB, and DeviceCMYK. 
		Since each of these families consists of just a single colour space with no parameters, 
		they may be referred to as the DeviceGray, DeviceRGB, and DeviceCMYK colour spaces.
	•	CIE-based colour spaces shall be based on an international standard for colour specification created 
		by the Commission Internationale de l’Éclairage (International Commission on Illumination). 
		These spaces specify colours in a way that is independent of the characteristics of any particular output device. 
		Colour space families in this category include CalGray, CalRGB, Lab, and ICCBased. 
		Individual colour spaces within these families shall be specified by means of dictionaries containing the parameter values needed to define the space.
	•	Special colour spaces add features or properties to an underlying colour space. 
		They include facilities for patterns, colour mapping, separations, and high-fidelity and multitone colour. 
		The corresponding colour space families are Pattern, Indexed, Separation, and DeviceN. 
		Individual colour spaces within these families shall be specified by means of additional parameters.

"
Class {
	#name : #PtColourSpace,
	#superclass : #PtObjecttype,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtColourSpace class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ColourSpace
		supertype: #Object
		version: #(1 1)
		section: '8.6.3'
		documentation: 'Colour spaces are classified into colour space families. 
Spaces within a family share the same general characteristics; 
they shall be distinguished by parameter values supplied at the time the space is specified. 
The families fall into three broad categories:

	•	Device colour spaces directly specify colours or shades of gray that the output device shall produce. 
		They provide a variety of colour specification methods, including grayscale, RGB (red-green-blue), and CMYK(cyan-magenta-yellow-black), 
		corresponding to the colour space families DeviceGray, DeviceRGB, and DeviceCMYK. 
		Since each of these families consists of just a single colour space with no parameters, 
		they may be referred to as the DeviceGray, DeviceRGB, and DeviceCMYK colour spaces.
	•	CIE-based colour spaces shall be based on an international standard for colour specification created 
		by the Commission Internationale de l’Éclairage (International Commission on Illumination). 
		These spaces specify colours in a way that is independent of the characteristics of any particular output device. 
		Colour space families in this category include CalGray, CalRGB, Lab, and ICCBased. 
		Individual colour spaces within these families shall be specified by means of dictionaries containing the parameter values needed to define the space.
	•	Special colour spaces add features or properties to an underlying colour space. 
		They include facilities for patterns, colour mapping, separations, and high-fidelity and multitone colour. 
		The corresponding colour space families are Pattern, Indexed, Separation, and DeviceN. 
		Individual colour spaces within these families shall be specified by means of additional parameters.'
]

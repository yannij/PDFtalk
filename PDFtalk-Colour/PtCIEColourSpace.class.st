"
PDF CIE-Based Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5, pp. 144.

Calibrated colour in PDF shall be defined in terms of an international standard used in the graphic arts, television, and printing industries. CIE-based colour spaces enable a page description to specify colour values in a way that is related to human visual perception. The goal is for the same colour specification to produce consistent results on different output devices, within the limitations of each device; Figure L.2 in Annex Lillustrates the kind of variation in colour reproduction that can result from the use of uncalibrated colour on different devices. PDF 1.1 supports three CIE-based colour space families, named CalGray, CalRGB, and Lab; PDF 1.3 added a fourth, named ICCBased.

NOTE 1
In PDF 1.1, a colour space family named CalCMYK was partially defined, with the expectation that its definition would be completed in a future version. However, this feature has been deprecated. PDF 1.3 and later versions support calibrated four-component colour spaces by means of ICC profiles. A conforming reader should ignore CalCMYK colour space attributes and render colours specified in this family as if they had been specified using DeviceCMYK.

NOTE 2
The details of the CIE colourimetric system and the theory on which it is based are beyond the scope of this specification; see the Bibliography for sources of further information. The semantics of CIE-based colour spaces are defined in terms of the relationship between the space’s components and the tristimulus values X, Y, and Z of the CIE 1931 XYZ space. The CalRGB and Lab colour spaces (PDF 1.1) are special cases of three-component CIE-based colour spaces, known as CIE-based ABC colour spaces. These spaces are defined in terms of a two-stage, nonlinear transformation of the CIE 1931 XYZ space. The formulation of such colour spaces models a simple zone theory of colour vision, consisting of a nonlinear trichromatic first stage combined with a nonlinear opponent-colour second stage. This formulation allows colours to be digitized with minimum loss of fidelity, an important consideration in sampled images.

Colour values in a CIE-based ABC colour space shall have three components, arbitrarily named A, B, and C. The first stage shall transform these components by first forcing their values to a specified range, then applying decoding functions, and then multiplying the results by a 3-by-3 matrix, producing three intermediate components arbitrarily named L, M, and N. The second stage shall transform these intermediate components in a similar fashion, producing the final X, Y, and Z components of the CIE 1931 XYZ space.

Colour spaces in the CIE-based families shall be defined by an array
	[name dictionary]
where name is the name of the family and dictionary is a dictionary containing parameters that further characterize the space. The entries in this dictionary have specific interpretations that depend on the colour space; some entries are required and some are optional. Setting the current stroking or nonstroking colour space to any CIE-based colour space shall initialize all components of the corresponding current colour to 0.0 (unless the range of valid values for a given component does not include 0.0, in which case the nearest valid value shall be substituted.).

NOTE 3
The model and terminology used here—CIE-based ABC (above) and CIE-based A (below)—are derived from the PostScript language, which supports these colour space families in their full generality. PDF supports specific useful cases of CIE-based ABC and CIE-based A spaces; most others can be represented as ICCBased spaces.
"
Class {
	#name : #PtCIEColourSpace,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Colour'
}

{ #category : #testing }
PtCIEColourSpace class >> isClassForArray: anArray [

	^(super isClassForArray: anArray) and: [
	anArray first asPDF = self type asPDF]
]

{ #category : #accessing }
PtCIEColourSpace class >> numberOfAttributes [
	^2
]

{ #category : #accessing }
PtCIEColourSpace class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #CIEColourSpace
		supertype: #ColourSpace
		version: #(1 1)
		section: '8.6.5.1'
		documentation: 'Calibrated colour in PDF shall be defined in terms of an international standard used in the graphic arts, television, and printing industries. 
CIE-based colour spaces enable a page description to specify colour values in a way that is related to human visual perception. 
The goal is for the same colour specification to produce consistent results on different output devices, within the limitations of each device; 
Figure L.2 in Annex Lillustrates the kind of variation in colour reproduction that can result from the use of uncalibrated colour on different devices. 
PDF 1.1 supports three CIE-based colour space families, named CalGray, CalRGB, and Lab; PDF 1.3 added a fourth, named ICCBased.

NOTE 1		In PDF 1.1, a colour space family named CalCMYK was partially defined, with the expectation that its definition would be completed in a future version. 
			However, this feature has been deprecated. PDF 1.3 and later versions support calibrated four-component colour spaces by means of ICC profiles. 
			A conforming reader should ignore CalCMYK colour space attributes and render colours specified in this family as if they had been specified using DeviceCMYK.

NOTE 2		The details of the CIE colourimetric system and the theory on which it is based are beyond the scope of this specification; 
			see the Bibliography for sources of further information. 
			The semantics of CIE-based colour spaces are defined in terms of the relationship between 
			the space’s components and the tristimulus values X, Y, and Z of the CIE 1931 XYZ space. 
			The CalRGB and Lab colour spaces (PDF 1.1) are special cases of three-component CIE-based colour spaces, 
			known as CIE-based ABC colour spaces. 
			These spaces are defined in terms of a two-stage, nonlinear transformation of the CIE 1931 XYZ space. 
			The formulation of such colour spaces models a simple zone theory of colour vision, 
			consisting of a nonlinear trichromatic first stage combined with a nonlinear opponent-colour second stage. 
			This formulation allows colours to be digitized with minimum loss of fidelity, an important consideration in sampled images.

Colour values in a CIE-based ABC colour space shall have three components, arbitrarily named A, B, and C.
The first stage shall transform these components by first forcing their values to a specified range, 
then applying decoding functions, and 
then multiplying the results by a 3-by-3 matrix, producing three intermediate components arbitrarily named L, M, and N. 
The second stage shall transform these intermediate components in a similar fashion, producing the final X, Y, and Z components of the CIE 1931 XYZ space.

Colour spaces in the CIE-based families shall be defined by an array
	[name dictionary]
where name is the name of the family and dictionary is a dictionary containing parameters that further characterize the space. 
The entries in this dictionary have specific interpretations that depend on the colour space; some entries are required and some are optional. 
Setting the current stroking or nonstroking colour space to any CIE-based colour space 
shall initialize all components of the corresponding current colour to 0.0 
(unless the range of valid values for a given component does not include 0.0, in which case the nearest valid value shall be substituted.).

NOTE 3		The model and terminology used here—CIE-based ABC (above) and CIE-based A (below)—are derived from the PostScript language, 
			which supports these colour space families in their full generality. 
			PDF supports specific useful cases of CIE-based ABC and CIE-based A spaces; most others can be represented as ICCBased spaces.'
]

{ #category : #accessing }
PtCIEColourSpace class >> resourcePrefix [
	^'CS'
]

{ #category : #accessing }
PtCIEColourSpace class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#ColorSpace
]

{ #category : #accessing }
PtCIEColourSpace class >> type [
	^self name
]

{ #category : #accessing }
PtCIEColourSpace >> alternativeDeviceColorspace [
	"<ColourSpace>"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PtCIEColourSpace >> defaultBlack [
	"<Color>"

	^self initialColourValues asPDF
]

{ #category : #accessing }
PtCIEColourSpace >> defaultDecodeArray [
	"<PDFArray of: Number>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtCIEColourSpace >> initialColourValues [
	"<Array of Number>
	the initial colour when the current colour space is set"

	^self subclassResponsibility
]

{ #category : #'accessing entries' }
PtCIEColourSpace >> name [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The name of the colour space type.'>
	^self objectAt: 1
]

{ #category : #accessing }
PtCIEColourSpace >> numberOfComponents [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtCIEColourSpace >> procSet [
	^#ImageC
]

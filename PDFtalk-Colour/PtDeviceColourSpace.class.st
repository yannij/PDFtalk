"
PDF Device Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.4, pp. 142.

The device colour spaces enable a page description to specify colour values that are directly related to their representation on an output device. 
Colour values in these spaces map directly (or by simple conversions) to the application of device colorants, such as quantities of ink or intensities of display phosphors. 
This enables a conforming writer to control colours precisely for a particular device, but the results might not be consistent from one device to another.

Output devices form colours either by adding light sources together or by subtracting light from an illuminating source. 
Computer displays and film recorders typically add colours; printing inks typically subtract them. 
These two ways of forming colours give rise to two complementary methods of colour specification, called additive and subtractive colour. 
The most widely used forms of these two types of colour specification are known as RGB and CMYK, respectively, 
for the names of the primary colours on which they are based. 
They correspond to the following device colour spaces:
	•	DeviceGray controls the intensity of achromatic light, on a scale from black to white.
	•	DeviceRGB controls the intensities of red, green, and blue light, the three additive primary colours used in displays.
	•	DeviceCMYK controls the concentrations of cyan, magenta, yellow, and black inks, the four subtractive process colours used in printing.

NOTE
Although the notion of explicit colour spaces is a PDF 1.1 feature, 
the operators for specifying colours in the device colour spaces—G, g, RG, rg, K, and k—are available in all versions of PDF. 
Beginning with PDF 1.2, colours specified in device colour spaces can optionally be remapped systematically into other colour spaces.

In the transparent imaging model (PDF 1.4), the use of device colour spaces is subject to special treatment 
within a transparency group whose group colour space is CIE-based. 
In particular, the device colour space operators should be used only if device colour spaces have 
been remapped to CIE-based spaces by means of the default colour space mechanism. 
Otherwise, the results are implementation-dependent and unpredictable.
"
Class {
	#name : #PtDeviceColourSpace,
	#superclass : #PtName,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceColourSpace class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #DeviceColourSpace
		supertype: #ColourSpace
		version: #(1 1)
		section: '8.6.4'
		documentation: 'The device colour spaces enable a page description to specify colour values that are directly related to their representation on an output device.
Colour values in these spaces map directly (or by simple conversions) to the application of device colorants, such as quantities of ink or intensities of display phosphors.
This enables a conforming writer to control colours precisely for a particular device, but the results might not be consistent from one device to another.'
]

{ #category : #accessing }
PtDeviceColourSpace >> alternativeDeviceColorspace [
	^self
]

{ #category : #accessing }
PtDeviceColourSpace >> black [
	^self initialColourValues asPDF
]

{ #category : #accessing }
PtDeviceColourSpace >> defaultBlack [
	^self initialColour
]

{ #category : #accessing }
PtDeviceColourSpace >> defaultDecodeArray [
	"<PDFArray of: Number>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtDeviceColourSpace >> initialColour [
	"<ColorValue | CmykColor>
	the initial colour when the current colour space is set.
	This is not relevant for device colour spaces, since the colour space is set implicitly when setting a colour.
	Implemented for documentation only"

	^ColorValue black
]

{ #category : #accessing }
PtDeviceColourSpace >> initialColourValues [
	"<Array of Number>
	the initial colour when the current colour space is set"

	^self subclassResponsibility
]

{ #category : #accessing }
PtDeviceColourSpace >> numberOfComponents [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtDeviceColourSpace >> procSet [
	^#ImageC
]

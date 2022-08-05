"
PDF DeviceCMYK Colour Space as defined in PDF 32000_2008.pdf, section 8.6.4.4, pp. 143.

The DeviceCMYK colour space allows colours to be specified according to the subtractive CMYK (cyan-magenta-yellow-black) model typical of printers and other paper-based output devices. The four components in a DeviceCMYK colour value shall represent the concentrations of these process colorants. Each component shall be a number in the range 0.0 to 1.0, where 0.0 shall denote the complete absence of a process colorant and 1.0 shall denote maximum concentration (absorbs as much as possible of the additive primary).

NOTE
As much as the reflective colours (CMYK) decrease reflection with increased ink values and radiant colours (RGB) increases the intensity of colours with increased values the values work in an opposite manner.

EXAMPLE
The following shows alternative ways to select the DeviceCMYK colour space and a specific colour within that space for stroking operations.
	/DeviceCMYK CS 					% Set DeviceCMYK colour space
	cyan magenta yellow black SC 		% Set colour
	cyan magenta yellow black K 		% Set both in one operation
The CS and SC operators shall select the current stroking colour space and current stroking colour separately; K shall set them in combination. 
The cs, sc, and k operators shall perform the same functions for nonstroking operations. 
Setting either current colour space to DeviceCMYK shall initialize the cyan, magenta, and yellow components of the corresponding current colour to 0.0 and the black component to 1.0.
"
Class {
	#name : #PtDeviceCMYK,
	#superclass : #PtDeviceColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceCMYK class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #DeviceCMYK
		supertype: #DeviceColourSpace
		version: #(1 1)
		section: '8.6.4.4'
		documentation: 'The DeviceCMYK colour space allows colours to be specified according to the subtractive CMYK (cyan-magenta-yellow-black) model typical of printers and other paper-based output devices. The four components in a DeviceCMYK colour value shall represent the concentrations of these process colorants. Each component shall be a number in the range 0.0 to 1.0, where 0.0 shall denote the complete absence of a process colorant and 1.0 shall denote maximum concentration (absorbs as much as possible of the additive primary).

NOTE
As much as the reflective colours (CMYK) decrease reflection with increased ink values and radiant colours (RGB) increases the intensity of colours with increased values the values work in an opposite manner.

EXAMPLE
The following shows alternative ways to select the DeviceCMYK colour space and a specific colour within that space for stroking operations.
	/DeviceCMYK CS 					% Set DeviceCMYK colour space
	cyan magenta yellow black SC 		% Set colour
	cyan magenta yellow black K 		% Set both in one operation
The CS and SC operators shall select the current stroking colour space and current stroking colour separately; K shall set them in combination. 
The cs, sc, and k operators shall perform the same functions for nonstroking operations. 
Setting either current colour space to DeviceCMYK shall initialize the cyan, magenta, and yellow components of the corresponding current colour to 0.0 and the black component to 1.0.'
]

{ #category : #accessing }
PtDeviceCMYK >> content [
	^#DeviceCMYK
]

{ #category : #accessing }
PtDeviceCMYK >> defaultDecodeArray [
	^#(0.0 1.0 0.0 1.0 0.0 1.0 0.0 1.0) asPDF
]

{ #category : #accessing }
PtDeviceCMYK >> initialColour [
	^CmykColor black
]

{ #category : #accessing }
PtDeviceCMYK >> initialColourValues [
	^#(0.0 0.0 0.0 1.0)
]

{ #category : #accessing }
PtDeviceCMYK >> numberOfComponents [
	^4
]

"
PDF DeviceRGB Colour Space as defined in PDF 32000_2008.pdf, section 8.6.4.3, pp. 143.

Colours in the DeviceRGB colour space shall be specified according to the additive RGB (red-green-blue) colour model, 
in which colour values shall be defined by three components representing the intensities of the additive primary colorants red, green, and blue. 
Each component shall be specified by a number in the range 0.0 to 1.0, 
where 0.0 shall denote the complete absence of a primary component and 1.0 shall denote maximum intensity.

EXAMPLE
This example shows alternative ways to select the DeviceRGB colour space and a specific colour within that space for stroking operations.
	/DeviceRGB CS 	% Set DeviceRGB colour space
	red green blue SC 	% Set colour
	red green blue RG 	% Set both in one operation
The CS and SC operators shall select the current stroking colour space and current stroking colour separately; RG shall set them in combination. 
The cs, sc, and rg operators shall perform the same functions for nonstroking operations. 
Setting either current colour space to DeviceRGB shall initialize the red, green, and blue components of the corresponding current colour to 0.0.
"
Class {
	#name : #PtDeviceRGB,
	#superclass : #PtDeviceColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceRGB class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #DeviceRGB
		supertype: #DeviceColourSpace
		version: #(1 1)
		section: '8.6.4.3'
		documentation: 'Colours in the DeviceRGB colour space shall be specified according to the additive RGB (red-green-blue) colour model, 
in which colour values shall be defined by three components representing the intensities of the additive primary colorants red, green, and blue. 
Each component shall be specified by a number in the range 0.0 to 1.0, 
where 0.0 shall denote the complete absence of a primary component and 1.0 shall denote maximum intensity.

EXAMPLE
This example shows alternative ways to select the DeviceRGB colour space and a specific colour within that space for stroking operations.
	/DeviceRGB CS 	% Set DeviceRGB colour space
	red green blue SC 	% Set colour
	red green blue RG 	% Set both in one operation
The CS and SC operators shall select the current stroking colour space and current stroking colour separately; RG shall set them in combination. 
The cs, sc, and rg operators shall perform the same functions for nonstroking operations. 
Setting either current colour space to DeviceRGB shall initialize the red, green, and blue components of the corresponding current colour to 0.0.'
]

{ #category : #accessing }
PtDeviceRGB >> bitsFor: aColorValue withSizes: bitsPerComponents [
	"<Integer>
	the bits stored in the pixel array"

	| maxBits nativeBitsPerComponent scales redBits greenBits blueBits |
	maxBits := bitsPerComponents inject: 0 into: [:max :number | max max: number].
	nativeBitsPerComponent := (PtPDF classAt: #ImageXObject) nativeBitsPerComponentFor: maxBits.
	scales := bitsPerComponents collect: [:bits | (1 bitShift: bits) - 1].
	redBits := (aColorValue red * scales first) rounded.
	greenBits := (aColorValue green * (scales at: 2)) rounded.
	blueBits := (aColorValue blue * scales last) rounded.
	^(redBits bitShift: nativeBitsPerComponent * 2) + (greenBits bitShift: nativeBitsPerComponent) + blueBits
]

{ #category : #accessing }
PtDeviceRGB >> bytesFromMappedPalette: aMappedPalette [
	| byteArray |
	byteArray := ByteArray new: aMappedPalette elementData size.
	1 to: byteArray size do: [:index |
		byteArray at: index put: ((aMappedPalette elementData at: index) bitShift: -5)].
	^byteArray
]

{ #category : #accessing }
PtDeviceRGB >> colorAt: someBits withSizes: bitsPerComponents decodeWith: anArray [
	"<ColorValue>"

	| maxBits nativeBitsPerComponent componentMask components values scale |
	maxBits := bitsPerComponents inject: 0 into: [:max :number | max max: number].
	nativeBitsPerComponent := (PDF classAt: #ImageXObject) nativeBitsPerComponentFor: maxBits.
	componentMask := (1 bitShift: nativeBitsPerComponent) - 1.
	components := (bitsPerComponents size to: 1 by: -1) collect: [:index |
		(someBits bitShift: ((index - 1) * nativeBitsPerComponent) negated) bitAnd: componentMask].
	values := OrderedCollection new: components size.
	scale := ColorValue scalingValue.
	components withIndexDo: [:value :index |
		| dMin dMax |
		dMin := anArray at: index * 2 - 1.
		dMax := anArray at: index * 2.
		values add: (((dMax - dMin) * value / componentMask + dMin) * scale) truncated].
	^ColorValue scaledRed: values first scaledGreen: (values at: 2) scaledBlue: values last
]

{ #category : #accessing }
PtDeviceRGB >> colorByteArrayFor: aColorValue [
	"<ByteArray[3]>"

	^aColorValue asByteArray
]

{ #category : #accessing }
PtDeviceRGB >> colorFromByteStream: aByteReadStream [
	"<ColorValue>"

	^ColorValue fromBytes: (aByteReadStream next: 3)
]

{ #category : #accessing }
PtDeviceRGB >> content [
	^#DeviceRGB
]

{ #category : #accessing }
PtDeviceRGB >> defaultDecodeArray [
	^#(0.0 1.0 0.0 1.0 0.0 1.0) asPDF
]

{ #category : #accessing }
PtDeviceRGB >> initialColourValues [
	^#(0.0 0.0 0.0)
]

{ #category : #accessing }
PtDeviceRGB >> numberOfComponents [
	^3
]

{ #category : #accessing }
PtDeviceRGB >> paletteFor: anImageXObject [
	| colors |
	(anImageXObject hasDecode or: [
	anImageXObject bitsPerComponent = 8]) ifTrue: [
		^FixedPalette newForDepths: anImageXObject depthsPerComponent].
	colors := anImageXObject uniqueColorValues.
	(colors size > ((1 bitShift: 16) - 1) or: [
	colors size * 6 > (anImageXObject bytesPerImage - anImageXObject numberOfPixel)]) ifTrue: [
			^FixedPalette newForDepths: anImageXObject depthsPerComponent].
	^MappedPalette withColors: colors
]

{ #category : #accessing }
PtDeviceRGB >> rgbBytesFrom: aByteArray [
	"<ByteArray>"

	^aByteArray
]

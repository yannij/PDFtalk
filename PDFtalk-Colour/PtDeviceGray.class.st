"
PDF DeviceGrayColour Space as defined in PDF 32000_2008.pdf, section 8.6.4.2, pp. 143.

Black, white, and intermediate shades of gray are special cases of full colour. 
A grayscale value shall be represented by a single number in the range 0.0 to 1.0, 
where 0.0 corresponds to black, 1.0 to white, and intermediate values to different gray levels.

EXAMPLE
This example shows alternative ways to select the DeviceGray colour space and a specific gray level within that space for stroking operations.
	/DeviceGray CS 	% Set DeviceGray colour space
	gray SC 			% Set gray level
	gray G 				% Set both in one operation
The CS and SC operators shall select the current stroking colour space and current stroking colour separately; G shall set them in combination. 
(The cs, sc, and g operators shall perform the same functions for nonstroking operations.) 
Setting either current colour space to DeviceGray shall initialize the corresponding current colour to 0.0.
"
Class {
	#name : #PtDeviceGray,
	#superclass : #PtDeviceColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceGray class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #DeviceGray
		supertype: #DeviceColourSpace
		version: #(1 1)
		section: '8.6.4.2'
		documentation: 'Black, white, and intermediate shades of gray are special cases of full colour. 
A grayscale value shall be represented by a single number in the range 0.0 to 1.0, 
where 0.0 corresponds to black, 1.0 to white, and intermediate values to different gray levels.

EXAMPLE
This example shows alternative ways to select the DeviceGray colour space and a specific gray level within that space for stroking operations.
	/DeviceGray CS 	% Set DeviceGray colour space
	gray SC 			% Set gray level
	gray G 				% Set both in one operation
The CS and SC operators shall select the current stroking colour space and current stroking colour separately; G shall set them in combination. 
(The cs, sc, and g operators shall perform the same functions for nonstroking operations.) 
Setting either current colour space to DeviceGray shall initialize the corresponding current colour to 0.0.'
]

{ #category : #accessing }
PtDeviceGray >> bitsFor: aSimplePaint withSizes: bitsPerComponents [
	"<Integer>
	the bits stored in the pixel array"

	^(aSimplePaint asGrayValue * ((1 bitShift: bitsPerComponents first) - 1)) rounded
]

{ #category : #accessing }
PtDeviceGray >> bytesFromMappedPalette: aMappedPalette [
	| byteArray |
	byteArray := ByteArray new: aMappedPalette size.
	1 to: byteArray size do: [:index |
		byteArray at: index put: ((aMappedPalette elementData at: index - 1 * 3 + 1) bitShift: -5)].
	^byteArray
]

{ #category : #accessing }
PtDeviceGray >> colorAt: someBits withSizes: bitsPerComponents decodeWith: anArray [
	"<ColorValue>"

	| mask dMin dMax brightness |
	mask := (1 bitShift: bitsPerComponents first) - 1.
	dMin := anArray first.
	dMax := anArray last.
	brightness := (((dMax - dMin) * someBits / mask + dMin) * ColorValue scalingValue) truncated.
	^ColorValue scaledRed: brightness scaledGreen: brightness scaledBlue: brightness
]

{ #category : #accessing }
PtDeviceGray >> colorByteArrayFor: aColorValue [
	"<ByteArray[1]>"

	^aColorValue asByteArray first: 1
]

{ #category : #accessing }
PtDeviceGray >> colorFromByteStream: aByteReadStream [
	"<ColorValue>"

	^ColorValue fromBytes: (Array new: 3 withAll: aByteReadStream next)
]

{ #category : #accessing }
PtDeviceGray >> content [
	^#DeviceGray
]

{ #category : #accessing }
PtDeviceGray >> coverageAt: someBits withSizes: bitsPerComponents decodeWith: anArray [
	"<CoverageValue>
	applies to masks.
	The meaning of transparent and opaque is opposite in Smalltalk and PDF:
	0 means 'transparent' (the background is painted) in Smalltalk and 'opaque' in PDF
	1 means 'opaque' (the image is painted) in Smalltalk and 'transparent' in PDF"

	| mask dMin dMax brightness |
	mask := (1 bitShift: bitsPerComponents first) - 1.
	dMin := anArray first.
	dMax := anArray last.
	brightness := (dMax - dMin) * someBits / mask + dMin.
	^CoverageValue coverage: 1 - brightness
]

{ #category : #accessing }
PtDeviceGray >> defaultDecodeArray [
	^#(0.0 1.0) asPDF
]

{ #category : #accessing }
PtDeviceGray >> initialColourValues [
	^#(0.0)
]

{ #category : #accessing }
PtDeviceGray >> numberOfComponents [
	^1
]

{ #category : #accessing }
PtDeviceGray >> paletteFor: anImageXObject [
	anImageXObject bitsPerComponent = 1 ifTrue: [
		^anImageXObject oneBitPalette].
	anImageXObject bitsPerComponent = 8 ifTrue: [
		^FixedPalette newForDepths: #(8 8 8)].
	^MappedPalette withColors: anImageXObject uniqueColorValues
]

{ #category : #accessing }
PtDeviceGray >> procSet [
	^#ImageB
]

{ #category : #accessing }
PtDeviceGray >> rgbBytesFrom: aByteArray [
	"<ByteArray>"

	| wst rst |
	wst := (ByteArray new: aByteArray size * 3) writeStream.
	rst := aByteArray readStream.
	[rst atEnd] whileFalse: [
		| byte |
		byte := rst next.
		wst nextPut: byte.
		wst nextPut: byte.
		wst nextPut: byte].
	^wst contents
]

"
PDF Image Dictionaries as defined in PDF 32000_2008.pdf, section 8.9.5, pp. 206.

An image dictionary—that is, the dictionary portion of a stream representing an image XObject—
may contain the entries in addition to the usual entries common to all streams. 
There are many relationships among these entries, and the current colour space may limit the choices for some of them. 
Attempting to use an image dictionary whose entries are inconsistent with each other or with the current colour space shall cause an error.

The entries described here are appropriate for a base image—one that is invoked directly with the Do operator. 
Some of the entries should not be used for images used in other ways, such as for alternate images, image masks, or thumbnail images. 
Except as noted, such irrelevant entries are simply ignored by a conforming reader.
"
Class {
	#name : #PtImageXObject,
	#superclass : #PtXObject,
	#category : #'PDFtalk-Images'
}

{ #category : #'instance creation' }
PtImageXObject class >> empty [
	| inst |
	inst := super empty.
	inst at: #Type put: self type.
	^inst
]

{ #category : #'instance creation' }
PtImageXObject class >> from: anImage [
	| inst |
	inst := self empty.
	inst initializeFrom: anImage.
	^inst
]

{ #category : #accessing }
PtImageXObject class >> nativeBitsPerComponentFor: numberOfBits [
	numberOfBits > 8 ifTrue: [
		^16].
	numberOfBits > 4 ifTrue: [
		^8].
	numberOfBits > 2 ifTrue: [
		^4].
	numberOfBits > 1 ifTrue: [
		^2].
	^1
]

{ #category : #accessing }
PtImageXObject class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ImageXObject
		supertype: #XObject
		section: '8.9.5'
		documentation: 'An image dictionary—that is, the dictionary portion of a stream representing an image XObject—
may contain the entries in addition to the usual entries common to all streams. 
There are many relationships among these entries, and the current colour space may limit the choices for some of them. 
Attempting to use an image dictionary whose entries are inconsistent with each other or with the current colour space shall cause an error.

The entries described here are appropriate for a base image—one that is invoked directly with the Do operator. 
Some of the entries should not be used for images used in other ways, such as for alternate images, image masks, or thumbnail images. 
Except as noted, such irrelevant entries are simply ignored by a conforming reader.'
]

{ #category : #accessing }
PtImageXObject class >> resourcePrefix [
	^'Im'
]

{ #category : #accessing }
PtImageXObject class >> subtype [
	^#Image
]

{ #category : #'accessing entries' }
PtImageXObject >> Alternates [
	<typeArrayOf: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 10 documentation: 'An array of alternate image dictionaries for this image. 
The order of elements within the array shall have no significance. 
This entry shall not be present in an image XObject that is itself an alternate image.'>
	^self objectAt: #Alternates ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtImageXObject >> BitsPerComponent [
	<type: #Integer>
	<attribute: 4 documentation: '(Required except for image masks and images that use the JPXDecode filter) 
The number of bits used to represent each colour component. 
Only a single value shall be specified; the number of bits shall be the same for all colour components. 
The value shall be 1, 2, 4, 8, or (in PDF 1.5) 16. 
If ImageMask is true, this entry is optional, but if specified, its value shall be 1.

If the image stream uses a filter, the value of BitsPerComponent shall be consistent with the size of the data samples that the filter delivers. 
In particular, a CCITTFaxDecode or JBIG2Decode filter shall always deliver 1-bit samples, 
a RunLengthDecode or DCTDecode filter shall always deliver 8-bit samples, 
and an LZWDecode or FlateDecode filter shall deliver samples of a specified size if a predictor function is used.

If the image stream uses the JPXDecode filter, this entry is optional and shall be ignored if present. 
The bit depth is determined by the conforming reader in the process of decoding the JPEG2000 image.'>
	^self objectAt: #BitsPerComponent
]

{ #category : #'accessing entries' }
PtImageXObject >> ColorSpace [
	<type: #ColourSpace>
	<attribute: 3 documentation: '(Required for images, except those that use the JPXDecode filter; not allowed forbidden for image masks) 
The colour space in which image samples shall be specified; it can be any type of colour space except Pattern.
If the image uses the JPXDecode filter, this entry may be present:
	•	If ColorSpace is present, any colour space specifications in the JPEG2000 data shall be ignored.
	•	If ColorSpace is absent, the colour space specifications in the JPEG2000 data shall be used. 
		The Decode array shall also be ignored unless ImageMask is true.'>
	^self objectAt: #ColorSpace
]

{ #category : #'accessing entries' }
PtImageXObject >> Decode [
	<typeArrayOf: #Number>
	<attribute: 8 documentation: 'An array of numbers describing how to map image samples into the range of values appropriate for the image’s colour space. 
If ImageMask is true, the array shall be either [0 1] or [1 0]; otherwise, its length shall be twice the number of colour components required by ColorSpace. 
If the image uses the JPXDecode filter and ImageMask is false, Decode shall be ignored by a conforming reader'>
	^self objectAt: #Decode ifAbsent: [self defaultDecodeArray]
]

{ #category : #'accessing entries' }
PtImageXObject >> Height [
	<type: #Integer>
	<required>
	<attribute: 2 documentation: 'The height of the image, in samples.'>
	^self objectAt: #Height
]

{ #category : #'accessing entries' }
PtImageXObject >> ID [
	<type: #String>
	<version: 1 dot: 3>
	<attribute: 15 documentation: '(indirect reference preferred) 
The digital identifier of the image’s parent Web Capture content set.'>
	^self objectAt: #ID
]

{ #category : #'accessing entries' }
PtImageXObject >> ImageMask [
	<type: #Boolean>
	<attribute: 6 documentation: 'A flag indicating whether the image shall be treated as an image mask. 
If this flag is true, the value of BitsPerComponent shall be 1 and Mask and ColorSpace shall not be specified; 
unmasked areas shall bepainted using the current nonstroking colour.'>
	^self objectAt: #ImageMask ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtImageXObject >> Intent [
	<type: #Name>
	<version: 1 dot: 1>
	<attribute: 5 documentation: 'The name of a colour rendering intent to be used in rendering the image. 
Default value: the current rendering intent in the graphics state.'>
	^self objectAt: #Intent
]

{ #category : #'accessing entries' }
PtImageXObject >> Interpolate [
	<type: #Boolean>
	<attribute: 9 documentation: 'A flag indicating whether image interpolation shall be performed by a conforming reader.'>
	^self objectAt: #Interpolate ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtImageXObject >> Mask [
	<type: #ImageXObject>
	<type: #Array>
	<version: 1 dot: 3>
	<attribute: 7 documentation: '(Optional except for image masks; not allowed for image masks) 
An image XObject defining an image mask to be applied to this image, 
or an array specifying a range of colours to be applied to it as a colour key mask. 
If ImageMask is true, this entry shall not be present.'>
	^self objectAt: #Mask
]

{ #category : #'accessing entries' }
PtImageXObject >> Matte [
	<typeArrayOf: #Number>
	<version: 1 dot: 4>
	<attribute: 19 documentation: 'Only for SoftMaskImage.
An array of component values specifying the matte colour with which the image data in the parent image shall have been preblended.
The array shall consist of n numbers, where n is the number of components in the colour space specified by the ColorSpace entry in the parent image’s image dictionary; the numbers shall be valid colour components in that colour space.
If this entry is absent, the image data shall not be preblended.'>
	^self objectAt: #Matte
]

{ #category : #'accessing entries' }
PtImageXObject >> Metadata [
	<type: #Stream>
	<version: 1 dot: 4>
	<attribute: 17 documentation: 'A metadata stream containing metadata for the image.'>
	^self objectAt: #Metadata
]

{ #category : #'accessing entries' }
PtImageXObject >> Name [
	<type: #Name>
	<attribute: 13 documentation: '(Required in PDF 1.0; optional otherwise) 
The name by which this image XObject is referenced in the XObject subdictionary of the current resource dictionary.
This entry is obsolescent and shall no longer be used.'>
	^self objectAt: #Name
]

{ #category : #'accessing entries' }
PtImageXObject >> OC [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 18 documentation: 'An optional content group or optional content membership dictionary, 
specifying the optional content properties for this image XObject. 
Before the image is processed by a conforming reader, its visibility shall be determined based on this entry. 
If it is determined to be invisible, the entire image shall be skipped, as if there were no Do operator to invoke it.'>
	^self objectAt: #OC ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtImageXObject >> OPI [
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 16 documentation: 'An OPI version dictionary for the image. 
If ImageMask is true, this entry shall be ignored.'>
	^self objectAt: #OPI ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtImageXObject >> SMask [
	<type: #ImageXObject>
	<version: 1 dot: 4>
	<attribute: 11 documentation: 'A subsidiary image XObject defining a soft-mask image that shall be used as a source of mask shape or mask opacity values in the transparent imaging model. 
The alpha source parameter in the graphics state determines whether the mask values shall be interpreted as shape or opacity.

If present, this entry shall override the current soft mask in the graphics state, as well as the image’s Mask entry, if any. 
However, the other transparency-related graphics state parameters—blend mode and alpha constant—shall remain in effect. 
If SMask is absent, the image shall have no associated soft mask (although the current soft mask in the graphics state may still apply).'>
	^self objectAt: #SMask
]

{ #category : #'accessing entries' }
PtImageXObject >> SMaskInData [
	<type: #Integer>
	<version: 1 dot: 5>
	<attribute: 12 documentation: '(Optional for images that use the JPXDecode filter, meaningless otherwise) 
A code specifying how soft-mask information encoded with image samples shall be used:
0	If present, encoded soft-mask image information shall be ignored.
1 	The image’s data stream includes encoded soft-mask values. 
	A conforming reader may create a soft-mask image from the information to be used as a source of mask shape or mask opacity in the transparency imaging model.
2	The image’s data stream includes colour channels that have been preblended with a background; the image data also includes an opacity channel. 
	A conforming reader may create a soft-mask image with a Matte entry from the opacity channel information to be used 
	as a source of mask shape or mask opacity in the transparency model.
If this entry has a nonzero value, SMask shall not be specified.'>
	^self objectAt: #SMaskInData ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtImageXObject >> StructParent [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 14 documentation: '(Required if the image is a structural content item) 
The integer key of the image’s entry in the structural parent tree.'>
	^self objectAt: #StructParent
]

{ #category : #'accessing entries' }
PtImageXObject >> Subtype [
	<type: #Name>
	<attribute: 1 documentation: 'The type of XObject that this dictionary describes.'>
	^self objectAt: #Subtype ifAbsent: [#Image asPDF]
]

{ #category : #'accessing entries' }
PtImageXObject >> Width [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The width of the image, in samples.'>
	^self objectAt: #Width
]

{ #category : #converting }
PtImageXObject >> addDecodeIfNeededFor: sourceBitsPerComponent [
	"If the source image bitsPerComponent is smaller than the bitsPerComponent of the receiver,
	add a /Decode array to scale the values"

	| decodeArray |
	(sourceBitsPerComponent allSatisfy: [:bits | bits = self bitsPerComponent]) ifTrue: [
		^self].
	decodeArray := sourceBitsPerComponent inject: Array new into: [:decode :bits |
		decode , (Array
			with: 0
			with: self maxComponent / ((1 bitShift: bits) - 1))].
	self at: #Decode put: decodeArray
]

{ #category : #actions }
PtImageXObject >> addProcSetTo: aRenderer [
	aRenderer addProcSet: self procSet
]

{ #category : #converting }
PtImageXObject >> addSoftMaskWithBytes: aByteArray [
	| softMask |
	softMask := (PtPDF classAt: #ImageXObject) empty.
	softMask at: #Width put: self width.
	softMask at: #Height put: self height.
	softMask at: #BitsPerComponent put: self bitsPerComponent.
	softMask at: #ColorSpace put: #DeviceGray.
	softMask contents: aByteArray asString.
	self at: #SMask put: softMask newReference
]

{ #category : #converting }
PtImageXObject >> asSmalltalkValue [
	"<Image>
	create an Smalltalk image with RGB or coverage colors"

	| image palette |
	(self internal isKindOf: PtUnsupported) ifTrue: [
		^PtUnsupported raiseSignal: self internal messageText].
	(self hasKey: #SMask) ifTrue: [
		image := Image extent: self width @ self height depth: 32 palette: FixedPalette bgr8Bit.
		image readPixelsFrom: self.
		^AlphaCompositedImage image: image].
	palette := self palette.
	image := Image extent: self width @ self height depth: palette depth palette: palette.
	image readPixelsFrom: self.
	(self hasKey: #Mask) ifTrue: [
		^OpaqueImage
			figure: (CachedImage on: image)
			shape: (CachedImage on: self Mask asSmalltalkValue)].
	^image
]

{ #category : #accessing }
PtImageXObject >> bitsFromBytes: numberOfBytes at: byteIndex [
	"<Integer>
	the bits (numberOfBytes * 8) from the pixel array"

	^(self internal copyFrom: byteIndex + 1 to: byteIndex + numberOfBytes) asByteArray inject: 0 into: [:num :byte |
		(num bitShift: 8) + byte]
]

{ #category : #accessing }
PtImageXObject >> bitsPerComponent [
	"<Integer>"

	^self BitsPerComponent asSmalltalkValue
]

{ #category : #accessing }
PtImageXObject >> bitsPerComponent: anInteger [
	self at: #BitsPerComponent put: (self class nativeBitsPerComponentFor: anInteger)
]

{ #category : #accessing }
PtImageXObject >> bitsPerPixel [
	"<Integer>"

	self isMask ifTrue: [
		^1].
	^self numberOfComponents * self bitsPerComponent
]

{ #category : #accessing }
PtImageXObject >> bitsPerRow [
	"<Integer>"

	^self bitsPerPixel * self width
]

{ #category : #accessing }
PtImageXObject >> byteArrayFor: anInteger size: numberOfBytes [
	"<ByteArray>
	the bits of anInteger are converted to numberOfBytes bytes.
	Leading bits are ignored"

	| bytes toConvert |
	bytes := ByteArray new: numberOfBytes.
	toConvert := anInteger.
	numberOfBytes to: 1 by: -1 do: [:index |
		bytes at: index put: (toConvert bitAnd: 255).
		toConvert := toConvert bitShift: -8].
	^bytes
]

{ #category : #accessing }
PtImageXObject >> bytesPerImage [
	^self height * self bytesPerRow
]

{ #category : #accessing }
PtImageXObject >> bytesPerRow [
	"<Integer>"

	^(self bitsPerRow / 8) ceiling
]

{ #category : #accessing }
PtImageXObject >> clearMaskForBytes: numberOfBytes shiftedRigthBy: bitsRight [
	| fullMask pixelMask |
	fullMask := (1 bitShift: numberOfBytes * 8) - 1.
	pixelMask := self pixelMask bitShift: bitsRight.
	^fullMask bitXor: pixelMask
]

{ #category : #printing }
PtImageXObject >> colorTypeName [
	"<String>
	for the printString"

	self isMask ifTrue: [
		^'Mask'].
	^self ColorSpace class name asString
]

{ #category : #accessing }
PtImageXObject >> combined: newInteger size: numberOfBytes shiftedRightBy: bitsRight at: bytesStart [
	^(self maskedBitsForBytes: numberOfBytes shiftedRightBy: bitsRight at: bytesStart) + (newInteger bitShift: bitsRight)
]

{ #category : #accessing }
PtImageXObject >> conversionColorspace [
	"masks do not have a color space"

	self isMask ifTrue: [
		^(PtPDF classAt: #DeviceGray) new].
	^self ColorSpace
]

{ #category : #accessing }
PtImageXObject >> defaultDecodeArray [
	self isMask ifTrue: [
		^#(0 1) asPDF].
	^self ColorSpace defaultDecodeArray
]

{ #category : #accessing }
PtImageXObject >> depth [
	"<Integer>
	the significant number of bits per pixel.
	Must be the same or lower than #bitsPerPixel"

	| maxComponent depth rst |
	self hasDecode ifFalse: [
		^self bitsPerPixel].
	maxComponent := self maxComponent.
	depth := 0.
	rst := self Decode asSmalltalkValue readStream.
	[rst atEnd] whileFalse: [
		| dMin dMax maxValue |
		dMin := rst next.
		dMax := rst next.
		maxValue := maxComponent / (dMax - dMin).
		depth := depth + maxValue rounded abs highBit].
	^depth
]

{ #category : #accessing }
PtImageXObject >> depthsPerComponent [
	"<Array of: Integer>
	the significant number of bits per component.
	Only relevant with a #Decode array.
	Provisorial: assumes that min is 0 and that min is smaller than max"

	| maxComponent depths rst |
	self isMask ifTrue: [
		^#(1)].
	self hasDecode ifFalse: [
		^Array new: self numberOfComponents withAll: self bitsPerComponent].
	maxComponent := self maxComponent.
	depths := OrderedCollection new.
	rst := self Decode asSmalltalkValue readStream.
	[rst atEnd] whileFalse: [
		depths add: (maxComponent / (rst next max: rst next)) rounded highBit].
	^depths
]

{ #category : #accessing }
PtImageXObject >> extent [
	^self width @ self height
]

{ #category : #testing }
PtImageXObject >> hasDecode [
	^self hasKey: #Decode
]

{ #category : #accessing }
PtImageXObject >> height [
	^self Height asSmalltalkValue
]

{ #category : #'initialize-release' }
PtImageXObject >> initializeFrom: anImage [
	self at: #Width put: anImage width.
	self at: #Height put: anImage height.
	anImage palette setImagePropertiesOf: self.
	anImage writePixelsTo: self.
	self filter: #FlateDecode
]

{ #category : #'initialize-release' }
PtImageXObject >> initializeImageBits [
	self contents: (String new: self bytesPerImage)
]

{ #category : #testing }
PtImageXObject >> isIndexed [
	^self isMask not and: [
	self ColorSpace isKindOf: (PtPDF classAt: #Indexed)]
]

{ #category : #testing }
PtImageXObject >> isMask [
	^self ImageMask
]

{ #category : #testing }
PtImageXObject >> isStandard1BitBWOrMask [
	"<Boolean>
	if true, the optimized image conversion can be used"

	self bitsPerComponent = 1 ifFalse: [
		^false].
	self isMask ifTrue: [
		^self Decode asSmalltalkValue = #(1 0)].
	^self Decode = self defaultDecodeArray and: [
	self ColorSpace asSmalltalkValue = #DeviceGray]
]

{ #category : #testing }
PtImageXObject >> isStandard8BitGray [
	^self bitsPerComponent = 8 and: [
	self Decode = self defaultDecodeArray and: [
	self ColorSpace asSmalltalkValue = #DeviceGray]]
]

{ #category : #testing }
PtImageXObject >> isStandard8BitRGB [
	^self bitsPerComponent = 8 and: [
	self Decode = self defaultDecodeArray and: [
	self ColorSpace asSmalltalkValue = #DeviceRGB]]
]

{ #category : #accessing }
PtImageXObject >> maskedBitsForBytes: numberOfBytes shiftedRightBy: bitsRight at: bytesStart [
	| clearMask oldInteger |
	oldInteger := self bitsFromBytes: numberOfBytes at: bytesStart.
	clearMask := self clearMaskForBytes: numberOfBytes shiftedRigthBy: bitsRight.
	^oldInteger bitAnd: clearMask
]

{ #category : #accessing }
PtImageXObject >> maxComponent [
	^(1 bitShift: self bitsPerComponent) - 1
]

{ #category : #accessing }
PtImageXObject >> numberOfComponents [
	self isMask ifTrue: [
		^1].
	^self ColorSpace numberOfComponents
]

{ #category : #accessing }
PtImageXObject >> numberOfPixel [
	^self width * self height
]

{ #category : #accessing }
PtImageXObject >> oneBitPalette [
	self isMask ifTrue: [
		^CoveragePalette monoMaskPalette].
	^MonoMappedPalette blackWhite
]

{ #category : #converting }
PtImageXObject >> palette [
	"<Palette>
	new palette suitable for a converted Smalltalk image"

	self isMask ifTrue: [
		^CoveragePalette monoMaskPalette].
	^self ColorSpace paletteFor: self
]

{ #category : #accessing }
PtImageXObject >> pixelBitsForPaint: aPaint [
	"<Integer>"

	^self conversionColorspace bitsFor: aPaint withSizes: self depthsPerComponent
]

{ #category : #accessing }
PtImageXObject >> pixelMask [
	^(1 bitShift: self bitsPerPixel) - 1
]

{ #category : #accessing }
PtImageXObject >> pixelPaintForBits: anInteger [
	"<ColorValue | CoverageValue>"

	self isMask ifTrue: [
		^self conversionColorspace
			coverageAt: anInteger
			withSizes: self depthsPerComponent
			decodeWith: self Decode asSmalltalkValue].
	^self conversionColorspace
		colorAt: anInteger
		withSizes: self depthsPerComponent
		decodeWith: self Decode asSmalltalkValue
]

{ #category : #enumerating }
PtImageXObject >> pixelsDo: aBlock [
	0 to: self height - 1 do: [:rowIndex |
		0 to: self width - 1 do: [:columnIndex | aBlock value: columnIndex value: rowIndex]]
]

{ #category : #printing }
PtImageXObject >> printOn: stream [
	stream
		nextPutAll: self class name asString;
		nextPutAll: '(';
		nextPutAll: self width printString;
		nextPutAll: ' @ ';
		nextPutAll: self height printString;
		nextPutAll: ' ';
		nextPutAll: self colorTypeName;
		nextPutAll: ' ';
		nextPutAll: self bitsPerComponent printString;
		nextPut: $)
]

{ #category : #printing }
PtImageXObject >> printvalueWith: printer [
	"Value protocol to print the object literally"
	
	| args |
	args := OrderedCollection new.
	args add: (printer dictionary: 'on' value: self content).
	args add: (printer constant: 'externalBytes' value: self external asByteArray).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtImageXObject >> procSet [
	self isMask ifTrue: [
		^#ImageB].
	^self ColorSpace procSet
]

{ #category : #'initialize-release' }
PtImageXObject >> resetImageProperties [
	"undo any potential change made by #setImagePropertiesOf:"

	self at: #BitsPerComponent put: nil.
	self at: #ColorSpace put: nil.
	self at: #ImageMask put: nil.
	self at: #Decode put: nil
]

{ #category : #accessing }
PtImageXObject >> setBytes: aByteArray at: indexInteger [
	self internal
		replaceBytesFrom: indexInteger + 1
		to: indexInteger + aByteArray size
		with: aByteArray asString
		startingAt: 1.
	self resetExternal
]

{ #category : #actions }
PtImageXObject >> setDecodeExplicitly [
	"trick to force a FixedPalette when converting to a Smalltalk image"

	self at: #Decode put: self Decode
]

{ #category : #accessing }
PtImageXObject >> startBitIndexAt: aPoint [
	"<Integer>
	start bit position of the pixel bits"

	^(aPoint y * self bytesPerRow bitShift: 3) + (aPoint x * self bitsPerPixel)
]

{ #category : #accessing }
PtImageXObject >> uniqueColorValues [
	"<Collection of: ColorValue>"

	| colors |
	colors := Set new: self height * self width // 10.
	self pixelsDo: [:x :y | colors add: (self valueAtPoint: x @ y)].
	^colors
]

{ #category : #accessing }
PtImageXObject >> valueAtPoint: aPoint [
	"<Paint>
	The paint at pixel location aPoint (zero based)"

	| bitsStart bytesStart bitsLeft numberOfBytes bitsRight bits rightAlignedBits maskedBits |
	bitsStart := self startBitIndexAt: aPoint.
	bytesStart := bitsStart bitShift: -3.
	bitsLeft := bitsStart bitAnd: 7.
	numberOfBytes := ((bitsLeft + self bitsPerPixel) / 8) ceiling.
	bitsRight := numberOfBytes * 8 - bitsLeft - self bitsPerPixel.
	bits := self bitsFromBytes: numberOfBytes at: bytesStart.
	rightAlignedBits := bits bitShift: bitsRight negated.
	maskedBits := rightAlignedBits bitAnd: self pixelMask.
	^self pixelPaintForBits: maskedBits
]

{ #category : #accessing }
PtImageXObject >> valueAtPoint: aPoint put: aPaint [
	"<Paint>
	Put aPaint at pixel location aPoint (zero based)"

	| newBits bitsStart bytesStart bitsLeft numberOfBytes bitsRight bitsToWrite bytes |
	newBits := self pixelBitsForPaint: aPaint.
	bitsStart := self startBitIndexAt: aPoint.
	bytesStart := bitsStart bitShift: -3.
	bitsLeft := bitsStart bitAnd: 7.
	numberOfBytes := ((bitsLeft + self bitsPerPixel) / 8) ceiling.
	bitsRight := numberOfBytes * 8 - bitsLeft - self bitsPerPixel.
	bitsToWrite := (bitsLeft + bitsRight) isZero
		ifTrue: [newBits]
		ifFalse: [
		self combined: newBits size: numberOfBytes shiftedRightBy: bitsRight at: bytesStart].
	bytes := self byteArrayFor: bitsToWrite size: numberOfBytes.
	self setBytes: bytes at: bytesStart.
	^aPaint
]

{ #category : #accessing }
PtImageXObject >> width [
	^self Width asSmalltalkValue
]

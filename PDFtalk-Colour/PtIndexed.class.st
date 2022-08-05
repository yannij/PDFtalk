"
PDF Indexed Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.3, pp. 156.

An Indexed colour space specifies that an area is to be painted using a colour map or colour table of arbitrary colours in some other space. 
A conforming reader shall treat each sample value as an index into the colour table and shall use the colour value it finds there. 
This technique can considerably reduce the amount of data required to represent a sampled image.
"
Class {
	#name : #PtIndexed,
	#superclass : #PtSpecialColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #'instance creation' }
PtIndexed class >> base: aColorspaceSymbol number: anInteger bytes: aByteArray [
	"Constructor for the value printer"
	
	| inst |
	inst := self empty.
	inst at: 2 put: aColorspaceSymbol.
	inst at: 3 put: anInteger.
	inst at: 4 put: aByteArray asString.
	^inst
]

{ #category : #'instance creation' }
PtIndexed class >> newForColors: someColors [
	| inst |
	inst := self empty.
	inst initializeWithColors: someColors.
	^inst
]

{ #category : #'instance creation' }
PtIndexed class >> newForColorspace: aColorspace [
	| inst |
	inst := self empty.
	inst initializeForColorspace: aColorspace.
	^inst
]

{ #category : #accessing }
PtIndexed class >> numberOfAttributes [
	^4
]

{ #category : #accessing }
PtIndexed class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Indexed
		supertype: #ColourSpace
		version: #(1 1)
		section: '8.6.6.3'
		documentation: 'An Indexed colour space specifies that an area is to be painted using a colour map or colour table of arbitrary colours in some other space. 
A conforming reader shall treat each sample value as an index into the colour table and shall use the colour value it finds there. 
This technique can considerably reduce the amount of data required to represent a sampled image.'
]

{ #category : #accessing }
PtIndexed >> alternativeDeviceColorspace [
	^self base alternativeDeviceColorspace
]

{ #category : #'accessing entries' }
PtIndexed >> base [
	<type: #ColourSpace>
	<required>
	<attribute: 2 documentation: 'The base parameter shall be an array or name that identifies the base colour space in which the values in the colour table are to be interpreted.
It shall be any device or CIE-based colour space or (PDF 1.3) a Separation or DeviceN space, but shall not be a Pattern space or another Indexed space.
If the base colour space is DeviceRGB, the values in the colour table shall be interpreted as red, green, and blue components; if the base colour space is a CIE-based ABC space such as a CalRGB or Lab space, the values shall be interpreted as A, B, and C components.'>
	^self objectAt: 2
]

{ #category : #accessing }
PtIndexed >> bitsFor: aColorValue withSizes: bitsPerComponents [
	"<Integer>
	the bits stored in the pixel array.
	If aColorValue is not found, it is added"

	| colorBytes hival bytes numberOfComponents |
	colorBytes := self base colorByteArrayFor: aColorValue.
	hival := self hival asSmalltalkValue.
	bytes := self lookup content.
	numberOfComponents := self base numberOfComponents.
	0 to: hival do: [:index |
		| byteIndex paletteBytes |
		byteIndex := index * numberOfComponents + 1.
		paletteBytes := bytes copyFrom: byteIndex to: byteIndex + numberOfComponents - 1.
		paletteBytes = colorBytes ifTrue: [
			^index]].
	hival >= 255 ifTrue: [
		"This error should be cought on a higher level to select an image format with more colors"
		^Error raiseSignal: 'The color cannot be added: the indexed colour space is full.'].
	self at: 3 put: hival + 1.
	self at: 4 put: (self lookup class content: bytes , colorBytes).
	^self hival asSmalltalkValue
]

{ #category : #accessing }
PtIndexed >> bytesAt: zeroBasedIndex [
	"<ByteArray>"

	| numberOfComponents |
	numberOfComponents := self base numberOfComponents.
	^self lookup content
		copyFrom: zeroBasedIndex * numberOfComponents + 1
		to: (zeroBasedIndex + 1) * numberOfComponents
]

{ #category : #accessing }
PtIndexed >> bytesFromMappedPalette: aMappedPalette [
	^self base bytesFromMappedPalette: aMappedPalette
]

{ #category : #accessing }
PtIndexed >> colorAt: zeroBasedIndex withSizes: bitsPerComponents decodeWith: anArray [
	"<ColorValue>"

	(#(#DeviceRGB #DeviceGray) includes: self alternativeDeviceColorspace asSmalltalkValue) ifFalse: [
		^self error: 'only /DeviceRGB and /DeviceGray are supported as base colour space'].
	self alternativeDeviceColorspace asSmalltalkValue = #DeviceGray ifTrue: [
		^ColorValue fromByte: (self bytesAt: zeroBasedIndex) first].
	^ColorValue fromBytes: (self bytesAt: zeroBasedIndex)
]

{ #category : #accessing }
PtIndexed >> defaultDecodeArray [
	^(Array with: 0 with: self hival) asPDF
]

{ #category : #'accessing entries' }
PtIndexed >> hival [
	<type: #Integer>
	<required>
	<attribute: 3 documentation: 'The hival parameter shall be an integer that specifies the maximum valid index value.
The colour table shall be indexed by integers in the range 0 to hival.
hival shall be no greater than 255, which is the integer required to index a table with 8-bit index values.'>
	^self objectAt: 3
]

{ #category : #accessing }
PtIndexed >> initialColourValues [
	^#(0)
]

{ #category : #'initialize-release' }
PtIndexed >> initializeColorsFrom: aMappedPalette [
	self at: 3 put: aMappedPalette size - 1.
	"need to create the PDF string directly. Otherwise, CR(13) will be replaced by LF (10)!"
	self at: 4 put: ((PtPDF classAt: #EncodedString) string: (self bytesFromMappedPalette: aMappedPalette) asString)
]

{ #category : #'initialize-release' }
PtIndexed >> initializeForColorspace: aColorspace [
	self at: 2 put: aColorspace.
	self at: 3 put: -1.
	self at: 4 put: ((PtPDF classAt: #EncodedString) string: String new)
]

{ #category : #'initialize-release' }
PtIndexed >> initializeWithColors: someColors [
	| wst |
	self at: 2 put: someColors first colorspace.
	self at: 3 put: someColors size - 1.
	wst := (ByteArray new: someColors size * self base numberOfComponents) writeStream.
	someColors do: [:colorValue | wst nextPutAll: colorValue asByteArray].
	self at: 4 put: wst contents asString
]

{ #category : #'accessing entries' }
PtIndexed >> lookup [
	<type: #Stream>
	<type: #String>
	<required>
	<attribute: 4 documentation: 'The colour table shall be defined by the lookup parameter, which may be either a stream or (PDF 1.2) a byte string.
It shall provide the mapping between index values and the corresponding colours in the base colour space.'>
	^self objectAt: 4
]

{ #category : #accessing }
PtIndexed >> numberOfColors [
	"<Integer>"

	^self hival asSmalltalkValue + 1
]

{ #category : #accessing }
PtIndexed >> numberOfComponents [
	^1
]

{ #category : #accessing }
PtIndexed >> paletteFor: anImageXObject [
	| colors rst |
	colors := OrderedCollection new: self numberOfColors.
	rst := self lookup asByteArray readStream.
	[rst atEnd] whileFalse: [colors add: (self base colorFromByteStream: rst)].
	^MappedPalette withColors: colors
]

{ #category : #printing }
PtIndexed >> printvalueWith: printer [
	"Value protocol to print the object literally"
	
	| args |
	args := OrderedCollection new.
	args add: (printer constant: 'base' value: self base asSmalltalkValue).
	args add: (printer constant: 'number' value: self hival asSmalltalkValue).
	args add: (printer constant: 'bytes' value: self lookup asByteArray).
	^printer printvalue: self arguments: args
]

{ #category : #accessing }
PtIndexed >> procSet [
	^#ImageI
]

{ #category : #accessing }
PtIndexed >> rgbBytes [
	"<ByteArray>
	uses 3 bytes per color"

	^self base rgbBytesFrom: self lookup asByteArray
]

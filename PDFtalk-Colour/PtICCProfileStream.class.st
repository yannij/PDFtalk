"
PDF ICCBased Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.5, pp. 149.

ICCBased colour spaces (PDF 1.3) shall be based on a cross-platform colour profile as defined by the International Color Consortium (ICC).
Unlike the CalGray, CalRGB, and Lab colour spaces, which are characterized by entries in the colour space dictionary, an ICCBased colour space shall be characterized by a sequence of bytes in a standard format.
"
Class {
	#name : #PtICCProfileStream,
	#superclass : #PDFStream,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtICCProfileStream class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ICCProfileStream
		supertype: #Stream
		version: #(1 3)
		section: '8.6.6.5'
		documentation: 'ICCBased colour spaces shall be based on a cross-platform colour profile as defined by the International Color Consortium (ICC).
Unlike the CalGray, CalRGB, and Lab colour spaces, which are characterized by entries in the colour space dictionary, an ICCBased colour space shall be characterized by a sequence of bytes in a standard format.'
]

{ #category : #'accessing entries' }
PtICCProfileStream >> Alternate [
	<type: #ColourSpace>
	<attribute: 2 documentation: 'An alternate colour space that shall be used in case the one specified in the stream data is not supported.
Non-conforming readers may use this colour space.
The alternate space may be any valid colour space (except a Pattern colour space) that has the number of components specified by N.
If this entry is omitted and the conforming reader does not understand the ICC profile data, the colour space that shall be used is DeviceGray, DeviceRGB, or DeviceCMYK, depending on whether the value of N is 1, 3, or 4, respectively.

There shall not be conversion of source colour values, such as a tint transformation, when using the alternate colour space.
Colour values within the range of the ICCBased colour space might not be within the range of the alternate colour space.
In this case, the nearest values within the range of the alternate space shall be substituted.'>
	^self objectAt: #Alternate ifAbsent: [
		self N asSmalltalkValue = 1 ifTrue: [
			^(PtPDF classAt: #DeviceGray) empty].
		self N asSmalltalkValue = 3 ifTrue: [
			^(PtPDF classAt: #DeviceRGB) empty].
		^(PtPDF classAt: #DeviceCMYK) empty]
]

{ #category : #'accessing entries' }
PtICCProfileStream >> Metadata [
	<type: #Stream>
	<version: 1 dot: 4>
	<attribute: 4 documentation: 'A metadata stream that shall contain metadata for the colour space'>
	^self objectAt: #Metadata ifAbsent: [PtPDF Stream empty]
]

{ #category : #'accessing entries' }
PtICCProfileStream >> N [
	<type: #Integer>
	<required>
	<attribute: 1 documentation: 'The number of colour components in the colour space described by the ICC profile data.
This number shall match the number of components actually in the ICC profile. N shall be 1, 3, or 4.'>
	^self objectAt: #N
]

{ #category : #'accessing entries' }
PtICCProfileStream >> Range [
	<typeArrayOf: #Number>
	<attribute: 3 documentation: 'An array of 2 × N numbers [min0 max0 min1 max1 …] that shall specify the minimum and maximum valid values of the corresponding colour components.
These values shall match the information in the ICC profile. Default value: [0.0 1.0 0.0 1.0 …].'>
	^self objectAt: #Range ifAbsent: [
		| array |
		array := Array new: self N asSmalltalkValue * 2.
		0 to: self N asSmalltalkValue - 1 do: [:i |
			array at: i * 2 + 1 put: 0.0.
			array at: i * 2 + 2 put: 1.0].
		array asPDF]
]

{ #category : #accessing }
PtICCProfileStream >> alternativeDeviceColorspace [
	"<ColourSpace>"
	
	^self Alternate
]

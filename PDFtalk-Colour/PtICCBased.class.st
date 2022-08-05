"
PDF ICCBased Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.5.5, pp. 149.

ICCBased colour spaces (PDF 1.3) shall be based on a cross-platform colour profile as defined by the International Color Consortium (ICC). 
Unlike the CalGray, CalRGB, and Lab colour spaces, which are characterized by entries in the colour space dictionary, 
an ICCBased colour space shall be characterized by a sequence of bytes in a standard format. 
Details of the profile format can be found in the ICC specification.
"
Class {
	#name : #PtICCBased,
	#superclass : #PtCIEColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtICCBased class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ICCBased
		supertype: #CIEColourSpace
		version: #(1 3)
		section: '8.6.5.5'
		documentation: 'ICCBased colour spaces shall be based on a cross-platform colour profile as defined by the International Color Consortium (ICC). 
Unlike the CalGray, CalRGB, and Lab colour spaces, which are characterized by entries in the colour space dictionary, 
an ICCBased colour space shall be characterized by a sequence of bytes in a standard format. 
Details of the profile format can be found in the ICC specification.'
]

{ #category : #accessing }
PtICCBased >> alternativeDeviceColorspace [
	^self stream alternativeDeviceColorspace
]

{ #category : #accessing }
PtICCBased >> black [
	"preliminary implementation"
	
	^self stream Alternate black
]

{ #category : #accessing }
PtICCBased >> colorAt: someBits withSizes: bitsPerComponents decodeWith: anArray [
	"<ColorValue>"

	self stream Alternate asSmalltalkValue = #DeviceRGB ifFalse: [
		^self error: 'only /DeviceRGB is supported as base colour space'].
	^self stream Alternate colorAt: someBits withSizes: bitsPerComponents decodeWith: anArray
]

{ #category : #accessing }
PtICCBased >> defaultBlack [
	^self stream Alternate defaultBlack
]

{ #category : #accessing }
PtICCBased >> defaultDecodeArray [
	^self stream Range
]

{ #category : #accessing }
PtICCBased >> initialColourValues [
	"the initial colour shall have all components equal to 0.0 unless that falls outside the intervals specified by the space’s Range entry, in which case the nearest valid value shall be substituted."

	^#(0.0)
]

{ #category : #accessing }
PtICCBased >> numberOfComponents [
	"given by the #N parameter in the ICC Profile stream"

	^self stream N asSmalltalkValue
]

{ #category : #accessing }
PtICCBased >> paletteFor: anImageXObject [
	^self stream Alternate paletteFor: anImageXObject
]

{ #category : #'accessing entries' }
PtICCBased >> stream [
	<type: #ICCProfileStream>
	<required>
	<attribute: 2 documentation: 'A dictionary containing parameters that further characterize the space. The entries in this dictionary have specific interpretations that depend on the colour space; some entries are required and some are optional.'>
	^self objectAt: 2
]

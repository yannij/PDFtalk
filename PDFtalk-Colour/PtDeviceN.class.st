"
PDF DeviceN Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.5, pp. 159.

DeviceN colour spaces (PDF 1.3) may contain an arbitrary number of colour components.
"
Class {
	#name : #PtDeviceN,
	#superclass : #PtSpecialColourSpace,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceN class >> maxNumberOfAttributes [
	^5
]

{ #category : #accessing }
PtDeviceN class >> numberOfAttributes [
	^4
]

{ #category : #accessing }
PtDeviceN class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #DeviceN
		supertype: #ColourSpace
		version: #(1 3)
		section: '8.6.6.5'
		documentation: 'DeviceN colour spaces may contain an arbitrary number of colour components.'
]

{ #category : #'accessing entries' }
PtDeviceN >> alternateSpace [
	<type: #DeviceColourSpace>
	<type: #CIEColourSpace>
	<required>
	<attribute: 3 documentation: 'When the colour space is set to a DeviceN space, if any of the component names in the colour space do not correspond to a colorant available on the device, the conforming reader shall perform subsequent painting operations in the alternate colour space specified by this parameter.

For NChannel colour spaces, the components shall be evaluated individually; that is, only the ones not present on the output device shall use the alternate colour space.'>
	^self objectAt: 3
]

{ #category : #accessing }
PtDeviceN >> alternativeDeviceColorspace [
	^self alternateSpace alternativeDeviceColorspace
]

{ #category : #'accessing entries' }
PtDeviceN >> attributes [
	<type: #DeviceNColourSpaceAttributes>
	<attribute: 5 documentation: 'The optional attributes parameter shall be a dictionary containing additional information about the components of colour space that conforming readers may use.
Conforming readers need not use the alternateSpace and tintTransform parameters, and may instead use custom blending algorithms, along with other information provided in the attributes dictionary if present.
(If the value of the Subtype entry in the attributes dictionary is NChannel, such information shall be present.)
However, alternateSpace and tintTransform shall always be provided for conforming readers that want to use them or do not support PDF 1.6.'>
	^self objectAt: 5
]

{ #category : #accessing }
PtDeviceN >> defaultDecodeArray [
	| list |
	list := OrderedCollection new.
	self numberOfComponents timesRepeat: [list addAll: #(0.0 1.0)].
	^list asPDF
]

{ #category : #accessing }
PtDeviceN >> initialColourValues [
	^#(0.0)
]

{ #category : #'accessing entries' }
PtDeviceN >> names [
	<typeArrayOf: #Name>
	<required>
	<attribute: 2 documentation: 'The names parameter shall be an array of name objects specifying the individual colour components.
The length of the array shall determine the number of components in the DeviceN colour space, which is subject to an implementation limit.
The component names shall all be different from one another, except for the name None, which may be repeated.
The special name All, used by Separation colour spaces, shall not be used.'>
	^self objectAt: 2
]

{ #category : #accessing }
PtDeviceN >> numberOfComponents [
	^self names size
]

{ #category : #'accessing entries' }
PtDeviceN >> tintTransform [
	<type: #Function>
	<required>
	<attribute: 4 documentation: 'The tintTransform parameter shall specify a function that is used to transform the tint values into the alternate colour space.
It shall be called with n tint values and returns m colour component values, where n is the number of components needed to specify a colour in the DeviceN colour space and m is the number required by the alternate colour space.'>
	^self objectAt: 4
]

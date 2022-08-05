"
PDF DeviceN Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.5, pp. 161.

A dictionary that describes the process colour space whose components are included in the DeviceN colour space
"
Class {
	#name : #PtDeviceNProcessDictionary,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceNProcessDictionary class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #DeviceNProcessDictionary
		supertype: #Dictionary
		section: '8.6.6.5'
		documentation: 'A dictionary that describes the process colour space whose components are included in the DeviceN colour space'
]

{ #category : #'accessing entries' }
PtDeviceNProcessDictionary >> ColorSpace [
	<type: #DeviceColourSpace>
	<type: #CIEColourSpace>
	<required>
	<attribute: 1 documentation: 'If an ICCBased colour space is specified, it shall provide calibration information appropriate for the process colour components specified in the names array of the DeviceN colour space'>
	^self objectAt: #ColorSpace
]

{ #category : #'accessing entries' }
PtDeviceNProcessDictionary >> Components [
	<typeArrayOf: #Name>
	<required>
	<attribute: 2 documentation: 'An array of component names that correspond, in order, to the components of the process colour space specified in ColorSpace.
For example, an RGB colour space shall have three names corresponding to red, green, and blue.
The names may be arbitrary (that is, not the same as the standard names for the colour space components) and shall match those specified in the names array of the DeviceN colour space, even if all components are not present in the names array'>
	^self objectAt: #Components
]

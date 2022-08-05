"
PDF DeviceN Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.5, pp. 161.

The optional attributes parameter shall be a dictionary containing additional information about the components of colour space that conforming readers may use.
Conforming readers need not use the alternateSpace and tintTransform parameters, and may instead use custom blending algorithms, along with other information provided in the attributes dictionary if present. (If the value of the Subtype entry in the attributes dictionary is NChannel, such information shall be present.)
However, alternateSpace and tintTransform shall always be provided for conforming readers that want to use them or do not support PDF 1.6.

"
Class {
	#name : #PtDeviceNColourSpaceAttributes,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceNColourSpaceAttributes class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #DeviceNColourSpaceAttributes
		supertype: #Dictionary
		version: #(1 3)
		section: '8.6.6.5'
		documentation: 'The optional attributes parameter shall be a dictionary containing additional information about the components of colour space that conforming readers may use.
Conforming readers need not use the alternateSpace and tintTransform parameters, and may instead use custom blending algorithms, along with other information provided in the attributes dictionary if present. (If the value of the Subtype entry in the attributes dictionary is NChannel, such information shall be present.)
However, alternateSpace and tintTransform shall always be provided for conforming readers that want to use them or do not support PDF 1.6.'
]

{ #category : #'accessing entries' }
PtDeviceNColourSpaceAttributes >> Colorants [
	<typeDictionaryOf: #Separation>
	<version: 1 dot: 6>
	<attribute: 2 documentation: '(Required if Subtype is NChannel and the colour space includes spot colorants; otherwise optional)
A dictionary describing the individual colorants that shall be used in the DeviceN colour space.
For each entry in this dictionary, the key shall be a colorant name and the value shall be an array defining a Separation colour space for that colorant.
The key shall match the colorant name given in that colour space.

This dictionary provides information about the individual colorants that may be useful to some conforming readers.
In particular, the alternate colour space and tint transformation function of a Separation colour space describe the appearance of that colorant alone, whereas those of a DeviceN colour space describe only the appearance of its colorants in combination.

If Subtype is NChannel, this dictionary shall have entries for all spot colorants in this colour space.
This dictionary may also include additional colorants not used by this colour space.'>
	^self objectAt: #Colorants ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtDeviceNColourSpaceAttributes >> MixingHints [
	<type: #Dictionary>
	<version: 1 dot: 6>
	<attribute: 3 documentation: 'A dictionary that specifies optional attributes of the inks that shall be used in blending calculations when used as an alternative to the tint transformation function.'>
	^self objectAt: #MixingHints ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtDeviceNColourSpaceAttributes >> Process [
	<type: #DeviceNProcessDictionary>
	<version: 1 dot: 6>
	<attribute: 3 documentation: '(Required if Subtype is NChannel and the colour space includes components of a process colour space, otherwise optional; PDF 1.6)
A dictionary that describes the process colour space whose components are included in this colour space.'>
	^self objectAt: #Process ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtDeviceNColourSpaceAttributes >> Subtype [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 1 documentation: 'A name specifying the preferred treatment for the colour space. Values shall be DeviceN or NChannel'>
	^self objectAt: #Subtype ifAbsent: [#DeviceN asPDF]
]

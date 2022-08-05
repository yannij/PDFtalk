"
PDF DeviceN Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6.5, pp. 161.

Provides information about the characteristics of colorants that may be used in blending calculations when the actual colorants are not available on the target device.
Conforming readers need not use this information
"
Class {
	#name : #PtDeviceNMixingHints,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Colour'
}

{ #category : #accessing }
PtDeviceNMixingHints class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #DeviceNMixingHints
		supertype: #Dictionary
		section: '8.6.6.5'
		documentation: 'Provides information about the characteristics of colorants that may be used in blending calculations when the actual colorants are not available on the target device.
Conforming readers need not use this information'
]

{ #category : #'accessing entries' }
PtDeviceNMixingHints >> DotGain [
	<typeDictionaryOf: #Function>
	<attribute: 3 documentation: 'A dictionary specifying the dot gain of inks that shall be used in blending calculations when used as an alternative to the tint transformation function.
Dot gain (or loss) represents the amount by which a printer’s halftone dots change as the ink spreads and is absorbed by paper.

For each entry, the key shall be a colorant name, and the value shall be a function that maps values in the range 0 to 1 to values in the range 0 to 1.
The dictionary may list colorants unused by this specific DeviceNinstance and need not list all colorants.
An entry with a key of Default shall specify a function to be used by all colorants for which a dot gain function is not explicitly specified.

Conforming readers may ignore values in this dictionary when other sources of dot gain information are available, such as ICC profiles associated with the process colour space or tint transformation functions associated with individual colorants.'>
	^self objectAt: #DotGain ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtDeviceNMixingHints >> PrintingOrder [
	<typeArrayOf: #Name>
	<requiredIf: #Solidities>
	<attribute: 2 documentation: 'An array of colorant names, specifying the order in which inks shall be laid down.
Each component in the names array of the DeviceN colour space shall appear in this array (although the order is unrelated to the order specified in the namesarray).
This entry may also list colorants unused by this specific DeviceN instance.'>
	^self objectAt: #PrintingOrder ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtDeviceNMixingHints >> Solidities [
	<typeDictionaryOf: #Number>
	<attribute: 1 documentation: 'A dictionary specifying the solidity of inks that shall be used in blending calculations when used as an alternative to the tint transformation function. For each entry, the key shall be a colorantname, and the value shall be a number between 0.0 and 1.0.
This dictionary need not contain entries for all colorants used in this colour space; it may also include additional colorants not used by this colour space.

A value of 1.0 simulates an ink that completely covers the inks beneath; a value of 0.0 simulates a transparent ink that completely reveals the inks beneath.
An entry with a key of Default specifies a value that shall be used by all components in the associated DeviceN colour space for which a solidity value is not explicitly provided.
If Default is not present, the default value for unspecified colorants shall be 0.0; conforming readers may choose to use other values.
If this entry is present, PrintingOrder shall also be present.'>
	^self objectAt: #Solidities ifAbsent: [PtPDF Dictionary empty]
]

"
PDF OutputIntent as defined in PDF 32000_2008.pdf pp. 633.

Output intents (PDF 1.4) provide a means for matching the colour characteristics of a PDF document with 
those of a target output device or production environment in which the document will be printed. 
The optional OutputIntents entry in the document catalogue holds an array of output intent dictionaries, 
each describing the colour reproduction characteristics of a possible output device or production condition. 
The contents of these dictionaries may vary for different devices and conditions. 
The dictionary’s Sentry specifies an output intent subtype that determines the format and meaning of the remaining entries.

NOTE 1
This use of multiple output intents allows the production process to be customized to the expected workflow and the specific tools available. 
For example, one production facility might process files conforming to a recognized standard such as PDF/X-1, 
while another uses the PDF/A standard to produce RGB output for document distribution on the Web. 
Each of these workflows would require different sets of output intent information. 
Multiple output intents also allow the same PDF file to be distributed unmodified to multiple production facilities. 
The choice of which output intent to use in a given production environment is a matter for agreement between the purchaser and provider of production services. 
PDF intentionally does not include a selector for choosing a particular output intent from within the PDF file.

At the time of publication, three output intent subtypes have been defined: 
	GTS_PDFX corresponding to the PDF/X format standard specified in ISO 15930, 
	GTS_PDFA1 corresponding to the PDF/A standard as defined by ISO 19005, and 
	ISO_PDFE1 corresponding to the PDF/E standard as defined by ISO 24517. 

Other subtypes may be added in the future; the names of any such additional subtypes shall conform to the naming guidelines.
"
Class {
	#name : #PtOutputIntent,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtOutputIntent class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OutputIntent
		supertype: #Dictionary
		version: #(1 4)
		section: '14.11.6'
		documentation: 'Output intents provide a means for matching the colour characteristics of a PDF document with 
those of a target output device or production environment in which the document will be printed. 
The optional OutputIntents entry in the document catalogue holds an array of output intent dictionaries, 
each describing the colour reproduction characteristics of a possible output device or production condition. 
The contents of these dictionaries may vary for different devices and conditions. 
The dictionary’s Sentry specifies an output intent subtype that determines the format and meaning of the remaining entries.

NOTE 1
This use of multiple output intents allows the production process to be customized to the expected workflow and the specific tools available. 
For example, one production facility might process files conforming to a recognized standard such as PDF/X-1, 
while another uses the PDF/A standard to produce RGB output for document distribution on the Web. 
Each of these workflows would require different sets of output intent information. 
Multiple output intents also allow the same PDF file to be distributed unmodified to multiple production facilities. 
The choice of which output intent to use in a given production environment is a matter for agreement between the purchaser and provider of production services. 
PDF intentionally does not include a selector for choosing a particular output intent from within the PDF file.

At the time of publication, three output intent subtypes have been defined: 
	GTS_PDFX corresponding to the PDF/X format standard specified in ISO 15930, 
	GTS_PDFA1 corresponding to the PDF/A standard as defined by ISO 19005, and 
	ISO_PDFE1 corresponding to the PDF/E standard as defined by ISO 24517. 

Other subtypes may be added in the future; the names of any such additional subtypes shall conform to the naming guidelines.'
]

{ #category : #'accessing entries' }
PtOutputIntent >> DestOutputProfile [
	<type: #Stream>
	<attribute: 6 documentation: '(Required if OutputConditionIdentifier does not specify a standard production condition; optional otherwise) 
An ICC profile stream defining the transformation from the PDF document’s source colours to output device colorants.

The format of the profile stream is the same as that used in specifying an ICCBased colour space. 
The output transformation uses the profile’s “from CIE” information (BToA in ICC terminology); 
the “to CIE” (AToB) information may optionally be used to remap source colour values to 
some other destination colour space, such as for screen preview or hardcopy proofing.'>
	^self objectAt: #DestOutputProfile
]

{ #category : #'accessing entries' }
PtOutputIntent >> Info [
	<type: #String>
	<attribute: 5 documentation: '(Required if OutputConditionIdentifier does not specify a standard production condition; optional otherwise) 
A human-readable text string containing additional information or comments about the intended target device or production condition.'>
	^self objectAt: #Info ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtOutputIntent >> OutputCondition [
	<type: #String>
	<attribute: 2 documentation: 'A text string concisely identifying the intended output device or production condition in human-readable form. 
This is the preferred method of defining such a string for presentation to the user.'>
	^self objectAt: #OutputCondition ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtOutputIntent >> OutputConditionIdentifier [
	<type: #String>
	<required>
	<attribute: 3 documentation: 'A text string identifying the intended output device or production condition in human- or machine-readable form. 
If human-readable, this string may be used in lieu of an OutputCondition string for presentation to the user.

A typical value for this entry may be the name of a production condition maintained in an industry-standard registry 
such as the ICC Characterization Data Registry (see the Bibliography). 
If the designated condition matches that in effect at production time, 
the production software is responsible for providing the corresponding ICC profile as defined in the registry.

If the intended production condition is not a recognized standard, 
the value of this entry may be Custom or an application-specific, machine-readable name. 
The DestOutputProfile entry defines the ICC profile, and the Info entry shall be used for further human-readable identification.'>
	^self objectAt: #OutputConditionIdentifier
]

{ #category : #'accessing entries' }
PtOutputIntent >> RegistryName [
	<type: #String>
	<attribute: 4 documentation: 'An text string (conventionally a uniform resource identifier, or URI) identifying the registry in which the condition designated by OutputConditionIdentifier is defined.'>
	^self objectAt: #RegistryName ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtOutputIntent >> S [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The output intent subtype; shall be either one of GTS_PDFX, GTS_PDFA1, ISO_PDFE1 or a key defined by an ISO 32000 extension.'>
	^self objectAt: #S
]

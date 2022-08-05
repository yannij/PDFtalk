"
PDF Group XObjects as defined in PDF 32000_2008.pdf, section 8.10.3, pp. 220.

Every group XObject shall have a group subtype (specified by the S entry in the group attributes dictionary) that determines the format and meaning of the dictionary’s remaining entries. This specification only defines one subtype, a transparency group XObject (subtype Transparency) representing a transparency group for use in the transparent imaging model.
"
Class {
	#name : #PtGroupAttributes,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-XObjects'
}

{ #category : #accessing }
PtGroupAttributes class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #GroupAttributes
		supertype: #Dictionary
		version: #(1 4)
		section: '8.10.3'
		documentation: 'Every group XObject shall have a group subtype (specified by the S entry in the group attributes dictionary) that determines the format and meaning of the dictionary’s remaining entries. 
This specification only defines one subtype, a transparency group XObject (subtype Transparency) representing a transparency group for use in the transparent imaging model.'
]

{ #category : #accessing }
PtGroupAttributes class >> type [
	^#Group
]

{ #category : #'accessing entries' }
PtGroupAttributes >> S [
	<type: #Name>
	<attribute: 2 documentation: 'The group subtype, which identifies the type of group whose attributes this dictionary describes and determines the format and meaning of the dictionary’s remaining entries. The only group subtype defined is Transparency'>
	<required>
	^self objectAt: #S
]

{ #category : #'accessing entries' }
PtGroupAttributes >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Group asPDF]
]

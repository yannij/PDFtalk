"
PDF Group XObjects as defined in PDF 32000_2008.pdf, section 8.10.3, pp. 220.

A group XObject (PDF 1.4) is a special type of form XObject that can be used to group graphical elements together as a unit for various purposes. It shall be distinguished by the presence of the optional Group entry in the form dictionary. The value of this entry shall be a subsidiary group attributes dictionary describing the properties of the group.
Every group XObject shall have a group subtype (specified by the S entry in the group attributes dictionary) that determines the format and meaning of the dictionary’s remaining entries. This specification only defines one subtype, a transparency group XObject (subtype Transparency) representing a transparency group for use in the transparent imaging model.

"
Class {
	#name : #PtGroup,
	#superclass : #PtFormXObject,
	#category : #'PDFtalk-XObjects'
}

{ #category : #testing }
PtGroup class >> isClassForStream: aStream [
	^(super isClassForStream: aStream) and: [
	aStream hasKey: #Group]
]

{ #category : #accessing }
PtGroup class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Group
		supertype: #XObject
		version: #(1 4)
		section: '8.10.3'
		documentation: 'A group XObject is a special type of form XObject that can be used to group graphical elements together as a unit for various purposes.
It shall be distinguished by the presence of the optional Group entry in the form dictionary.
The value of this entry shall be a subsidiary group attributes dictionary describing the properties of the group.

Every group XObject shall have a group subtype (specified by the S entry in the group attributes dictionary) that determines the format and meaning of the dictionary’s remaining entries.
This specification only defines one subtype, a transparency group XObject (subtype Transparency) representing a transparency group for use in the transparent imaging model.'
]

{ #category : #'accessing entries' }
PtGroup >> Group [
	<type: #GroupAttributes>
	<required>
	<version: 1 dot: 4>
	<attribute: 1 documentation: 'A group attributes dictionary indicating that the contents of the form XObject shall be treated 
as a group and specifying the attributes of that group.

If a Ref entry is present, the group attributes shall also apply to the external page imported by that entry, 
which allows such an imported page to be treated as a group without further modification.'>
	^self objectAt: #Group
]

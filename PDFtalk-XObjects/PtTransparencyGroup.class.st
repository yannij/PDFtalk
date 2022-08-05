"
PDF Transparency Group XObjects as defined in PDF 32000_2008.pdf, section 11.6.6, pp. 349.

A transparency group is represented in PDF as a special type of group XObject called a transparency group XObject. A group XObject is in turn a type of form XObject, distinguished by the presence of a Group entry in its form dictionary. The value of this entry is a subsidiary group attributes dictionary defining the properties of the group. The format and meaning of the dictionary’s contents shall be determined by its group subtype, which is specified by the dictionary’s S entry.
"
Class {
	#name : #PtTransparencyGroup,
	#superclass : #PtGroup,
	#category : #'PDFtalk-XObjects'
}

{ #category : #testing }
PtTransparencyGroup class >> isClassForStream: aStream [
	^(super isClassForStream: aStream) and: [
	((aStream at: #Group) content at: #S) asPDF = #Transparency asPDF]
]

{ #category : #accessing }
PtTransparencyGroup class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #TransparencyGroup
		supertype: #Group
		version: #(1 4)
		section: '11.6.6'
		documentation: 'A transparency group is represented in PDF as a special type of group XObject called a transparency group XObject. A group XObject is in turn a type of form XObject, distinguished by the presence of a Group entry in its form dictionary. The value of this entry is a subsidiary group attributes dictionary defining the properties of the group. The format and meaning of the dictionary’s contents shall be determined by its group subtype, which is specified by the dictionary’s S entry.'
]

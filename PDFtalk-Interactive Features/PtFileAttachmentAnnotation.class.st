"
PDF File Attachment Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.15, pp. 406.

A file attachment annotation contains a reference to a file, which typically shall be embedded in the PDF file.

NOTE	A table of data might use a file attachment annotation to link to a spreadsheet file based on that data; activating the annotation extracts the embedded file and gives the user an opportunity to view it or store it in the file system.

The Contents entry of the annotation dictionary may specify descriptive text relating to the attached file.
Conforming readers shall use this entry rather than the optional Desc entry in the file specification dictionary identified by the annotation’s FS entry.
"
Class {
	#name : #PtFileAttachmentAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtFileAttachmentAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FileAttachmentAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.15'
		documentation: 'A file attachment annotation contains a reference to a file, which typically shall be embedded in the PDF file.

NOTE	A table of data might use a file attachment annotation to link to a spreadsheet file based on that data; activating the annotation extracts the embedded file and gives the user an opportunity to view it or store it in the file system.

The Contents entry of the annotation dictionary may specify descriptive text relating to the attached file.
Conforming readers shall use this entry rather than the optional Desc entry in the file specification dictionary identified by the annotation’s FS entry.'
]

{ #category : #accessing }
PtFileAttachmentAnnotation class >> subtype [
	^#FileAttachment
]

{ #category : #'accessing entries' }
PtFileAttachmentAnnotation >> FS [
	<type: #FileSpecification>
	<required>
	<attribute: 1 documentation: 'The file associated with this annotation.'>
	^self objectAt: #FS
]

{ #category : #'accessing entries' }
PtFileAttachmentAnnotation >> Name [
	<type: #Name>
	<attribute: 2 documentation: 'The name of an icon that shall be used in displaying the annotation.
Conforming readers shall provide predefined icon appearances for at least the following standard names:
	GraphPushPin
	PaperclipTag
Additional names may be supported as well.
The annotation dictionary’s AP entry, if present, shall take precedence over the Name entry.'>
	^self objectAt: #Name ifAbsent: [#PushPin asPDF]
]

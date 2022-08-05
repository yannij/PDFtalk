"
PDF Rubber Stamp Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.12, pp. 404.

A rubber stamp annotation displays text or graphics intended to look as if they were stamped on the page with a rubber stamp.
When opened, it shall display a pop-up window containing the text of the associated note.
"
Class {
	#name : #PtStampAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtStampAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #StampAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.12'
		documentation: 'A rubber stamp annotation displays text or graphics intended to look as if they were stamped on the page with a rubber stamp.
When opened, it shall display a pop-up window containing the text of the associated note.'
]

{ #category : #accessing }
PtStampAnnotation class >> subtype [
	^#Stamp
]

{ #category : #'accessing entries' }
PtStampAnnotation >> Name [
	<type: #Name>
	<attribute: 1 documentation: 'The name of an icon that shall be used in displaying the annotation.
Conforming readers shall provide predefined icon appearances for at least the following standard names:
	Approved, Experimental, NotApproved, AsIs, Expired, 
	NotForPublicRelease, Confidential, Final, Sold, Departmental, 
	ForComment, TopSecret, Draft, ForPublicRelease
Additional names may be supported as well.
The annotation dictionary’s AP entry, if present, shall take precedence over the Name entry.'>
	^self objectAt: #Name ifAbsent: [#Draft asPDF]
]

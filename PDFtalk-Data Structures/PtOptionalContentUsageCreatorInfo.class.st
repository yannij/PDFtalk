"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.4.4, pp. 232.

A dictionary used by the creating application to store application-specific data associated with this optional content group.
It shall contain two required entries:
	Creator 		A text string specifying the application that created the group.
	Subtype 	A name defining the type of content controlled by the group. Suggested values include but shall not be limited to Artwork, for graphic-design or publishing applications, and Technical, for technical designs such as building plans or schematics.

Additional entries may be included to present information relevant to the creating application or related applications
"
Class {
	#name : #PtOptionalContentUsageCreatorInfo,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentUsageCreatorInfo class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentUsageCreatorInfo
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.4.4'
		documentation: 'A dictionary used by the creating application to store application-specific data associated with this optional content group.
It shall contain two required entries:
	Creator 		A text string specifying the application that created the group.
	Subtype 	A name defining the type of content controlled by the group. Suggested values include but shall not be limited to Artwork, for graphic-design or publishing applications, and Technical, for technical designs such as building plans or schematics.

Additional entries may be included to present information relevant to the creating application or related applications'
]

{ #category : #'accessing entries' }
PtOptionalContentUsageCreatorInfo >> Creator [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'A text string specifying the application that created the group'>
	^self objectAt: #Creator
]

{ #category : #'accessing entries' }
PtOptionalContentUsageCreatorInfo >> Subtype [
	<type: #Name>
	<attribute: 2 documentation: 'A name defining the type of content controlled by the group.
Suggested values include but shall not be limited to Artwork, for graphic-design or publishing applications, and Technical, for technical designs such as building plans or schematics'>
	^self objectAt: #Subtype
]

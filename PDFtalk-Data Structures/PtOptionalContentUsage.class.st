"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.4.4, pp. 232.

Optional content groups are typically constructed to control the visibility of graphic objects that are related in some way.
Objects can be related in several ways; for example, a group may contain content in a particular language or content suitable for viewing at a particular magnification.

An optional content group’s usage dictionary (the value of the Usage entry in an optional content group dictionary) shall contain information describing the nature of the content controlled by the group
"
Class {
	#name : #PtOptionalContentUsage,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentUsage class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentUsage
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.4.4'
		documentation: 'Optional content groups are typically constructed to control the visibility of graphic objects that are related in some way.
Objects can be related in several ways; for example, a group may contain content in a particular language or content suitable for viewing at a particular magnification.

An optional content group’s usage dictionary (the value of the Usage entry in an optional content group dictionary) shall contain information describing the nature of the content controlled by the group'
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> CreatorInfo [
	<type: #OptionalContentUsageCreatorInfo>
	<attribute: 1 documentation: 'A dictionary used by the creating application to store application-specific data associated with this optional content group.
It shall contain two required entries:
	Creator 	A text string specifying the application that created the group.
	Subtype 	A name defining the type of content controlled by the group. Suggested values include but shall not be limited to Artwork, for graphic-design or publishing applications, and Technical, for technical designs such as building plans or schematics.

Additional entries may be included to present information relevant to the creating application or related applications.
Groups whose Intent entry contains Design typically include a CreatorInfo entry.'>
	^self objectAt: #CreatorInfo ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> Export [
	<type: #Dictionary>
	<attribute: 3 documentation: 'A dictionary containing one entry, ExportState, a name whose value shall be either ON or OFF.
This value shall indicate the recommended state for content in this group when the document (or part of it) is saved by a conforming reader to a format that does not support optional content (for example, a raster image format).'>
	^self objectAt: #Export ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> Language [
	<type: #OptionalContentUsageLanguage>
	<attribute: 2 documentation: 'A dictionary specifying the language of the content controlled by this optional content group.
It may contain the following two entries:
	Lang (required) 		A text string that specifies a language and possibly a locale. For example, es-MX represents Mexican Spanish.
	Preferred (optional) 	A name whose values shall be either ON or OFF. Default value: OFF. It shall be used by conforming readers when there is a partial match but no exact match between the system language and the language strings in all usage dictionaries'>
	^self objectAt: #Language ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> PageElement [
	<type: #Dictionary>
	<attribute: 8 documentation: 'A dictionary declaring that the group contains a pagination artifact.
It shall contain one entry, Subtype, whose value shall be a name that is either
	HF (header/footer), 
	FG (foreground image or graphic), 
	BG (background image or graphic), or 
	L (logo)'>
	^self objectAt: #PageElement ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> Print [
	<type: #Dictionary>
	<attribute: 5 documentation: 'A dictionary specifying that the content in this group is shall be used when printing.
It may contain the following optional entries:
	Subtype 	A name object specifying the kind of content controlled by the group; for example, Trapping, PrintersMarks and Watermark.
	PrintState 	A name that shall be either ON or OFF, indicating that the group shall be set to that state when the document is printed from a conforming reader'>
	^self objectAt: #Print ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> User [
	<type: #Dictionary>
	<attribute: 7 documentation: 'A dictionary specifying one or more users for whom this optional content group is primarily intended.
Each dictionary shall have two required entries:
	Type 	A name object that shall be either Ind (individual), Ttl (title), or Org (organization).
	Name 	A text string or array of text strings representing the name(s) of the individual, position or organization'>
	^self objectAt: #User ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> View [
	<type: #Dictionary>
	<attribute: 6 documentation: 'A dictionary that shall have a single entry, ViewState, a name that shall have a value of either ON or OFF, indicating that the group shall be set to that state when the document is opened in a conforming reader.'>
	^self objectAt: #View ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOptionalContentUsage >> Zoom [
	<type: #Dictionary>
	<attribute: 4 documentation: 'A dictionary specifying a range of magnifications at which the content in this optional content group is best viewed.
It shall contain one or both of the following entries:
	min 	The minimum recommended magnification factor at which the group shall be ON. Default value: 0.
	max 	The magnification factor below which the group shall be ON. Default value: infinity'>
	^self objectAt: #Zoom ifAbsent: [PtPDF Dictionary empty]
]

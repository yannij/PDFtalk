"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.4.4, pp. 232.

A dictionary specifying the language of the content controlled by this optional content group.
It may contain the following two entries:
	Lang (required) 		A text string that specifies a language and possibly a locale. For example, es-MX represents Mexican Spanish.
	Preferred (optional) 	A name whose values shall be either ON or OFF. Default value: OFF. It shall be used by conforming readers when there is a partial match but no exact match between the system language and the language strings in all usage dictionaries
"
Class {
	#name : #PtOptionalContentUsageLanguage,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentUsageLanguage class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentUsageLanguage
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.4.4'
		documentation: 'A dictionary specifying the language of the content controlled by this optional content group.
It may contain the following two entries:
	Lang (required) 		A text string that specifies a language and possibly a locale. For example, es-MX represents Mexican Spanish.
	Preferred (optional) 	A name whose values shall be either ON or OFF. Default value: OFF. It shall be used by conforming readers when there is a partial match but no exact match between the system language and the language strings in all usage dictionaries'
]

{ #category : #'accessing entries' }
PtOptionalContentUsageLanguage >> Lang [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'A text string that specifies a language and possibly a locale.
For example, es-MX represents Mexican Spanish'>
	^self objectAt: #Lang
]

{ #category : #'accessing entries' }
PtOptionalContentUsageLanguage >> Preferred [
	<type: #Name>
	<attribute: 2 documentation: 'A name whose values shall be either ON or OFF.
It shall be used by conforming readers when there is a partial match but no exact match between the system language and the language strings in all usage dictionaries'>
	^self objectAt: #Preferred ifAbsent: [#OFF asPDF]
]

"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.4.4, pp. 233.

A usage application dictionary specifies the rules for which usage entries shall be used by conforming readers to automatically manipulate the state of optional content groups, which groups shall be affected, and under which circumstances.

Usage application dictionaries shall only be used by interactive conforming readers, and shall not be used by applications that use PDF as final form output
"
Class {
	#name : #PtOptionalContentUsageApplication,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentUsageApplication class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentUsageApplication
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.4.4'
		documentation: 'A usage application dictionary specifies the rules for which usage entries shall be used by conforming readers to automatically manipulate the state of optional content groups, which groups shall be affected, and under which circumstances.

Usage application dictionaries shall only be used by interactive conforming readers, and shall not be used by applications that use PDF as final form output'
]

{ #category : #'accessing entries' }
PtOptionalContentUsageApplication >> Category [
	<typeArrayOf: #Name>
	<attribute: 3 documentation: 'An array of names, each of which corresponds to a usage dictionary entry.
When managing the states of the optional content groups in the OCGs array, each of the corresponding categories in the group’s usage dictionary shall be considered.'>
	^self objectAt: #Category ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentUsageApplication >> Creator [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'A text string specifying the application that created the group'>
	^self objectAt: #Creator
]

{ #category : #'accessing entries' }
PtOptionalContentUsageApplication >> Event [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'A name defining the situation in which this usage application dictionary should be used.
Shall be one of View, Print, or Export'>
	^self objectAt: #Event
]

{ #category : #'accessing entries' }
PtOptionalContentUsageApplication >> OCGs [
	<typeArrayOf: #OptionalContentGroup>
	<attribute: 2 documentation: 'An array listing the optional content groups that shall have their states automatically managed based on information in their usage dictionary'>
	^self objectAt: #OCGs ifAbsent: [#() asPDF]
]

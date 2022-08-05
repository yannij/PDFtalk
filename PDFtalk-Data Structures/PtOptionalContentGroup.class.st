"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.2.1, pp. 222.

An optional content group is a dictionary representing a collection of graphics that can be made visible or invisible dynamically by users of conforming readers.
The graphics belonging to such a group may reside anywhere in the document: they need not be consecutive in drawing order, nor even belong to the same content stream
"
Class {
	#name : #PtOptionalContentGroup,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentGroup class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentGroup
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.2'
		documentation: 'An optional content group is a dictionary representing a collection of graphics that can be made visible or invisible dynamically by users of conforming readers.
The graphics belonging to such a group may reside anywhere in the document: they need not be consecutive in drawing order, nor even belong to the same content stream'
]

{ #category : #accessing }
PtOptionalContentGroup class >> resourcePrefix [
	^'MC'
]

{ #category : #accessing }
PtOptionalContentGroup class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#Properties
]

{ #category : #accessing }
PtOptionalContentGroup class >> type [
	^#OCG
]

{ #category : #'accessing entries' }
PtOptionalContentGroup >> Intent [
	<type: #Name>
	<typeArrayOf: #Name>
	<attribute: 2 documentation: 'A single intent name or an array containing any combination of names.
PDF defines two names, View and Design, that may indicate the intended use of the graphics in the group.
A conforming reader may choose to use only groups that have a specific intent and ignore others'>
	^self objectAt: #Intent ifAbsent: [#View asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentGroup >> Name [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'The name of the optional content group, suitable for presentation in a reader’s user interface'>
	^self objectAt: #Name
]

{ #category : #'accessing entries' }
PtOptionalContentGroup >> Usage [
	<type: #OptionalContentUsage>
	<attribute: 3 documentation: 'A usage dictionary describing the nature of the content controlled by the group.
It may be used by features that automatically control the state of the group based on outside factors'>
	^self objectAt: #Usage ifAbsent: [PtPDF Dictionary empty]
]

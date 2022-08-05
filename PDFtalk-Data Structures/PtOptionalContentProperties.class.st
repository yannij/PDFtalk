"
PDF Optional Content as defined in PDF 32000_2008.pdf section 8.11.4.2, pp. 228.

The optional OCProperties entry in the document catalog shall contain, when present, the optional content properties dictionary, which contains a list of all the optional content groups in the document, as well as information about the default and alternate configurations for optional content.
This dictionary shall be present if the file contains any optional content; if it is missing, a conforming reader shall ignore any optional content structures in the document
"
Class {
	#name : #PtOptionalContentProperties,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #accessing }
PtOptionalContentProperties class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #OptionalContentProperties
		supertype: #Dictionary
		version: #(1 5)
		section: '8.11.4.2'
		documentation: 'The optional OCProperties entry in the document catalog shall contain, when present, the optional content properties dictionary, which contains a list of all the optional content groups in the document, as well as information about the default and alternate configurations for optional content.
This dictionary shall be present if the file contains any optional content; if it is missing, a conforming reader shall ignore any optional content structures in the document'
]

{ #category : #'accessing entries' }
PtOptionalContentProperties >> Configs [
	<typeArrayOf: #OptionalContentConfiguration>
	<attribute: 3 documentation: 'An array of alternate optional content configuration dictionaries'>
	^self objectAt: #Configs ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOptionalContentProperties >> D [
	<type: #OptionalContentConfiguration>
	<required>
	<attribute: 2 documentation: 'The default viewing optional content configuration dictionary'>
	^self objectAt: #D
]

{ #category : #'accessing entries' }
PtOptionalContentProperties >> OCGs [
	<typeArrayOf: #Reference>
	<required>
	<attribute: 1 documentation: 'An array of indirect references to all the optional content groups in the document, in any order.
Every optional content group shall be included in this array'>
	^self objectAt: #OCGs
]

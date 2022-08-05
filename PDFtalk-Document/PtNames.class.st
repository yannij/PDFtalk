"
PDF Names as defined in PDF 32000_2008.pdf pp. 80.

Some categories of objects in a PDF file can be referred to by name rather than by object reference.
The correspondence between names and objects is established by the document’s name dictionary (PDF 1.2), located by means of the Names entry in the document’s catalog.
Each entry in this dictionary designates the root of a name tree defining names for a particular category of objects.
"
Class {
	#name : #PtNames,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtNames class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Names
		supertype: #Dictionary
		version: #(1 2)
		section: '7.7.4'
		documentation: 'A PDF document may include general information, such as the document’s title, author, and creation and modification dates. 
Such global information about the document (as opposed to its content or structure) is called metadata and is intended to assist in cataloguing and searching for documents in external databases. 
Beginning with PDF 1.4, metadata may also be specified for individual components of a document.

Metadata may be stored in a PDF document in either of the following ways:

	•	In a metadata stream (PDF 1.4) associated with the document or a component of the document (14.3.2, “Metadata Streams”)
	•	In a document information dictionary associated with the document (14.3.3, “Document Information Dictionary”)

NOTE
Document information dictionaries is the original way that metadata was included in a PDF file. 
Metadata streams were introduced in PDF 1.4 and is now the preferred method to include metadata.

Metadata Streams

Metadata, both for an entire document and for components within a document, may be stored in PDF streams called metadata streams (PDF 1.4).

NOTE 1
Metadata streams have the following advantages over the document information dictionary:
	•	PDF-based workflows often embed metadata-bearing artwork as components within larger documents. 
		Metadata streams provide a standard way of preserving the metadata of these components for examination downstream. 
		PDF-aware conforming products should be able to derive a list of all metadata-bearing document components from the PDF document itself.
	•	PDF documents are often made available on the Web or in other environments, where many tools routinely examine, catalogue, and classify documents. 
		These tools should be able to understand the self-contained description of the document even if they do not understand PDF.

Besides the usual entries common to all stream dictionaries, the metadata stream dictionary shall contain additional entries.
The contents of a metadata stream shall be the metadata represented in Extensible Markup Language (XML).

NOTE 2
This information is visible as plain text to tools that are not PDF-aware only if the metadata stream is both unfiltered and unencrypted.'
]

{ #category : #'accessing entries' }
PtNames >> AP [
	<type: #NameTree>
	<version: 1 dot: 3>
	<attribute: 2 documentation: 'A name tree mapping name strings to annotation appearance streams.'>
	^self objectAt: #AP ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> AlternatePresentations [
	<type: #NameTree>
	<version: 1 dot: 4>
	<attribute: 9 documentation: 'A name tree mapping name strings to alternate presentations.'>
	^self objectAt: #AlternatePresentations ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> Dests [
	<typeNameTreeOf: #Destination>
	<version: 1 dot: 2>
	<attribute: 1 documentation: 'A name tree mapping name strings to destinations.'>
	^self objectAt: #Dests ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> EmbeddedFiles [
	<typeNameTreeOf: #FileSpecification>
	<version: 1 dot: 4>
	<attribute: 8 documentation: 'A name tree mapping name strings to file specifications for embedded file streams.'>
	^self objectAt: #EmbeddedFiles ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> IDS [
	<type: #NameTree>
	<version: 1 dot: 3>
	<attribute: 6 documentation: 'A name tree mapping digital identifiers to Web Capture content sets.'>
	^self objectAt: #IDS ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> JavaScript [
	<type: #NameTree>
	<version: 1 dot: 3>
	<attribute: 3 documentation: 'A name tree mapping name strings to document-level JavaScript actions.'>
	^self objectAt: #JavaScript ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> Pages [
	<type: #NameTree>
	<version: 1 dot: 3>
	<attribute: 4 documentation: 'A name tree mapping name strings to visible pages for use in interactive forms.'>
	^self objectAt: #Pages ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> Renditions [
	<type: #NameTree>
	<version: 1 dot: 5>
	<attribute: 10 documentation: 'A name tree mapping name strings (which shall have Unicode encoding) to rendition objects.'>
	^self objectAt: #Renditions ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> Templates [
	<type: #NameTree>
	<version: 1 dot: 3>
	<attribute: 5 documentation: 'A name tree mapping name strings to invisible (template) pages for use in interactive forms.'>
	^self objectAt: #Templates ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

{ #category : #'accessing entries' }
PtNames >> URLS [
	<type: #NameTree>
	<version: 1 dot: 3>
	<attribute: 7 documentation: 'A name tree mapping uniform resource locators (URLs) to Web Capture content sets'>
	^self objectAt: #URLS ifAbsent: [(PtPDF classAt: #NameTree) empty]
]

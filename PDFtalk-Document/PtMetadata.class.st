"
PDF Metadata as defined in PDF 32000_2008.pdf pp. 548.

A PDF document may include general information, such as the document’s title, author, and creation and modification dates. 
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
This information is visible as plain text to tools that are not PDF-aware only if the metadata stream is both unfiltered and unencrypted.
"
Class {
	#name : #PtMetadata,
	#superclass : #PtTypedStream,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtMetadata class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Metadata
		supertype: #Stream
		version: #(1 4)
		section: '14.3'
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
PtMetadata >> Subtype [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The type of metadata stream that this dictionary describes; shall be XML.'>
	^self objectAt: #Subtype
]

"
PDF Document Information Dictionary object as defined in PDF 32000_2008.pdf pp. 549.

The optional Info entry in the trailer of a PDF file (see Trailer) shall hold a document information dictionary containing metadata for the document.
Any entry whose value is not known should be omitted from the dictionary rather than included with an empty string as its value.

Some conforming readers may choose to permit searches on the contents of the document information dictionary.
To facilitate browsing and editing, all keys in the dictionary shall be fully spelled out, not abbreviated.
New keys should be chosen with care so that they make sense to users.

The value associated with any key not specifically mentioned in Table 317 shall be a text string.

Although conforming readers may store custom metadata in the document information dictionary, they may not store private content or structural information there.
Such information shall be stored in the document catalogue instead (see Catalog).
"
Class {
	#name : #PtDocumentInformation,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Files'
}

{ #category : #'instance creation' }
PtDocumentInformation class >> empty [
	"<DocumentInformation>
	basic infos of a generated PDF.
	The following information should be added by the application:
		#Title a Textstring with the document’s title.
		#Author a Textstring with the name of the person who created the document.
		#Creator a Textstring with the name of the application that created the document.
	Also, #Subject and #Keywords may be useful"

	| inst timestamp |
	inst := super empty.
	timestamp := Timestamp now.
	inst at: #CreationDate put: timestamp.
	inst at: #ModDate put: timestamp.
	inst at: #Producer put: PtPDF producerText.
	^inst
]

{ #category : #accessing }
PtDocumentInformation class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #DocumentInformation
		supertype: #Dictionary
		section: '14.3.3'
		documentation: 'The optional Info entry in the trailer of a PDF file (see Trailer) shall hold a document information dictionary containing metadata for the document.
Any entry whose value is not known should be omitted from the dictionary rather than included with an empty string as its value.

Some conforming readers may choose to permit searches on the contents of the document information dictionary.
To facilitate browsing and editing, all keys in the dictionary shall be fully spelled out, not abbreviated.
New keys should be chosen with care so that they make sense to users.

The value associated with any key not specifically mentioned in Table 317 shall be a text string.

Although conforming readers may store custom metadata in the document information dictionary, they may not store private content or structural information there.
Such information shall be stored in the document catalogue instead (see Catalog).'
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Author [
	<type: #String>
	<attribute: 2 documentation: 'The name of the person who created the document.'>
	^self objectAt: #Author ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> CreationDate [
	<type: #Date>
	<attribute: 7 documentation: 'The date and time the document was created, in human-readable form.'>
	^self objectAt: #CreationDate ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Creator [
	<type: #String>
	<attribute: 5 documentation: 'If the document was converted to PDF from another format, the name of the conforming product that created the original document from which it was converted.'>
	^self objectAt: #Creator ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> GTS_PDFXVersion [
	<type: #String>
	<version: 1 dot: 3>
	<attribute: 10 documentation: 'PDF/X conformance level identifier
	The value of the pdfxid:GTS_PDFXVersion property for PDF/X-4 files prepared in accordance with this part of ISO 15930 is PDF/X-4.'>
	^self objectAt: #GTS_PDFXVersion ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Keywords [
	<type: #String>
	<version: 1 dot: 1>
	<attribute: 4 documentation: 'Keywords associated with the document.'>
	^self objectAt: #Keywords ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> ModDate [
	<type: #Date>
	<version: 1 dot: 1>
	<attribute: 8 documentation: '(Required if PieceInfo is present in the document catalogue) 
The date and time the document was most recently modified, in human-readable form.'>
	^self objectAt: #ModDate ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Producer [
	<type: #String>
	<attribute: 6 documentation: 'If the document was converted to PDF from another format, the name of the conforming product that converted it to PDF.'>
	^self objectAt: #Producer ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Subject [
	<type: #String>
	<version: 1 dot: 1>
	<attribute: 3 documentation: 'The subject of the document.'>
	^self objectAt: #Subject ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Title [
	<type: #String>
	<attribute: 1 documentation: 'The document’s title.'>
	^self objectAt: #Title ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtDocumentInformation >> Trapped [
	<type: #Name>
	<version: 1 dot: 3>
	<attribute: 9 documentation: 'A name object indicating whether the document has been modified to include trapping information:
	True		The document has been fully trapped; no further trapping shall be needed. This shall be the name True, not the boolean value true.
	False		The document has not yet been trapped. This shall be the name False, not the boolean value false.
	Unknown	Either it is unknown whether the document has been trapped or it has been partly but not yet fully trapped; some additional trapping may still be needed.

NOTE
The value of this entry may be set automatically by the software creating the document’s trapping information, or it may be known only to a human operator and entered manually.'>
	^self objectAt: #Trapped ifAbsent: [#Unknown asPDF]
]

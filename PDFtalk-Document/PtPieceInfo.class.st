"
PDF Page-Piece Dictionaries as defined in PDF 32000_2008.pdf, section 14.5, pp. 551.

A page-piece dictionary (PDF 1.3) may be used to hold private conforming product data. The data may be associated with a page or form XObject by means of the optional PieceInfo entry in the page object or form dictionary. Beginning with PDF 1.4, private data may also be associated with the PDF document by means of the PieceInfo entry in the document catalogue.

NOTE 1		Conforming products may use this dictionary as a place to store private data in connection with that document, page, or form. Such private data can convey information meaningful to the conforming product that produces it (such as information on object grouping for a graphics editor or the layer information used by Adobe Photoshop®) but may be ignored by general-purpose conforming readers.

A page-piece dictionary may contain any number of entries, each keyed by the name of a distinct conforming product or of a well-known data type recognized by a family of conforming products. The value associated with each key shall be a data dictionary containing the private data that shall be used by the conforming product. The Private entry may have a value of any data type, but typically it is a dictionary containing all of the private data needed by the conforming product other than the actual content of the document, page, or form.

"
Class {
	#name : #PtPieceInfo,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtPieceInfo class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #PieceInfo
		supertype: #Dictionary
		version: #(1 3)
		section: '14.11.6'
		documentation: 'A page-piece dictionary (PDF 1.3) may be used to hold private conforming product data. The data may be associated with a page or form XObject by means of the optional PieceInfo entry in the page object or form dictionary. Beginning with PDF 1.4, private data may also be associated with the PDF document by means of the PieceInfo entry in the document catalogue.

NOTE 1		Conforming products may use this dictionary as a place to store private data in connection with that document, page, or form. Such private data can convey information meaningful to the conforming product that produces it (such as information on object grouping for a graphics editor or the layer information used by Adobe Photoshop®) but may be ignored by general-purpose conforming readers.

A page-piece dictionary may contain any number of entries, each keyed by the name of a distinct conforming product or of a well-known data type recognized by a family of conforming products. The value associated with each key shall be a data dictionary containing the private data that shall be used by the conforming product. The Private entry may have a value of any data type, but typically it is a dictionary containing all of the private data needed by the conforming product other than the actual content of the document, page, or form.'
]

{ #category : #'accessing entries' }
PtPieceInfo >> LastModified [
	<type: #Date>
	<required>
	<attribute: 1 documentation: 'The date and time when the contents of the document, page, or form were most recently modified by this conforming product.'>
	^self objectAt: #LastModified
]

{ #category : #'accessing entries' }
PtPieceInfo >> Private [
	<type: #Object>
	<attribute: 2 documentation: 'Any private data appropriate to the conforming product, typically in the form of a dictionary.'>
	^self objectAt: #Private ifAbsent: [PtPDF Dictionary empty]
]

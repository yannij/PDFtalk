"
PDF Explicit Destination as defined in PDF 32000_2008.pdf, section 12.3.2, pp. 365.

A destination defines a particular view of a document, consisting of the following items:
• The page of the document that shall be displayed
• The location of the document window on that page
• The magnification (zoom) factor

Destinations may be associated with outline items, annotations, or actions.
In each case, the destination specifies the view of the document that shall be presented when the outline item or annotation is opened or the action is performed. In addition, the optional OpenAction entry in a document’s catalogue may specify a destination that shall be displayed when the document is opened.
A destination may be specified either explicitly by an array of parameters defining its properties or indirectly by name.
"
Class {
	#name : #PtDestination,
	#superclass : #PtObjecttype,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtDestination class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Destination
		supertype: #Object
		section: '12.3.2'
		documentation: 'A destination defines a particular view of a document, consisting of the following items:
• The page of the document that shall be displayed
• The location of the document window on that page
• The magnification (zoom) factor

Destinations may be associated with outline items, annotations, or actions.
In each case, the destination specifies the view of the document that shall be presented when the outline item or annotation is opened or the action is performed. In addition, the optional OpenAction entry in a document’s catalogue may specify a destination that shall be displayed when the document is opened.
A destination may be specified either explicitly by an array of parameters defining its properties or indirectly by name.'
]

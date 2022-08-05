"
PDF URI Action as defined in PDF 32000_2008.pdf, section 12.6.4.7, pp. 423.

A uniform resource identifier (URI) is a string that identifies (resolves to) a resource on the Internet—typically a file that is the destination of a hypertext link, although it may also resolve to a query or other entity.
(URIs are described in Internet RFC 2396, Uniform Resource Identifiers (URI): Generic Syntax)

A URI action causes a URI to be resolved
"
Class {
	#name : #PtURI,
	#superclass : #PtAction,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtURI class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #URI
		supertype: #Action
		version: #(1 1)
		section: '12.6.4.7'
		documentation: 'A uniform resource identifier (URI) is a string that identifies (resolves to) a resource on the Internet—typically a file that is the destination of a hypertext link, although it may also resolve to a query or other entity.
(URIs are described in Internet RFC 2396, Uniform Resource Identifiers (URI): Generic Syntax)

A URI action causes a URI to be resolved'
]

{ #category : #'accessing entries' }
PtURI >> IsMap [
	<type: #Boolean>
	<attribute: 2 documentation: 'A flag specifying whether to track the mouse position when the URI is resolved.
This entry applies only to actions triggered by the user’s clicking an annotation; it shall be ignored for actions associated with outline items or with a document’s OpenAction entry'>
	^self objectAt: #IsMap ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtURI >> URI [
	<type: #AsciiString>
	<required>
	<attribute: 1 documentation: 'The uniform resource identifier to resolve, encoded in 7-bit ASCII'>
	^self objectAt: #URI
]

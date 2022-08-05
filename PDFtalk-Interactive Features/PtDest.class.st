"
PDF Explicit Destination as defined in PDF 32000_2008.pdf, section 12.3.2.3, pp. 367.

A dictionary with a D entry whose value is an ExplicitDestination.

This form allows additional attributes to be associated with the destination, as well as enabling a go-to action that shall be used as the target of a named destination
"
Class {
	#name : #PtDest,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtDest class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Dest
		supertype: #Destination
		section: '12.3.2.3'
		documentation: 'A dictionary with a D entry whose value is an ExplicitDestination.

This form allows additional attributes to be associated with the destination, as well as enabling a go-to action that shall be used as the target of a named destination'
]

{ #category : #'accessing entries' }
PtDest >> D [
	<type: #ExplicitDestination>
	<required>
	<attribute: 1 documentation: 'An explicit destination array'>
	^self objectAt: #D
]

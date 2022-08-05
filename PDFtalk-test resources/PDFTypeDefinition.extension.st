Extension { #name : #PDFTypeDefinition }

{ #category : #'*PDFtalk-test resources-test instances' }
PDFTypeDefinition class >> example [
	^PDFTypeDefinition
		name: #JPXDecode
		supertype: #Filter
		version: #(1 5)
		section: '7.4.9'
		documentation: 'The JPXDecode filter decodes data that has been encoded using the JPEG2000 compression method, an ISO standard for the compression and packaging of image data.'
]

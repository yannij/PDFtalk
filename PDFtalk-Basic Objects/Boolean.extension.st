Extension { #name : #Boolean }

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Boolean class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Boolean
		supertype: #Object
		section: '7.3.2'
		documentation: 'Boolean objects represent the logical values of true and false. They appear in PDF files using the keywords true and false.'
]

{ #category : #'*PDFtalk-Basic Objects-writing' }
Boolean >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutAll: self printString asByteArray
]

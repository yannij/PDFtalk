Extension { #name : #PtDocumentInformation }

{ #category : #'*PDFtalk-test resources-test instances' }
PtDocumentInformation class >> example [
	^(PtFile readTesterOn: '<<
	/Title (PostScript Language Reference, Third Edition)
	/Author (Adobe Systems Incorporated)
	/Creator (Adobe FrameMaker 5.5.3 for Power Macintosh®)
	/Producer (Acrobat Distiller 3.01 for Power Macintosh)
	/CreationDate (D:19970915110347-08''00'')
	/ModDate (D:19990209153925-08''00'')
>>') readObject
]

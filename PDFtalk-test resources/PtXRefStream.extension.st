Extension { #name : #PtXRefStream }

{ #category : #'*PDFtalk-test resources-test instances' }
PtXRefStream class >> example [
	^self
		on: ((Valuemap new)
			at: #Type put: #XRef;
			at: #Index put: #(0 11);
			at: #W put: #(1 2 2);
			at: #Filter put: #ASCIIHexDecode;
			at: #Size put: 11;
			at: #Root put: (PtPDF Dictionary with: #Type -> #Catalog) newReference;
			at: #Length put: 153;
			yourself)
		external: '	00 0000 FFFF
	01 0032 0000
	01 007A 0000
	01 00AC 0000
	01 00EE 0000
	01 0172 0000
	01 01BE 0000
	02 000A 0000
	02 000A 0001
	02 000A 0002
	01 01D8 0000'
]

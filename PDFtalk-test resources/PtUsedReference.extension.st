Extension { #name : #PtUsedReference }

{ #category : #'*PDFtalk-test resources-test instances' }
PtUsedReference class >> example [
	^self id: (PtObjectId number: 3 generation: 73) value: 12345
]

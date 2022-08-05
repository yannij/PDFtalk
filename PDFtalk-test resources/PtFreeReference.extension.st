Extension { #name : #PtFreeReference }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFreeReference class >> example [
	^self id: (PtObjectId number: 7 generation: 15) value: 3
]

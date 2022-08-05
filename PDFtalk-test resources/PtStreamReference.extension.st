Extension { #name : #PtStreamReference }

{ #category : #'*PDFtalk-test resources-test instances' }
PtStreamReference class >> example [
	^self id: (PtObjectId number: 3) value: 12345
]

Extension { #name : #PtMissingObject }

{ #category : #'*PDFtalk-test resources-test instances' }
PtMissingObject class >> example [
	^self at: (PtObjectId number: 2) expected: (Array with: (PtDirectType onSymbol: #Catalog))
]

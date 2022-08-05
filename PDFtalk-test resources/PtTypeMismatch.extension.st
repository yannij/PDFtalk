Extension { #name : #PtTypeMismatch }

{ #category : #'*PDFtalk-test resources-test instances' }
PtTypeMismatch class >> example [
	^self for: (PtPDF classAt: #Catalog) empty expected: (Array with: (PtDirectType onSymbol: #ColourSpace))
]

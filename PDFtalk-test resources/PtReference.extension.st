Extension { #name : #PtReference }

{ #category : #'*PDFtalk-test resources-test instances' }
PtReference class >> example [
"
	^'12 1 R' pdfReadstream nextPDFObject
"

	^self id: (PtObjectId number: 12 generation: 1)
]

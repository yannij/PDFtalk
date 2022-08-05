Extension { #name : #PtCrossReferences }

{ #category : #'*PDFtalk-test resources-test instances' }
PtCrossReferences class >> example [
	^self
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array
			with: (PtCrossReferenceSubsection
				firstNumber: 0
				entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
			with: (PtCrossReferenceSubsection
				firstNumber: 3
				entries: (Array with: (PtUsedReference id: (PtObjectId number: 3) value: 25325)))
			with: (PtCrossReferenceSubsection
				firstNumber: 23
				entries: (Array
					with: (PtUsedReference id: (PtObjectId number: 23 generation: 2) value: 25518)
					with: (PtUsedReference id: (PtObjectId number: 24) value: 25635)))
			with: (PtCrossReferenceSubsection
				firstNumber: 30
				entries: (Array with: (PtUsedReference id: (PtObjectId number: 30) value: 25777)))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 22
			with: #Root -> (PtPDF Dictionary with: #Type -> #Catalog) newReference
			with: #Info -> PtPDF Dictionary new newReference
			with: #ID -> (Array
				with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject
				with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject) asPDF)
]

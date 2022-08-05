Extension { #name : #PtTrailer }

{ #category : #'*PDFtalk-test resources-test instances' }
PtTrailer class >> example [
	^self
		with: #Size -> 22
		with: #Root -> (PtPDF Dictionary with: #Type -> #Catalog) newReference
		with: #Info -> PtPDF Dictionary empty newReference
		with: #ID -> (Array
			with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject
			with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject) asPDF
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtTrailer class >> exampleMinimal [
	^self on: (Valuemap
		with: #Size -> 22
		with: #Root -> (Dictionary with: #Type -> #Catalog) asPDF newReference)
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtTrailer class >> exampleString [
	^'trailer
<< /Size 22
/Root 2 0 R
/Info 1 0 R
/ID[< 81b14aafa313db63dbd6f981e49f94f4 >
< 81b14aafa313db63dbd6f981e49f94f4 >
]
>>
startxref
18799
 %%EOF'
]

Extension { #name : #PtStandardFont }

{ #category : #'*PDFtalk-test resources-test instances' }
PtStandardFont class >> example [
	| inst |
	inst:= self empty.
	inst at: #BaseFont put: #Helvetica.
	^inst
]

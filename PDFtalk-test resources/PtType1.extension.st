Extension { #name : #PtType1 }

{ #category : #'*PDFtalk-test resources-test instances' }
PtType1 class >> example [
	| inst |
	inst:= self empty.
	inst at: #BaseFont put: #MyFont.
	^inst
]

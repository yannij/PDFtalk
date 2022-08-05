Extension { #name : #PtZipFilter }

{ #category : #'*PDFtalk-test resources-instance creation' }
PtZipFilter class >> testerWith: aPDFDictionaryOrNil [
	| inst |
	inst := self new.
	aPDFDictionaryOrNil ifNotNil: [inst initializeParameters: aPDFDictionaryOrNil].
	^inst
]

Extension { #name : #PDFArray }

{ #category : #'*PDFtalk-test resources-test instances' }
PDFArray class >> example [
	^(PtFile readTesterOn: '[ 549 3.14 false (Ralph) /SomeName ]') readObject
]

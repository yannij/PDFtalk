Extension { #name : #SequenceableCollection }

{ #category : #'*PDFtalk-Basic Objects-converting' }
SequenceableCollection >> asPDF [
	^PDF Array on: self
]

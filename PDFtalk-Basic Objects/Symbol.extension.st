Extension { #name : #Symbol }

{ #category : #'*PDFtalk-Basic Objects-converting' }
Symbol >> asPDF [
	^(PDF classAt: #Name) on: self
]

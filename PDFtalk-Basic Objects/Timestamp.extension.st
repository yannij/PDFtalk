Extension { #name : #Timestamp }

{ #category : #'*PDFtalk-Basic Objects-converting' }
Timestamp >> asPDF [
	^(PDF classAt: #Date) on: self
]

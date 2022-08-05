Extension { #name : #Integer }

{ #category : #'*PDFtalk-Basic Objects-converting' }
Integer >> asPDF [
	^PtNumber on: self
]

{ #category : #'*PDFtalk-Basic Objects-printing' }
Integer >> writePDFOn: aWriter indent: anInteger [
	aWriter nextPutAll: self printPostScript asByteArray
]

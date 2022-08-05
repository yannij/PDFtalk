Extension { #name : #String }

{ #category : #'*PDFtalk-Basic Objects-converting' }
String >> asPDF [
	^PDF String fromPdf: self
]

Extension { #name : #Rectangle }

{ #category : #'*PDFtalk-Data Structures-converting' }
Rectangle >> asPDF [
	^(PDF classAt: #Rectangle) fromRectangle: self
]

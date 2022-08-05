Extension { #name : #SmallInteger }

{ #category : #'*PDFtalk-Basic Objects-converting' }
SmallInteger >> asPDF [
	^PtInteger on: self
]

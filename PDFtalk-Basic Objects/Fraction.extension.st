Extension { #name : #Fraction }

{ #category : #'*PDFtalk-Basic Objects-converting' }
Fraction >> asPDF [
	^PtReal on: self asFloat
]

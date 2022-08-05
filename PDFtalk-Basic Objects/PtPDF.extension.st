Extension { #name : #PtPDF }

{ #category : #'*PDFtalk-Basic Objects-accessing type classes' }
PtPDF class >> Array [
	^self classAt: #Array
]

{ #category : #'*PDFtalk-Basic Objects-accessing type classes' }
PtPDF class >> Dictionary [
	^self classAt: #Dictionary
]

{ #category : #'*PDFtalk-Basic Objects-accessing type classes' }
PtPDF class >> String [
	^self classAt: #String
]

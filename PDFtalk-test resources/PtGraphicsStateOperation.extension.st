Extension { #name : #PtGraphicsStateOperation }

{ #category : #'*PDFtalk-test resources-test instances' }
PtGraphicsStateOperation class >> example [
	^PtSetDash
		with: #(0 1)
		with: 0
]

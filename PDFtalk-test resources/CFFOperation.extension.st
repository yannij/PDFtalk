Extension { #name : #CFFOperation }

{ #category : #'*PDFtalk-test resources-test instances' }
CFFOperation class >> example [
	^CFFOperation operator: (CFFDictOperator value: 4) operands: #(385)
]

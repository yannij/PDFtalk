Extension { #name : #CFFEncodingSupplement }

{ #category : #'*PDFtalk-test resources-test instances' }
CFFEncodingSupplement class >> example [
	^CFFEncodingSupplement glyphsAtCode: (Valuemap
		with: 1 -> #symbol
		with: #key -> 'string')
]

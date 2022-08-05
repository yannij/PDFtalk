Extension { #name : #PtOTGlyph }

{ #category : #'*PDFtalk-test resources-test instances' }
PtOTGlyph class >> example [
	^PtOTGlyph
		id: 1
		name: 'a string'
		charString: #[42]
		code: 1
		hMetric: (PtOTHorMetric advanceWidth: 500 lsb: 16)
]

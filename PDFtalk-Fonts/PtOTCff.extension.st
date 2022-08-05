Extension { #name : #PtOTCff }

{ #category : #'*PDFtalk-Fonts-converting' }
PtOTCff >> pdfFontFile [
	^PDF Stream
		on: (Dictionary
			with: #Subtype -> #Type1C
			with: #Filter -> #FlateDecode)
		internal: self contents asString
]

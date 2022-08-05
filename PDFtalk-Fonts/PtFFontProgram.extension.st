Extension { #name : #PtFFontProgram }

{ #category : #'*PDFtalk-Fonts-converting' }
PtFFontProgram >> pdfFontFile [
	| headerBytes binaryBytes trailerBytes headerSize binarySize trailerSize wst |
	headerBytes := self header contents asString.
	headerSize := headerBytes size.
	binaryBytes := self binaryContents asString.
	binarySize := binaryBytes size.
	trailerBytes := self trailerByteString.
	trailerSize := trailerBytes size.
	wst := WriteStream on: (String new: headerSize + binarySize + trailerSize).
	wst
		nextPutAll: headerBytes;
		nextPutAll: binaryBytes;
		nextPutAll: trailerBytes.
	^PDF Stream
		on: (Valuemap
			with: #Length1 -> headerSize
			with: #Length2 -> binarySize
			with: #Length3 -> trailerSize
			with: #Filter -> #FlateDecode)
		internal: wst contents
]

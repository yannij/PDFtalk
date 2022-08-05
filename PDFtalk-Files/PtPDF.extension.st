Extension { #name : #PtPDF }

{ #category : #'*PDFtalk-Files-accessing' }
PtPDF class >> producerText [
	"<Textstring>
	default text used as /Producer in the /Trailer/Info"

	^(PtPDF classAt: #Textstring) fromString: 'PDFtalk ' , self libraryVersionString
]

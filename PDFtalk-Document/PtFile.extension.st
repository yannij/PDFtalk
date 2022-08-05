Extension { #name : #PtFile }

{ #category : #'*PDFtalk-Document-converting' }
PtFile >> asDocument [
	"<Document>
	a new document with the same contents as the receiver for writing out the PDF later"

	| newDocument info |
	newDocument := PtDocument new.
	newDocument root: self root copyWithNewReferences.
	info := self trailer Info.
	info at: #ModDate put: Timestamp now.
	info at: #Producer put: PtPDF producerText.
	newDocument info: info.
	newDocument previousId: self trailer ID.
	^newDocument
]

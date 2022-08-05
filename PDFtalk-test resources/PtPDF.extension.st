Extension { #name : #PtPDF }

{ #category : #'*PDFtalk-test resources-accessing' }
PtPDF class >> pdfSpecificationFilenameString [
	"<String>
	the original specification.
	Used for examples - if the file does not exist, the user is asked for the file"
	"self pdfSpecificationFilenameString"

	| path |
	PDFSpecificationFilenameString ifNotNil: [:string |
		^string].
	path := 'PDF32000_2008.pdf'.
	path asFilename exists ifTrue: [
		^path].
	(Dialog
		requestFileNameWithMessage: 'PDF Specification'
		default: 'PDF32000_2008.pdf'
		version: #mustBeOld
		ifFail: nil
		for: nil) ifNotNil: [:fromUser |
			fromUser asFilename exists ifTrue: [
				^PDFSpecificationFilenameString := fromUser]].
	self error: 'could not access the PDF specification'
]

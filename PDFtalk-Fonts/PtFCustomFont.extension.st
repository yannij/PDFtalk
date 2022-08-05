Extension { #name : #PtFCustomFont }

{ #category : #'*PDFtalk-Fonts-converting' }
PtFCustomFont >> addPDFFontFileTo: aFontDescriptor [
	aFontDescriptor at: #FontFile put: self program pdfFontFile newReference
]

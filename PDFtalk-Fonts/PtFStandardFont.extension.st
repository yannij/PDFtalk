Extension { #name : #PtFStandardFont }

{ #category : #'*PDFtalk-Fonts-converting' }
PtFStandardFont >> pdfFont [
	| pdfFont |
	pdfFont := (PDF classAt: #Type1) empty.
	pdfFont at: #BaseFont put: self postScriptName asSymbol.
	^pdfFont
]

{ #category : #'*PDFtalk-Fonts-converting' }
PtFStandardFont >> pdfWinAnsiEncodingAttributesWith: extraGlyphs [
	"from PDF 1.5, this special treatment is deprecated:
	Also standard fonts should have a proper description (without a FontFile though)"

	| dict |
	dict := Valuemap new.
	dict at: #Encoding put: (self newPDFEncodingWith: extraGlyphs).
	^dict
]

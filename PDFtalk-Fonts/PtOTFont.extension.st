Extension { #name : #PtOTFont }

{ #category : #'*PDFtalk-Fonts-converting' }
PtOTFont >> addPDFFontFileTo: aFontDescriptor [
	aFontDescriptor at: #FontFile3 put: self cff pdfFontFile newReference
]

{ #category : #'*PDFtalk-Fonts-accessing' }
PtOTFont >> pdfStringWithTabularCharacters: aString for: aPDFRenderer [
	"<String>
	string with WinAnsiEncoding where tabular glyphs are specially encoded"

	^aPDFRenderer pdfStringWithTabularCharacters: aString inFont: self
]

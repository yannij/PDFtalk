Class {
	#name : #PtFontEncodingTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtFontEncodingTests >> testOpenTypePS [
	| page |
	page := PtPDF Page newInBounds: (0 @ -5 corner: 120 @ 15) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textObjectDo: [
			renderer setFont: #FreeSansBold size: 16.
			renderer showString: 'Übertrag: 1.00 €']].
	self assert: page Contents internal = 'BT
/F1 16 Tf
(\334bertrag: 1.00 \200) Tj
ET
' withLf.
	self assert: (page Resources fonts objectAt: #F1) pdfSource = '<<	/Type /Font
	/Subtype /Type1
	/BaseFont /FreeSansBold
	/FontDescriptor 0 0 R
	/Widths [278 333 474 556 556 889 722 238 333 333 389 584 278 333 278 278 556 556 556 556 556 556 556 556 556 556 333 333 584 584 584 611 975 722 722 722 722 667 611 778 722 278 556 722 611 833 722 778 667 778 722 667 611 722 667 944 667 667 611 333 278 333 584 556 333 556 611 556 611 556 333 611 611 278 278 556 278 889 611 611 611 611 389 556 333 611 556 778 556 556 500 389 280 389 584 700 640 700 278 333 500 1000 556 556 333 1000 667 333 1000 700 611 700 700 278 278 500 500 350 556 1000 333 1000 556 333 953 700 500 667 278 333 556 556 556 556 280 556 333 737 370 556 584 333 737 333 606 584 351 351 333 611 556 278 333 300 365 556 869 869 869 611 722 722 722 722 722 722 1000 722 667 667 667 667 278 278 278 278 722 722 778 778 778 778 778 584 778 722 722 722 722 667 667 611 556 556 556 556 556 556 889 556 556 556 556 556 278 278 278 278 611 611 611 611 611 611 611 584 611 611 611 611 611 556 611 556]
	/FirstChar 32
	/LastChar 255
	/Encoding /WinAnsiEncoding	>>' withLf.
	self assert: (page Resources fonts objectAt: #F1) FontDescriptor pdfSource = '<<	/Type /FontDescriptor
	/FontName /FreeSansBold
	/Flags 262176
	/FontBBox [-967 -460 1556 1072]
	/ItalicAngle 0
	/Ascent 800
	/Descent -200
	/CapHeight 730
	/StemV 166
	/FontFile3 0 0 R	>>' withLf
]

{ #category : #tests }
PtFontEncodingTests >> testStandard [
	| page |
	page := PtPDF Page newInBounds: (0 @ -5 corner: 120 @ 15) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer showString: 'Übertrag: 1.00 €']].
	self assert: page Contents internal = 'BT
/F1 16 Tf
(\334bertrag: 1.00 \200) Tj
ET
' withLf.
	self assert: (page Resources fonts objectAt: #F1) pdfSource = '<<	/Type /Font
	/Subtype /Type1
	/BaseFont /Helvetica
	/Encoding /WinAnsiEncoding	>>' withLf
]

{ #category : #tests }
PtFontEncodingTests >> testStandardTwoByteString [
	| page |
	page := PtPDF Page newInBounds: (0 @ -5 corner: 120 @ 15) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer showString: (String with: 0 asCharacter) asTwoByteString]].
	self assert: page Contents internal = 'BT
/F1 16 Tf
(\000) Tj
ET
' withLf.
	self assert: (page Resources fonts objectAt: #F1) pdfSource = '<<	/Type /Font
	/Subtype /Type1
	/BaseFont /Helvetica
	/Encoding /WinAnsiEncoding	>>' withLf
]

{ #category : #tests }
PtFontEncodingTests >> testStandardUnknownCharacter [
	| page |
	page := PtPDF Page newInBounds: (0 @ -5 corner: 120 @ 15) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer showString: (String with: 0 asCharacter)]].
	self assert: page Contents internal = 'BT
/F1 16 Tf
(\000) Tj
ET
' withLf.
	self assert: (page Resources fonts objectAt: #F1) pdfSource = '<<	/Type /Font
	/Subtype /Type1
	/BaseFont /Helvetica
	/Encoding /WinAnsiEncoding	>>' withLf
]

{ #category : #tests }
PtFontEncodingTests >> testType1 [
	| page |
	page := PtPDF Page newInBounds: (0 @ -5 corner: 120 @ 15) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textObjectDo: [
			renderer setFont: #NimbusSansLRegu size: 16.
			renderer showString: 'Übertrag: 1.00 €']].
	self assert: page Contents internal = 'BT
/F1 16 Tf
(\334bertrag: 1.00 \200) Tj
ET
' withLf.
	self assert: (page Resources fonts objectAt: #F1) pdfSource = '<<	/Type /Font
	/Subtype /Type1
	/BaseFont /NimbusSanL-Regu
	/FontDescriptor 0 0 R
	/Widths [278 278 355 556 556 889 667 191 333 333 389 584 278 333 278 278 556 556 556 556 556 556 556 556 556 556 278 278 584 584 584 556 1015 667 667 722 722 667 611 778 722 278 500 667 556 833 722 778 667 778 722 667 611 722 667 944 667 667 611 278 278 278 469 556 333 556 556 500 556 556 278 556 556 222 222 500 222 833 556 556 556 556 333 500 278 556 500 722 500 500 500 334 260 334 584 278 556 278 222 556 333 1000 556 556 333 1000 667 333 1000 278 611 278 278 222 221 333 333 350 556 1000 333 1000 500 333 944 278 500 667 278 333 556 556 556 556 260 556 333 737 370 556 584 278 737 333 606 584 351 351 333 556 537 278 333 351 365 556 869 869 869 611 667 667 667 667 667 667 1000 722 667 667 667 667 278 278 278 278 722 722 778 778 778 778 778 584 778 722 722 722 722 666 666 611 556 556 556 556 556 556 889 500 556 556 556 556 278 278 278 278 556 556 556 556 556 556 556 584 611 556 556 556 556 500 555 500]
	/FirstChar 32
	/LastChar 255
	/Encoding /WinAnsiEncoding	>>' withLf.
	self assert: (page Resources fonts objectAt: #F1) FontDescriptor pdfSource = '<<	/Type /FontDescriptor
	/FontName /NimbusSanL-Regu
	/Flags 32
	/FontBBox [-174 -285 1001 953]
	/ItalicAngle 0
	/Ascent 729
	/Descent -218
	/CapHeight 729
	/StemV 88
	/FontFile 0 0 R	>>' withLf
]

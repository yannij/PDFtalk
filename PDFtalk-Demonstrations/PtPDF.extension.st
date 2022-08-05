Extension { #name : #PtPDF }

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> allDemos_appendPDFs [
	"shows how to add all pages of a PDF to another.
	We take all pdfs from the current directory which start with 'demo' and append them all to a new document"
	"PDF allDemos_appendPDFs"

	| doc files |
	doc := PtDocument new.
	files := '.' asFilename directoryContents.
	(files select: [:path | 'demo*.pdf' match: path]) sorted do: [:path |
		| file |
		file := path asFilename.
		doc appendAllPagesFrom: (PtFile read: file)].
	doc saveAndShowAs: 'allDemos_appendPDFs.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo01_HelloWorld [
	"PDF demo01_HelloWorld"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 70 @ 20) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer fillColor: CmykColor black.
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 10.
			renderer add: (PtNextLineRelative operands: #(10 5)).
			renderer showString: 'Hello World']].
	page saveAndShowAs: 'demo01_HelloWorld.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo01_minimalPDF [
	"bare bones for showing the internals (dont worry - most of that is abstracted away (see next demos)"
	"PDF demo01_minimalPDF.
	PDFtalk.UI.Snooper openFile:  'demo01_minimalPDF.pdf'"

	| root page trailer refs writer xrefs startxref fst |
	root := (PtPDF classAt: #Catalog) new.
	root at: #Type put: #Catalog.
	root at: #Pages put: (PtPDF classAt: #Pages) new newReference.
	root Pages at: #Type put: #Pages.
	root Pages at: #Kids put: #().
	root Pages at: #Count put: 0.
	page := PtPDF Page new.
	page at: #Type put: #Page.
	root Pages at: #Kids put: (root Pages Kids with: page newReference).
	root Pages at: #Count put: root Pages count.
	page at: #Parent put: (root at: #Pages).	"get the reference"
	trailer := (PtPDF classAt: #Trailer) new.
	trailer at: #Root put: root newReference.
	refs := trailer tracedReferences.
	trailer at: #Size put: refs size + 1.
	refs doWithIndex: [:reference :id | reference assignNewNumber: id].
	writer := PtWriter new.
	writer writeVersionHeader: (PtVersion highestVersionIn: refs).
	xrefs := writer writeObjects: refs.
	startxref := writer position.
	writer writeCrossReferenceSection: xrefs.
	writer writeTrailer: trailer.
	writer writeStartxref: startxref.
	fst := ('demo01_minimalPDF.pdf' asFilename withEncoding: #binary) writeStream.
	[fst nextPutAll: writer contents] ensure: [fst close].
	ExternalWebBrowser open: 'demo01_minimalPDF.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo01a_normalPDF [
	"usually adds /Info and /ID to the /Trailer"
	"PDF demo01a_normalPDF.
	PDFtalk.UI.Snooper openFile:  'demo01a_normalPDF.pdf'"

	| document |
	document := PtDocument new.
	document root addPage: PtPDF Page empty.
	document saveAs: 'demo01a_normalPDF.pdf'.

	ExternalWebBrowser open: 'demo01a_normalPDF.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo02_graphics [
	"PDF demo02_graphics"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer add: (PtSetStrokingCMYK operands: (CmykColor cyan: 0 magenta: 0.6 yellow: 1 black: 0) asPDFArray).
		renderer linewidth: 5.
		renderer moveTo: 10 @ 10.
		renderer lineTo: 60 @ 80.
		renderer stroke.
		renderer fillColor: (CmykColor cyan: 0.5 magenta: 0 yellow: 0 black: 0.5).
		renderer addRectangleLeft: 20 bottom: 20 width: 20 height: 40.
		renderer fill.
		renderer strokeColor: (CmykColor cyan: 0.4 magenta: 0.6 yellow: 0 black: 0).
		renderer dash: ((PtPDF classAt: #Dash) array: #(2 1) offset: 0).
		renderer linewidth: 3.
		renderer displayArcBBoxOrigin: 25 @ 45 extent: 30 @ 30 startAngle: 270 sweepAngle: 270.
		renderer stroke].
	page saveAndShowAs: 'demo02_graphics.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo03_text [
	"PDF demo03_text"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 165 @ 30) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textRenderingMode: 0.
		renderer fillColor: (CmykColor cyan: 0 magenta: 0.6 yellow: 1 black: 0).
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer add: (PtNextLineRelative operands: #(10 10)).
			renderer showString: 'Helvetica (Standard)']].
	page saveAndShowAs: 'demo03_text.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo03a_text_NonASCII [
	"PDF demo03a_text_NonASCII"
	"no change. The normal Smalltalk strings can be used"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 150 @ 30) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textRenderingMode: 0.
		renderer fillColor: (CmykColor cyan: 0 magenta: 0.6 yellow: 1 black: 0).
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer add: (PtNextLineRelative operands: #(5 10)).
			renderer showString: 'Übertrag: 1.00 € ©®']].
	page saveAndShowAs: 'demo03a_text_NonASCII.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo03b_text_FontCharactersTable [
	"PDF demo03b_text_FontCharactersTable"

	| font page |
	font := #Helvetica.
	"
	font := #HelveticaBold.
	font := #HelveticaOblique.
	font := #HelveticaBoldOblique.
	font := #TimesRoman.
	font := #TimesBold.
	font := #TimesItalic.
	font := #TimesBoldItalic.
	font := #Courier.
	font := #CourierBold.
	font := #CourierOblique.
	font := #CourierBoldOblique.
	font := #Symbol.
	font := #ZapfDingbats.
	font := #NimbusSansLRegu.
	font := #FreeSansBold.
	"
	page := PtPDF Page newInBounds: (0 @ 0 corner: 400 @ 380) colorspace: (PtPDF classAt: #DeviceGray) new render: [:renderer |
		| line |
		line := renderer bounds extent y - 20.
		renderer setFont: #Helvetica size: 14.
		renderer textObjectDo: [
			renderer add: (PtNextLineRelative
				with: 5
				with: line).
			renderer showString: font printString , ' with WinAnsi encoding'].
		line := line - 20.
		renderer strokeColor: (ColorValue fromBytesRed: 170 green: 170 blue: 170).
		renderer linewidth: 0.5.
		renderer moveTo: (50 + 18) @ (line - 5).
		renderer lineTo: (50 + 18 + (16 * 20)) @ (line - 5).
		renderer moveTo: (50 + 18 + (16 * 20)) @ (line - 5).
		renderer lineTo: (50 + 18 + (16 * 20)) @ (line - (16 * 20) - 5).
		renderer stroke.
		renderer fillColor: (ColorValue fromBytesRed: 128 green: 128 blue: 128).
		0 to: 15 do: [:column |
			| left |
			left := (column + 1) * 20 + 50.
			renderer moveTo: (left - 2) @ (line - 5).
			renderer lineTo: (left - 2) @ (line - (16 * 20) - 5).
			renderer stroke.
			renderer textObjectDo: [
				renderer add: (PtNextLineRelative
					with: left + 3
					with: line).
				renderer showString: (column printStringRadix: 16)]].
		0 to: 15 do: [:row |
			| left |
			line := line - 20.
			left := 50.
			renderer moveTo: (left + 18) @ (line - 5).
			renderer lineTo: (left + 18 + (16 * 20)) @ (line - 5).
			renderer stroke.
			renderer setFont: #Helvetica size: 14.
			renderer fillColor: (ColorValue fromBytesRed: 128 green: 128 blue: 128).
			renderer textObjectDo: [
				renderer add: (PtNextLineRelative
					with: 10
					with: line).
				renderer showString: (row * 16 printStringRadix: 16) , ' - ' , ((row + 1) * 16 - 1 printStringRadix: 16)].
			renderer setFont: font size: 16.
			renderer fillColor: ColorValue black.
			0 to: 15 do: [:column |
				| char |
				left := left + 20.
				char := (row * 16 + column) asCharacter.
				renderer textObjectDo: [
					renderer add: (PtNextLineRelative
						with: left
						with: line).
					renderer showString: (String with: char)]]]].
	page saveAndShowAs: 'demo03b_text_FontCharactersTable.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo03c_text_DifferentFonts [
	"PDF demo03c_text_DifferentFonts"
	"for each style, the appropriate font needs to be set"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 300 @ 30) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textObjectDo: [
			renderer add: (PtNextLineRelative operands: #(5 10)).
			renderer setFont: #Helvetica size: 16.
			renderer showString: 'normal'.
			renderer setFont: #'Helvetica-Bold' size: 16.
			renderer showString: 'bold'.
			renderer setFont: #'Helvetica-Oblique' size: 16.
			renderer showString: 'italic'.
			renderer setFont: #'Helvetica-BoldOblique' size: 16.
			renderer showString: 'boldItalic'.
			renderer setFont: #'Times-Roman' size: 16.
			renderer showString: 'Times'.
			renderer setFont: #'Times-BoldItalic' size: 16.
			renderer showString: 'boldItalic']].
	page saveAndShowAs: 'demo03c_text_DifferentFonts.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo03d_text_Underline [
	"PDF demo03d_text_Underline"
	"Underline needs to be drawn as line"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 160 @ 30) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		| string scale underlineLinewidth underlinePosition stringWidth |
		string := 'Helvetica (Standard)'.
		scale := 16.
		renderer textObjectDo: [
			renderer add: (PtNextLineRelative operands: #(5 10)).
			renderer setFont: #Helvetica size: scale.
			renderer showString: string].
		underlineLinewidth := (PtFFont fontAt: #Helvetica) underlineThicknessInTextSpace * scale.
		renderer linewidth: underlineLinewidth.
		underlinePosition := (PtFFont fontAt: #Helvetica) underlinePositionInTextSpace * scale.
		renderer moveTo: 5 @ (10 + underlinePosition).
		stringWidth := ((PtFFont fontAt: #Helvetica) widthOfString: string) * scale.
		renderer lineTo: (5 + stringWidth) @ (10 + underlinePosition).
		renderer stroke].
	page saveAndShowAs: 'demo03d_text_Underline.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo03e_text_CopyrightAndTrademarkInAllFonts [
	"PDF demo03e_text_CopyrightAndTrademarkInAllFonts"

	| page y |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 300 @ 230) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		y := 230.
		PtFStandardFont definedFontKeys do: [:font |
			y := y - 15.
			renderer textObjectDo: [
				renderer setFont: #Helvetica size: 10.
				renderer add: (PtNextLineRelative
					with: 5
					with: y).
				renderer showString: font asString , ': '].
			renderer textObjectDo: [
				renderer setFont: font size: 10.
				renderer add: (PtNextLineRelative
					with: 110
					with: y).
				renderer showString: 'Copyright©, Trademark®']]].
	page saveAndShowAs: 'demo03e_text_CopyrightAndTrademarkInAllFonts.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo04_fonts [
	"PDF demo04_fonts"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 260 @ 70) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer textRenderingMode: 0.
		renderer fillColor: CmykColor black.
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer add: (PtNextLineRelative operands: #(10 50)).
			renderer showString: 'Helvetica (Standard)'].
		renderer fillColor: (CmykColor cyan: 0.5 magenta: 0.6 yellow: 0 black: 0).
		renderer textObjectDo: [
			renderer setFont: #NimbusSansLRegu size: 16.
			renderer add: (PtNextLineRelative operands: #(10 30)).
			renderer showString: 'Nimbus Sans L Regular (Type-1)'].
		renderer fillColor: (CmykColor cyan: 0 magenta: 0.6 yellow: 1 black: 0).
		renderer textObjectDo: [
			renderer setFont: #FreeSansBold size: 16.
			renderer add: (PtNextLineRelative operands: #(10 10)).
			renderer showString: 'Free Sans Bold (OpenType(PS))']].
	page saveAndShowAs: 'demo04_fonts.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo04a_loadedFonts [
	"PDF demo04a_loadedFonts"

	| numberOfFonts page height |
	numberOfFonts := PtFFont loadedFonts size.
	height := numberOfFonts * 35 + 50.
	page := PtPDF Page newInBounds: (0 @ 0 corner: 400 @ height) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer textRenderingMode: 0.
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 18.
			renderer
				textMatrix: #(1 0 0 1 10), (Array with: height - 20);
				showString: 'Font list'.
			PtFFont loadedFonts keys asSortedCollection do: [:each |
				renderer add: (PtNextLineRelative operands: #(0 -20)).
				renderer setFont: #Helvetica size: 12.
				renderer showString: each asString.
				renderer setFont: each size: 12.
				renderer add: (PtNextLineRelative operands: #(0 -15)).
				renderer showString: 'The quick brown fox jumps over the lazy dog']]].
	page saveAndShowAs: 'demo04a_loadedFonts.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo04b_MICRDemo [
	"PDF demo04b_MICRDemo"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 165 @ 30) colorspace: (PtPDF classAt: #DeviceCMYK) new render:  [:renderer |
		renderer textObjectDo: [
			renderer setFont: #MICRDemoCheckPrixa size: 14.
			renderer add: (PtNextLineRelative operands: #(10 10)).
			renderer showString: '01234567890 / ; : -']].
	page saveAndShowAs: 'demo04b_MICRDemo.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo05_transparency [
	"PDF demo05_transparency"

	(PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		| transparentGState xObject |
		renderer setExtGState: (PtPDF classAt: #ExtGState) forTransparency.
		renderer fillColor: (CmykColor cyan: 0.5 magenta: 0 yellow: 0 black: 0.5).
		renderer addRectangleLeft: 20 bottom: 20 width: 20 height: 40.
		renderer fill.
		renderer strokeColor: (CmykColor cyan: 0.4 magenta: 0.6 yellow: 0 black: 0).
		renderer dash: ((PtPDF classAt: #Dash) array: #(2 1) offset: 0).
		renderer linewidth: 3.
		renderer displayArcBBoxOrigin: 25 @ 45 extent: 30 @ 30 startAngle: 270 sweepAngle: 270.
		renderer stroke.
		transparentGState := (PtPDF classAt: #ExtGState) forTransparency.
		transparentGState at: #BM put: #Multiply.
		transparentGState at: #CA put: 0.8.
		transparentGState at: #ca put: 0.8.
		renderer setExtGState: transparentGState.
		xObject := (PtPDF classAt: #TransparencyGroup) newInBounds: (7.5 @ 7.5 corner: 62.5 @ 82.5) colorspace: (PtPDF classAt: #DeviceCMYK) new in: renderer render: [:formRenderer |
			formRenderer strokeColor: (CmykColor cyan: 0 magenta: 0.6 yellow: 1 black: 0).
			formRenderer linewidth: 5.
			formRenderer dash: (PtPDF classAt: #Dash) empty.
			formRenderer moveTo: 10 @ 10.
			formRenderer lineTo: 60 @ 80.
			formRenderer stroke].
		renderer paintXObject: xObject]) saveAndShowAs: 'demo05_transparency.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo06_shading [
	"PDF demo06_shading"

	(PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		| function axialShading |
		function := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
		function at: #Domain put: #(0 1.0).
		function at: #N put: 1.
		function at: #C0 put: (CmykColor cyan: 0 magenta: 0.36 yellow: 0.6 black: 0) asPDFArray.
		function at: #C1 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
		axialShading := (PtPDF classAt: #AxialShading) empty.
		axialShading at: #ColorSpace put: #DeviceCMYK.
		axialShading at: #Coords put: (10 @ 0) asPDFArray , (90 @ 0) asPDFArray.
		axialShading at: #Function put: function newReference.
		renderer isolatedDo: [
			renderer addRectangleLeft: 10 bottom: 10 width: 80 height: 80.
			renderer setClippingPath.
			renderer paintShading: axialShading]]) saveAndShowAs: 'demo06_shading.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo07_shadingStiching [
	"PDF demo07_shadingStiching"

	(PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		| function1 function2 stichingFunction axialShading |
		function1 := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
		function1 at: #Domain put: #(0 1.0).
		function1 at: #N put: 0.5.
		function1 at: #C0 put: (CmykColor cyan: 0 magenta: 0.36 yellow: 0.6 black: 0) asPDFArray.
		function1 at: #C1 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
		function2 := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
		function2 at: #Domain put: #(0 1.0).
		function2 at: #N put: 2.
		function2 at: #C0 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
		function2 at: #C1 put: (CmykColor cyan: 0.6 magenta: 0.36 yellow: 0 black: 0) asPDFArray.
		stichingFunction := (PtPDF classAt: #StichingFunction) empty.
		stichingFunction at: #Domain put: #(0 1.0).
		stichingFunction
			at: #Functions
			put: (Array
				with: function1 newReference
				with: function2 newReference).
		stichingFunction at: #Bounds put: #(0.5).
		stichingFunction at: #Encode put: #(0 1.0 0 1.0).
		axialShading := (PtPDF classAt: #AxialShading) empty.
		axialShading at: #ColorSpace put: #DeviceCMYK.
		axialShading at: #Coords put: #(0 0 1 0).
		axialShading at: #Function put: stichingFunction newReference.
		renderer isolatedDo: [
			renderer addRectangleLeft: 10 bottom: 10 width: 80 height: 80.
			renderer setClippingPath.
			renderer concat: (((PtPDF classAt: #Matrix) scaling: 80 @ 80) translatedBy: 10 @ 10).
			renderer paintShading: axialShading]]) saveAndShowAs: 'demo07_shadingStiching.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo08_shadingRadial [
	"PDF demo08_shadingRadial"

	(PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		| function shading |
		function := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
		function at: #Domain put: #(0 1.0).
		function at: #N put: 1.
		function at: #C0 put: (CmykColor cyan: 0 magenta: 0.36 yellow: 0.6 black: 0) asPDFArray.
		function at: #C1 put: (CmykColor cyan: 0.6 magenta: 0 yellow: 0.6 black: 0) asPDFArray.
		shading := (PtPDF classAt: #RadialShading) empty.
		shading at: #ColorSpace put: #DeviceCMYK.
		shading at: #Coords put: #(-0.3 0.3 0 0 0 1).
		shading at: #Function put: function newReference.
		renderer isolatedDo: [
			renderer addRectangleLeft: 10 bottom: 10 width: 80 height: 80.
			renderer setClippingPath.
			renderer concat: (((PtPDF classAt: #Matrix) scaling: 40 @ 40) translatedBy: 50 @ 50).
			renderer paintShading: shading]]) saveAndShowAs: 'demo08_shadingRadial.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo09_shadingGauss [
	"PDF demo09_shadingGauss"
	"simulates the edge of an object filtered by a gaussian blur"

	(PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceGray) new render: [:renderer |
		| linearFunction linearShading splineFunction splineShading |
		linearFunction := (PtPDF classAt: #SampledFunction) empty.
		linearFunction at: #Domain put: #(0 1.0).
		linearFunction at: #Range put: #(0 1.0).
		linearFunction at: #Size put: #(14).
		linearFunction at: #BitsPerSample put: 8.
		linearFunction at: #Order put: 1.	"linear interpolation"
		linearFunction contents: #[0 2 6 17 37 68 107 148 187 218 238 249 253 255] asString.
		splineFunction := linearFunction copy.
		splineFunction at: #Order put: 3.	"cubic spline interpolation"
		linearShading := (PtPDF classAt: #AxialShading) empty.
		linearShading at: #ColorSpace put: #DeviceGray.
		linearShading at: #Coords put: #(0 0 1 0).
		linearShading at: #Function put: linearFunction newReference.
		splineShading := linearShading copy.
		splineShading at: #Function put: splineFunction newReference.
		renderer isolatedDo: [
			renderer addRectangleLeft: 10 bottom: 55 width: 80 height: 35.
			renderer setClippingPath.
			renderer concat: (((PtPDF classAt: #Matrix) scaling: 80 @ 80) translatedBy: 10 @ 55).
			renderer paintShading: linearShading].
		renderer isolatedDo: [
			renderer addRectangleLeft: 10 bottom: 10 width: 80 height: 35.
			renderer setClippingPath.
			renderer concat: (((PtPDF classAt: #Matrix) scaling: 80 @ 80) translatedBy: 10 @ 10).
			renderer paintShading: splineShading]]) saveAndShowAs: 'demo09_shadingGauss.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo10_transformationsNone [
	"PDF demo10_transformationsNone"

	| page |
	page := PtPDF Page newInBounds: (-100 @ -100 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer moveTo: -100 @ 0; lineTo: 100 @ 0; stroke.	"draws a line at y = 0"
		renderer moveTo: 0 @ -100; lineTo: 0 @ 100; stroke.	"draws a line at x = 0"
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 1.
			renderer textMatrix: #(4 0 0 4 50 50); showString: '(50 50)'.	"bigger font"
			renderer textMatrix: #(2 0 0 2 -50 50); showString: '(-50 50)'.
			renderer textMatrix: #(2 0 0 2 50 -50); showString: '(50 -50)'.
			renderer textMatrix: #(2 0 0 2 -50 -50); showString: '(-50 -50)']].
	page saveAndShowAs: 'demo10_transformationsNone.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo10a_transformationsFlipVertically [
	"PDF demo10a_transformationsFlipVertically"

	| page |
	page := PtPDF Page newInBounds: (-100 @ -100 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
            renderer concat: ((PtPDF classAt: #Matrix) scaling: 1 @ -1).
		renderer moveTo: -100 @ 0; lineTo: 100 @ 0; stroke.	"draws a line at y = 0"
		renderer moveTo: 0 @ -100; lineTo: 0 @ 100; stroke.	"draws a line at x = 0"
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 1.
			renderer textMatrix: #(4 0 0 4 50 50); showString: '(50 50)'.	"bigger font"
			renderer textMatrix: #(2 0 0 2 -50 50); showString: '(-50 50)'.
			renderer textMatrix: #(2 0 0 2 50 -50); showString: '(50 -50)'.
			renderer textMatrix: #(2 0 0 2 -50 -50); showString: '(-50 -50)']].
	page saveAndShowAs: 'demo10a_transformationsFlipVertically.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo10b_transformationsFlipHorizontally [
	"PDF demo10b_transformationsFlipHorizontally"

	| page |
	page := PtPDF Page newInBounds: (-100 @ -100 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
            renderer concat: ((PtPDF classAt: #Matrix) scaling: -1 @ 1).
		renderer moveTo: -100 @ 0; lineTo: 100 @ 0; stroke.	"draws a line at y = 0"
		renderer moveTo: 0 @ -100; lineTo: 0 @ 100; stroke.	"draws a line at x = 0"
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 1.
			renderer textMatrix: #(4 0 0 4 50 50); showString: '(50 50)'.	"bigger font"
			renderer textMatrix: #(2 0 0 2 -50 50); showString: '(-50 50)'.
			renderer textMatrix: #(2 0 0 2 50 -50); showString: '(50 -50)'.
			renderer textMatrix: #(2 0 0 2 -50 -50); showString: '(-50 -50)']].
	page saveAndShowAs: 'demo10b_transformationsFlipHorizontally.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo10c_transformationsFlipDiagonal [
	"PDF demo10c_transformationsFlipDiagonal"

	| page |
	page := PtPDF Page newInBounds: (-100 @ -100 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
            renderer concat: ((PtPDF classAt: #Matrix) scaling: -1 @ -1).
		renderer moveTo: -100 @ 0; lineTo: 100 @ 0; stroke.	"draws a line at y = 0"
		renderer moveTo: 0 @ -100; lineTo: 0 @ 100; stroke.	"draws a line at x = 0"
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 1.
			renderer textMatrix: #(4 0 0 4 50 50); showString: '(50 50)'.	"bigger font"
			renderer textMatrix: #(2 0 0 2 -50 50); showString: '(-50 50)'.
			renderer textMatrix: #(2 0 0 2 50 -50); showString: '(50 -50)'.
			renderer textMatrix: #(2 0 0 2 -50 -50); showString: '(-50 -50)']].
	page saveAndShowAs: 'demo10c_transformationsFlipDiagonal.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo10d_transformationsFlipVerticallyTranslateOrigin [
	"PDF demo10d_transformationsFlipVerticallyTranslateOrigin"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 100 @ -100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
            renderer concat: ((PtPDF classAt: #Matrix) scaling: 1 @ -1).
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 1.
	            renderer textMatrix: #(2 0 0 -2 10 10); showString: '(10 10)'.
      	      renderer textMatrix: #(2 0 0 -2 10 20); showString: '(10 20)'.
            	renderer textMatrix: #(2 0 0 -2 10 30); showString: '(10 30)'.
	            renderer textMatrix: #(2 0 0 -2 10 40); showString: '(10 40)'.
      	      renderer textMatrix: #(2 0 0 -2 20 10); showString: '(20 10)'.
            	renderer textMatrix: #(2 0 0 -2 20 20); showString: '(20 20)'.
	            renderer textMatrix: #(2 0 0 -2 20 30); showString: '(20 30)'.
      	      renderer textMatrix: #(2 0 0 -2 20 40); showString: '(20 40)']].
	page saveAndShowAs: 'demo10d_transformationsFlipVerticallyTranslateOrigin.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo11_URI_Link [
	"PDF demo11_URI_Link"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 150 @ 30) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		| link action |
		renderer textRenderingMode: 0.
		renderer fillColor: (CmykColor cyan: 0 magenta: 0.6 yellow: 1 black: 0).
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 16.
			renderer add: (PtNextLineRelative operands: #(5 10)).
			renderer showString: 'Web link to Adobe'].
		link := (PtPDF classAt: #LinkAnnotation) empty.
		link at: #Rect put: #(4 7 136 24).
		link at: #Border put: #(0 0 0).
		action := (PtPDF classAt: #URI) empty.
		action at: #URI put: 'http://www.adobe.com'.
		link at: #A put: action.
		renderer addAnnotation: link].
	page saveAndShowAs: 'demo11_URI_Link.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo12_copyPagesToNewPDF [
	"PDF demo12_copyPagesToNewPDF"
	"return the path to the extracted PDF to be used in other demos"

	| extractedDocument targetFilename inputStream |
	extractedDocument := PtDocument new.
	targetFilename := (PtPDF pdfSpecificationFilenameString asFilename tail allButLast: 4) , '[extracted10to20].pdf'.
	inputStream := PtPDF pdfSpecificationFilenameString asFilename readStream binary.
	[
	| root |
	root := (PtFile readFrom: inputStream) root.
	10 to: 20 do: [:pageNumber |
		extractedDocument root addPage: (root pageAt: pageNumber) copyIsolatedWithNewReferences].
	extractedDocument saveAs: targetFilename] ensure: [
			inputStream close].
	^targetFilename
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo13_splitPDF [
	"PDF demo13_splitPDF"
	"Thanks to Holger Kleinsorgen who posted the basic solution to the vwnc list"

	| filename inputStream inputPDF pageNumber |
	filename := self demo12_copyPagesToNewPDF asFilename.
	inputStream := filename readStream binary.
	[
	inputPDF := PtFile readFrom: inputStream.
	pageNumber := 1.
	inputPDF root pagesDo: [:page |
		| targetFilename onePageDocument |
		onePageDocument := PtDocument new.
		onePageDocument root addPage: page copyIsolatedWithNewReferences.
		targetFilename := (filename asString allButLast: 4) , '_' , pageNumber printString , '.pdf'.
		onePageDocument saveAs: targetFilename.
		pageNumber := pageNumber + 1]] ensure: [
			inputStream close]
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo14_addAnnotation [
	"PDF demo14_addAnnotation"

	| filename inputStream clone |
	filename := self demo12_copyPagesToNewPDF asFilename.
	inputStream := filename readStream binary.
	[
	clone := (PtFile readFrom: inputStream) asDocument.
	clone root pagesDo: [:page |
		| newAnnotation popupAnnotation popupAnnotationRef |
		newAnnotation := (PtPDF classAt: #TextAnnotation) empty.
		newAnnotation at: #Rect put: (50 @ 500 extent: 200 @ 40).
		"add some optional attribute"
		newAnnotation at: #Contents put: 'The text of the annotation'.
		newAnnotation at: #T put: 'Title of the text annotation'.
		popupAnnotation := (PtPDF classAt: #PopupAnnotation) empty.
		popupAnnotation at: #Rect put: (80 @ 550 extent: 200 @ 100).
		popupAnnotationRef := popupAnnotation newReference.
		newAnnotation at: #Popup put: popupAnnotationRef.
		page
			at: #Annots
			put: ((page Annots with: newAnnotation newReference) with: popupAnnotationRef)].
	clone saveAs: (filename asString allButLast: 4) , '_Annotated.pdf'] ensure: [
			inputStream close]
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo20_ImagesUsage [
	"PDF demo20_ImagesUsage"

	| page |
	page := PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer isolatedDo: [
			renderer concat: (((PtPDF classAt: #Matrix) scaling: 32 @ 32) translatedBy: 34 @ 34).
			renderer paintXObject: PtImageXObject depth8Masked]].
	page saveAndShowAs: 'demo20_ImagesUsage.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> demo21_Images [
	"Demo for what you can do with images in PDF.
	Demonstrates also how to use images as values stored in methods: look at ImageXObject class>>#addDemoImageMethods"
	"PDF demo21_Images"

	| a4 page |
	a4 := 595 @ 842.
	page := PtPDF Page newInBounds: (0 @ 0 corner: a4) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		| left m m2 p image alpha |
		left := 10.
		m := 2 @ 0.
		m2 := m + m.
		p := left @ 170.
		renderer fillColor: (ColorValue fromBytesRed: 230 green: 230 blue: 230).
		renderer addRectangleLeft: 20 bottom: 20 width: a4 x - 40 height: a4 y - 40.
		renderer fill.
		renderer fillColor: ColorValue black.
		renderer concat: ((PtPDF classAt: #Matrix) scaling: 4 @ 4).
		image := PtImageXObject pdfIconFigureImage.
		p := (renderer paintImage: image caption: 'Image' in: (p extent: image extent)) + m.
		image := PtImageXObject pdfIconMaskImage.
		image at: #ColorSpace put: #DeviceGray.
		image at: #ImageMask put: nil.
		p := (renderer paintImage: image caption: '+ Mask' in: (p extent: image extent)) + m2.
		image := PtImageXObject pdfIconImage.
		renderer paintImage: image caption: '= Icon' in: (p extent: image extent).
		p := left @ (p y - 40).
		image := PtImageXObject balloonImage.
		p := (renderer paintImage: image caption: 'Image' in: (p extent: image extent * 2)) + m.
		image := PtImageXObject balloonMaskImage.
		image at: #ColorSpace put: #DeviceGray.
		image at: #ImageMask put: nil.
		p := (renderer paintImage: image caption: '+ Mask' in: (p extent: image extent * 2)) + m2.
		image := PtImageXObject balloonMaskedImage.
		renderer paintImage: image caption: '= OpaqueImage' in: (p extent: image extent * 2).
		p := left @ (p y - 40).
		image := PtImageXObject pdfIconImage.
		renderer isolatedDo: [
			renderer concat: ((((PtPDF classAt: #Matrix) scaling: image extent) rotatedByDegrees: 35) translatedBy: p + (12 @ -6)).
			renderer paintXObject: image].
		renderer showString: 'rotated' at: p - (0 @ 4).
		p := p + (image width @ 0 + (m2 + m2)).
		image := PtImageXObject balloonMaskedImage.
		image at: #Interpolate put: true.
		p := (renderer paintImage: image caption: 'interpolated' in: (p extent: image extent * 2)) + m2.
		image := PtImageXObject balloonInvertedImage.
		renderer paintImage: image caption: 'inverted' in: (p extent: image extent * 2).
		p := left @ (p y - 40).
		image := PtImageXObject fixedDepth6Image.
		p := (renderer paintImage: image caption: 'Image' in: (p extent: image extent * 3)) + m2.
		image at: #Interpolate put: true.
		p := (renderer paintImage: image caption: 'interpolated' in: (p extent: image extent * 3)) + m2.
		renderer paintImage: image caption: 'scaled' in: (p extent: image extent * (8 @ 4)).
		p := left @ (p y - 40).
		alpha := PtImageXObject buttonAlphaImage.
		p := (renderer paintImage: alpha caption: 'AlphaImage' in: (p extent: alpha extent)) + m.
		renderer isolatedDo: [
			renderer concat: (((PtPDF classAt: #Matrix) scaling: alpha extent) translatedBy: p).
			renderer paintXObject: image.
			renderer paintXObject: alpha].
		renderer showString: 'on Background' at: p - (0 @ 4)].
	page saveAndShowAs: 'demo21_Images.pdf'
]

{ #category : #'*PDFtalk-Demonstrations-demos' }
PtPDF class >> runAllDemos [
	"PDF runAllDemos"

	PtPDF demo01_HelloWorld.
	PtPDF demo01_minimalPDF.
	PtPDF demo01a_normalPDF.
	PtPDF demo02_graphics.
	PtPDF demo03_text.
	PtPDF demo03a_text_NonASCII.
	PtPDF demo03b_text_FontCharactersTable.
	PtPDF demo03c_text_DifferentFonts.
	PtPDF demo03d_text_Underline.
	PtPDF demo03e_text_CopyrightAndTrademarkInAllFonts.
	PtPDF demo04_fonts.
	PtPDF demo04a_loadedFonts.
	PtPDF demo04b_MICRDemo.
	PtPDF demo05_transparency.
	PtPDF demo06_shading.
	PtPDF demo07_shadingStiching.
	PtPDF demo08_shadingRadial.
	PtPDF demo09_shadingGauss.
	PtPDF demo10_transformationsNone.
	PtPDF demo10a_transformationsFlipVertically.
	PtPDF demo10b_transformationsFlipHorizontally.
	PtPDF demo10c_transformationsFlipDiagonal.
	PtPDF demo10d_transformationsFlipVerticallyTranslateOrigin.
	PtPDF demo11_URI_Link.
	PtPDF demo12_copyPagesToNewPDF.
	PtPDF demo13_splitPDF.
	PtPDF demo14_addAnnotation.
	PtPDF demo20_ImagesUsage.
	PtPDF demo21_Images.
	PtPDF allDemos_appendPDFs
]

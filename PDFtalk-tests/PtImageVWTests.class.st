"
Tests involving VisualWorks images
"
Class {
	#name : #PtImageVWTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #'tests color bits' }
PtImageVWTests >> testColorValueAsInteger [
	self assert: ((PtPDF classAt: #DeviceRGB) new bitsFor: ColorValue magenta withSizes: #(8 8 8)) = 2r111111110000000011111111.
	self assert: ((PtPDF classAt: #DeviceRGB) new bitsFor: ColorValue magenta withSizes: #(4 4 4)) = 2r111100001111.
	self assert: ((PtPDF classAt: #DeviceRGB) new bitsFor: ColorValue magenta withSizes: #(2 2 2)) = 2r110011.
	self assert: ((PtPDF classAt: #DeviceRGB) new bitsFor: ColorValue magenta withSizes: #(1 1 1)) = 2r101.
	self assert: ((PtPDF classAt: #DeviceRGB) new bitsFor: ColorValue magenta withSizes: #(16 16 16)) = 2r111111111111111100000000000000001111111111111111.
	self assert: ((PtPDF classAt: #DeviceRGB) new
		colorAt: 2r111111110000000011111111
		withSizes: #(8 8 8)
		decodeWith: #(0 1.0 0 1.0 0 1.0)) = ColorValue magenta.
	self assert: ((PtPDF classAt: #DeviceRGB) new
		colorAt: 2r111100001111
		withSizes: #(4 4 4)
		decodeWith: #(0 1.0 0 1.0 0 1.0)) = ColorValue magenta.
	self assert: ((PtPDF classAt: #DeviceRGB) new
		colorAt: 2r110011
		withSizes: #(2 2 2)
		decodeWith: #(0 1.0 0 1.0 0 1.0)) = ColorValue magenta.
	self assert: ((PtPDF classAt: #DeviceRGB) new
		colorAt: 2r101
		withSizes: #(1 1 1)
		decodeWith: #(0 1.0 0 1.0 0 1.0)) = ColorValue magenta.
	self assert: ((PtPDF classAt: #DeviceRGB) new
		colorAt: 2r111111111111111100000000000000001111111111111111
		withSizes: #(16 16 16)
		decodeWith: #(0 1.0 0 1.0 0 1.0)) = ColorValue magenta
]

{ #category : #tests }
PtImageVWTests >> testColorsForIndexedColorspaces [
	"The number of colors in an indexed colorspace are different when directly copied or incrementally added"

	| image |
	image := Depth8Image exampleMappedDepth08.
	self assert: (image palette emptyIndexedColorspace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB -1).
	self assert: (image asPDFPixelByPixel ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 232).
	self assert: (image asPDF ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 235).
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertAlphaCompositedImage [
	| smalltalkImage recreatedImage pdfImage |
	smalltalkImage := AlphaCompositedImage example.
	self assert: smalltalkImage printString = 'an AlphaCompositedImage'.
	self assert: smalltalkImage image printString = 'Depth32Image(extent: 64 @ 32 depth: 32)'.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage printString = 'ImageXObject(64 @ 32 DeviceRGB 8)'.
	self deny: pdfImage isMask.
	self assert: pdfImage SMask printString = 'ImageXObject(64 @ 32 DeviceGray 8)'.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'an AlphaCompositedImage'.
	self assert: recreatedImage image printString = 'Depth32Image(extent: 64 @ 32 depth: 32)'.
	self assert: recreatedImage image pixelValues = smalltalkImage image pixelValues.
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth01Mask [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth1Image exampleMask.
	self assert: smalltalkImage printString = 'Depth1Image(extent: 32 @ 32 depth: 1)'.
	self assert: smalltalkImage palette = CoveragePalette monoMaskPalette.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage isMask.
	self deny: (pdfImage hasKey: #ColorSpace).
	self assert: pdfImage bitsPerComponent = 1.
	self assert: pdfImage Decode printString = '[1 0]'.
	self assert: pdfImage bytesPerRow = 4.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth1Image(extent: 32 @ 32 depth: 1)'.
	self assert: recreatedImage palette = CoveragePalette monoMaskPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth01Mono [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth1Image example.
	self assert: smalltalkImage printString = 'Depth1Image(extent: 20 @ 20 depth: 1)'.
	self assert: smalltalkImage palette = MonoMappedPalette blackWhite.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceGray.
	self assert: pdfImage bitsPerComponent = 1.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1]'.
	self assert: pdfImage bytesPerRow = 3.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth1Image(extent: 20 @ 20 depth: 1)'.
	self assert: recreatedImage palette = MonoMappedPalette blackWhite.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth02FixedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth2Image exampleFixedDepth02.
	self assert: smalltalkImage printString = 'Depth2Image(extent: 2 @ 2 depth: 2)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 1 redMask: 1 greenShift: 0 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 6.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 2 @ 2 depth: 24)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth02FixedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth2Image exampleFixedDepth02.
	self assert: smalltalkImage printString = 'Depth2Image(extent: 2 @ 2 depth: 2)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 1 redMask: 1 greenShift: 0 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 1.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 1.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 2 @ 2 depth: 3)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 1 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth02MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth2Image exampleMappedDepth02.
	self assert: smalltalkImage printString = 'Depth2Image(extent: 24 @ 24 depth: 2)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 3).
	self assert: pdfImage bitsPerComponent = 2.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 3]'.
	self assert: pdfImage bytesPerRow = 6.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth2Image(extent: 24 @ 24 depth: 2)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth02MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth2Image exampleMappedDepth02.
	self assert: smalltalkImage printString = 'Depth2Image(extent: 24 @ 24 depth: 2)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 3).
	self assert: pdfImage bitsPerComponent = 2.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 3]'.
	self assert: pdfImage bytesPerRow = 6.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth2Image(extent: 24 @ 24 depth: 2)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth02MappedRGBPDF [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth2Image exampleMappedDepth02PDF.
	self assert: smalltalkImage printString = 'Depth2Image(extent: 16 @ 16 depth: 2)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 3).
	self assert: pdfImage bitsPerComponent = 2.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 3]'.
	self assert: pdfImage bytesPerRow = 4.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth2Image(extent: 16 @ 16 depth: 2)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth02MappedRGBPDFByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth2Image exampleMappedDepth02PDF.
	self assert: smalltalkImage printString = 'Depth2Image(extent: 16 @ 16 depth: 2)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 3).
	self assert: pdfImage bitsPerComponent = 2.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 3]'.
	self assert: pdfImage bytesPerRow = 4.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth2Image(extent: 16 @ 16 depth: 2)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03FixedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleFixedDepth03.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 4 @ 2 depth: 3)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 1 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 12.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 4 @ 2 depth: 24)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03FixedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleFixedDepth03.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 4 @ 2 depth: 3)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 1 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 1.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 2.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 4 @ 2 depth: 3)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 1 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth03.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 24 @ 24 depth: 3)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 12.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 7).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 7]'.
	self assert: pdfImage bytesPerRow = 12.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth4Image(extent: 24 @ 24 depth: 3)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth03.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 24 @ 24 depth: 3)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 12.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 7).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 7]'.
	self assert: pdfImage bytesPerRow = 12.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 24 @ 24 depth: 3)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03MappedRGBPDF [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth03PDF.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 16 @ 16 depth: 3)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 4).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 4]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth4Image(extent: 16 @ 16 depth: 3)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03MappedRGBPDFByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth03PDF.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 16 @ 16 depth: 3)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 4).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 4]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 16 @ 16 depth: 3)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03MappedRGBVW [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth03VW.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 26 @ 26 depth: 3)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 5).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 5]'.
	self assert: pdfImage bytesPerRow = 13.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth4Image(extent: 26 @ 26 depth: 3)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth03MappedRGBVWByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth03VW.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 26 @ 26 depth: 3)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 5).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 5]'.
	self assert: pdfImage bytesPerRow = 13.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 26 @ 26 depth: 3)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth04FixedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleFixedDepth04.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 4 @ 4 depth: 4)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 3 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 12.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 4 @ 4 depth: 24)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth04FixedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleFixedDepth04.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 4 @ 4 depth: 4)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 3 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: smalltalkImage packedRowSize = 4.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 2.
	self assert: pdfImage Decode printString = '[0 1 0 3 0 3]'.
	self assert: pdfImage bytesPerRow = 3.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 4 @ 4 depth: 4)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 2 redMask: 3 greenShift: 1 greenMask: 1 blueShift: 0 blueMask: 1)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth04MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth04.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 10).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 10]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth04MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth04.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 10).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 10]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth04MappedRGBPDF [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth04PDF.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 13).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 13]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth04MappedRGBPDFByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth4Image exampleMappedDepth04PDF.
	self assert: smalltalkImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 13).
	self assert: pdfImage bitsPerComponent = 4.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 13]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth4Image(extent: 16 @ 16 depth: 4)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth05MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth05.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 5)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 17).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 17]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 5)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth05MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth05.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 5)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 17).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 17]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 5)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth06FixedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleFixedDepth06.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 4 redMask: 3 greenShift: 2 greenMask: 3 blueShift: 0 blueMask: 3)'.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 24.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 8 @ 8 depth: 24)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth06FixedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleFixedDepth06.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 4 redMask: 3 greenShift: 2 greenMask: 3 blueShift: 0 blueMask: 3)'.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 2.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 6.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 4 redMask: 3 greenShift: 2 greenMask: 3 blueShift: 0 blueMask: 3)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth06MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth06.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 6)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 34).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 34]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 6)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth06MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth06.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 6)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 32).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 32]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 6)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth06MappedRGBPDF [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth06PDF.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 44).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 44]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth06MappedRGBPDFByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth06PDF.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 8.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 44).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 44]'.
	self assert: pdfImage bytesPerRow = 8.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 8 @ 8 depth: 6)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth07MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth07.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 68).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 68]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth07MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth07.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 68).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 68]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth07MappedRGBPDF [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth07PDF.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 111).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 111]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth07MappedRGBPDFByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth07PDF.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 98).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 98]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 7)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08FixedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleFixedDepth08.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 5 redMask: 7 greenShift: 2 greenMask: 7 blueShift: 0 blueMask: 3)'.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 48.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 16 @ 16 depth: 24)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08FixedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleFixedDepth08.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 5 redMask: 7 greenShift: 2 greenMask: 7 blueShift: 0 blueMask: 3)'.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 4.
	self assert: pdfImage Decode printString = '[0 2.14286 0 2.14286 0 5]'.
	self assert: pdfImage bytesPerRow = 24.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 5 redMask: 7 greenShift: 2 greenMask: 7 blueShift: 0 blueMask: 3)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth08.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 235).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 235]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08MappedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth08.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 232).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 232]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08MappedRGBGray [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth08Gray.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 140 @ 133 depth: 8)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 140.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace class name = #Indexed.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 254]'.
	self assert: pdfImage bytesPerRow = 140.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 140 @ 133 depth: 8)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08MappedRGBGrayByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth08Gray.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 140 @ 133 depth: 8)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 140.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace class name = #Indexed.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 130]'.
	self assert: pdfImage bytesPerRow = 140.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 140 @ 133 depth: 8)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08MappedRGBPDF [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth08PDF.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDF.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 248).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 248]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelBytes = smalltalkImage pixelBytes
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth08MappedRGBPDFByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth8Image exampleMappedDepth08PDF.
	self assert: smalltalkImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 16.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: (pdfImage ColorSpace asSmalltalkValue first: 3) = #(#Indexed #DeviceRGB 244).
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 244]'.
	self assert: pdfImage bytesPerRow = 16.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth8Image(extent: 16 @ 16 depth: 8)'.
	self assert: recreatedImage palette class = MappedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth09MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth16Image exampleMappedDepth09PDF.
	self assert: smalltalkImage printString = 'Depth16Image(extent: 32 @ 32 depth: 9)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 64.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 96.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 32 @ 32 depth: 24)'.
	self assert: recreatedImage palette class = FixedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth10MappedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth16Image exampleMappedDepth10.
	self assert: smalltalkImage printString = 'Depth16Image(extent: 32 @ 32 depth: 10)'.
	self assert: smalltalkImage palette class = MappedPalette.
	self assert: smalltalkImage packedRowSize = 64.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 96.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 32 @ 32 depth: 24)'.
	self assert: recreatedImage palette class = FixedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth15FixedRGB [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth16Image exampleFixedDepth15.
	self assert: smalltalkImage printString = 'Depth16Image(extent: 14 @ 14 depth: 15)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 10 redMask: 31 greenShift: 5 greenMask: 31 blueShift: 0 blueMask: 31)'.
	self assert: smalltalkImage packedRowSize = 28.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	self assert: pdfImage bytesPerRow = 42.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 14 @ 14 depth: 24)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	"some colors differ by 1 bit"
	recreatedImage pixelBytes with: smalltalkImage pixelBytes do: [:bytes1 :bytes2 |
		(bytes1 = bytes2 or: [
		bytes1 with: bytes2 do: [:byte1 :byte2 |
			self assert: (byte1 - byte2) abs <= 1]])].
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth15FixedRGBByPixel [
	| smalltalkImage pdfImage recreatedImage |
	smalltalkImage := Depth16Image exampleFixedDepth15.
	self assert: smalltalkImage printString = 'Depth16Image(extent: 14 @ 14 depth: 15)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 10 redMask: 31 greenShift: 5 greenMask: 31 blueShift: 0 blueMask: 31)'.
	self assert: smalltalkImage packedRowSize = 28.
	pdfImage := smalltalkImage asPDFPixelByPixel.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self assert: pdfImage Decode printString = '[0 8.22581 0 8.22581 0 8.22581]'.
	self assert: pdfImage bytesPerRow = 42.
	recreatedImage := pdfImage asSmalltalkValuePixelByPixel.
	self assert: recreatedImage printString = 'Depth16Image(extent: 14 @ 14 depth: 15)'.
	self assert: recreatedImage palette printString = '(Graphics.FixedPalette redShift: 10 redMask: 31 greenShift: 5 greenMask: 31 blueShift: 0 blueMask: 31)'.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth24FixedRGB [
	| smalltalkImage recreatedImage pdfImage |
	smalltalkImage := Depth24Image exampleFixedDepth24.
	self assert: smalltalkImage printString = 'Depth24Image(extent: 16 @ 16 depth: 24)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: smalltalkImage packedRowSize = 48.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self assert: pdfImage bytesPerRow = 48.
	self deny: pdfImage hasDecode.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 16 @ 16 depth: 24)'.
	self assert: recreatedImage palette class = FixedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth24Of32FixedRGB [
	| smalltalkImage recreatedImage pdfImage |
	smalltalkImage := Depth32Image exampleFixedDepth24.
	self assert: smalltalkImage printString = 'Depth32Image(extent: 15 @ 16 depth: 24)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: smalltalkImage packedRowSize = 60.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self assert: pdfImage bytesPerRow = 45.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'Depth24Image(extent: 15 @ 16 depth: 24)'.
	self assert: recreatedImage palette class = FixedPalette.
	self assert: recreatedImage pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertDepth32FixedABGR [
	| smalltalkImage recreatedImage pdfImage |
	smalltalkImage := Depth32Image exampleFixedDepth32.
	self assert: smalltalkImage printString = 'Depth32Image(extent: 64 @ 32 depth: 32)'.
	self assert: smalltalkImage palette printString = '(Graphics.FixedPalette redShift: 0 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 16 blueMask: 255)'.
	self assert: smalltalkImage packedRowSize = 256.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage ColorSpace asSmalltalkValue = #DeviceRGB.
	self assert: pdfImage bitsPerComponent = 8.
	self assert: pdfImage bytesPerRow = 192.
	self assert: pdfImage Decode printString = '[0 1 0 1 0 1]'.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'an AlphaCompositedImage'.
	self assert: recreatedImage image printString = 'Depth32Image(extent: 64 @ 32 depth: 32)'.
	self assert: recreatedImage image palette class = FixedPalette.
	self assert: recreatedImage image pixelValues = smalltalkImage pixelValues
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertIcon [
	| smalltalkImage recreatedImage pdfImage |
	smalltalkImage := Icon example.
	self assert: smalltalkImage printString = 'an Icon'.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage printString = 'ImageXObject(32 @ 32 DeviceRGB 8)'.
	self deny: pdfImage isMask.
	self assert: pdfImage Mask printString = 'ImageXObject(32 @ 32 Mask 1)'.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'an OpaqueImage'.
	self assert: recreatedImage figure printString = 'a CachedImage'.
	self assert: recreatedImage figure image printString = 'Depth24Image(extent: 32 @ 32 depth: 24)'.
	self assert: recreatedImage shape printString = 'a CachedImage'.
	self assert: recreatedImage shape image printString = 'Depth1Image(extent: 32 @ 32 depth: 1)'.
]

{ #category : #'tests conversion' }
PtImageVWTests >> testConvertOpaqueImage [
	| smalltalkImage recreatedImage pdfImage |
	smalltalkImage := OpaqueImage example.
	self assert: smalltalkImage printString = 'an OpaqueImage'.
	self assert: smalltalkImage figure printString = 'a CachedImage'.
	self assert: smalltalkImage figure image printString = 'Depth24Image(extent: 16 @ 16 depth: 24)'.
	self assert: smalltalkImage shape printString = 'a CachedImage'.
	self assert: smalltalkImage shape image printString = 'Depth1Image(extent: 16 @ 16 depth: 1)'.
	pdfImage := smalltalkImage asPDF.
	self assert: pdfImage printString = 'ImageXObject(16 @ 16 DeviceRGB 8)'.
	self deny: pdfImage isMask.
	self assert: pdfImage Mask printString = 'ImageXObject(16 @ 16 Mask 1)'.
	recreatedImage := pdfImage asSmalltalkValue.
	self assert: recreatedImage printString = 'an OpaqueImage'.
	self assert: recreatedImage figure printString = 'a CachedImage'.
	self assert: recreatedImage figure image printString = 'Depth24Image(extent: 16 @ 16 depth: 24)'.
	self assert: recreatedImage shape printString = 'a CachedImage'.
	self assert: recreatedImage shape image printString = 'Depth1Image(extent: 16 @ 16 depth: 1)'.
	self assert: recreatedImage figure image pixelValues = smalltalkImage figure image pixelValues.
	self assert: recreatedImage shape image pixelValues = smalltalkImage shape image pixelValues.
]

{ #category : #'tests color bits' }
PtImageVWTests >> testGrayAsInteger [
	self assert: ((PtPDF classAt: #DeviceGray) new bitsFor: (ColorValue brightness: 0.25) withSizes: #(8)) = 2r01000000.
	self assert: ((PtPDF classAt: #DeviceGray) new bitsFor: (ColorValue brightness: 0.25) withSizes: #(4)) = 2r0100.
	self assert: ((PtPDF classAt: #DeviceGray) new bitsFor: (ColorValue brightness: 0.25) withSizes: #(2)) = 2r01.
	self assert: ((PtPDF classAt: #DeviceGray) new bitsFor: (ColorValue brightness: 0.25) withSizes: #(1)) = 2r0.
	self assert: ((PtPDF classAt: #DeviceGray) new bitsFor: (ColorValue brightness: 0.25) withSizes: #(16)) = 2r0100000000000010.
	self assert: ((PtPDF classAt: #DeviceGray) new colorAt: 2r01000000 withSizes: #(8) decodeWith: #(0 1.0)) = (ColorValue brightness: 0.250885).
	self assert: ((PtPDF classAt: #DeviceGray) new colorAt: 2r0100 withSizes: #(4) decodeWith: #(0 1.0)) = (ColorValue brightness: 0.266634).
	self assert: ((PtPDF classAt: #DeviceGray) new colorAt: 2r01 withSizes: #(2) decodeWith: #(0 1.0)) = (ColorValue brightness: 0.333293).
	self assert: ((PtPDF classAt: #DeviceGray) new colorAt: 2r0 withSizes: #(1) decodeWith: #(0 1.0)) = ColorValue black.
	self assert: ((PtPDF classAt: #DeviceGray) new colorAt: 2r0100000000000010 withSizes: #(16) decodeWith: #(0 1.0)) = (ColorValue brightness: 0.25)
]

{ #category : #tests }
PtImageVWTests >> testHexSourceFixedRGBDepth15 [
	| image pdfImage |
	image := Depth16Image exampleFixedDepth15.
	pdfImage := image asPDFPixelByPixel.
	pdfImage filter: #ASCIIHexDecode.
	self assert: pdfImage pdfSource = '<<	/Subtype /Image
	/Type /XObject
	/Width 14
	/Height 14
	/BitsPerComponent 8
	/ColorSpace /DeviceRGB
	/Decode [0 8.22581 0 8.22581 0 8.22581]
	/Length 1195
	/Filter /ASCIIHexDecode	>>
stream
0F141B10151C10151A10141C10151B10161C10151B10151C10171C10151C1016
1C10161C0F151B10151C10171C12171D11161D11161C13171D12161C12181D12
171D12161C13181D13181D13171C12181D12181D12161D10161B11161C1016
1D10171D11171C10161C11171D12181D12171D14181E12181C12171D11171D0F
161D0F151C0E151C10161D0F161B10151D0F161D11171D11151D11171C1016
1C10161D12171D10161C0C131B0C131C0B141B0B131C0C131C0C151D0A131B0A
151C0E151D0A141C0F161D0F161D0A141C0E151D09111C08121C08111C0912
1B08121C08111C09121C0A121C0A121B0B131C0B131D0A121B0A131D0A121D07
121D07101D06111C07101C07121D08121C08111D09131D09121D09141E0A14
1D09121D0A131D08111D09121E07121C09111E07121D08111E09121E09141F0A
121E0A141F0B131E0A131E0C151F0A131E09141D09121F09141F09131F0914
1E0B151F0A151F0A141F0A151F0C161F0A161F0C161F0C151F0B151F0B151F0C
161F0B151F0A151F0B151F0B151F0B151F0A161F0A171F0E161F0A171F0F17
1F0A171F0E161F0C171F0C161F0B171F0A161F0C171F0A171F0E181F0A171F0F
181F0E191F0F181F0F191F10191F0E191F0F171F0E181F0E181F0A191F0A17
1F0E181F0A171F0E191F0F191F0F191F111A1F111A1F101B1F10181F0E191F0A
171F0E191F0E171F0E191F0E191F10191F10191F101A1F10191F111B1F111B
1F11191F0F1A1F111A1F0E181F0E161F0A171F0E171F0E161F0E181F0E171F0F
191F111A1F10181F11191F11191F0F191F0F171F>
endstream' withLf
]

{ #category : #tests }
PtImageVWTests >> testHexSourceFixedRGBDepth24 [
	| image pdfImage |
	image := Depth24Image exampleFixedDepth24.
	pdfImage := image asPDF.
	pdfImage filter: #ASCIIHexDecode.
	self assert: pdfImage pdfSource = '<<	/Subtype /Image
	/Type /XObject
	/Width 16
	/Height 16
	/BitsPerComponent 8
	/ColorSpace /DeviceRGB
	/Length 1561
	/Filter /ASCIIHexDecode	>>
stream
FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
FFFF00FF414194414194414194FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FFFF00FFFF00FF414194FFFFFFC5C5FF8383E64141
94FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FF414194C5C5FFC5C5FF8383E6414194FF00FFFF00FFFF00FFFF00FFFF00
FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4141948383E68383E65252B528
288BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
FFFF00FFFF00FF41419441419428288BFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FFFF00FF626200626200949400FF00FFFF00FFFF00
FF940707940707940707FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF626200FF
FFFFFFFF00C5C5007B7B00FF00FF940707FFFFFFFF8383EE3131940707FF00
FFFF00FFFF00FFFF00FFFF00FF626200FFFF00FFFF00C5C5005A5A00FF00FF94
0707FF8383FF8383EE3131940707FF00FFFF00FFFF00FFFF00FFFF00FF9494
00C5C500C5C500949400393900FF00FF940707EE3131EE3131BD2020730000FF
00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B7B005A5A00393900FF00FFFF00
FFFF00FF940707940707730000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
00FFFF00FFFF00FFFF00FF>
endstream' withLf
]

{ #category : #tests }
PtImageVWTests >> testImageFixedRGBDepth15 [
	| image palette |
	image := Depth16Image exampleFixedDepth15.
	self assert: image printString = 'Depth16Image(extent: 14 @ 14 depth: 15)'.
	self assert: image depth = 15.
	self assert: image bitsPerPixel = 16.
	palette := image palette.
	self assert: palette class = FixedPalette.
	self assert: palette printString = '(Graphics.FixedPalette redShift: 10 redMask: 31 greenShift: 5 greenMask: 31 blueShift: 0 blueMask: 31)'.
	self assert: palette colorspace = #DeviceRGB.
	self assert: palette bitsPerComponent = 5.
	self assert: ((PtPDF classAt: #ImageXObject) nativeBitsPerComponentFor: palette bitsPerComponent) = 8.
	self assert: palette hasColor.
	self assert: palette isMonochrome not.
	self assert: palette hasGrayOrColor
]

{ #category : #tests }
PtImageVWTests >> testImageFixedRGBDepth24 [
	| image palette |
	image := Depth24Image exampleFixedDepth24.
	self assert: image printString = 'Depth24Image(extent: 16 @ 16 depth: 24)'.
	self assert: image depth = 24.
	self assert: image bitsPerPixel = 24.
	palette := image palette.
	self assert: palette class = FixedPalette.
	self assert: palette printString = '(Graphics.FixedPalette redShift: 16 redMask: 255 greenShift: 8 greenMask: 255 blueShift: 0 blueMask: 255)'.
	self assert: palette colorspace = #DeviceRGB.
	self assert: palette bitsPerComponent = 8.
	self assert: ((PtPDF classAt: #ImageXObject) nativeBitsPerComponentFor: palette bitsPerComponent) = 8.
	self assert: palette hasColor.
	self assert: palette isMonochrome not.
	self assert: palette hasGrayOrColor
]

{ #category : #tests }
PtImageVWTests >> testImageMappedRGBDepth9 [
	| image palette |
	image := Depth16Image exampleMappedDepth09PDF.
	self assert: image printString = 'Depth16Image(extent: 32 @ 32 depth: 9)'.
	self assert: image depth = 9.
	self assert: image bitsPerPixel = 16.
	palette := image palette.
	self assert: palette class = MappedPalette.
	self assert: palette mapResolution = #(4 4 4 6).
	self assert: palette size = 300.
	self assert: palette colorspace class name = #DeviceRGB.
	self assert: palette values size = 300.
	self assert: palette hasColor.
	self assert: palette isMonochrome not.
	self assert: palette hasGrayOrColor
]

{ #category : #'tests optimization' }
PtImageVWTests >> testOptimizedAsPDFDepth1 [
	| image |
	image := Depth1Image example.
	self assert: image asPDF = image asPDFPixelByPixel
]

{ #category : #'tests optimization' }
PtImageVWTests >> testOptimizedAsPDFDepth1Mask [
	| image |
	image := Depth1Image exampleMask.
	self assert: image asPDF = image asPDFPixelByPixel
]

{ #category : #'tests optimization' }
PtImageVWTests >> testOptimizedAsPDFFixedRGBDepth24 [
	| image |
	image := Depth24Image exampleFixedDepth24.
	self assert: image asPDF = image asPDFPixelByPixel
]

{ #category : #'tests optimization' }
PtImageVWTests >> testOptimizedFromPDFDepth1 [
	| pdfImage |
	pdfImage := Depth1Image example asPDF.
	self assert: (pdfImage asSmalltalkValue sameBitsAndStructure: pdfImage asSmalltalkValuePixelByPixel)
]

{ #category : #'tests optimization' }
PtImageVWTests >> testOptimizedFromPDFDepth1Mask [
	| pdfImage |
	pdfImage := Depth1Image exampleMask asPDF.
	self assert: (pdfImage asSmalltalkValue sameBitsAndStructure: pdfImage asSmalltalkValuePixelByPixel)
]

{ #category : #'tests optimization' }
PtImageVWTests >> testOptimizedFromPDFFixedRGBDepth24 [
	| pdfImage |
	pdfImage := Depth24Image exampleFixedDepth24 asPDF.
	pdfImage setDecodeExplicitly.
	self assert: (pdfImage asSmalltalkValue sameBitsAndStructure: pdfImage asSmalltalkValuePixelByPixel)
]

{ #category : #tests }
PtImageVWTests >> testPDFFixedRGBDepth15 [
	| image pdfImage |
	image := Depth16Image exampleFixedDepth15.
	pdfImage := image asPDFPixelByPixel.
	self assert: pdfImage asDictionary asSmalltalkValue asSource = ((Valuemap new: 9)
		add: #Subtype -> #Image;
		add: #Type -> #XObject;
		add: #Width -> 14;
		add: #Height -> 14;
		add: #BitsPerComponent -> 8;
		add: #ColorSpace -> #DeviceRGB;
		add: #Decode -> #(0 8.22581 0 8.22581 0 8.22581);
		add: #Length -> 275;
		add: #Filter -> #FlateDecode;
		yourself) asSource
]

{ #category : #tests }
PtImageVWTests >> testPDFFixedRGBDepth24 [
	| image pdfImage |
	image := Depth24Image exampleFixedDepth24.
	pdfImage := image asPDF.
	self assert: pdfImage asDictionary asSmalltalkValue asSource = ((Valuemap new: 7)
		add: #Subtype -> #Image;
		add: #Type -> #XObject;
		add: #Width -> 16;
		add: #Height -> 16;
		add: #BitsPerComponent -> 8;
		add: #ColorSpace -> #DeviceRGB;
		add: #Length -> 137;
		add: #Filter -> #FlateDecode;
		yourself) asSource
]

{ #category : #tests }
PtImageVWTests >> testPDFInverted [
	| image pdfImage |
	image := Depth24Image exampleFixedDepth24.
	self assert: (image valueAtPoint: 0 @ 0) asByteArray = #[255 0 255].
	pdfImage := image asPDF.
	pdfImage at: #Decode put: #(1.0 0 1.0 0 1.0 0).
	self assert: (pdfImage asSmalltalkValue valueAtPoint: 0 @ 0) asByteArray = #[0 255 0].
]

{ #category : #tests }
PtImageVWTests >> testPDFMappedRGBDepth9 [
	| image pdfImage |
	image := Depth16Image exampleMappedDepth09PDF.
	pdfImage := image asPDF.
	self assert: pdfImage asDictionary asSmalltalkValue asSource = ((Valuemap new: 8)
		add: #Subtype -> #Image;
		add: #Type -> #XObject;
		add: #Width -> 32;
		add: #Height -> 32;
		add: #BitsPerComponent -> 8;
		add: #ColorSpace -> #DeviceRGB;
		add: #Length -> 1186;
		add: #Filter -> #FlateDecode;
		yourself) asSource
]

{ #category : #'tests color bits' }
PtImageVWTests >> testPixelAccessDepth15 [
	| image pdfImage |
	image := Depth16Image exampleFixedDepth15.
	pdfImage := image asPDFPixelByPixel.
	self assert: (pdfImage valueAtPoint: 9 @ 9) = (ColorValue red: 0.419241 green: 0.741912 blue: 1.0).
	pdfImage valueAtPoint: 9 @ 9 put: ColorValue red.
	self assert: (pdfImage valueAtPoint: 9 @ 9) = ColorValue red
]

{ #category : #'tests color bits' }
PtImageVWTests >> testPixelAccessDepth24 [
	| image pdfImage |
	image := Depth24Image exampleFixedDepth24.
	pdfImage := image asPDF.
	self assert: (pdfImage valueAtPoint: 9 @ 9) = ColorValue white.
	pdfImage valueAtPoint: 9 @ 9 put: ColorValue green.
	self assert: (pdfImage valueAtPoint: 9 @ 9) = ColorValue green.
]

{ #category : #tests }
PtImageVWTests >> testResourceFixedRGBDepth15 [
	| image page |
	image := Depth16Image exampleFixedDepth15.
	page := PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer concat: (((PtPDF classAt: #Matrix) scaling: 16 @ 16) translatedBy: 50 @ 50).
		renderer paintXObject: image asPDFPixelByPixel].
	self assert: page Resources ProcSet asSmalltalkValue = #(#PDF #Text #ImageC).
	self assert: (page Resources XObject objectAt: #Im1) asDictionary asSmalltalkValue asSource = ((Valuemap new: 8)
		add: #Subtype -> #Image;
		add: #Type -> #XObject;
		add: #Width -> 14;
		add: #Height -> 14;
		add: #BitsPerComponent -> 8;
		add: #ColorSpace -> #DeviceRGB;
		add: #Decode -> #(0 8.22581 0 8.22581 0 8.22581);
		add: #Length -> 275;
		add: #Filter -> #FlateDecode;
		yourself) asSource.
	self assert: page Contents internal = '16 0 0 16 50 50 cm
/Im1 Do
' withLf
]

{ #category : #tests }
PtImageVWTests >> testResourceFixedRGBDepth24 [
	| image page |
	image := Depth24Image exampleFixedDepth24.
	page := PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer concat: (((PtPDF classAt: #Matrix) scaling: 16 @ 16) translatedBy: 50 @ 50).
		renderer paintXObject: image asPDF].
	self assert: page Resources ProcSet asSmalltalkValue = #(#PDF #Text #ImageC).
	self assert: (page Resources XObject objectAt: #Im1) asDictionary asSmalltalkValue asSource = ((Valuemap new: 7)
		add: #Subtype -> #Image;
		add: #Type -> #XObject;
		add: #Width -> 16;
		add: #Height -> 16;
		add: #BitsPerComponent -> 8;
		add: #ColorSpace -> #DeviceRGB;
		add: #Length -> 137;
		add: #Filter -> #FlateDecode;
		yourself) asSource.
	self assert: page Contents internal = '16 0 0 16 50 50 cm
/Im1 Do
' withLf
]

{ #category : #tests }
PtImageVWTests >> testResourceMappedRGBDepth8PDF [
	| image page dict |
	image := Depth8Image exampleMappedDepth08PDF.
	page := PtPDF Page newInBounds: (0 @ 0 corner: 100 @ 100) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer concat: (((PtPDF classAt: #Matrix) scaling: 16 @ 16) translatedBy: 50 @ 50).
		renderer paintXObject: image asPDF].
	self assert: page Resources ProcSet asSmalltalkValue = #(#PDF #Text #ImageI).
	dict := (page Resources XObject objectAt: #Im1) asDictionary asSmalltalkValue.
	self assert: (dict at: #Subtype) = #Image.
	self assert: (dict at: #Type) = #XObject.
	self assert: (dict at: #Width) = 16.
	self assert: (dict at: #Height) = 16.
	self assert: (dict at: #BitsPerComponent) = 8.
	self assert: ((dict at: #ColorSpace) first: 3) = #(#Indexed #DeviceRGB 248).
	self assert: (dict at: #Length) = 267.
	self assert: (dict at: #Filter) = #FlateDecode.
	self assert: page Contents internal = '16 0 0 16 50 50 cm
/Im1 Do
' withLf
]

{ #category : #tests }
PtImageVWTests >> testTooManyColorsForIndexedColorspace [
	| image pdfImage |
	image := Depth16Image exampleMappedDepth09PDF.
	pdfImage := (PtPDF classAt: #ImageXObject) empty.
	pdfImage at: #Width put: image width.
	pdfImage at: #Height put: image height.
	pdfImage bitsPerComponent: image palette bitsPerComponent.
	pdfImage at: #ColorSpace put: image palette indexedColorspace.
	self should: [image writePixelsByPixelTo: pdfImage] raise: Error
]

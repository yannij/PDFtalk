Extension { #name : #ColorValue }

{ #category : #'*PDFtalk-Colour-converting' }
ColorValue >> asCmykColor [
	"<CmykColor>"

	^CmykColor fromColorValue: self
]

{ #category : #'*PDFtalk-Colour-converting' }
ColorValue >> asColorRef [
	"^a COLORREF, a long"
	"like 0x00bbggrr"

	^(ByteReadStream littleEndianOn: (ByteArray
		with: ((self red * 256) truncated min: 255)
		with: ((self green * 256) truncated min: 255)
		with: ((self blue * 256) truncated min: 255)
		with: 0)) nextLong
]

{ #category : #'*PDFtalk-Colour-converting' }
ColorValue >> asPDFArray [
	"<Array3 of: Number>
	Array of 3 numbers between 0.0 (zero intensity) and 1.0 (maximum intensity) suitable for PDF DeviceRGB"

	^Array
		with: self red
		with: self green
		with: self blue
]

{ #category : #'*PDFtalk-Colour-accessing' }
ColorValue >> colorspace [
	^#DeviceRGB
]

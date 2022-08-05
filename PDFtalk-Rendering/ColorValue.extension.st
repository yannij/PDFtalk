Extension { #name : #ColorValue }

{ #category : #'*PDFtalk-Rendering-accessing' }
ColorValue >> fillColourSetter [
	self isGray ifTrue: [
		^PtSetNonStrokingGray with: self asGrayValue].
	^PtSetNonStrokingRGB operands: self asPDFArray
]

{ #category : #'*PDFtalk-Rendering-accessing' }
ColorValue >> strokeColourSetter [
	self isGray ifTrue: [
		^PtSetStrokingGray with: self asGrayValue].
	^PtSetStrokingRGB operands: self asPDFArray
]

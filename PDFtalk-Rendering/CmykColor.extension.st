Extension { #name : #CmykColor }

{ #category : #'*PDFtalk-Rendering-accessing' }
CmykColor >> fillColourSetter [
	self isMonochrome ifTrue: [
		^PtSetNonStrokingGray with: self asGrayValue].
	^PtSetNonStrokingCMYK operands: self asPDFArray
]

{ #category : #'*PDFtalk-Rendering-accessing' }
CmykColor >> strokeColourSetter [
	self isMonochrome ifTrue: [
		^PtSetStrokingGray with: self asGrayValue].
	^PtSetStrokingCMYK operands: self asPDFArray
]

"
Zip filters as defined in PDF 32000_2008.pdf pp. 25.

This class implements some common state and functionality for Zip-based filters.
"
Class {
	#name : #PtZipFilter,
	#superclass : #PtFilter,
	#instVars : [
		'predictor',
		'colors',
		'bitsPerComponent',
		'columns',
		'predictors',
		'predicted'
	],
	#category : #'PDFtalk-Streams'
}

{ #category : #accessing }
PtZipFilter >> bitsPerComponent [
	"<Integer>
	(May be used only if Predictor is greater than 1)
	The number of bits used to represent each colour component in a sample.
	Valid values are 1, 2, 4, 8, and (PDF 1.5) 16.
	Default value: 8."

	^bitsPerComponent ifNil: [8]
]

{ #category : #accessing }
PtZipFilter >> colors [
	"<Integer>
	(May be used only if Predictor is greater than 1)
	The number of interleaved colour components per sample.
	Valid values are 1 to 4 (PDF 1.0) and 1 or greater (PDF 1.3).
	Default value: 1."

	^colors ifNil: [1]
]

{ #category : #accessing }
PtZipFilter >> columns [
	"<Integer>
	(May be used only if Predictor is greater than 1)
	The number of samples in each row.
	Default value: 1."

	^columns ifNil: [1]
]

{ #category : #filtering }
PtZipFilter >> compressed: aByteString [
	"<ByteString>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtZipFilter >> decoded [
	(self externalIsError or: [
	self external isEmpty]) ifTrue: [
			^self external].
	^self unpredicted: self predicted
]

{ #category : #filtering }
PtZipFilter >> decompressed: aByteString [
	"<ByteString>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtZipFilter >> encoded [
	self internalIsError ifTrue: [
		^self internal].
	^self compressed: self predicted
]

{ #category : #'initialize-release' }
PtZipFilter >> initializeParameters: aDecodeParms [
	predictor := (aDecodeParms at: #Predictor ifAbsent: [
		^self]) content.
	colors := aDecodeParms at: #Colors ifPresent: #content.
	bitsPerComponent := aDecodeParms at: #BitsPerComponent ifPresent: #content.
	columns := aDecodeParms at: #Columns ifPresent: #content
]

{ #category : #accessing }
PtZipFilter >> minPdfVersion [
	^PtVersion pdf1_0
]

{ #category : #accessing }
PtZipFilter >> pdfVersion [
	self predictor = 1 ifTrue: [
		^self minPdfVersion].
	self bitsPerComponent = 16 ifTrue: [
		^PtVersion pdf1_5].
	self colors > 4 ifTrue: [
		^PtVersion pdf1_3].
	^self minPdfVersion
]

{ #category : #accessing }
PtZipFilter >> pixelDistance [
	"<Integer>
	the horizontal distance in bytes between corresponding bytes of adjacent pixels"

	self bitsPerComponent < 8 ifTrue: [
		^1].
	^self colors * self bitsPerComponent // 8
]

{ #category : #accessing }
PtZipFilter >> predicted [
	"<ByteString>
	Buffer for prediction"

	^predicted ifNil: [
		predicted := internal ifNotNil: [self predicted: self internal] ifNil: [
			self decompressed: self external]]
]

{ #category : #filtering }
PtZipFilter >> predicted: aByteString [
	"<ByteString>"

	| bytesPerRow rows rst wst |
	self predictor = 1 ifTrue: [
		^aByteString].
	self predictor = 2 ifTrue: [
		^(PtTIFFPredictor newFor: self) predicted: aByteString].
	"we deal only with PNG predictors"
	bytesPerRow := self colors * self bitsPerComponent * self columns // 8.
	rows := OrderedCollection new: aByteString size // bytesPerRow.
	rst := aByteString asByteArray readStream.
	[rst atEnd] whileFalse: [rows add: (rst next: bytesPerRow)].
	wst := (ByteArray new: aByteString size + rows size) writeStream.
	rows inject: (ByteArray new: bytesPerRow + 1 withAll: 0) into: [:upperRow :row |
		| rowPredictor predictedRow predictorType |
		predictorType := self predictor - 10.
		predictorType = 5 ifTrue: [
			predictorType := 0].
		rowPredictor := self predictorAt: predictorType.
		wst nextPut: rowPredictor type.
		predictedRow := rowPredictor predict: row withUpperRow: upperRow.
		wst nextPutAll: predictedRow.
		row].
	^wst contents asString
]

{ #category : #accessing }
PtZipFilter >> predictor [
	"<Integer>
	A code that selects the predictor algorithm, if any.
	If the value of this entry is 1, the filter shall assume that the normal algorithm was used to encode the data, without prediction.
	If the value is greater than 1, the filter shall assume that the data was differenced before being encoded, and Predictor selects the predictor algorithm.
	Default value: 1."

	^predictor ifNil: [1]
]

{ #category : #accessing }
PtZipFilter >> predictorAt: anInteger [
	"<PNGPredictor>"

	^self predictors at: anInteger ifAbsentPut: [
		(PtPNGPredictor subclassFor: anInteger) offsetLeft: self pixelDistance]
]

{ #category : #accessing }
PtZipFilter >> predictors [
	"<Dictionary key: Integer value: PNGPredictor>
	Cache for row predictors. The key can be between 0 and 4"

	^predictors ifNil: [predictors := IdentityDictionary new]
]

{ #category : #filtering }
PtZipFilter >> unpredicted: aByteString [
	"<ByteString>"

	| bytesPerRow rows rst wst |
	self predictor = 1 ifTrue: [
		^aByteString].
	self predictor = 2 ifTrue: [
		^(PtTIFFPredictor newFor: self) unpredicted: aByteString].
	"we deal only with PNG predictors"
	bytesPerRow := self colors * self bitsPerComponent * self columns // 8 + 1.
	rows := OrderedCollection new: aByteString size // bytesPerRow.
	rst := aByteString asByteArray readStream.
	[rst atEnd] whileFalse: [rows add: (rst next: bytesPerRow)].
	wst := (ByteArray new: aByteString size - rows size) writeStream.
	rows inject: (ByteArray new: bytesPerRow - 1 withAll: 0) into: [:upperRow :row |
		| rowPredictor unpredicted |
		rowPredictor := self predictorAt: row first.
		unpredicted := rowPredictor unpredict: (row allButFirst: 1) withUpperRow: upperRow.
		wst nextPutAll: unpredicted.
		unpredicted].
	^wst contents asString
]

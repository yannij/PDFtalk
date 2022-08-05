"
The type longHorMetric is defined as an array where each element has two parts: the advance width, which is of type USHORT, and the left side bearing, which is of type SHORT. These fields are in font design units.
"
Class {
	#name : #PtOTHmtx,
	#superclass : #PtOTTable,
	#instVars : [
		'hMetrics'
	],
	#category : #'PDFtalk-Fonts OpenType'
}

{ #category : #accessing }
PtOTHmtx class >> tag [
	^'hmtx'
]

{ #category : #accessing }
PtOTHmtx >> hMetrics [
	"<Array of HorMetric>"

	^hMetrics ifNil: [
		| bytes offset metrics advanceWidth |
		bytes := self bytes.
		offset := 1.
		metrics := OrderedCollection new: self file numGlyphs.
		self file numberOfHMetrics timesRepeat: [
			advanceWidth := bytes unsignedShortAt: offset.
			offset := offset + 2.
			metrics add: (PtOTHorMetric advanceWidth: advanceWidth lsb: (bytes shortAt: offset)).
			offset := offset + 2].
		self file numGlyphs - self file numberOfHMetrics timesRepeat: [
			metrics add: (PtOTHorMetric advanceWidth: advanceWidth lsb: (bytes shortAt: offset)).
			offset := offset + 2].
		hMetrics := metrics asArray]
]

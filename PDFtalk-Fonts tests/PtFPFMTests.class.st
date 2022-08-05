Class {
	#name : #PtFPFMTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #tests }
PtFPFMTests >> testRead [
	self shouldnt: [PtFPFMHeader fromBytes: PtFPFMHeader exampleBytes] raise: Error.
	self assert: (PtFPFMHeader fromBytes: PtFPFMHeader exampleBytes) = PtFPFMHeader example.
	self shouldnt: [PtFExtTextMetrics fromBytes: PtFExtTextMetrics exampleBytes] raise: Error.
	self assert: (PtFExtTextMetrics fromBytes: PtFExtTextMetrics exampleBytes) = PtFExtTextMetrics example.
	self shouldnt: [PtFPairKern fromBytes: PtFPairKern exampleBytes] raise: Error.
	self assert: (PtFPairKern fromBytes: PtFPairKern exampleBytes) = PtFPairKern example.
	self shouldnt: [PtFPostScriptFontMetrics fromBytes: PtFPostScriptFontMetrics exampleBytes] raise: Error.
	self assert: (PtFPostScriptFontMetrics fromBytes: PtFPostScriptFontMetrics exampleBytes) = PtFPostScriptFontMetrics example.
]

{ #category : #tests }
PtFPFMTests >> testReadWrite [
	self assert: (PtFPFMHeader fromBytes: PtFPFMHeader exampleBytes) asBytes = PtFPFMHeader exampleBytes.
	self assert: (PtFExtTextMetrics fromBytes: PtFExtTextMetrics exampleBytes) asBytes = PtFExtTextMetrics exampleBytes.
	self assert: (PtFPairKern fromBytes: PtFPairKern exampleBytes) asBytes = PtFPairKern exampleBytes.
	self assert: (PtFPostScriptFontMetrics fromBytes: PtFPostScriptFontMetrics exampleBytes) asBytes = PtFPostScriptFontMetrics exampleBytes.
]

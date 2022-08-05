Extension { #name : #PtFExtTextMetrics }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFExtTextMetrics class >> example [
	^PtFExtTextMetrics fromBytes: #[52 0 240 0 0 0 232 3 3 0 232 3 232 3 32 3 244 1 188 2 200 0 0 0 188 2 156 255 100 0 100 0 177 0 38 0 50 0 100 0 25 0 25 0 231 0 38 0]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFExtTextMetrics class >> exampleBytes [
	^self exampleBytesTazLT4SemiLight
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFExtTextMetrics class >> exampleBytesTazLT4SemiLight [
	^#[52 0 240 0 0 0 232 3 3 0 232 3 232 3 32 3 244 1 188 2 200 0 0 0 188 2 156 255 100 0 100 0 177 0 38 0 50 0 100 0 25 0 25 0 231 0 38 0]
]

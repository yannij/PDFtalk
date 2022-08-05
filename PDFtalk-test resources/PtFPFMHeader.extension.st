Extension { #name : #PtFPFMHeader }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPFMHeader class >> example [
	^PtFPFMHeader fromBytes: #[67 111 112 121 114 105 103 104 116 32 49 57 57 55 44 32 49 57 57 57 44 32 50 48 48 50 44 32 50 48 48 54 32 98 121 32 76 117 99 91 97 115 93 32 100 101 32 71 114 111 111 116 46 32 65 108 108 0 0 0 129 0 10 0 44 1 44 1 96 3 62 0 0 0 0 0 0 144 1 0 0 0 38 4 33 126 1 1 4 5 255 27 0 0 0]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPFMHeader class >> exampleBytes [
	^self exampleBytesTazLT4SemiLight
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPFMHeader class >> exampleBytesTazLT4SemiLight [
	^#[67 111 112 121 114 105 103 104 116 32 49 57 57 55 44 32 49 57 57 57 44 32 50 48 48 50 44 32 50 48 48 54 32 98 121 32 76 117 99 91 97 115 93 32 100 101 32 71 114 111 111 116 46 32 65 108 108 0 0 0 129 0 10 0 44 1 44 1 96 3 62 0 0 0 0 0 0 144 1 0 0 0 38 4 33 126 1 1 4 5 255 27 0 0 0]
]

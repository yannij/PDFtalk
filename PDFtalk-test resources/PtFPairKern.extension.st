Extension { #name : #PtFPairKern }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPairKern class >> example [
	^PtFPairKern first: 65 second: 28 kernAmount: -6
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPairKern class >> exampleBytes [
	^self exampleBytesTazLT4SemiLight
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFPairKern class >> exampleBytesTazLT4SemiLight [
	^#[65 28 250 255]
]

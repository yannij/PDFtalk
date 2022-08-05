Extension { #name : #PtNativeValue }

{ #category : #'*PDFtalk-test resources-test instances' }
PtNativeValue class >> example [
	^self content: 3
]

{ #category : #'*PDFtalk-test resources-accessing' }
PtNativeValue class >> stringLf [
	^String with: Character lf
]

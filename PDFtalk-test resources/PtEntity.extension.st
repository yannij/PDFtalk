Extension { #name : #PtEntity }

{ #category : #'*PDFtalk-test resources-test instances' }
PtEntity class >> example [
	"<PDFEntity>"

	^self subclassResponsibility
]

{ #category : #'*PDFtalk-test resources-accessing' }
PtEntity class >> stringLf [
	^String with: Character lf
]

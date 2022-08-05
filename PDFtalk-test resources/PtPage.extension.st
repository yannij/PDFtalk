Extension { #name : #PtPage }

{ #category : #'*PDFtalk-test resources-instance creation' }
PtPage class >> newNumbered: anInteger [
	| page |
	page := self empty.
	page at: #Number put: anInteger.
	^page
]

{ #category : #'*PDFtalk-test resources-accessing' }
PtPage >> structureString [
	^'#'
]

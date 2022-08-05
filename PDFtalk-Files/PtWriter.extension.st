Extension { #name : #PtWriter }

{ #category : #'*PDFtalk-Files-writing' }
PtWriter >> writeObjects: someReferences [
	"<CrossReferenceSection>
	Write someReferences to the stream.
	The references must have numbers assigned"

	^PtCrossReferenceSection initialOn: (someReferences collect: [:reference |
		| pos |
		pos := self position.
		reference writeIndirectObjectOn: self indent: 0.
		self cr.
		PtUsedReference id: reference id value: pos])
]

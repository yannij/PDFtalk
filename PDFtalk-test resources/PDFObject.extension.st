Extension { #name : #PDFObject }

{ #category : #'*PDFtalk-test resources-accessing attributes' }
PDFObject >> attributeNames [
	"<Collection of: Symbol>"

	^self sortedAttributePragmas collect: #selector
]

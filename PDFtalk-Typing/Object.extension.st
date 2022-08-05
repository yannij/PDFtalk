Extension { #name : #Object }

{ #category : #'*PDFtalk-Typing-testing' }
Object class >> isPDFType [
	"<Boolean>
	true if the receiver represents a PDF type"

	^self class includesSelector: #pdfTypeDefinition
]

{ #category : #'*PDFtalk-Typing-converting' }
Object class >> newPDFTypeOfClass [
	"<PDFtalk.Type>
	returns a new Type instance - only used for constructing the type hierarchy"

	^PtType newFromClass: self
]

{ #category : #'*PDFtalk-Typing-accessing' }
Object >> pdfType [
	"<PDFtalk.Type | nil>"
	
	^self class pdfType
]

{ #category : #'*PDFtalk-Typing-converting' }
Object class >> pdfType [
	"<PDFtalk.Type | nil>"

	^(self class whichClassIncludesSelector: #pdfTypeDefinition) ifNotNil: [:metaclass |
		metaclass theNonMetaClass pdfTypeOfClass]
]

{ #category : #'*PDFtalk-Typing-accessing' }
Object class >> pdfTypeDefinition [
	"<PDFtalk.Type>"

	^PDFTypeDefinition new
]

{ #category : #'*PDFtalk-Typing-converting' }
Object class >> pdfTypeOfClass [
	"<PDFtalk.Type>"

	^PDF typeAt: self pdfTypeDefinition name
]

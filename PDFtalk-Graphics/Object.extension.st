Extension { #name : #Object }

{ #category : #'*PDFtalk-Graphics-actions' }
Object >> addAsContentTokenWith: someOperands to: someOperators inParser: aContentParser [
	"<Array of: Object>"

	^someOperands , (Array with: self)
]

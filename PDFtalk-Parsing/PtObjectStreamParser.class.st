"
This parser reads PDF objects from an object stream.
Indirect objects are expected NOT to have number, generation and #obj and #endobj tags.
"
Class {
	#name : #PtObjectStreamParser,
	#superclass : #PtObjectParser,
	#category : #'PDFtalk-Parsing'
}

{ #category : #'reading objects' }
PtObjectStreamParser >> pickObjectAt: position with: aFile [
	"read an object at top level from the object stream.
	Set the position and reset it to the original after reading, so that calls can be nested."

	^self keepPositionAfter: [
		self position: position.
		aFile indirectObjectFrom: self]
]

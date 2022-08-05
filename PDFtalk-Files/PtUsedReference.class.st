"
A Cross-Reference in-use Entry as defined in PDF 32000_2008.pdf pp. 40.

The format of an in-use entry shall be:

	nnnnnnnnnn ggggg n eol

where:

	nnnnnnnnnn shall be a 10-digit byte offset in the decoded stream
	ggggg shall be a 5-digit generation number
	n shall be a keyword identifying this as an in-use entry
	eol shall be a 2-character end-of-line sequence

The byte offset in the decoded stream shall be a 10-digit number, padded with leading zeros if necessary, giving the number of bytes from the beginning of the file to the beginning of the object. It shall be separated from the generation number by a single SPACE. The generation number shall be a 5-digit number, also padded with leading zeros if necessary. Following the generation number shall be a single SPACE, the keyword n, and a 2-character end-of-line sequence consisting of one of the following: SP CR, SP LF, or CR LF. Thus, the overall length of the entry shall always be exactly 20 bytes.
"
Class {
	#name : #PtUsedReference,
	#superclass : #PtCrossReference,
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtUsedReference class >> type [
	"Type 1 entries define objects that are in use but are not compressed (corresponding to n entries in a cross-reference table).
	Field 2: The byte offset of the object, starting from the beginning of the file.
	Field 3: The generation number of the object. Default value: 0."

	^1
]

{ #category : #testing }
PtUsedReference >> isSameReference: anObject [
	^anObject isReferencedBy: self
]

{ #category : #accessing }
PtUsedReference >> keyword [
	^'n'
]

{ #category : #comparing }
PtUsedReference >> matches: anObjectId [
	^(super matches: anObjectId) and: [
	self generation = anObjectId generation]
]

{ #category : #reading }
PtUsedReference >> readIndirectObjectWith: aFile [
	"<PDFObject>"

	^aFile parser pickObjectFor: self with: aFile
]

{ #category : #testing }
PtUsedReference >> refersTo: aPDFReference [
	^self matches: aPDFReference
]

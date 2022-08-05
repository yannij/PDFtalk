"
A Cross-Reference in-use Entry for an object in an object stream as defined in PDF 32000_2008.pdf pp. 51.
"
Class {
	#name : #PtStreamReference,
	#superclass : #PtUsedReference,
	#category : #'PDFtalk-Files'
}

{ #category : #accessing }
PtStreamReference class >> type [
	"Type 2 entries define compressed objects.
	Field 2: The object number of the object stream in which this object is stored. (The generation number of the object stream shall be implicitly 0.)
	Field 3: The index of this object within the object stream."

	^2
]

{ #category : #accessing }
PtStreamReference >> generation [
	^0
]

{ #category : #accessing }
PtStreamReference >> indexInObjectStream [
	^self id generation
]

{ #category : #printing }
PtStreamReference >> printOn: aStream [
	aStream
		nextPutAll: self value printString;
		nextPutAll: ' 0 R @ ';
		nextPutAll: self indexInObjectStream printString
]

{ #category : #reading }
PtStreamReference >> readIndirectObjectWith: aFile [
	"<PDFObject>"

	^(aFile objectStreamAt: self value) readAt: self indexInObjectStream with: aFile
]

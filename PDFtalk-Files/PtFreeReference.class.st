"
A Cross-Reference free Entry as defined in PDF 32000_2008.pdf pp. 41.

The cross-reference entry for a free object has essentially the same format, except that the keyword shall be finstead of n and the interpretation of the first item is different:

	nnnnnnnnnn ggggg f eol

where:

	nnnnnnnnnn shall be the 10-digit object number of the next free object
	ggggg shall be a 5-digit generation number
	f shall be a keyword identifying this as a free entry
	eol shall be a 2-character end-of-line sequence

There are two ways an entry may be a member of the free entries list. Using the basic mechanism the free entries in the cross-reference table may form a linked list, with each free entry containing the object number of the next. The first entry in the table (object number 0) shall always be free and shall have a generation number of 65,535; it is shall be the head of the linked list of free objects. The last free entry (the tail of the linked list) links back to object number 0. Using the second mechanism, the table may contain other free entries that link back to object number 0 and have a generation number of 65,535, even though these entries are not in the linked list itself.
Except for object number 0, all objects in the cross-reference table shall initially have generation numbers of 0. When an indirect object is deleted, its cross-reference entry shall be marked free and it shall be added to the linked list of free entries. The entry’s generation number shall be incremented by 1 to indicate the generation number to be used the next time an object with that object number is created. Thus, each time the entry is reused, it is given a new generation number. The maximum generation number is 65,535; when a cross-reference entry reaches this value, it shall never be reused.
"
Class {
	#name : #PtFreeReference,
	#superclass : #PtCrossReference,
	#category : #'PDFtalk-Files'
}

{ #category : #instances }
PtFreeReference class >> initial [
	^self id: (PtObjectId number: 0 generation: 65535) value: 0
]

{ #category : #accessing }
PtFreeReference class >> type [
	"Type 0 entries define the linked list of free objects (corresponding to f entries in a cross-reference table).
	Field 2: The object number of the next free object.
	Field 3: The generation number to use if this object number is used again."

	^0
]

{ #category : #accessing }
PtFreeReference >> keyword [
	^'f'
]

{ #category : #comparing }
PtFreeReference >> matches: anObjectId [
	^(super matches: anObjectId) and: [
	self generation - 1 = anObjectId generation]
]

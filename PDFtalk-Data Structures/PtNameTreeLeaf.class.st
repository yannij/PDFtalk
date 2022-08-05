"
PDF Name Trees as defined in PDF 32000_2008.pdf pp. 88.

The Names entries in the leaf (or root) nodes shall contain the tree’s keys and their associated values, arranged in key-value pairs and shall be sorted lexically in ascending order by key.
Shorter keys shall appear before longer ones beginning with the same byte sequence.
Any encoding of the keys may be used as long as it is self-consistent; keys shall be compared for equality on a simple byte-by-byte basis.
"
Class {
	#name : #PtNameTreeLeaf,
	#superclass : #PtNameTree,
	#category : #'PDFtalk-Data Structures'
}

{ #category : #'accessing entries' }
PtNameTreeLeaf >> Limits [
	<typeArrayOf: #String>
	<required>
	<attribute: 2 documentation: 'Shall be an array of two strings, that shall specify the (lexically) least and greatest keys included in the Names array of a leaf node or in the Names arrays of any leaf nodes that are descendants of an intermediate node.'>
	^self objectAt: #Limits
]

{ #category : #'accessing entries' }
PtNameTreeLeaf >> Names [
	<type: #Array>
	<required>
	<attribute: 1 documentation: 'Shall be an array of the form
	[key1 value1 key2 value2 … keyn valuen]
where each key i shall be a string and the corresponding value i shall be the object associated with that key.
The keys shall be sorted in lexical order.'>
	^self objectAt: #Names
]

{ #category : #accessing }
PtNameTreeLeaf >> elements [
	| elements rst |
	elements := OrderedCollection new.
	rst := self Names content readStream.
	[rst atEnd] whileFalse: [elements add: rst next -> rst next].
	^elements
]

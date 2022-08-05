"
PDF Pages as defined in PDF 32000_2008.pdf pp. 75.

The pages of a document are accessed through a structure known as the page tree, which defines the ordering of pages in the document. Using the tree structure, conforming readers using only limited memory, can quickly open a document containing thousands of pages. The tree contains nodes of two types—intermediate nodes, called page tree nodes, and leaf nodes, called page objects—whose form is described in the subsequent sub-clauses. Conforming products shall be prepared to handle any form of tree structure built of such nodes.

NOTE
The simplest structure can consist of a single page tree node that references all of the document’s page objects directly. However, to optimize application performance, a conforming writer can construct trees of a particular form, known as balanced trees. Further information on this form of tree can be found in Data Structures and Algorithms, by Aho, Hopcroft, and Ullman (see the Bibliography).
"
Class {
	#name : #PtPages,
	#superclass : #PtPageTree,
	#category : #'PDFtalk-Document'
}

{ #category : #'instance creation' }
PtPages class >> empty [
	| inst |
	inst := super empty.
	inst at: #Kids put: #() asPDF.
	inst at: #Count put: 0.
	^inst
]

{ #category : #accessing }
PtPages class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Pages
		supertype: #PageTree
		section: '7.7.3.2'
		documentation: 'The pages of a document are accessed through a structure known as the page tree, which defines the ordering of pages in the document. Using the tree structure, conforming readers using only limited memory, can quickly open a document containing thousands of pages. The tree contains nodes of two types—intermediate nodes, called page tree nodes, and leaf nodes, called page objects—whose form is described in the subsequent sub-clauses. Conforming products shall be prepared to handle any form of tree structure built of such nodes.

NOTE
The simplest structure can consist of a single page tree node that references all of the document’s page objects directly. However, to optimize application performance, a conforming writer can construct trees of a particular form, known as balanced trees. Further information on this form of tree can be found in Data Structures and Algorithms, by Aho, Hopcroft, and Ullman (see the Bibliography).'
]

{ #category : #'accessing entries' }
PtPages >> Count [
	<type: #Integer>
	<required>
	<attribute: 2 documentation: 'The number of leaf nodes (page objects) that are descendants of this node within the page tree.'>
	^self objectAt: #Count
]

{ #category : #'accessing entries' }
PtPages >> Kids [
	<typeArrayOf: #PageTree>
	<required>
	<attribute: 1 documentation: 'An array of indirect references to the immediate children of this node. The children shall only be page objects or other page tree nodes.'>
	^self objectAt: #Kids
]

{ #category : #actions }
PtPages >> addPageTree: aPageTree [
	"add aPageTree (a Page or a Pages) as last element"

	self addPageTree: aPageTree withParent: self reference
]

{ #category : #actions }
PtPages >> addPageTree: aPageTree withParent: aReferenceToSelf [
	self addPageTreeReference: aPageTree newReference withParent: aReferenceToSelf
]

{ #category : #actions }
PtPages >> addPageTreeReference: aPageTreeReference withParent: aReferenceToSelf [
	aPageTreeReference referent at: #Parent put: aReferenceToSelf.
	self at: #Kids put: (self Kids with: aPageTreeReference).
	self at: #Count put: self count.
	self hasParent ifTrue: [
		self Parent updateCount]
]

{ #category : #accessing }
PtPages >> allInherited [
	"<Dictionary key: Name value: PDFObject>"

	| dict |
	dict := self hasParent
		ifTrue: [self Parent allInherited]
		ifFalse: [Dictionary new].
	#(#CropBox #MediaBox #Rotate) do: [:attribute |
		(self hasKey: attribute) ifTrue: [
			dict at: attribute put: (self at: attribute)]].
	(self hasKey: #Resources) ifTrue: [
		dict
			at: #Resources
			put: (self mergedResources: (dict at: #Resources) with: (self at: #Resources))].
	^dict
]

{ #category : #accessing }
PtPages >> count [
	^self Kids content inject: 0 into: [:sum :kid | sum + kid referent count]
]

{ #category : #accessing }
PtPages >> firstPage [
	^self Kids first firstPage
]

{ #category : #accessing }
PtPages >> numberOfPages [
	^self Count content
]

{ #category : #accessing }
PtPages >> numberOfPagesBefore: aPage [
	"<Integer>
	the number of pages before aPage in the receiver"

	self Kids objects inject: self numberOfPreviousPages into: [:numberOfPages :pageTree |
		pageTree = aPage
			ifFalse: [numberOfPages + pageTree numberOfPages]
			ifTrue: [
			^numberOfPages]]
]

{ #category : #accessing }
PtPages >> pageAt: anInteger [
	| pageNumber |
	(anInteger between: 0 and: self numberOfPages) ifFalse: [
		^Error raiseSignal: 'No page with number ', anInteger printString].
	pageNumber := anInteger.
	self Kids objects do: [:pageTree |
		pageTree numberOfPages < pageNumber
			ifTrue: [
			pageNumber := pageNumber - pageTree numberOfPages]
			ifFalse: [
			^pageTree pageAt: pageNumber]]
]

{ #category : #enumerating }
PtPages >> pagesDo: oneArgumentBlock [
	self Kids objects do: [:pageTree | pageTree pagesDo: oneArgumentBlock]
]

{ #category : #accessing }
PtPages >> reference [
	^self Kids isEmpty
		ifTrue: [
		self hasParent
			ifTrue: [self Parent referenceTo: self]
			ifFalse: [self newReference]]
		ifFalse: [
		self Kids first at: #Parent]
]

{ #category : #accessing }
PtPages >> referenceTo: aPages [
	self Kids do: [:kidRef |
		kidRef content == aPages ifTrue: [
			^kidRef]].
	^nil
]

{ #category : #actions }
PtPages >> updateCount [
	self at: #Count put: self count
]

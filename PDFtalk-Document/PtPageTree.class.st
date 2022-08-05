"
PDF Page Tree as defined in PDF 32000_2008.pdf pp. 75.

The pages of a document are accessed through a structure known as the page tree, which defines the ordering of pages in the document.
Using the tree structure, conforming readers using only limited memory, can quickly open a document containing thousands of pages.
The tree contains nodes of two types—intermediate nodes, called page tree nodes, and leaf nodes, called page objects.
Conforming products shall be prepared to handle any form of tree structure built of such nodes.
"
Class {
	#name : #PtPageTree,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtPageTree class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #PageTree
		supertype: #Dictionary
		section: '7.7.3.2'
		documentation: 'The pages of a document are accessed through a structure known as the page tree, which defines the ordering of pages in the document.
Using the tree structure, conforming readers using only limited memory, can quickly open a document containing thousands of pages.
The tree contains nodes of two types—intermediate nodes, called page tree nodes, and leaf nodes, called page objects.
Conforming products shall be prepared to handle any form of tree structure built of such nodes.'
]

{ #category : #comparing }
PtPageTree >> = anObject [
	^self class == anObject class and: [
	self contentWithoutCycles = anObject contentWithoutCycles]
]

{ #category : #'accessing entries' }
PtPageTree >> CropBox [
	<type: #Rectangle>
	<inheritable>
	<attribute: 4 documentation: 'A rectangle, expressed in default user space units,
that shall define the visible region of default user space.
When the page is displayed or printed, its contents shall be clipped (cropped) to this rectangle
and then shall be imposed on the output medium in some implementation-defined manner.
Default value: the value of MediaBox.'>
	^self objectAt: #CropBox inheritOr: [self MediaBox]
]

{ #category : #'accessing entries' }
PtPageTree >> MediaBox [
	<type: #Rectangle>
	<inheritable>
	<attribute: 3 documentation: 'A rectangle, expressed in default user space units,
that shall define the boundaries of the physical medium on which the page shall be displayed or printed.'>
	^self inherited: #MediaBox
]

{ #category : #'accessing entries' }
PtPageTree >> Parent [
	<typeIndirect: #Pages>
	<attribute: 1 documentation: '(Required except in root node; prohibited in the root node)
	The page tree node that is the immediate parent of this one.'>
	^self objectAt: #Parent ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPageTree >> Resources [
	<type: #Resources>
	<inheritable>
	<attribute: 2 documentation: 'A dictionary containing any resources required by the page.
If the page requires no resources, the value of this entry shall be an empty dictionary.
Omitting the entry entirely indicates that the resources shall be inherited from an ancestor node in the page tree.'>
	^self inherited: #Resources
]

{ #category : #'accessing entries' }
PtPageTree >> Rotate [
	<type: #Integer>
	<inheritable>
	<attribute: 5 documentation: 'The number of degrees by which the page shall be rotated clockwise when displayed or printed.
The value shall be a multiple of 90.'>
	^self objectAt: #Rotate inheritOr: [0 asPDF]
]

{ #category : #accessing }
PtPageTree >> contentWithoutCycles [
	| copy |
	copy := super contentWithoutCycles.
	copy removeKey: #Parent ifAbsent: [nil].
	^copy
]

{ #category : #copying }
PtPageTree >> copyDownInherited [
	"add all inherited attributes from the parents"

	| dict |
	dict := self hasParent ifTrue: [
		self Parent allInherited].
	dict keysAndValuesDo: [:name :object |
		| newObject |
		newObject := object.
		((self hasKey: name) and: [
		name = #Resources]) ifTrue: [
				newObject := self mergedResources: self Resources with: object].
		self at: name put: newObject]
]

{ #category : #copying }
PtPageTree >> copyIsolatedWithNewReferences [
	"<Page>
	dont copy the parent reference - the whole document would be included"

	| copy |
	copy := self copy.
	"copy copyDownInherited."
	copy content removeKey: #Parent ifAbsent: [nil].
	^copy copyWithNewReferences
]

{ #category : #accessing }
PtPageTree >> count [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtPageTree >> firstPage [
	"<Page>"

	^self subclassResponsibility
]

{ #category : #testing }
PtPageTree >> hasParent [
	^self hasKey: #Parent
]

{ #category : #comparing }
PtPageTree >> hash [
	^self contentWithoutCycles hash
]

{ #category : #accessing }
PtPageTree >> inherited: aSymbol [
	"<PDF.Object>
	returns the object which MUST be present in the Parent chain.
	If the attribute is absent, look for it in the parents.
	Throw error if not found"

	| pdf unique |
	unique := 'unique'.
	pdf := self content at: aSymbol ifAbsent: [unique].
	pdf == unique ifFalse: [
		^pdf pdfObject].
	^(self Parent inherited: aSymbol) pdfObject
]

{ #category : #accessing }
PtPageTree >> mergedResources: aGeneralResources with: aSpecificResources [
	"<Dictionary key: Name value: PDFObject>"

	| merged |
	merged := aGeneralResources copy.
	aSpecificResources keysAndValuesDo: [:name :object |
		| newObject |
		newObject := (merged hasKey: name)
			ifTrue: [
			self mergedResources: (merged at: name) with: object]
			ifFalse: [
			object].
		merged at: name put: newObject].
	^merged
]

{ #category : #accessing }
PtPageTree >> numberOfPages [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtPageTree >> numberOfPreviousPages [
	"<Integer>
	the number of pages before the receiver in the document."

	self hasParent ifFalse: [
		^0].
	^self Parent numberOfPagesBefore: self
]

{ #category : #accessing }
PtPageTree >> objectAt: aSymbol inheritOr: aBlock [
	"<PDF.Object>
	returns the object.
	If the attribute is absent, look for it in the parents.
	If not found, answer the block value"

	| pdf unique |
	unique := 'unique'.
	pdf := self content at: aSymbol ifAbsent: [unique].
	pdf == unique ifFalse: [
		^pdf pdfObject].
	pdf := self Parent objectAt: aSymbol inheritOr: [
		^aBlock value].
	^pdf pdfObject
]

{ #category : #accessing }
PtPageTree >> pageAt: anInteger [
	"<Page>
	throws exception when out of bounds"

	^self subclassResponsibility
]

{ #category : #enumerating }
PtPageTree >> pagesDo: oneArgumentBlock [
	self subclassResponsibility
]

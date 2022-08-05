"
PDF Outline dictionary as defined in PDF 32000_2008.pdf, section 12.3.3,  pp. 367.

A PDF document may contain a document outline that the conforming reader may display on the screen, allowing the user to navigate interactively from one part of the document to another.
The outline consists of a tree-structured hierarchy of outline items (sometimes called bookmarks), which serve as a visual table of contents to display the document’s structure to the user.
The user may interactively open and close individual items by clicking them with the mouse.
When an item is open, its immediate children in the hierarchy shall become visible on the screen; each child may in turn be open or closed, selectively revealing or hiding further parts of the hierarchy. 
When an item is closed, all of its descendants in the hierarchy shall be hidden.
Clicking the text of any visible item activates the item, causing the conforming reader to jump to a destination or trigger an action associated with the item.

The root of a document’s outline hierarchy is an outline dictionary specified by the Outlines entry in the document catalogue.
Each individual outline item within the hierarchy shall be defined by an outline item dictionary.
The items at each level of the hierarchy form a linked list, chained together through their Prev and Next entries and accessed through the First and Last entries in the parent item (or in the outline dictionary in the case of top-level items).
When displayed on the screen, the items at a given level shall appear in the order in which they occur in the linked list.

"
Class {
	#name : #PtOutlines,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtOutlines class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Outlines
		supertype: #Dictionary
		section: '12.3.3'
		documentation: 'A PDF document may contain a document outline that the conforming reader may display on the screen, allowing the user to navigate interactively from one part of the document to another.
The outline consists of a tree-structured hierarchy of outline items (sometimes called bookmarks), which serve as a visual table of contents to display the document’s structure to the user.
The user may interactively open and close individual items by clicking them with the mouse.
When an item is open, its immediate children in the hierarchy shall become visible on the screen; each child may in turn be open or closed, selectively revealing or hiding further parts of the hierarchy. 
When an item is closed, all of its descendants in the hierarchy shall be hidden.
Clicking the text of any visible item activates the item, causing the conforming reader to jump to a destination or trigger an action associated with the item.

The root of a document’s outline hierarchy is an outline dictionary specified by the Outlines entry in the document catalogue.
Each individual outline item within the hierarchy shall be defined by an outline item dictionary.
The items at each level of the hierarchy form a linked list, chained together through their Prev and Next entries and accessed through the First and Last entries in the parent item (or in the outline dictionary in the case of top-level items).
When displayed on the screen, the items at a given level shall appear in the order in which they occur in the linked list.'
]

{ #category : #'accessing entries' }
PtOutlines >> Count [
	<type: #Integer>
	<attribute: 4 documentation: '(Required if the document has any open outline entries)
Total number of visible outline items at all levels of the outline.
The value cannot be negative.
This entry shall be omitted if there are no open outline items.'>
	^self objectAt: #Count
]

{ #category : #'accessing entries' }
PtOutlines >> First [
	<typeIndirect: #OutlineItem>
	<required>
	<attribute: 2 documentation: '(Required if there are any open or closed outline entries)
An outline item dictionary representing the first top-level item in the outline.'>
	^self objectAt: #First
]

{ #category : #'accessing entries' }
PtOutlines >> Last [
	<typeIndirect: #OutlineItem>
	<required>
	<attribute: 3 documentation: '(Required if there are any open or closed outline entries)
An outline item dictionary representing the last top-level item in the outline.'>
	^self objectAt: #Last
]

{ #category : #'accessing entries' }
PtOutlines >> Type [
	<type: #Name>
	<attribute: 1 documentation: 'The type of PDF object that this dictionary describes.'>
	^self objectAt: #Type ifAbsent: [#Outlines asPDF]
]

{ #category : #accessing }
PtOutlines >> itemAt: aSectionString [
	"<OutlineItem | nil>
	aSectionString is like '7.3.5' "

	| rst search rest |
	rst := aSectionString readStream.
	search := rst upTo: $..
	rest := rst upToEnd.
	^self items
		detect: [:item | search , '*' match: item titleString]
		ifFound: [:item | item itemAt: rest in: search]
		ifNone: [nil]
]

{ #category : #accessing }
PtOutlines >> items [ 
	"<SequenceableCollecrtion of: OutlineItem>"

	| list item |
	list := OrderedCollection new.
	item := self First.
	list add: item.
	[item hasKey: #Next] whileTrue: 
			[item := item Next.
			list add: item].
	^list
]

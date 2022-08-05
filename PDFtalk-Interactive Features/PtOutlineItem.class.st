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
	#name : #PtOutlineItem,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtOutlineItem class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #OutlineItem
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
PtOutlineItem >> A [
	<type: #Action>
	<version: 1 dot: 1>
	<attribute: 9 documentation: '(shall not be present if a Dest entry is present)
The action that shall be performed when this item is activated.'>
	^self objectAt: #A ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOutlineItem >> C [
	<typeArrayOf: #Number>
	<version: 1 dot: 4>
	<attribute: 11 documentation: 'An array of three numbers in the range 0.0 to 1.0, representing the components in the DeviceRGB colour space of the colour that shall be used for the outline entry’s text.'>
	^self objectAt: #C ifAbsent: [#(0.0 0.0 0.0) asPDF]
]

{ #category : #'accessing entries' }
PtOutlineItem >> Count [
	<type: #Integer>
	<attribute: 7 documentation: '(Required if the item has any descendants)
If the outline item is open, Count is the sum of the number of visible descendent outline items at all levels.
The number of visible descendent outline items shall be determined by the following recursive process:
	Step 1. Initialize Count to zero.
	Step 2. Add to Count the number of immediate children. During repetitions of this step, update only the Count of the original outline item.
	Step 3. For each of those immediate children whose Count is positive and non-zero, repeat steps 2 and 3.
If the outline item is closed, Count is negative and its absolute value is the number of descendants that would be visible if the outline item were opened.'>
	^self objectAt: #Count
]

{ #category : #'accessing entries' }
PtOutlineItem >> Dest [
	<type: #Destination>
	<type: #Name>
	<type: #String>
	<attribute: 8 documentation: '(shall not be present if an A entry is present)
The destination that shall be displayed when this item is activated.'>
	^self objectAt: #Dest ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtOutlineItem >> F [
	<type: #Integer>
	<version: 1 dot: 4>
	<attribute: 12 documentation: 'A set of flags specifying style characteristics for displaying the outline item’s text.

The value shall be an integer interpreted as one-bit flags specifying style characteristics for displaying the item.
Bit positions within the flag word are numbered from low-order to high-order bits, with the lowest-order bit numbered 1.
Bit position		Name		Meaning
	1			Italic		If set to 1, display the item in italic.
	2			Bold		If set to 1, display the item in bold.
All other bits of the integer shall be 0.'>
	^self objectAt: #F ifAbsent: [0 asPDF]
]

{ #category : #'accessing entries' }
PtOutlineItem >> First [
	<typeIndirect: #OutlineItem>
	<attribute: 5 documentation: '(Required if the item has any descendants)
The first of this item’s immediate children in the outline hierarchy.'>
	^self objectAt: #First
]

{ #category : #'accessing entries' }
PtOutlineItem >> Last [
	<typeIndirect: #OutlineItem>
	<attribute: 6 documentation: '(Required if the item has any descendants)
The last of this item’s immediate children in the outline hierarchy.'>
	^self objectAt: #Last
]

{ #category : #'accessing entries' }
PtOutlineItem >> Next [
	<typeIndirect: #OutlineItem>
	<attribute: 4 documentation: '(Required for all but the last item at each level)
The next item at this outline level.'>
	^self objectAt: #Next
]

{ #category : #'accessing entries' }
PtOutlineItem >> Parent [
	<typeIndirect: #OutlineItem>
	<typeIndirect: #Outlines>
	<required>
	<attribute: 2 documentation: 'The parent of this item in the outline hierarchy.
The parent of a top-level item shall be the outline dictionary itself.'>
	^self objectAt: #Parent
]

{ #category : #'accessing entries' }
PtOutlineItem >> Prev [
	<typeIndirect: #OutlineItem>
	<attribute: 3 documentation: '(Required for all but the first item at each level)
The previous item at this outline level.'>
	^self objectAt: #Prev
]

{ #category : #'accessing entries' }
PtOutlineItem >> SE [
	<typeIndirect: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 10 documentation: 'The structure element to which the item refers.'>
	^self objectAt: #SE ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtOutlineItem >> Title [
	<type: #String>
	<required>
	<attribute: 1 documentation: 'The text that shall be displayed on the screen for this item.'>
	^self objectAt: #Title
]

{ #category : #accessing }
PtOutlineItem >> itemAt: searchString in: readString [
	"<OutlineItem | nil>
	aSectionString is like '7.3.5' "

	| rst search rest |
	searchString isEmpty ifTrue: [^self].
	rst := searchString readStream.
	search := readString , '.' , (rst upTo: $.).
	rest := rst upToEnd.
	^self items
		detect: [:item | search , '*' match: item titleString]
		ifFound: [:item | item itemAt: rest in: search]
		ifNone: [nil]
]

{ #category : #accessing }
PtOutlineItem >> items [ 
	"<SequenceableCollecrtion of: OutlineItem>"

	| list item |
	list := OrderedCollection new.
	(self hasKey: #First) ifFalse: [
		^list].
	item := self First.
	list add: item.
	[item hasKey: #Next] whileTrue: 
			[item := item Next.
			list add: item].
	^list
]

{ #category : #accessing }
PtOutlineItem >> titleString [
	"<String>"
	
	^self Title asString
]

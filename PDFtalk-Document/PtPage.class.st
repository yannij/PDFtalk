"
PDF Page as defined in PDF 32000_2008.pdf pp. 77.

The leaves of the page tree are page objects, each of which is a dictionary specifying the attributes of a single page of the document.
The table also identifies which attributes a page may inherit from its ancestor nodes in the page tree.
Attributes that are not explicitly identified in the table as inheritable shall not be inherited.
"
Class {
	#name : #PtPage,
	#superclass : #PtPageTree,
	#category : #'PDFtalk-Document'
}

{ #category : #accessing }
PtPage class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #Page
		supertype: #PageTree
		section: '7.7.3.3'
		documentation: 'The leaves of the page tree are page objects, each of which is a dictionary specifying the attributes of a single page of the document.
The table also identifies which attributes a page may inherit from its ancestor nodes in the page tree.
Attributes that are not explicitly identified in the table as inheritable shall not be inherited.'
]

{ #category : #'accessing entries' }
PtPage >> AA [
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 18 documentation: 'An additional-actions dictionary that shall define actions to be performed when the page is opened or closed.
(PDF 1.3) additional-actions dictionaries are not inheritable.'>
	^self objectAt: #AA ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPage >> Annots [
	<typeArrayOf: #Annot>
	<attribute: 17 documentation: 'An array of annotation dictionaries that shall contain indirect references to all annotations associated with the page.'>
	^self objectAt: #Annots ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtPage >> ArtBox [
	<type: #Rectangle>
	<version: 1 dot: 3>
	<attribute: 8 documentation: 'A rectangle, expressed in default user space units,
that shall define the extent of the page’s meaningful content (including potential white space) as intended by the page’s creator.'>
	^self objectAt: #ArtBox ifAbsent: [self CropBox]
]

{ #category : #'accessing entries' }
PtPage >> B [
	<typeArrayOf: #Reference>
	<version: 1 dot: 1>
	<attribute: 14 documentation: '(recommended if the page contains article beads)
An array that shall contain indirect references to all article beads appearing on the page.
The beads shall be listed in the array in natural reading order.

NOTE
The information in this entry can be created or recreated from the information obtained from the Threads key in the Catalog.'>
	^self objectAt: #B ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtPage >> BleedBox [
	<type: #Rectangle>
	<version: 1 dot: 3>
	<attribute: 6 documentation: 'A rectangle, expressed in default user space units,
that shall define the region to which the contents of the page shall be clipped when output in a production environment.'>
	^self objectAt: #BleedBox ifAbsent: [self CropBox]
]

{ #category : #'accessing entries' }
PtPage >> BoxColorInfo [
	<type: #Dictionary>
	<version: 1 dot: 4>
	<attribute: 9 documentation: 'A box colour information dictionary that shall specify the colours and other visual characteristics that should be used in displaying guidelines on the screen for the various page boundaries.
If this entry is absent, the application shall use its own current default settings.'>
	^self objectAt: #BoxColorInfo ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPage >> Contents [
	<type: #Contents>
	<typeArrayOf: #Contents>
	<attribute: 10 documentation: 'A content stream that shall describe the contents of this page.
If this entry is absent, the page shall be empty.

The value shall be either a single stream or an array of streams.
If the value is an array, the effect shall be as if all of the streams in the array were concatenated, in order, to form a single stream.
Conforming writers can create image objects and other resources as they occur, even though they interrupt the content stream. The division between streams may occur only at the boundaries between lexical tokens (see 7.2, "Lexical Conventions") but shall be unrelated to the page’s logical content or organization. Applications that consume or produce PDF files need not preserve the existing structure of the Contents array. Conforming writers shall not create a Contents array containing no elements.'>
	^self objectAt: #Contents ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> Dur [
	<type: #Number>
	<version: 1 dot: 1>
	<attribute: 15 documentation: 'The page’s display duration (also called its advance timing):
the maximum length of time, in seconds, that the page shall be displayed during presentations before the viewer application shall automatically advance to the next page.
By default, the viewer shall not advance automatically.'>
	^self objectAt: #Dur ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> Group [
	<type: #GroupAttributes>
	<version: 1 dot: 4>
	<attribute: 12 documentation: 'A group attributes dictionary that shall specify the attributes of the page’s page group for use in the transparent imaging model'>
	^self objectAt: #Group ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtPage >> ID [
	<type: #String>
	<version: 1 dot: 3>
	<attribute: 22 documentation: '(indirect reference preferred)
The digital identifier of the page’s parent Web Capture content set.'>
	^self objectAt: #ID ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> LastModified [
	<type: #Date>
	<requiredIf: #PieceInfo>
	<version: 1 dot: 3>
	<attribute: 2 documentation: 'The date and time when the page’s contents were most recently modified.
If a page-piece dictionary (PieceInfo) is present, the modification date shall be used to ascertain 
which of the application data dictionaries that it contains correspond to the current content of the page.'>
	^self objectAt: #LastModified ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> MediaBox [
	<type: #Rectangle>
	<required>
	<inheritable>
	<attribute: 4 documentation: 'A rectangle, expressed in default user space units,
that shall define the boundaries of the physical medium on which the page shall be displayed or printed.'>
	^self inherited: #MediaBox
]

{ #category : #'accessing entries' }
PtPage >> Metadata [
	<type: #Metadata>
	<version: 1 dot: 4>
	<attribute: 19 documentation: 'A metadata stream that shall contain metadata for the page.'>
	^self objectAt: #Metadata ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> PZ [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 23 documentation: 'The page’s preferred zoom (magnification) factor:
the factor by which it shall be scaled to achieve the natural display magnification.'>
	^self objectAt: #PZ ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> Parent [
	<typeIndirect: #Pages>
	<required>
	<attribute: 1 documentation: 'The page tree node that is the immediate parent of this page object.'>
	^self objectAt: #Parent
]

{ #category : #'accessing entries' }
PtPage >> PieceInfo [
	<typeDictionaryOf: #PieceInfo>
	<version: 1 dot: 3>
	<attribute: 20 documentation: 'A page-piece dictionary associated with the page.'>
	^self objectAt: #PieceInfo ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtPage >> PresSteps [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 27 documentation: 'A navigation node dictionary that shall represent the first node on the page.'>
	^self objectAt: #PresSteps ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPage >> Resources [
	<type: #Resources>
	<required>
	<inheritable>
	<attribute: 3 documentation: 'A dictionary containing any resources required by the page.
If the page requires no resources, the value of this entry shall be an empty dictionary.
Omitting the entry entirely indicates that the resources shall be inherited from an ancestor node in the page tree.'>
	^self inherited: #Resources
]

{ #category : #'accessing entries' }
PtPage >> SeparationInfo [
	<type: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 24 documentation: 'A separation dictionary that shall contain information needed to generate colour separations for the page.'>
	^self objectAt: #SeparationInfo ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPage >> StructParents [
	<type: #Integer>
	<version: 1 dot: 3>
	<attribute: 21 documentation: 'The integer key of the page’s entry in the structural parent tree.'>
	^self objectAt: #StructParents ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> Tabs [
	<type: #Name>
	<version: 1 dot: 5>
	<attribute: 25 documentation: 'A name specifying the tab order that shall be used for annotations on the page. The possible values shall be R (row order), C (column order), and S (structure order).'>
	^self objectAt: #Tabs ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> TemplateInstantiated [
	<type: #Name>
	<version: 1 dot: 5>
	<attribute: 26 documentation: '(Required if this page was created from a named page object)
The name of the originating page object.'>
	^self objectAt: #TemplateInstantiated ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> Thumb [
	<type: #ThumbnailImage>
	<attribute: 13 documentation: 'A stream object that shall define the page’s thumbnail image'>
	^self objectAt: #Thumb ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtPage >> Trans [
	<type: #Dictionary>
	<version: 1 dot: 1>
	<attribute: 16 documentation: 'A transition dictionary describing the transition effect that shall be used when displaying the page during presentations.'>
	^self objectAt: #Trans ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtPage >> TrimBox [
	<type: #Rectangle>
	<version: 1 dot: 3>
	<attribute: 7 documentation: 'A rectangle, expressed in default user space units,
that shall define the intended dimensions of the finished page after trimming.'>
	^self objectAt: #TrimBox ifAbsent: [self CropBox]
]

{ #category : #'accessing entries' }
PtPage >> UserUnit [
	<type: #Number>
	<version: 1 dot: 6>
	<attribute: 28 documentation: 'A positive number that shall give the size of default user space units, in multiples of 1/72 inch.
The range of supported values shall be implementation-dependent.
Default value: 1.0 (user space unit is 1/72 inch).'>
	^self objectAt: #UserUnit ifAbsent: [1.0 asPDF]
]

{ #category : #'accessing entries' }
PtPage >> VP [
	<type: #Array>
	<version: 1 dot: 6>
	<attribute: 29 documentation: 'An array of viewport dictionaries that shall specify rectangular regions of the page.'>
	^self objectAt: #VP ifAbsent: [#() asPDF]
]

{ #category : #accessing }
PtPage >> contentGraphics [
	"<ContentGraphics>"

	^PtContentGraphics on: self
]

{ #category : #accessing }
PtPage >> contentString [
	"<String>
	all decoded content of Contents"

	self Contents ifNil: [
		^''].
	(self Contents isKindOf: PtPDF Array) ifTrue: [
		| wst |
		wst := String new writeStream.
		self Contents objects do: [:contents |
			wst nextPutAll: (contents encrypted
				ifTrue: ['']
				ifFalse: [
				contents internal])].
		^wst contents].
	self Contents encrypted ifTrue: [
		^''].
	^self Contents internal
]

{ #category : #accessing }
PtPage >> count [
	^1
]

{ #category : #accessing }
PtPage >> firstContents [
	"<Contents>"

	(self Contents isKindOf: PtPDF Array) ifTrue: [
		^self Contents first].
	^self Contents
]

{ #category : #accessing }
PtPage >> firstPage [
	^self
]

{ #category : #testing }
PtPage >> isEncrypted [
	| firstContents |
	firstContents := self firstContents.
	^firstContents notNil and: [
	firstContents encrypted]
]

{ #category : #accessing }
PtPage >> numberOfPages [
	^1
]

{ #category : #accessing }
PtPage >> pageAt: anInteger [
	anInteger = 1 ifFalse: [
		^Error raiseSignal: 'No page with number ', anInteger printString].
	^self
]

{ #category : #accessing }
PtPage >> pageNumber [
	"<Integer>
	the index of the receiver in the document.
	The first page has the pageNumber 1"

	^self numberOfPreviousPages + 1
]

{ #category : #enumerating }
PtPage >> pagesDo: oneArgumentBlock [
	oneArgumentBlock value: self
]

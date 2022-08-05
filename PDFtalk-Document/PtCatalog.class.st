"
PDF Catalog as defined in PDF 32000_2008.pdf pp. 71.

The root of a document’s object hierarchy is the catalog dictionary, located by means of the Root entry in the trailer of the PDF file (see Trailer). 
The catalog contains references to other objects defining the document’s contents, outline, article threads, named destinations, and other attributes. In addition, it contains information about how the document shall be displayed on the screen, such as whether its outline and thumbnail page images shall be displayed automatically and whether some location other than the first page shall be shown when the document is opened.
"
Class {
	#name : #PtCatalog,
	#superclass : #PtTypedDictionary,
	#category : #'PDFtalk-Document'
}

{ #category : #'instance creation' }
PtCatalog class >> empty [
	| inst |
	inst := super empty.
	inst at: #Pages put: (PtPDF classAt: #Pages) empty newReference.
	^inst
]

{ #category : #accessing }
PtCatalog class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Catalog
		supertype: #Dictionary
		section: '7.7.2'
		documentation: 'The root of a document’s object hierarchy is the catalog dictionary, located by means of the Root entry in the trailer of the PDF file (see Trailer). 
The catalog contains references to other objects defining the document’s contents, outline, article threads, named destinations, and other attributes. In addition, it contains information about how the document shall be displayed on the screen, such as whether its outline and thumbnail page images shall be displayed automatically and whether some location other than the first page shall be shown when the document is opened.'
]

{ #category : #'accessing entries' }
PtCatalog >> AA [
	<type: #Dictionary>
	<version: 1 dot: 4>
	<attribute: 14 documentation: 'An additional-actions dictionary defining the actions that shall be taken in response to various trigger events affecting the document as a whole.'>
	^self objectAt: #AA ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> AF [
	<typeArrayOf: #EmbeddedFile>
	<version: 2 dot: 0>
	<attribute: 30 documentation: 'Associated File'>
	^self objectAt: #AF ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> AcroForm [
	<type: #Dictionary>
	<version: 1 dot: 2>
	<attribute: 16 documentation: 'The document’s interactive form (AcroForm) dictionary.'>
	^self objectAt: #AcroForm ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Collection [
	<type: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 28 documentation: 'A collection dictionary that a conforming reader shall use to enhance the presentation of file attachments stored in the PDF document.'>
	^self objectAt: #Collection ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Dests [
	<typeIndirect: #Dictionary>
	<version: 1 dot: 1>
	<attribute: 7 documentation: 'A dictionary of names and corresponding destinations.'>
	^self objectAt: #Dests ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Extensions [
	<type: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 3 documentation: '(ISO 32000)
An extensions dictionary containing developer prefix identification and version numbers for developer extensions that occur in this document.'>
	^self objectAt: #Extensions ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Lang [
	<type: #String>
	<version: 1 dot: 4>
	<attribute: 20 documentation: 'A language identifier that shall specify the natural language for all text in the document
except where overridden by language specifications for structure elements or marked content. 
If this entry is absent, the language shall be considered unknown.'>
	^self objectAt: #Lang ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> Legal [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 26 documentation: 'A dictionary that shall contain attestations regarding the content of a PDF document, as it relates to the legality of digital signatures.'>
	^self objectAt: #Legal ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> MarkInfo [
	<type: #Dictionary>
	<version: 1 dot: 4>
	<attribute: 19 documentation: 'A mark information dictionary that shall contain information about the document’s usage of Tagged PDF conventions.'>
	^self objectAt: #MarkInfo ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Metadata [
	<typeIndirect: #Metadata>
	<version: 1 dot: 4>
	<attribute: 17 documentation: 'A metadata stream that shall contain metadata for the document.'>
	^self objectAt: #Metadata ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtCatalog >> Names [
	<type: #Names>
	<version: 1 dot: 2>
	<attribute: 6 documentation: 'The document’s name dictionary (see Name).'>
	^self objectAt: #Names ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtCatalog >> NeedsRendering [
	<type: #Boolean>
	<version: 1 dot: 7>
	<attribute: 29 documentation: 'A flag used to expedite the display of PDF documents containing XFA forms.
It specifies whether the document shall be regenerated when the document is first opened.
See the XML Forms Architecture (XFA) Specification.
Default value: false.'>
	^self objectAt: #NeedsRendering ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtCatalog >> OCProperties [
	<type: #OptionalContentProperties>
	<version: 1 dot: 5>
	<attribute: 24 documentation: '(required if a document contains optional content)
The document’s optional content properties dictionary.'>
	^self objectAt: #OCProperties ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtCatalog >> OpenAction [
	<type: #Array>
	<type: #Dictionary>
	<version: 1 dot: 1>
	<attribute: 13 documentation: 'A value specifying a destination that shall be displayed or an action that shall be performed when the document is opened.
The value shall be either an array defining a destination or an action dictionary representing an action.
If this entry is absent, the document shall be opened to the top of the first page at the default magnification factor.'>
	^self objectAt: #OpenAction ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> Outlines [
	<typeIndirect: #Outlines>
	<attribute: 11 documentation: 'The outline dictionary that shall be the root of the document’s outline hierarchy.'>
	^self objectAt: #Outlines ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> OutputIntents [
	<typeArrayOf: #OutputIntent>
	<version: 1 dot: 4>
	<attribute: 22 documentation: 'An array of output intent dictionaries that shall specify the colour characteristics of output devices on which the document might be rendered.'>
	^self objectAt: #OutputIntents ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> PageLabels [
	<type: #NumberTree>
	<version: 1 dot: 3>
	<attribute: 5 documentation: 'A number tree (see NumberTree) defining the page labelling for the document.
The keys in this tree shall be page indices; the corresponding values shall be page label dictionaries.
Each page index shall denote the first page in a labelling range to which the specified page label dictionary applies.
The tree shall include a value for page index 0.'>
	^self objectAt: #PageLabels ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtCatalog >> PageLayout [
	<type: #Name>
	<version: 1 dot: 5 ifValue: #TwoPageLeft>
	<version: 1 dot: 5 ifValue: #TwoPageRight>
	<attribute: 9 documentation: 'A name object specifying the page layout shall be used when the document is opened:
	SinglePage			Display one page at a time
	OneColumn			Display the pages in one column
	TwoColumnLeft		Display the pages in two columns, with odd-numbered pages on the left
	TwoColumnRight	Display the pages in two columns, with odd-numbered pages on the right
	TwoPageLeft		Display the pages two at a time, with odd-numbered pages on the left
	TwoPageRight		Display the pages two at a time, with odd-numbered pages on the right
Default value: SinglePage.'>
	^self objectAt: #PageLayout ifAbsent: [#SinglePage asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> PageMode [
	<type: #Name>
	<version: 1 dot: 5 ifValue: #UseOC>
	<version: 1 dot: 6 ifValue: #UseAttachments>
	<attribute: 10 documentation: 'A name object specifying how the document shall be displayed when opened:
	UseNone			Neither document outline nor thumbnail images visible
	UseOutlines			Document outline visible
	UseThumbs			Thumbnail images visible
	FullScreen			Full-screen mode, with no menu bar, window controls, or any other window visible
	UseOC				Optional content group panel visible
	UseAttachments	Attachments panel visible
Default value: UseNone.'>
	^self objectAt: #PageMode ifAbsent: [#UseNone asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> Pages [
	<typeIndirect: #Pages>
	<required>
	<attribute: 4 documentation: 'The page tree node that shall be the root of the document’s page tree.'>
	^self objectAt: #Pages
]

{ #category : #'accessing entries' }
PtCatalog >> Perms [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 25 documentation: 'A permissions dictionary that shall specify user access permissions for the document.'>
	^self objectAt: #Perms ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> PieceInfo [
	<typeDictionaryOf: #PieceInfo>
	<version: 1 dot: 4>
	<attribute: 23 documentation: 'A page-piece dictionary associated with the document.'>
	^self objectAt: #PieceInfo ifAbsent: [PtPDF Dictionary new]
]

{ #category : #'accessing entries' }
PtCatalog >> Requirements [
	<typeArrayOf: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 27 documentation: 'An array of requirement dictionaries that shall represent requirements for the document.'>
	^self objectAt: #Requirements ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> SpiderInfo [
	<type: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 21 documentation: 'A Web Capture information dictionary that shall contain state information used by any Web Capture extension.'>
	^self objectAt: #SpiderInfo ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> StructTreeRoot [
	<type: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 18 documentation: 'The document’s structure tree root dictionary.'>
	^self objectAt: #StructTreeRoot ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Threads [
	<typeArrayOf: #Dictionary>
	<version: 1 dot: 1>
	<attribute: 12 documentation: 'An array of thread dictionaries that shall represent the document’s article threads.'>
	^self objectAt: #Threads ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtCatalog >> URI [
	<type: #Dictionary>
	<version: 1 dot: 1>
	<attribute: 15 documentation: 'A URI dictionary containing document-level information for URI (uniform resource identifier) actions.'>
	^self objectAt: #URI ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtCatalog >> Version [
	<type: #Name>
	<version: 1 dot: 4>
	<attribute: 2 documentation: 'The version of the PDF specification to which the document conforms (for example, 1.4) if later than the version specified in the file’s header (see Header).
If the header specifies a later version, or if this entry is absent, the document shall conform to the version specified in the header.
This entry enables a conforming writer to update the version using an incremental update.

The value of this entry shall be a name object, not a number, and therefore shall be preceded by a SOLIDUS (2Fh) character (/) when written in the PDF file (for example, /1.4).'>
	^self objectAt: #Version ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtCatalog >> ViewerPreferences [
	<type: #ViewerPreferences>
	<version: 1 dot: 2>
	<attribute: 8 documentation: 'A viewer preferences dictionary specifying the way the document shall be displayed on the screen.
If this entry is absent, conforming readers shall use their own current user preference settings.'>
	^self objectAt: #ViewerPreferences ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #actions }
PtCatalog >> addPage: aPage [
	"add aPage as last element of the top Pages.
	Convenience method. The use of #addPageTree: is preferred"

	self addPageTree: aPage
]

{ #category : #actions }
PtCatalog >> addPageReference: aPageReference [
	"add aPage as last element of the top Pages.
	Convenience method. The use of #addPageTree: is preferred"

	self Pages addPageTreeReference: aPageReference withParent: (self at: #Pages)
]

{ #category : #actions }
PtCatalog >> addPageTree: aPageTree [
	"add aPageTree (a Page or a Pages) as last element of the top Pages"

	self Pages addPageTree: aPageTree withParent: (self at: #Pages)
]

{ #category : #accessing }
PtCatalog >> firstPage [
	"<Page>"

	^self Pages firstPage
]

{ #category : #accessing }
PtCatalog >> pageAt: anInteger [
	"<Page>
	throws exception when out of bounds"
	
	^self Pages pageAt: anInteger
]

{ #category : #accessing }
PtCatalog >> pages [
	"<Array of: Page>"

	| pages |
	pages := OrderedCollection new.
	self Pages pagesDo: [:page | pages add: page].
	^pages
]

{ #category : #enumerating }
PtCatalog >> pagesDo: oneArgumentBlock [
	self Pages pagesDo: oneArgumentBlock
]

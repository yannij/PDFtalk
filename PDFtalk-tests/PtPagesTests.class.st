Class {
	#name : #PtPagesTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtPagesTests >> testAddFirstPage [
	| catalog page |
	catalog := PtDocument new root.
	self assert: catalog Pages = (PtPDF classAt: #Pages) empty.
	self deny: (catalog at: #Pages) isDirect.
	self assert: catalog Pages Type = #Pages asPDF.
	self assert: catalog Pages Parent isEmpty.
	self deny: (catalog Pages hasKey: #Parent).
	self assert: catalog Pages Kids isEmpty.
	self assert: catalog Pages Count = 0 asPDF.
	page := PtPDF Page empty.
	self assert: page Type = #Page asPDF.
	catalog addPageTree: page.
	self assert: catalog Pages Count = 1 asPDF.
	self assert: catalog Pages Kids size = 1.
	self assert: catalog Pages Kids first == page.
	self deny: catalog Pages Kids content first isDirect.
	self assert: page Type = #Page asPDF.
	self deny: (page at: #Parent) isDirect.
	self assert: page Parent == catalog Pages.
	self assert: (page at: #Parent) == (catalog at: #Pages).
]

{ #category : #tests }
PtPagesTests >> testAddFirstPageToPages [
	"the first page of a document MUST be added via #root (Catalog)!
	Otherwise the references of catalog #Pages is different from the page #Parent"

	| catalog page |
	catalog := PtDocument new root.
	page := PtPDF Page empty.
	catalog Pages addPageTree: page.
	self assert: catalog Pages Count = 1 asPDF.
	self assert: catalog Pages Kids size = 1.
	self assert: catalog Pages Kids first == page.
	self deny: catalog Pages Kids content first isDirect.
	self deny: (page at: #Parent) isDirect.
	self assert: page Parent == catalog Pages.
	self deny: (page at: #Parent) == (catalog at: #Pages).
]

{ #category : #tests }
PtPagesTests >> testAddPages [
	| catalog pages |
	catalog := PtDocument new root.
	catalog addPageTree: PtPDF Page empty.
	pages := (PtPDF classAt: #Pages) empty.
	catalog Pages addPageTree: pages.
	self assert: catalog Pages Count = 1 asPDF.
	self assert: catalog Pages Kids size = 2.
	self deny: catalog Pages Kids content first = catalog Pages Kids content last.
	self deny: catalog Pages Kids content first isDirect.
	self deny: catalog Pages Kids content last isDirect.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages Kids content last content Parent == catalog Pages.
	self assert: catalog Pages structureString = '(#())'.
	pages addPageTree: PtPDF Page empty.
	self assert: catalog Pages Count = 2 asPDF.
	self assert: catalog Pages Kids size = 2.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages Kids content last content == pages.
	self assert: catalog Pages Kids content last content Kids first Parent == pages.
	self assert: catalog Pages structureString = '(#(#))'.
]

{ #category : #tests }
PtPagesTests >> testAddPagesAndPage [
	| catalog pages |
	catalog := PtDocument new root.
	catalog addPageTree: PtPDF Page empty.
	pages := (PtPDF classAt: #Pages) empty.
	catalog Pages addPageTree: pages.
	self assert: catalog Pages Count = 1 asPDF.
	self assert: catalog Pages Kids size = 2.
	self deny: catalog Pages Kids content first = catalog Pages Kids content last.
	self deny: catalog Pages Kids content first isDirect.
	self deny: catalog Pages Kids content last isDirect.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages Kids content last content Parent == catalog Pages.
	self assert: catalog Pages structureString = '(#())'.
	pages addPageTree: PtPDF Page empty.
	self assert: catalog Pages Count = 2 asPDF.
	self assert: catalog Pages Kids size = 2.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages Kids content last content == pages.
	self assert: catalog Pages Kids content last content Kids first Parent == pages.
	self assert: catalog Pages structureString = '(#(#))'.
]

{ #category : #tests }
PtPagesTests >> testAddPagesToCatalog [
	| catalog pages |
	catalog := PtDocument new root.
	pages := (PtPDF classAt: #Pages) empty.
	catalog addPageTree: pages.
	self assert: catalog Pages Count = 0 asPDF.
	self assert: catalog Pages Kids size = 1.
	self deny: catalog Pages Kids content first isDirect.
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog at: #Pages).
	self assert: catalog Pages structureString = '(())'.
	pages addPageTree: PtPDF Page empty.
	self assert: catalog Pages Count = 1 asPDF.
	self assert: catalog Pages Kids size = 1.
	self assert: catalog Pages Kids content first content Kids content first content Parent == catalog Pages Kids content first content.
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages Kids content last content == pages.
	self assert: catalog Pages Kids content last content Kids first Parent == pages.
	self assert: catalog Pages structureString = '((#))'.
]

{ #category : #tests }
PtPagesTests >> testAddPagesWithPage [
	| catalog pages |
	catalog := PtDocument new root.
	catalog addPageTree: PtPDF Page empty.
	pages := (PtPDF classAt: #Pages) empty.
	pages addPageTree: PtPDF Page empty.
	catalog Pages addPageTree: pages.
	self assert: catalog Pages Count = 2 asPDF.
	self assert: catalog Pages Kids size = 2.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages Kids content last content == pages.
	self assert: catalog Pages Kids content last content Kids first Parent == pages.
	self assert: catalog Pages structureString = '(#(#))'.
]

{ #category : #tests }
PtPagesTests >> testAddSecondPage [
	| catalog |
	catalog := PtDocument new root.
	catalog addPageTree: PtPDF Page empty.
	catalog addPageTree: PtPDF Page empty.
	self assert: catalog Pages Count = 2 asPDF.
	self assert: catalog Pages Kids size = 2.
	self deny: catalog Pages Kids content first = catalog Pages Kids content last.
	self deny: catalog Pages Kids content first isDirect.
	self deny: catalog Pages Kids content last isDirect.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
	self assert: catalog Pages structureString = '(##)'.
]

{ #category : #tests }
PtPagesTests >> testAddSecondPageToPages [
	| catalog |
	catalog := PtDocument new root.
	catalog addPageTree: PtPDF Page empty.
	catalog Pages addPageTree: PtPDF Page empty.
	self assert: catalog Pages Count = 2 asPDF.
	self assert: catalog Pages Kids size = 2.
	self deny: catalog Pages Kids content first = catalog Pages Kids content last.
	self deny: catalog Pages Kids content first isDirect.
	self deny: catalog Pages Kids content last isDirect.
	self assert: catalog Pages Kids content first content Parent == catalog Pages Kids content last content Parent.
	self assert: (catalog Pages Kids content first content at: #Parent) == (catalog Pages Kids content last content at: #Parent).
	self assert: catalog Pages Kids content first content Parent == catalog Pages.
]

{ #category : #tests }
PtPagesTests >> testNestedPages [
	| root |
	root := PtDocument exampleNestedPages root.
	self assert: root Pages structureString = '(#(###)#)'.
]

{ #category : #tests }
PtPagesTests >> testPageAt [
	| root |
	root := PtDocument exampleNestedPages root.
	self assert: (root pageAt: 1) == root Pages Kids first.
	self assert: ((root pageAt: 1) at: #Number) = 1 asPDF.
	self assert: ((root pageAt: 2) at: #Number) = 2 asPDF.
	self assert: ((root pageAt: 3) at: #Number) = 3 asPDF.
	self assert: ((root pageAt: 4) at: #Number) = 4 asPDF.
	self assert: ((root pageAt: 5) at: #Number) = 5 asPDF.
	self should: [root pageAt: 0] raise: Error.
	self should: [root pageAt: 6] raise: Error.
]

{ #category : #tests }
PtPagesTests >> testPageNumber [
	| root i |
	root := PtDocument exampleNestedPages root.
	"root := PDF pdfSpecification root."
	i := 0.
	root pagesDo: [:page |
		i := i + 1.
		self assert: page pageNumber = i].
]

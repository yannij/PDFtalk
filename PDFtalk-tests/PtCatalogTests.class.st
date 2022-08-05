Class {
	#name : #PtCatalogTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtCatalogTests >> testAttributes [
	| root |
	root := (PtPDF classAt: #Catalog) example.
	self assert: root Type asSmalltalkValue = #Catalog.
	self assert: root Pages = (PtPDF classAt: #Pages) new.
	self assert: root PageLabels = (PtPDF classAt: #NumberTree) nodeClass new.
	self assert: root Names isEmpty.
	self assert: root attributeNames asArray = #(#Type #Version #Extensions #Pages #PageLabels #Names #Dests #ViewerPreferences #PageLayout #PageMode #Outlines #Threads #OpenAction #AA #URI #AcroForm #Metadata #StructTreeRoot #MarkInfo #Lang #SpiderInfo #OutputIntents #PieceInfo #OCProperties #Perms #Legal #Requirements #Collection #NeedsRendering #AF).
	self assert: (root attributesPresent collect: #selector) asArray = #(#Type #Pages #PageLabels).
	self assert: (root attributesRequired collect: #selector) asArray = #(#Type #Pages).
	self assert: root pdfVersion = PtVersion pdf1_3.
	self assert: root hasRequiredAttributes
]

{ #category : #tests }
PtCatalogTests >> testAttributesWithoutPages [
	| root |
	root := (PtPDF classAt: #Catalog) on: (Dictionary
		with: #Type -> #Catalog
		with: #PageLabels -> PtPDF Dictionary new newReference).
	self assert: root Type asSmalltalkValue = #Catalog.
	self should: [root Pages] raise: KeyNotFound.
	self assert: (root at: #PageLabels) referent = (PtPDF classAt: #NumberTree) nodeClass new.
	self assert: root Names isEmpty.
	self assert: root attributeNames asArray = #(#Type #Version #Extensions #Pages #PageLabels #Names #Dests #ViewerPreferences #PageLayout #PageMode #Outlines #Threads #OpenAction #AA #URI #AcroForm #Metadata #StructTreeRoot #MarkInfo #Lang #SpiderInfo #OutputIntents #PieceInfo #OCProperties #Perms #Legal #Requirements #Collection #NeedsRendering #AF).
	self assert: (root attributesPresent collect: #selector) asArray = #(#Type #PageLabels).
	self assert: (root attributesRequired collect: #selector) asArray = #(#Type #Pages).
	self assert: root pdfVersion = PtVersion pdf1_3.
	self assert: root hasRequiredAttributes not
]

{ #category : #tests }
PtCatalogTests >> testAttributesWithoutType [
	| root |
	root := (PtPDF classAt: #Catalog) on: (Dictionary
		with: #Pages -> (PtPDF classAt: #Pages) new newReference
		with: #PageLabels -> PtPDF Dictionary new).
	self should: [root Type] raise: KeyNotFound.
	self assert: root Pages = (PtPDF classAt: #Pages) new.
	self assert: root PageLabels = (PtPDF classAt: #NumberTree) nodeClass new.
	self assert: root Names isEmpty.
	self assert: root attributeNames asArray = #(#Type #Version #Extensions #Pages #PageLabels #Names #Dests #ViewerPreferences #PageLayout #PageMode #Outlines #Threads #OpenAction #AA #URI #AcroForm #Metadata #StructTreeRoot #MarkInfo #Lang #SpiderInfo #OutputIntents #PieceInfo #OCProperties #Perms #Legal #Requirements #Collection #NeedsRendering #AF).
	self assert: (root attributesPresent collect: #selector) asArray = #(#Pages #PageLabels).
	self assert: (root attributesRequired collect: #selector) asArray = #(#Type #Pages).
	self assert: root pdfVersion = PtVersion pdf1_3.
	self assert: root hasRequiredAttributes not
]

{ #category : #tests }
PtCatalogTests >> testFullAttributes [
	| root |
	root := (PtPDF classAt: #Catalog) exampleFull.
	self assert: root Type asSmalltalkValue = #Catalog.
	self assert: root Pages pdfType name = #Pages.
	self assert: root PageLabels isNil.
	self assert: root Names = (PtPDF classAt: #Names) new.
	self assert: root attributeNames asArray = #(#Type #Version #Extensions #Pages #PageLabels #Names #Dests #ViewerPreferences #PageLayout #PageMode #Outlines #Threads #OpenAction #AA #URI #AcroForm #Metadata #StructTreeRoot #MarkInfo #Lang #SpiderInfo #OutputIntents #PieceInfo #OCProperties #Perms #Legal #Requirements #Collection #NeedsRendering #AF).
	self assert: (root attributesPresent collect: #selector) asArray = #(#Type #Version #Extensions #Pages #Names #Dests #ViewerPreferences #PageLayout #PageMode #Outlines #Threads #OpenAction #AA #URI #AcroForm #StructTreeRoot #MarkInfo #Lang #SpiderInfo #OutputIntents #PieceInfo #OCProperties #Perms #Legal #Requirements #Collection #NeedsRendering).
	self assert: (root attributesRequired collect: #selector) asArray = #(#Type #Pages).
	self assert: root pdfVersion = PtVersion pdf1_7.
	self assert: root hasRequiredAttributes
]

{ #category : #tests }
PtCatalogTests >> testVersion [
	self assert: (PtPDF classAt: #Catalog) exampleFull pdfVersion = PtVersion pdf1_7
]

{ #category : #tests }
PtCatalogTests >> testVersionConditionalPageLayoutSinglePage [
	self assert: (((PtPDF classAt: #Catalog) example)
		at: #PageLayout put: #SinglePage;
		yourself) pdfVersion = PtVersion pdf1_3
]

{ #category : #tests }
PtCatalogTests >> testVersionConditionalPageLayoutTwoPageLeft [
	self assert: (((PtPDF classAt: #Catalog) example)
		at: #PageLayout put: #TwoPageLeft;
		yourself) pdfVersion = PtVersion pdf1_5
]

{ #category : #tests }
PtCatalogTests >> testVersionConditionalPageLayoutTwoPageRight [
	self assert: (((PtPDF classAt: #Catalog) example)
		at: #PageLayout put: #TwoPageRight;
		yourself) pdfVersion = PtVersion pdf1_5
]

{ #category : #tests }
PtCatalogTests >> testVersionConditionalPageModeUseAttachments [
	self assert: (((PtPDF classAt: #Catalog) example)
		at: #PageMode put: #UseAttachments;
		yourself) pdfVersion = PtVersion pdf1_6
]

{ #category : #tests }
PtCatalogTests >> testVersionConditionalPageModeUseOC [
	self assert: (((PtPDF classAt: #Catalog) example)
		at: #PageMode put: #UseOC;
		yourself) pdfVersion = PtVersion pdf1_5
]

{ #category : #tests }
PtCatalogTests >> testVersionConditionalPageModeUseOutlines [
	self assert: (((PtPDF classAt: #Catalog) example)
		at: #PageMode put: #UseOutlines;
		yourself) pdfVersion = PtVersion pdf1_3
]

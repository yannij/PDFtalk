Extension { #name : #PtCatalog }

{ #category : #'*PDFtalk-test resources-test instances' }
PtCatalog class >> example [
	^self
		with: #Type -> #Catalog
		with: #Pages -> (PtPDF classAt: #Pages) new newReference
		with: #PageLabels -> (PtPDF classAt: #NumberTree) nodeClass new
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtCatalog class >> exampleFull [
	^self on: ((Dictionary new)
		at: #AA put: Dictionary new;
		at: #AcroForm put: Dictionary new;
		at: #Collection put: Dictionary new;
		at: #Dests put: Dictionary new asPDF newReference;
		at: #Extensions put: Dictionary new;
		at: #Lang put: 'en';
		at: #Legal put: Dictionary new;
		at: #MarkInfo put: Dictionary new;
		at: #Metadata put: nil;
		at: #Names put: Dictionary new;
		at: #NeedsRendering put: false;
		at: #OCProperties put: Dictionary new;
		at: #OpenAction put: Dictionary new;
		at: #Outlines put: (Dictionary with: #Type -> #Outlines) asPDF newReference;
		at: #OutputIntents put: #();
		at: #PageLabels put: nil;
		at: #PageLayout put: #OneColumn;
		at: #PageMode put: #UseOutlines;
		at: #Pages put: (Dictionary with: #Type -> #Pages) asPDF newReference;
		at: #Perms put: Dictionary new;
		at: #PieceInfo put: Dictionary new;
		at: #Requirements put: #();
		at: #SpiderInfo put: Dictionary new;
		at: #StructTreeRoot put: Dictionary new;
		at: #Threads put: #();
		at: #Type put: #Catalog;
		at: #URI put: Dictionary new;
		at: #Version put: #'1.4';
		at: #ViewerPreferences put: Dictionary new;
		yourself)
]

{ #category : #'*PDFtalk-test resources-instance creation' }
PtCatalog class >> newMinimal [
	"<Catalog>
	a legal but minimal PDF conforming catalog.
	The starting point for creating new documents"
	"self newMinimal"

	| page pages resources |
	resources := PtPDF Dictionary
		with: #ProcSet -> #(#PDF).
	page := PtPDF Page
		with: #Type -> #Page
		with: #Resources -> resources.
	pages := (PtPDF classAt: #Pages)
		with: #Type -> #Pages
		with: #MediaBox -> #(0 0 792 612)
		with: #Kids -> (Array with: page) asPDF
		with: #Count -> 1.
	page at: #Parent put: pages.
	^(PtPDF classAt: #Catalog)
		with: #Type -> #Catalog
		with: #Pages -> pages
]

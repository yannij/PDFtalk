Extension { #name : #PtFFont }

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtFFont class >> primeRuntime [
	"reset and load all class variables to fill the caches to avoid lazy initialization at runtime"
	"self primeRuntime"

	PtFFontBody primeRuntime.
	self reloadFonts
]

{ #category : #'*PDFtalk-Deploying-actions' }
PtFFont class >> reloadFonts [
	"self reloadFonts"

	self resetLoadedFonts.
	self loadedFonts
]

{ #category : #'*PDFtalk-Deploying-actions' }
PtFFont class >> resetLoadedFonts [
	"self resetLoadedFonts"

	LoadedFonts := nil
]

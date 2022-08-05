Extension { #name : #PtFFontBody }

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtFFontBody class >> primeRuntime [
	"reset and load all class variables to fill the caches to avoid lazy initialization at runtime"
	"self primeRuntime"

	self resetPostScriptFonts
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtFFontBody class >> resetPostScriptFonts [
	"self resetPostScriptFonts"

	PostScriptFonts := nil
]

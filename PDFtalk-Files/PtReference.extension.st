Extension { #name : #PtReference }

{ #category : #'*PDFtalk-Files-initialize-release' }
PtReference >> with: aFile [
	"setup the virgin receiver to resolve the object from the file
	see #referent for the lazy initializer"

	referent := PtFileReference id: self id file: aFile
]

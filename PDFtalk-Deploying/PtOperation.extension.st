Extension { #name : #PtOperation }

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtOperation class >> primeRuntime [
	"self primeRuntime"

	self resetClassesAtNames.
	self classesAtNames
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtOperation class >> resetClassesAtNames [
	"self resetClassesAtNames"

	ClassesAtNames := nil
]

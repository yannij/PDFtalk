Extension { #name : #PtDocument }

{ #category : #'*PDFtalk-Demonstrations-actions' }
PtDocument >> saveAndShowAs: aFilenameString [
	self saveAs: aFilenameString.
	ExternalWebBrowser open: aFilenameString
]

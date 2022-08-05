Extension { #name : #PtPage }

{ #category : #'*PDFtalk-Demonstrations-actions' }
PtPage >> saveAndShowAs: aFilenameString [
	| document |
	document := PtDocument new.
	document root addPage: self.
	document saveAndShowAs: aFilenameString
]

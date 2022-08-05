Extension { #name : #CFFSubroutine }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
CFFSubroutine class >> dynamicallyReferencedClasses [
	^Array with: self fullName asSymbol
]

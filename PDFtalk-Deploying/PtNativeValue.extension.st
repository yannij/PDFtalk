Extension { #name : #PtNativeValue }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
PtNativeValue class >> dynamicallyReferencedClasses [
	^Array with: PDFDate fullName asSymbol
]

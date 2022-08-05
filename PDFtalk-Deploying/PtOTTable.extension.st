Extension { #name : #PtOTTable }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
PtOTTable class >> dynamicallyReferencedClasses [
	^self allSubclasses collect: [:cl | cl fullName asSymbol]
]

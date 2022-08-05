Extension { #name : #PtOTCmapSubtable }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
PtOTCmapSubtable class >> dynamicallyReferencedClasses [
	^self allSubclasses collect: [:cl | cl fullName asSymbol]
]

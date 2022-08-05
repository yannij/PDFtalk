Extension { #name : #CFFDict }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
CFFDict class >> dynamicallyReferencedClasses [
	^self withAllSubclasses collect: [:cl | cl fullName asSymbol]
]

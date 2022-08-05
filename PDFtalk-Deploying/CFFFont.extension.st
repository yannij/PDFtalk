Extension { #name : #CFFFont }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
CFFFont class >> dynamicallyReferencedClasses [
	^self withAllSubclasses collect: [:cl | cl fullName asSymbol]
]

Extension { #name : #CFFOperator }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
CFFOperator class >> dynamicallyReferencedClasses [
	^self withAllSubclasses collect: [:cl | cl fullName asSymbol]
]

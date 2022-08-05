Extension { #name : #CFFMapping }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
CFFMapping class >> dynamicallyReferencedClasses [
	^self allSubclasses collect: [:cl | cl fullName asSymbol]
]

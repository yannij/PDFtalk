Extension { #name : #PtAttributeType }

{ #category : #'*PDFtalk-Deploying-dynamic references' }
PtAttributeType class >> dynamicallyReferencedClasses [
	^self allSubclasses collect: [:cl | cl fullName asSymbol]
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtAttributeType class >> primeRuntime [
	"self primeRuntime"

	self resetTypeClassesAtKey.
	self typeClassesAtKey
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtAttributeType class >> resetTypeClassesAtKey [
	"self resetTypeClassesAtKey"

	TypeClasses := nil
]

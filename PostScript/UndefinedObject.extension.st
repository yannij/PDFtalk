Extension { #name : #UndefinedObject }

{ #category : #'*PostScript-accessing' }
UndefinedObject >> postScriptType [
	^#nulltype
]

{ #category : #'*PostScript-printing' }
UndefinedObject >> printPostScriptOn: aStream [
	aStream nextPutAll: 'null'
]

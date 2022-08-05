Extension { #name : #SequenceableCollection }

{ #category : #'*PostScript-printing' }
SequenceableCollection >> prettyPrintPSOn: aStream indent: anInteger [
	self printPostScriptOn: aStream
]

{ #category : #'*PostScript-printing' }
SequenceableCollection >> printPostScriptOn: aStream [
	aStream nextPutAll: '['.
	self do: [:value | value printPostScriptOn: aStream] separatedBy: [aStream space].
	aStream nextPutAll: ']'
]

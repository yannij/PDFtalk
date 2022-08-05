Extension { #name : #Symbol }

{ #category : #'*PostScript-converting' }
Symbol >> asPostScriptExecutable [
	^self
]

{ #category : #'*PostScript-accessing' }
Symbol >> postScriptType [
	^#operatortype
]

{ #category : #'*PostScript-printing' }
Symbol >> prettyPrintPSOn: aStream indent: anInteger [
	self printOn: aStream
]

{ #category : #'*PostScript-printing' }
Symbol >> printPostScriptOn: aStream [
	aStream nextPutAll: self asString
]

{ #category : #'*PostScript-actions' }
Symbol >> processIn: interpreter [
	(interpreter valueAt: self) doIn: interpreter
]

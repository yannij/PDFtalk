Extension { #name : #Boolean }

{ #category : #'*PostScript-converting' }
Boolean >> asPostScriptString [
	^self printPostScript
]

{ #category : #'*PostScript-logical operations' }
Boolean >> postScriptAnd: aBoolean [
	^self & aBoolean
]

{ #category : #'*PostScript-logical operations' }
Boolean >> postScriptNot [
	^self not
]

{ #category : #'*PostScript-logical operations' }
Boolean >> postScriptOr: aBoolean [
	^self | aBoolean
]

{ #category : #'*PostScript-accessing' }
Boolean >> postScriptType [
	^#booleantype
]

{ #category : #'*PostScript-logical operations' }
Boolean >> postScriptXor: aBoolean [
	^self xor: aBoolean
]

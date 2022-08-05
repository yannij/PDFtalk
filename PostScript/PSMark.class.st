"
PLRM.pdf 3.3.12 p.58
"
Class {
	#name : #PSMark,
	#superclass : #Object,
	#category : #PostScript
}

{ #category : #comparing }
PSMark >> = anObject [
	^self class == anObject class
]

{ #category : #comparing }
PSMark >> hash [
	^self class hash
]

{ #category : #accessing }
PSMark >> postScriptType [
	^#marktype
]

{ #category : #printing }
PSMark >> printOn: stream [
	stream nextPutAll: '*mark*'
]

{ #category : #accessing }
PSMark >> value [
	^self
]

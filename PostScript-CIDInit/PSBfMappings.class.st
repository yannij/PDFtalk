"
Mapping from character codes to unicode

Used in type 2 CMaps in the /ToUnicode attribute

What does ""bf"" stand for?
"
Class {
	#name : #PSBfMappings,
	#superclass : #PSMappings,
	#category : #'PostScript-CIDInit'
}

{ #category : #accessing }
PSBfMappings >> addMapping: aMapping [
	| codespace |
	codespace := (self codespaceFor: aMapping source) ifNil: [
		^(Error receiver: self selector: #addMapping: index: aMapping value: nil) raiseRequest].
	codespace at: aMapping source first put: aMapping
]

{ #category : #accessing }
PSBfMappings >> characterAt: aCode [
	"<Character | nil>"

	^(self mappingAt: aCode) ifNotNil: [:mapping | mapping characterAt: aCode]
]

{ #category : #accessing }
PSBfMappings >> codespaceFor: aCodeOrRange [
	"<Codespace | nil>
	the matching codespace"

	^self codespaces detect: [:codespace | aCodeOrRange isInRange: codespace range] ifNone: [
		nil]
]

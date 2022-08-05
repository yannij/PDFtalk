"
Mapping from some codes to notdef character IDs

Used in Adobe's default CMaps (type 1)
"
Class {
	#name : #PSNotdefMappings,
	#superclass : #PSMappings,
	#category : #'PostScript-CIDInit'
}

{ #category : #accessing }
PSNotdefMappings >> cidAt: aCode [
	"<Integer | nil>"

	^(self mappingAt: aCode) ifNotNil: [:mapping | mapping destination]
]

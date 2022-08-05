"
Mapping from some codes to character IDs

Used in Adobe's default CMaps (type 1)
"
Class {
	#name : #PSCIDMappings,
	#superclass : #PSMappings,
	#category : #'PostScript-CIDInit'
}

{ #category : #accessing }
PSCIDMappings >> cidAt: aCode [
	"<Integer | nil>"

	^(self mappingAt: aCode) ifNotNil: [:mapping | mapping destinationAt: aCode]
]

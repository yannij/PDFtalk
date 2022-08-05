Extension { #name : #Array }

{ #category : #'*PostScript-CIDInit-converting' }
Array >> mappingsFrom: aRange [
	| mappings |
	mappings := OrderedCollection new.
	self with: aRange codes do: [:item :code | mappings add: (item mappingFrom: code)].
	^mappings
]

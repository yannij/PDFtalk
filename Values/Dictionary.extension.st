Extension { #name : #Dictionary }

{ #category : #'*Values-printing' }
Dictionary >> keysForPrinting [
	^[self keys asSortedCollection] on: Error do: [:ex | ex return: self keys]
]

{ #category : #'*Values-printing' }
Dictionary >> printargumentsWith: aPrinter [
	^self keysForPrinting collect: [:key |
		DictionaryPrintargument
			name: (key printvalueWith: aPrinter)
			value: ((self at: key) printvalueWith: aPrinter)]
]

{ #category : #'*Values-printing' }
Dictionary >> printvalueWith: printer [
	^DictionaryPrintvalue arguments: (self printargumentsWith: printer)
]

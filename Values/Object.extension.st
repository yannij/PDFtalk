Extension { #name : #Object }

{ #category : #'*Values-printing' }
Object >> asDescription [
	"<Text>
	produces a text equivalent to the soure with bold leaf values"

	^self asDescriptionFor: self class
]

{ #category : #'*Values-printing' }
Object >> asDescriptionFor: targetClass [
	"<Text>
	produces a text equivalent to the source"

	| printer printvalue |
	printer := ValuePrinter newFor: targetClass.
	printvalue := self printvalueWith: printer.
	^printvalue description
]

{ #category : #'*Values-printing' }
Object >> asSource [
	"<String>
	produces a string which can be evaluated in the context of the receiver class to an object equivalent to the receiver"

	^self asSourceFor: self class
]

{ #category : #'*Values-printing' }
Object >> asSourceFor: targetClass [
	"<String>
	produces a string which can be evaluated in the context of targetClass to an object equivalent to the receiver"

	| printer printvalue |
	printer := ValuePrinter newFor: targetClass.
	printvalue := self printvalueWith: printer.
	^printvalue sourceWithPrinter: printer
]

{ #category : #'*Values-actions' }
Object >> beImmutable [
	self beReadOnlyObject.
	^self
]

{ #category : #'*Values-actions' }
Object >> beMutable [
	self beWritableObject.
	^self
]

{ #category : #'*Values-comparing' }
Object >> isEqualValue: anObject [
	^self = anObject
]

{ #category : #'*Values-named values' }
Object class >> nameOrNilFor: aValue [
	"<Symbol | nil>"

	^self namesByValues at: aValue ifAbsent: [nil]
]

{ #category : #'*Values-named values' }
Object class >> namedValueNames [
	"<Array of: Symbol>
	names to print for special known values"
	
	^#()
]

{ #category : #'*Values-named values' }
Object class >> namesByValues [
	"<Dictionary key: Value value: Symbol>"

	^Value namedValuesAt: self ifAbsentPut: [self newNamesByValues]
]

{ #category : #'*Values-named values' }
Object class >> newNamesByValues [
	"<Dictionary key: Value value: Symbol>"

	| dict |
	dict := Valuemap new: self namedValueNames size.
	self namedValueNames do: [:symbol | dict at: (self perform: symbol) put: symbol].
	^dict
]

{ #category : #'*Values-printing' }
Object >> printvalueWith: printer [
	^LiteralPrintvalue string: self storeString
]

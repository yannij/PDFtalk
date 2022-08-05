"
PDF Operator as defined in PDF 32000_2008.pdf pp. 82.

An operator is a PDF keyword specifying some action that shall be performed, such as painting a graphical shape on the page.
An operator keyword shall be distinguished from a name object by the absence of an initial SOLIDUS character (2Fh) (/).
Operators shall be meaningful only inside a content stream.
"
Class {
	#name : #PtOperation,
	#superclass : #Value,
	#instVars : [
		'operands'
	],
	#classVars : [
		'ClassesAtNames'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #accessing }
PtOperation class >> classesAtNames [
	"<Dictionary key: Symbol value: Operator class>"

	^ClassesAtNames ifNil: [ClassesAtNames := self newClassesAtNames]
]

{ #category : #accessing }
PtOperation class >> documentation [
	"<String>"

	^self subclassResponsibility
]

{ #category : #'instance creation optional' }
PtOperation class >> empty [
	^self new
]

{ #category : #accessing }
PtOperation class >> end [
	"<Operator class | nil>
	the corresponding end operator"

	^nil
]

{ #category : #specification }
PtOperation class >> localSpecification [
	<sequence: #operands>
]

{ #category : #accessing }
PtOperation class >> named: aSymbol [
	"<Operator class | nil>"

	^self classesAtNames at: aSymbol ifAbsent: [nil]
]

{ #category : #accessing }
PtOperation class >> newClassesAtNames [
	| dict |
	dict := Dictionary new.
	PtOperation allSubclassesDo: [:subclass |
		subclass usedForLookup ifTrue: [
			dict at: subclass operatorName put: subclass]].
	^dict
]

{ #category : #accessing }
PtOperation class >> on: aSymbol [
	"<Operator>"

	(PtOperation named: aSymbol) ifNotNil: [:class |
		^class empty].
	^PtUnknownOperation operatorName: aSymbol
]

{ #category : #accessing }
PtOperation class >> operandTypes [
	"<Array of: (Array with: String with: Symbol)>
	The names and types of the operands"

	^#()
]

{ #category : #'instance creation' }
PtOperation class >> operands: operandsArray [

	| inst |
	inst := self new.
	inst initializeOperands: operandsArray asPDF.
	^inst
]

{ #category : #accessing }
PtOperation class >> operatorName [
	"<Symbol>
	Equals to the printed name of the operator.
	Subclasses overwrite this method if the class name is not the same as the operator name"

	^self subclassResponsibility
]

{ #category : #accessing }
PtOperation class >> pdfVersion [
	^PtVersion pdf1_0
]

{ #category : #testing }
PtOperation class >> usedForLookup [
	"the class is used to construct the lookup table"

	^self subclasses isEmpty
]

{ #category : #'instance creation optional' }
PtOperation class >> with: operand1 [
	^self operands: (Array with: operand1)
]

{ #category : #'instance creation optional' }
PtOperation class >> with: operand1 with: operand2 [
	^self operands: (Array
		with: operand1
		with: operand2)
]

{ #category : #'instance creation optional' }
PtOperation class >> with: operand1 with: operand2 with: operand3 [
	^self operands: (Array
		with: operand1
		with: operand2
		with: operand3)
]

{ #category : #'instance creation optional' }
PtOperation class >> with: operand1 with: operand2 with: operand3 with: operand4 [
	^self operands: (Array
		with: operand1
		with: operand2
		with: operand3
		with: operand4)
]

{ #category : #comparing }
PtOperation >> = anObject [
	^self class == anObject class and: [
	self operands = anObject operands]
]

{ #category : #actions }
PtOperation >> addAsContentTokenWith: someOperands to: someOperators inParser: aContentParser [
	someOperators add: (self operands: someOperands).
	^#()
]

{ #category : #comparing }
PtOperation >> hash [
	^self operands hash
]

{ #category : #'initialize-release' }
PtOperation >> initializeOperands: operandsArray [

	(operandsArray notNil and: [operandsArray notEmpty])
		ifTrue: [operands := (Array withAll: operandsArray) beImmutable].
	self beImmutable
]

{ #category : #actions }
PtOperation >> modify: aProcessor with: aResource [
	"change the graphics state with aResource"

	"do nothing by default"
]

{ #category : #accessing }
PtOperation >> operands [
	"<SequenceableCollection of: PDF.Object>"

	^operands ifNil: [#()]
]

{ #category : #copying }
PtOperation >> operands: someOperands [
	^self class operands: someOperands
]

{ #category : #accessing }
PtOperation >> operatorName [
	"<Symbol>"

	^self class operatorName
]

{ #category : #printing }
PtOperation >> printOn: aWriteStream [
	self operands do: [:operand |
		aWriteStream
			nextPutAll: operand printString;
			space].
	aWriteStream nextPutAll: self operatorName
]

{ #category : #printing }
PtOperation >> printvalueWith: printer [

	| args |
	args := OrderedCollection new.
	args add: (printer array: 'operands' value: self operands).
	^printer printvalue: self arguments: args
]

{ #category : #actions }
PtOperation >> processWith: aProcessor at: indexInteger [
	"modify aProcessor (graphics state, graphics state stack, etc.).
	indexInteger is the position of the receiver in the operations"

	aProcessor addOperation: self
]

{ #category : #accessing }
PtOperation >> resource [
	^nil
]

{ #category : #accessing }
PtOperation >> resourceIn: aPageGraphics [
	"<PDFObject | nil>
	the resolved resource from the page resourcse"
	
	^nil
]

{ #category : #copying }
PtOperation >> with: operand1 [
	^self operands: (Array with: operand1)
]

{ #category : #copying }
PtOperation >> with: operand1 with: operand2 [
	^self operands: (Array
		with: operand1
		with: operand2)
]

{ #category : #copying }
PtOperation >> with: operand1 with: operand2 with: operand3 [
	^self operands: (Array
		with: operand1
		with: operand2
		with: operand3)
]

{ #category : #copying }
PtOperation >> with: operand1 with: operand2 with: operand3 with: operand4 [
	^self operands: (Array
		with: operand1
		with: operand2
		with: operand3
		with: operand4)
]

{ #category : #writing }
PtOperation >> writePDFOn: aWriter indent: anInteger [
	self operands do: [:operand |
		operand writePDFOn: aWriter indent: anInteger.
		aWriter space].
	aWriter nextPutAll: self operatorName asByteArray
]

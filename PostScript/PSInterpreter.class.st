"
PostScript interpreter
"
Class {
	#name : #PSInterpreter,
	#superclass : #Object,
	#instVars : [
		'scanner',
		'operandStack',
		'dictionaryStack',
		'executionStack',
		'resources',
		'properties'
	],
	#category : #PostScript
}

{ #category : #'instance creation' }
PSInterpreter class >> on: postScriptSourceString [
	| inst |
	inst := self new.
	inst initializeScanner: (PSScanner on: postScriptSourceString).
	^inst
]

{ #category : #accessing }
PSInterpreter class >> permittedPDFType4FunctionOperators [
	"PostScript operators allowed in type 4 functions.
	See the PDF spec chapter 7.10.5 Type 4 (PostScript Calculator) Functions"

	| arithmetic bitwise conditional stack |
	arithmetic := #(#abs #add #atan #ceiling #cos #cvi #cvr #div #exp #floor #idiv #ln #log #mod #mul #neg #round #sin #sqrt #sub #truncate).
	bitwise := #(#and #bitshift #eq false #ge #gt #le #lt #ne).
	conditional := #(#if #ifelse).
	stack := #(#copy #dup #exch #index #pop #roll).
	^arithmetic , bitwise , conditional , stack
]

{ #category : #'instance creation' }
PSInterpreter class >> run: aPostScriptSourceString [
	"run aPostScriptSourceString in a new instance"

	^(self on: aPostScriptSourceString) run
]

{ #category : #'accessing resources' }
PSInterpreter >> category: categorySymbol at: aKey [
	"<Object>"

	^(self categoryAt: categorySymbol) at: aKey ifAbsent: [
		KeyNotFound raiseSignal: aKey , ' was not found']
]

{ #category : #'accessing resources' }
PSInterpreter >> categoryAt: categorySymbol [
	"<Category>"

	^self categoryAt: categorySymbol ifAbsent: [
		KeyNotFound raiseSignal: categorySymbol , ' was not found']
]

{ #category : #'accessing resources' }
PSInterpreter >> categoryAt: categorySymbol ifAbsent: absentBlock [
	"<Category>"

	^self resources at: categorySymbol ifAbsent: [
		(PSCategory predefined: categorySymbol)
			ifNotNil: [:category |
			self resources at: categorySymbol put: category.
			self resources at: categorySymbol]
			ifNil: [
			absentBlock value]]
]

{ #category : #actions }
PSInterpreter >> clear [
	operandStack := nil
]

{ #category : #'accessing dictionaries' }
PSInterpreter >> dictionaryStack [
	^dictionaryStack ifNil: [
		| sys stack |
		sys := self newSystemdict.
		stack := PSStack new.
		stack push: (sys at: #systemdict).
		stack push: (sys at: #globaldict).
		stack push: (sys at: #userdict).
		dictionaryStack := stack]
]

{ #category : #'accessing dictionaries' }
PSInterpreter >> dictionaryWith: aSymbol [
	"<Dictionary | nil>"

	^self dictionaryStack objects detect: [:dict | dict includesKey: aSymbol] ifNone: [
		nil]
]

{ #category : #accessing }
PSInterpreter >> executionStack [
	^executionStack ifNil: [executionStack := PSStack new]
]

{ #category : #accessing }
PSInterpreter >> global [
	"<Boolean>
	true: allocate objects in the global vm
	false: allocate objects in the local vm"

	^self properties at: #global ifAbsent: [false]
]

{ #category : #accessing }
PSInterpreter >> global: aBoolean [
	self properties at: #global put: aBoolean
]

{ #category : #testing }
PSInterpreter >> hasMark [
	^(self propertyAt: #marks ifAbsent: [#()]) notEmpty
]

{ #category : #'accessing resources' }
PSInterpreter >> inCategory: categorySymbol at: keySymbol put: anObject [
	"<Object>"

	(self categoryAt: categorySymbol) at: keySymbol put: anObject.
	^anObject
]

{ #category : #'accessing resources' }
PSInterpreter >> inCategory: categorySymbol removeKey: keySymbol [
	(self categoryAt: categorySymbol) removeKey: keySymbol.
	categorySymbol = #Category ifTrue: [
		self resources removeKey: keySymbol]
]

{ #category : #'initialize-release' }
PSInterpreter >> initializeScanner: aScanner [
	scanner := aScanner
]

{ #category : #actions }
PSInterpreter >> mark [
	"Optimization: keep a separate stack of marks
	to avoid searching the potentially large stack for a mark on every step of the program"

	(self propertyAt: #marks ifAbsentPut: [OrderedCollection new]) add: #mark.
	^self stack push: PSMark new
]

{ #category : #'accessing dictionaries' }
PSInterpreter >> newSystemdict [
	| dict |
	dict := PSDictionary new.
	dict at: #systemdict put: dict.
	dict at: #globaldict put: PSDictionary new.
	dict at: #userdict put: PSDictionary new.
	dict at: #null put: nil.
	dict at: #true put: true.
	dict at: #false put: false.
	PSBuildIn operators keysAndValuesDo: [:symbol :operator | dict at: symbol put: operator].
	dict beImmutable.
	^dict
]

{ #category : #actions }
PSInterpreter >> next [
	^self scanner nextPostScriptObject
]

{ #category : #accessing }
PSInterpreter >> operandStack [
	^operandStack ifNil: [operandStack := PSStack new]
]

{ #category : #actions }
PSInterpreter >> pop [
	^self stack pop
]

{ #category : #actions }
PSInterpreter >> popTillMark [
	"<OrderedCollection of: Object>
	in the order: top-of-stack first continuing towards the bottom-of-stack"

	self unmark.
	^self stack popTillMark
]

{ #category : #printing }
PSInterpreter >> printOn: aStream [
	self stack printPostScriptOn: aStream
]

{ #category : #'accessing properties' }
PSInterpreter >> properties [
	"<Dictionary>
	arbitrary properties.
	Used for state information and as temporary storage during execution"

	^properties ifNil: [properties := Dictionary new]
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyAt: aSymbol [
	"<Object>
	property named aSymbol.
	Raises an error if not defined"

	^self propertyAt: aSymbol ifAbsent: [
		KeyNotFound raiseSignal: aSymbol , ' was not found']
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyAt: aSymbol ifAbsent: aZeroArgumentBlock [
	^self properties at: aSymbol ifAbsent: aZeroArgumentBlock
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyAt: aSymbol ifAbsentPut: aZeroArgumentBlock [
	^self properties at: aSymbol ifAbsentPut: aZeroArgumentBlock
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyAt: aSymbol ifPresent: aOneArgumentBlock [
	^self properties at: aSymbol ifPresent: aOneArgumentBlock
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyAt: aSymbol put: anObject [
	^self properties at: aSymbol put: anObject
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyRemove: aSymbol [
	"<Object>
	remove property named aSymbol and answer its value"

	^self propertyRemove: aSymbol ifAbsent: [
		KeyNotFound raiseSignal: aSymbol , ' was not found']
]

{ #category : #'accessing properties' }
PSInterpreter >> propertyRemove: aSymbol ifAbsent: aZeroArgumentBlock [
	"<Object>
	remove property named aSymbol and answer its value"

	^self properties removeKey: aSymbol ifAbsent: aZeroArgumentBlock
]

{ #category : #actions }
PSInterpreter >> push: anObject [
	^self stack push: anObject
]

{ #category : #accessing }
PSInterpreter >> random [
	"<Random>"

	^self properties at: #random ifAbsentPut: [Random new]
]

{ #category : #'accessing resources' }
PSInterpreter >> resources [
	"<Category>"

	^resources ifNil: [
		| category |
		category := PSCategory predefined: #Category.
		category at: #Category put: category.
		category at: #Generic put: (PSCategory predefined: #Generic).
		resources := category]
]

{ #category : #actions }
PSInterpreter >> run [
	[self scanner atEnd] whileFalse: [self step].
	^self
]

{ #category : #actions }
PSInterpreter >> run: aPostScriptSourceString [
	"run aPostScriptSourceString in the current instance with the default scanning behavior.
	The PostScript code is evaluated at the current source position.
	After evaluation, the original source position is restored, therefore the execution can be nested."

	| oldScanner |
	oldScanner := self scanner.
	^[
	self initializeScanner: (PSScanner on: aPostScriptSourceString).
	self run.
	self] ensure: [
			self initializeScanner: oldScanner]
]

{ #category : #accessing }
PSInterpreter >> scanner [
	^scanner ifNil: [scanner := PSScanner on: '']
]

{ #category : #accessing }
PSInterpreter >> stack [
	^self operandStack
]

{ #category : #actions }
PSInterpreter >> step [
	"read the next token, create the object and execute it"

	| token |
	token := [self next] on: PSEndOfTokenStreamNotification do: [:ex |
		^self].
	token processIn: self.
	^self
]

{ #category : #actions }
PSInterpreter >> step: anInteger [
	"step anInteger times"

	anInteger timesRepeat: [self step].
	^self
]

{ #category : #accessing }
PSInterpreter >> trace [
	"<SequenceableCollection of: Object>
	Sequence of executed token"

	^self properties at: #trace ifAbsentPut: [OrderedCollection new]
]

{ #category : #actions }
PSInterpreter >> trace: anObject [
	self trace add: anObject
]

{ #category : #actions }
PSInterpreter >> unmark [
	| list |
	list := self propertyAt: #marks ifAbsent: [
		^PSUnmatchedmark raiseSignal].
	list isEmpty ifTrue: [
		^PSUnmatchedmark raiseSignal].
	list removeLast.
	list isEmpty ifTrue: [
		self propertyRemove: #marks]
]

{ #category : #'accessing dictionaries' }
PSInterpreter >> valueAt: aSymbol [
	"<Object>
	look up aSymbol in the dictionary stack.
	Raise error when not found"

	^self valueAt: aSymbol ifAbsent: [
		(KeyNotFound receiver: self selector: #valueAt: index: aSymbol) raiseRequest]
]

{ #category : #'accessing dictionaries' }
PSInterpreter >> valueAt: aSymbol ifAbsent: aZeroArgumentBlock [
	"<Object>
	look up aSymbol in the dictionary stack.
	Evaluate aZeroArgumentBlock when not found"

	self dictionaryStack objects do: [:dict |
		dict at: aSymbol ifPresent: [:op |
			^op]].
	^aZeroArgumentBlock value
]

{ #category : #accessing }
PSInterpreter >> version [
	"<String>"
	
	^self class package dbVersionOrDerived
]

Class {
	#name : #PSInterpreterTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #Testing }
PSInterpreterTests >> test3Plus4 [
	| interpreter object |
	interpreter := PSInterpreter on: '3 4 add'.
	self assert: interpreter stack isEmpty.
	object := interpreter next.
	self assert: object = 3.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: interpreter stack top value = 3.
	self assert: interpreter stack printString = '|| 3 <'.
	object := interpreter next.
	self assert: object = 4.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: interpreter stack top value = 4.
	self assert: interpreter stack printString = '|| 3 4 <'.
	object := interpreter next.
	self assert: object value = #add.
	self assert: object printPostScript = 'add'.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: interpreter stack top value = 7.
	self assert: interpreter stack printString = '|| 7 <'
]

{ #category : #Testing }
PSInterpreterTests >> testArrayConstruction [
	| interpreter object |
	interpreter := PSInterpreter on: '[3 4]'.
	self assert: interpreter stack isEmpty.
	object := interpreter next.
	self assert: object printPostScript = '['.
	self assert: (object isKindOf: Symbol).
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: interpreter stack top value = PSMark new.
	self assert: interpreter stack printString = '|| *mark* <'.
	object := interpreter next.
	self assert: object = 3.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: interpreter stack top value = 3.
	self assert: interpreter stack printString = '|| *mark* 3 <'.
	object := interpreter next.
	self assert: object = 4.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: interpreter stack top value = 4.
	self assert: interpreter stack printString = '|| *mark* 3 4 <'.
	object := interpreter next.
	self assert: (object isKindOf: Symbol).
	self assert: object printPostScript = ']'.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: (interpreter stack top isKindOf: Array).
	self assert: interpreter stack printString = '|| [3 4] <'
]

{ #category : #Testing }
PSInterpreterTests >> testComment [
	| interpreter |
	interpreter := PSInterpreter on: '3 4 add 	%aComment'.
	self assert: interpreter stack isEmpty.
	self assert: interpreter step printString = '|| 3 <'.
	self assert: interpreter step printString = '|| 3 4 <'.
	self assert: interpreter step printString = '|| 7 <'.
	self should: [interpreter next] raise: PSEndOfTokenStreamNotification
]

{ #category : #Testing }
PSInterpreterTests >> testCommentPlus [
	| interpreter |
	interpreter := PSInterpreter on: '3 4 add 	%aComment
	/end'.
	self assert: interpreter stack isEmpty.
	self assert: interpreter step printString = '|| 3 <'.
	self assert: interpreter step printString = '|| 3 4 <'.
	self assert: interpreter step printString = '|| 7 <'.
	self assert: interpreter step printString = '|| 7 /end <'.
	self assert: interpreter scanner atEnd
]

{ #category : #Testing }
PSInterpreterTests >> testDictionaryConstruction [
	| interpreter object |
	interpreter := PSInterpreter on: '	<</a 0.1 /abc (tx) /bbb {pop pop}>>pop'.
	self assert: interpreter printString = '||  <'.
	self assert: interpreter step printString = '|| *mark* <'.
	self assert: interpreter step printString = '|| *mark* /a <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /abc <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /abc (tx) <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /abc (tx) /bbb <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /abc (tx) /bbb {pop pop} <'.
	object := interpreter next.
	self assert: (object isKindOf: Symbol).
	self assert: object printPostScript = '>>'.
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: (interpreter stack top isKindOf: PSDictionary).
	self assert: interpreter printString = '|| <</a 0.1 /abc (tx) /bbb {pop pop}>> <'.
	self assert: interpreter step printString = '||  <'
]

{ #category : #Testing }
PSInterpreterTests >> testEmpty [
	| interpreter |
	interpreter := PSInterpreter on: ''.
	self assert: interpreter stack isEmpty.
	self assert: interpreter next isNil.
	self assert: interpreter scanner atEnd.
	self should: [interpreter next] raise: PSEndOfTokenStreamNotification
]

{ #category : #Testing }
PSInterpreterTests >> testNestedArrayConstruction [
	| interpreter object |
	interpreter := PSInterpreter on: '[3 [(abc) /bcd] 4]'.
	self assert: interpreter stack isEmpty.
	object := interpreter next.
	self assert: object printPostScript = '['.
	object processIn: interpreter.
	self assert: interpreter printString = '|| *mark* <'.
	self assert: interpreter step printString = '|| *mark* 3 <'.
	self assert: interpreter step printString = '|| *mark* 3 *mark* <'.
	self assert: interpreter step printString = '|| *mark* 3 *mark* (abc) <'.
	self assert: interpreter step printString = '|| *mark* 3 *mark* (abc) /bcd <'.
	self assert: interpreter step printString = '|| *mark* 3 [(abc) /bcd] <'.
	self assert: interpreter step printString = '|| *mark* 3 [(abc) /bcd] 4 <'.
	self assert: interpreter step printString = '|| [3 [(abc) /bcd] 4] <'
]

{ #category : #Testing }
PSInterpreterTests >> testNestedDictionaryConstruction [
	| interpreter |
	interpreter := PSInterpreter on: '	<</a 0.1 /dict <</abc (tx)>> /bbb {pop pop}>> pop'.
	self assert: interpreter printString = '||  <'.
	self assert: interpreter step printString = '|| *mark* <'.
	self assert: interpreter step printString = '|| *mark* /a <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /dict <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /dict *mark* <'.
	self assert: (interpreter step: 2) printString = '|| *mark* /a 0.1 /dict *mark* /abc (tx) <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /dict <</abc (tx)>> <'.
	self assert: (interpreter stack top isKindOf: PSDictionary).
	self assert: interpreter step printString = '|| *mark* /a 0.1 /dict <</abc (tx)>> /bbb <'.
	self assert: interpreter step printString = '|| *mark* /a 0.1 /dict <</abc (tx)>> /bbb {pop pop} <'.
	self assert: (interpreter stack top isKindOf: PSProcedure).
	self assert: interpreter step printString = '|| <</a 0.1 /dict <</abc (tx)>> /bbb {pop pop}>> <'.
	self assert: (interpreter stack top isKindOf: PSDictionary).
	self assert: interpreter step printString = '||  <'.
]

{ #category : #Testing }
PSInterpreterTests >> testNestedProcedureConstruction [
	| interpreter |
	interpreter := PSInterpreter on: '/abc {
	dup pop /xyz {2 3 add} def
}def'.
	self assert: interpreter stack isEmpty.
	self assert: interpreter step printString = '|| /abc <'.
	self assert: interpreter step printString = '|| /abc {dup pop /xyz {2 3 add} def} <'.
	self assert: interpreter step printString = '||  <'.
]

{ #category : #Testing }
PSInterpreterTests >> testOperatorNotFound [
	| interpreter object |
	interpreter := Interpreter on: '3 4 zork'.
	self assert: interpreter stack isEmpty.
	self assert: interpreter step printString = '|| 3 <'.
	self assert: interpreter step printString = '|| 3 4 <'.
	object := interpreter next.
	self assert: (object isKindOf: Symbol).
	self assert: object value = #zork.
	self should: [object processIn: interpreter] raise: KeyNotFound.
	[object processIn: interpreter] on: KeyNotFound do: [:ex |
		self assert: ex receiver == interpreter.
		self assert: ex object = #zork].
	self assert: interpreter stack printString = '|| 3 4 <'
]

{ #category : #Testing }
PSInterpreterTests >> testProcedureConstruction [
	| interpreter object |
	interpreter := PSInterpreter on: '/abc {
	dup pop
}def'.
	self assert: interpreter stack isEmpty.
	object := interpreter next.
	self assert: object printPostScript = '/abc'.
	object processIn: interpreter.
	object := interpreter next.
	self assert: object printPostScript = '{dup pop}'.
	self assert: (object isKindOf: PSProcedure).
	object processIn: interpreter.
	self deny: interpreter stack isEmpty.
	self assert: (interpreter stack top isKindOf: PSProcedure).
	self assert: interpreter printString = '|| /abc {dup pop} <'.
	object := interpreter next.
	self assert: (object isKindOf: Symbol).
	self assert: object printPostScript = 'def'
]

{ #category : #Testing }
PSInterpreterTests >> testRun [
	| ps |
	ps := PSInterpreter run: '3 4 add'.
	self assert: ps stack top value = 7.
	self assert: ps stack size = 1.
	ps run: 'dup mul'.
	self assert: ps stack top value = 49.
	self assert: ps stack size = 1.
	ps := PSInterpreter run: '3 4 add dup mul'.
	self assert: ps stack top value = 49.
	self assert: ps stack size = 1.
	ps := PSInterpreter run: '3 4 mul'.
	self assert: ps stack top value = 12.
	self assert: ps stack size = 1.
	ps := (PSInterpreter on: '3 4 mul') step: 2.
	self assert: ps stack top value = 4.
	self assert: ps stack size = 2.
	ps run: 'add dup'.
	self assert: ps stack top value = 7.
	self assert: ps stack size = 2.
	ps run.
	self assert: ps stack top value = 49.
	self assert: ps stack size = 1
]

{ #category : #Testing }
PSInterpreterTests >> testRunCascaded [
	| ps |
	ps := (PSInterpreter on: '')
		run: '3 4 add';
		run: 'dup mul';
		yourself.
	self assert: ps stack top value = 49.
	self assert: ps stack size = 1.
	ps := (PSInterpreter new)
		run: '3';
		run: '4';
		run: 'add';
		run: 'dup';
		run: 'mul';
		yourself.
	self assert: ps stack top value = 49.
	self assert: ps stack size = 1.
	ps := (PSInterpreter new)
		run: '3';
		run: '4';
		run: 'add';
		run: 'dup';
		run: 'mul';
		yourself.
	self assert: ps stack top value = 49.
	self assert: ps stack size = 1
]

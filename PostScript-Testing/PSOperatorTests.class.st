Class {
	#name : #PSOperatorTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testAbs [
	self assert: (PSInterpreter run: '4.5 abs') printString = '|| 4.5 <'.
	self assert: (PSInterpreter run: '-3 abs') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '0 abs') printString = '|| 0 <'.
	self should: [PSInterpreter run: 'abs'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testAdd [
	self assert: (PSInterpreter run: '3 4 add') printString = '|| 7 <'.
	self assert: (PSInterpreter run: '9.9 1.1 add') printString = '|| 11 <'.
	self should: [PSInterpreter run: '4 add'] raise: PSStackunderflow
]

{ #category : #'Testing Array' }
PSOperatorTests >> testAload [
	self assert: (PSInterpreter run: '[23 (ab) -6] aload') printString = '|| 23 (ab) -6 [23 (ab) -6] <'.
	self should: [PSInterpreter run: 'aload'] raise: PSStackunderflow
]

{ #category : #'Testing String' }
PSOperatorTests >> testAnchorsearch [
	self assert: (PSInterpreter run: '(abbc) (ab) anchorsearch') printString = '|| (bc) (ab) true <'.
	self assert: (PSInterpreter run: '(abbc) (bb) anchorsearch') printString = '|| (abbc) false <'.
	self assert: (PSInterpreter run: '(abbc) (bc) anchorsearch') printString = '|| (abbc) false <'.
	self assert: (PSInterpreter run: '(abbc) (B) anchorsearch') printString = '|| (abbc) false <'.
	self should: [PSInterpreter run: '(ab) anchorsearch'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testAnd [
	self assert: (PSInterpreter run: 'true true and') printString = '|| true <'.
	self assert: (PSInterpreter run: 'true false and') printString = '|| false <'.
	self assert: (PSInterpreter run: 'false true and') printString = '|| false <'.
	self assert: (PSInterpreter run: 'false false and') printString = '|| false <'.
	self assert: (PSInterpreter run: '99 1 and') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '52 7 and') printString = '|| 4 <'.
	self should: [PSInterpreter run: '4 and'] raise: PSStackunderflow
]

{ #category : #'Testing Array' }
PSOperatorTests >> testArray [
	self assert: (PSInterpreter run: '3 array') printString = '|| [null null null] <'.
	self should: [PSInterpreter run: 'array'] raise: PSStackunderflow
]

{ #category : #'Testing Array' }
PSOperatorTests >> testArrayConstruction [
	self assert: (PSInterpreter run: '[') printString = '|| *mark* <'.
	self assert: (PSInterpreter run: '[5 4 3]') printString = '|| [5 4 3] <'.
	self assert: (PSInterpreter run: 'mark 5 4 3 counttomark array astore exch pop') printString = '|| [5 4 3] <'.
	self assert: (PSInterpreter run: '[1 2 add]') printString = '|| [3] <'.
	self should: [PSInterpreter run: ']'] raise: PSUnmatchedmark
]

{ #category : #'Testing Array' }
PSOperatorTests >> testAstore [
	self assert: (PSInterpreter run: '(a) (bcd) (ef) 3 array astore') printString = '|| [(a) (bcd) (ef)] <'.
	self should: [PSInterpreter run: 'astore'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testAtan [
	self assert: (PSInterpreter run: '0 1 atan') printString = '|| 0 <'.
	self assert: (PSInterpreter run: '1 0 atan') printString = '|| 90 <'.
	self assert: (PSInterpreter run: '-100 0 atan') printString = '|| 270 <'.
	self assert: (PSInterpreter run: '4 4 atan') printString = '|| 45 <'.
	self should: [PSInterpreter run: 'atan'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testBitshift [
	self assert: (PSInterpreter run: '7 3 bitshift') printString = '|| 56 <'.
	self assert: (PSInterpreter run: '142 -3 bitshift') printString = '|| 17 <'.
	self should: [PSInterpreter run: '4 bitshift'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testCeiling [
	self assert: (PSInterpreter run: '3.2 ceiling') printString = '|| 4 <'.
	self assert: (PSInterpreter run: '-4.8 ceiling') printString = '|| -4 <'.
	self assert: (PSInterpreter run: '99 ceiling') printString = '|| 99 <'.
	self should: [PSInterpreter run: 'ceiling'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testClear [
	self assert: (PSInterpreter run: '(a) (b) (c) clear') printString = '||  <'.
	self assert: (PSInterpreter run: '(a) clear') printString = '||  <'.
	self assert: (PSInterpreter run: 'clear') printString = '||  <'
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testCleartomark [
	self assert: (PSInterpreter run: '3 4 mark 20 15 cleartomark') printString = '|| 3 4 <'.
	self assert: (PSInterpreter run: '3 4 mark cleartomark') printString = '|| 3 4 <'.
	self should: [PSInterpreter run: '3 4 cleartomark'] raise: PSUnmatchedmark
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testCopy [
	self assert: (PSInterpreter run: '(a) (b) (c) 2 copy') printString = '|| (a) (b) (c) (b) (c) <'.
	self assert: (PSInterpreter run: '(a) (b) (c) 0 copy') printString = '|| (a) (b) (c) <'.
	self should: [PSInterpreter run: '(a) (b) (c) 4 copy'] raise: PSStackunderflow
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testCopyArray [
	self assert: (PSInterpreter run: '
		/a1 [1 2 3] def
		a1 dup length array copy') printString = '|| [1 2 3] <'
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testCopyDictionary [
	self assert: (PSInterpreter run: '
		/a1 <</a 1 /b 2 /c 3>> def
		a1 dup length dict copy') printString = '|| <</a 1 /b 2 /c 3>> <'
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testCos [
	self assert: (PSInterpreter run: '0 cos') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '90 cos') printString = '|| 0 <'.
	self should: [PSInterpreter run: 'cos'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testCount [
	self assert: (PSInterpreter run: '(a) (b) (c) (d) count') printString = '|| (a) (b) (c) (d) 4 <'.
	self assert: (PSInterpreter run: '(a) (b) (c) count') printString = '|| (a) (b) (c) 3 <'.
	self assert: (PSInterpreter run: 'count') printString = '|| 0 <'
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testCountdictstack [
	self assert: (PSInterpreter run: 'countdictstack') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '1 dict begin countdictstack') printString = '|| 4 <'
]

{ #category : #'Testing Control' }
PSOperatorTests >> testCountexecstack [
	self assert: (PSInterpreter run: 'countexecstack') printString = '|| 0 <'.
	self assert: (PSInterpreter run: '/a {3 2 add countexecstack} def a') printString = '|| 5 1 <'
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testCounttomark [
	self assert: (PSInterpreter run: '1 mark 2 3 counttomark') printString = '|| 1 *mark* 2 3 2 <'.
	self assert: (PSInterpreter run: '1 mark counttomark') printString = '|| 1 *mark* 0 <'.
	self should: [PSInterpreter run: '3 4 counttomark'] raise: PSUnmatchedmark
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testCurrentdict [
	self assert: (PSInterpreter run: 'currentdict') printString = '|| <<>> <'.
	self assert: (PSInterpreter run: '1 dict begin /a 42 def currentdict') printString = '|| <</a 42>> <'
]

{ #category : #'Testing Type, Attribute, and Conversion' }
PSOperatorTests >> testCvi [
	self assert: (PSInterpreter run: '(3.3E1) cvi') printString = '|| 33 <'.
	self assert: (PSInterpreter run: '-47.8 cvi') printString = '|| -47 <'.
	self assert: (PSInterpreter run: '520.9 cvi') printString = '|| 520 <'.
	self should: [PSInterpreter run: 'cvi'] raise: PSStackunderflow
]

{ #category : #'Testing Type, Attribute, and Conversion' }
PSOperatorTests >> testCvn [
	self assert: (PSInterpreter run: '(abc) cvn') printString = '|| /abc <'.
	self assert: (PSInterpreter run: '(abc) cvx cvn') printString = '|| abc <'.
	self should: [PSInterpreter run: 'cvn'] raise: PSStackunderflow
]

{ #category : #'Testing Type, Attribute, and Conversion' }
PSOperatorTests >> testCvr [
	self assert: (PSInterpreter run: '(3.3E1) cvr') printString = '|| 33 <'.
	self assert: (PSInterpreter run: '-47.8 cvr') printString = '|| -47.8 <'.
	self assert: (PSInterpreter run: '(-47.8) cvr') printString = '|| -47.8 <'.
	self assert: (PSInterpreter run: '520.9 cvr') printString = '|| 520.9 <'.
	self should: [PSInterpreter run: 'cvr'] raise: PSStackunderflow
]

{ #category : #'Testing Type, Attribute, and Conversion' }
PSOperatorTests >> testCvrs [
	self assert: (PSInterpreter run: '
		/temp 12 string def
		123 10 temp cvrs') printString = '|| (123) <'.
	self assert: (PSInterpreter run: '
		/temp 12 string def
		-123 10 temp cvrs') printString = '|| (-123) <'.
	self assert: (PSInterpreter run: '
		/temp 12 string def
		123.4 10 temp cvrs') printString = '|| (123.4) <'.
	self assert: (PSInterpreter run: '
		/temp 12 string def
		123 16 temp cvrs') printString = '|| (7B) <'.
	self assert: (PSInterpreter run: '
		/temp 12 string def
		-123 16 temp cvrs') printString = '|| (FFFFFF85) <'.
	self assert: (PSInterpreter run: '
		/temp 12 string def
		123.4 16 temp cvrs') printString = '|| (7B) <'.
	self should: [PSInterpreter run: '(abc) cvs'] raise: PSStackunderflow
]

{ #category : #'Testing Type, Attribute, and Conversion' }
PSOperatorTests >> testCvs [
	self assert: (PSInterpreter run: '
		/str 20 string def
		123 456 add str cvs') printString = '|| (579) <'.
	self assert: (PSInterpreter run: '
		/str 20 string def
		mark str cvs') printString = '|| (--nostringval--) <'.
	self should: [PSInterpreter run: '(abc) cvs'] raise: PSStackunderflow
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testDef [
	| interpreter |
	interpreter := PSInterpreter run: '/A 65 def'.
	self assert: interpreter stack isEmpty.
	self assert: (interpreter dictionaryStack top at: #A) = 65.
	self assert: (PSInterpreter run: '/ncnt 1 def currentdict') printString = '|| <</ncnt 1>> <'.
	self assert: (PSInterpreter run: '
	/ncnt 1 def
	/ncnt ncnt 1 add def
	currentdict') printString = '|| <</ncnt 2>> <'.
	self should: [PSInterpreter run: '65 def'] raise: PSStackunderflow
]

{ #category : #'Testing Resource' }
PSOperatorTests >> testDefineCategory [
	self assert: (PSInterpreter run: '
		true setglobal
			/catdict /Generic /Category findresource def
			/Widget catdict /Category defineresource pop
		false setglobal
		/Frob1 <</a 1>> /Widget defineresource') printString = '|| <</a 1>> <'.
	self assert: (PSInterpreter run: '
		true setglobal
			/catdict /Generic /Category findresource def
			/Widget catdict /Category defineresource pop
		false setglobal
		/Frob1 <</a 1>> /Widget defineresource pop
		/Frob1 /Widget findresource') printString = '|| <</a 1>> <'.
	self assert: (PSInterpreter run: '
		true setglobal
			/catdict /Generic /Category findresource def
			/Widget catdict /Category defineresource pop
		false setglobal
		/Frob1 <</a 1>> /Widget defineresource pop
		/Frob1 /Widget resourcestatus') printString = '|| 0 1 true <'.
	self assert: (PSInterpreter run: '
		true setglobal
			/catdict /Generic /Category findresource def
			/Widget catdict /Category defineresource pop
		false setglobal
		/Frob1 <</a 1>> /Widget defineresource pop
		(*) {} 10 string /Widget resourceforall') printString = '|| Frob1 <'
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testDict [
	self assert: (PSInterpreter run: '3 dict') printString = '|| <<>> <'.
	self should: [PSInterpreter run: 'dict'] raise: PSStackunderflow
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testDictionaries [
	self assert: (PSInterpreter run: 'globaldict') printString = '|| <<>> <'.
	self assert: (PSInterpreter run: '/a 1 def userdict') printString = '|| <</a 1>> <'.
	self assert: (PSInterpreter run: 'systemdict length') pop > 120
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testDiv [
	self assert: (PSInterpreter run: '3 2 div') printString = '|| 1.5 <'.
	self assert: (PSInterpreter run: '4 2 div') printString = '|| 2 <'.
	self should: [PSInterpreter run: '2 div'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testDup [
	self assert: (PSInterpreter run: '3 4 dup') printString = '|| 3 4 4 <'.
	self should: [PSInterpreter run: 'dup'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testEq [
	self assert: (PSInterpreter run: '4.0 4 eq') printString = '|| true <'.
	self assert: (PSInterpreter run: '(abc) (abc) eq') printString = '|| true <'.
	self assert: (PSInterpreter run: '(abc) /abc eq') printString = '|| true <'.
	self assert: (PSInterpreter run: '[1 2 3] dup eq') printString = '|| true <'.
	self assert: (PSInterpreter run: '[1 2 3] [1 2 3] eq') printString = '|| false <'.
	self should: [PSInterpreter run: '4 eq'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testExch [
	self assert: (PSInterpreter run: '1 2 exch') printString = '|| 2 1 <'.
	self assert: (PSInterpreter run: '1 2 exch exch') printString = '|| 1 2 <'.
	self should: [PSInterpreter run: '3 exch'] raise: PSStackunderflow
]

{ #category : #'Testing Control' }
PSOperatorTests >> testExec [
	self assert: (PSInterpreter run: '(3 2 add) cvx exec') printString = '|| 5 <'.
	self assert: (PSInterpreter run: '3 2 /add exec') printString = '|| 3 2 /add <'.
	self assert: (PSInterpreter run: '3 2 /add cvx exec') printString = '|| 5 <'.
	self should: [PSInterpreter run: 'exec'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testExp [
	self assert: (PSInterpreter run: '9 0.5 exp') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '-9 -1 exp') printString = '|| -0.11111111 <'.
	self should: [PSInterpreter run: '2 exp'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testFloor [
	self assert: (PSInterpreter run: '3.2 floor') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '-4.8 floor') printString = '|| -5 <'.
	self assert: (PSInterpreter run: '99 floor') printString = '|| 99 <'.
	self should: [PSInterpreter run: 'floor'] raise: PSStackunderflow
]

{ #category : #'Testing Control' }
PSOperatorTests >> testFor [
	self assert: (PSInterpreter run: '0 1 1 4 {add} for') printString = '|| 10 <'.
	self assert: (PSInterpreter run: '1 2 6 { } for') printString = '|| 1 3 5 <'.
	self assert: (PSInterpreter run: '3 -.5 1 { } for') printString = '|| 3 2.5 2 1.5 1 <'.
	self should: [PSInterpreter run: '1 4 {add} for'] raise: PSStackunderflow
]

{ #category : #'Testing Control' }
PSOperatorTests >> testForExit [
	self assert: (PSInterpreter run: '1 1 100 {dup 6 ge {exit} if} for') printString = '|| 1 2 3 4 5 6 <'.
	self should: [PSInterpreter run: 'exit'] raise: PSExitNotification
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testForall [
	self assert: (PSInterpreter run: '0 [ 13 29 3 -8 21 ] { add } forall') printString = '|| 58 <'.
	self assert: (PSInterpreter run: '
	/d 2 dict def
	d /abc 123 put
	d /xyz (test) put
	d { } forall') printString = '|| /abc 123 /xyz (test) <'.
	self should: [PSInterpreter run: '{ add } forall'] raise: PSStackunderflow
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testForallExit [
	self assert: (PSInterpreter run: '0 [ 13 29 3 8 21 ] {1 index 42 gt {(end) exit} if add } forall') printString = '|| 45 8 (end) <'
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testGe [
	self assert: (PSInterpreter run: '4.2 4 ge') printString = '|| true <'.
	self assert: (PSInterpreter run: '(abc) (d) ge') printString = '|| false <'.
	self assert: (PSInterpreter run: '(aba) (ab) ge') printString = '|| true <'.
	self assert: (PSInterpreter run: '(aba) (aba) ge') printString = '|| true <'.
	self should: [PSInterpreter run: '4 ge'] raise: PSStackunderflow
]

{ #category : #'Testing Resource' }
PSOperatorTests >> testGenericCategory [
	| source |
	self assert: (PSInterpreter run: '/Generic /Category findresource') stack top size = 5.
	source := '
		currentglobal 								% Save the current VM status on the stack.
		true setglobal
			/Generic /Category findresource
			dup length 1 add dict copy
			dup /InstanceType /dicttype put
			/Widget exch /Category defineresource pop
		setglobal 								% Restore the saved VM status.
		/Button <</a 1>> /Widget defineresource'.
	self assert: (PSInterpreter run: source) printString = '|| <</a 1>> <'
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testGet [
	self assert: (PSInterpreter run: '[31 41 59] 0 get') printString = '|| 31 <'.
	self assert: (PSInterpreter run: '[0 (string1) [ ] {add 2 div}] 2 get') printString = '|| [] <'.
	self assert: (PSInterpreter run: '
	/mykey (myvalue) def
	currentdict /mykey get') printString = '|| (myvalue) <'.
	self assert: (PSInterpreter run: '(abc) 1 get') printString = '|| 98 <'.
	self assert: (PSInterpreter run: '(a) 0 get') printString = '|| 97 <'.
	self should: [PSInterpreter run: '0 get'] raise: PSStackunderflow
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testGetinterval [
	self assert: (PSInterpreter run: '[9 8 7 6 5] 1 3 getinterval') printString = '|| [8 7 6] <'.
	self assert: (PSInterpreter run: '(abcde) 1 3 getinterval') printString = '|| (bcd) <'.
	self assert: (PSInterpreter run: '(abcde) 0 0 getinterval') printString = '|| () <'.
	self should: [PSInterpreter run: '0 0 getinterval'] raise: PSStackunderflow
]

{ #category : #'Testing Miscellaneous' }
PSOperatorTests >> testGlobal [
	self assert: (PSInterpreter run: 'currentglobal') printString = '|| false <'.
	self assert: (PSInterpreter run: 'true setglobal currentglobal') printString = '|| true <'
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testGt [
	self assert: (PSInterpreter run: '4.2 4 gt') printString = '|| true <'.
	self assert: (PSInterpreter run: '(abc) (d) gt') printString = '|| false <'.
	self assert: (PSInterpreter run: '(aba) (ab) gt') printString = '|| true <'.
	self assert: (PSInterpreter run: '(aba) (aba) gt') printString = '|| false <'.
	self should: [PSInterpreter run: '4 gt'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testIdiv [
	self assert: (PSInterpreter run: '3 2 idiv') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '4 2 idiv') printString = '|| 2 <'.
	self assert: (PSInterpreter run: '-5 2 idiv') printString = '|| -2 <'.
	self should: [PSInterpreter run: '2 idiv'] raise: PSStackunderflow
]

{ #category : #'Testing Control' }
PSOperatorTests >> testIf [
	self assert: (PSInterpreter run: '3 4 lt {(3 is less than 4)} if') printString = '|| (3 is less than 4) <'.
	self assert: (PSInterpreter run: '
		4 3 lt
			{(TruePart)}
			{(FalsePart)}
		ifelse') printString = '|| (FalsePart) <'.
	self should: [PSInterpreter run: '{add} if'] raise: PSStackunderflow.
	self should: [PSInterpreter run: '{4} {add} ifelse'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testIndex [
	self assert: (PSInterpreter run: '(a) (b) (c) (d) 0 index') printString = '|| (a) (b) (c) (d) (d) <'.
	self assert: (PSInterpreter run: '(a) (b) (c) (d) 3 index') printString = '|| (a) (b) (c) (d) (a) <'.
	self should: [PSInterpreter run: '0 index'] raise: PSStackunderflow.
	self should: [PSInterpreter run: '(a) (b) (c) (d) 4 index'] raise: PSStackunderflow
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testKnown [
	self assert: (PSInterpreter run: '
		/mydict 5 dict def
		mydict /total 0 put
		mydict /total known') printString = '|| true <'.
	self assert: (PSInterpreter run: '
		/mydict 5 dict def
		mydict /total 0 put
		mydict /badname known') printString = '|| false <'.
	self should: [PSInterpreter run: '/total known'] raise: PSStackunderflow
]

{ #category : #'Testing Miscellaneous' }
PSOperatorTests >> testLanguagelevel [
	self assert: (PSInterpreter run: 'languagelevel') printString = '|| 3 <'
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testLe [
	self assert: (PSInterpreter run: '4.2 4 le') printString = '|| false <'.
	self assert: (PSInterpreter run: '(abc) (d) le') printString = '|| true <'.
	self assert: (PSInterpreter run: '(aba) (ab) le') printString = '|| false <'.
	self assert: (PSInterpreter run: '(aba) (aba) le') printString = '|| true <'.
	self should: [PSInterpreter run: '4 le'] raise: PSStackunderflow
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testLength [
	self assert: (PSInterpreter run: '[1 2 4] length') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '[ ] length') printString = '|| 0 <'.
	self assert: (PSInterpreter run: '/ar 20 array def ar length') printString = '|| 20 <'.
	self assert: (PSInterpreter run: '
	/mydict 5 dict def
	mydict length') printString = '|| 0 <'.
	self assert: (PSInterpreter run: '
	/mydict 5 dict def
	mydict /firstkey (firstvalue) put
	mydict length') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '(abc\n) length') printString = '|| 4 <'.
	self assert: (PSInterpreter run: '() length') printString = '|| 0 <'.
	self assert: (PSInterpreter run: '/foo length') printString = '|| 3 <'.
	self should: [PSInterpreter run: 'length'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testLn [
	self assert: (PSInterpreter run: '10 ln') printString = '|| 2.30258509 <'.
	self assert: (PSInterpreter run: '100 ln') printString = '|| 4.60517019 <'.
	self should: [PSInterpreter run: 'ln'] raise: PSStackunderflow
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testLoad [
	self assert: (PSInterpreter run: '
		/avg {add 2 div} def
		/avg load') printString = '|| {add 2 div} <'.
	self should: [PSInterpreter run: 'load'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testLog [
	self assert: (PSInterpreter run: '10 log') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '100 log') printString = '|| 2 <'.
	self should: [PSInterpreter run: 'log'] raise: PSStackunderflow
]

{ #category : #'Testing Control' }
PSOperatorTests >> testLoopExit [
	self assert: (PSInterpreter run: '{count 4 ge {(end) exit} if (abc)} loop') printString = '|| (abc) (abc) (abc) (abc) (end) <'
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testLt [
	self assert: (PSInterpreter run: '4.2 4 lt') printString = '|| false <'.
	self assert: (PSInterpreter run: '(abc) (d) lt') printString = '|| true <'.
	self assert: (PSInterpreter run: '(aba) (ab) lt') printString = '|| false <'.
	self assert: (PSInterpreter run: '(aba) (aba) lt') printString = '|| false <'.
	self should: [PSInterpreter run: '4 lt'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testMark [
	self assert: (PSInterpreter run: '(a) (b) (c) (d) mark') printString = '|| (a) (b) (c) (d) *mark* <'.
	self assert: (PSInterpreter run: 'mark') printString = '|| *mark* <'
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testMaxlength [
	self assert: (PSInterpreter run: '<</a 1 /b 2>> maxlength') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '<</a 1 /b 2 /c 3>> maxlength') printString = '|| 7 <'.
	self should: [PSInterpreter run: 'maxlength'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testMod [
	self assert: (PSInterpreter run: '5 3 mod') printString = '|| 2 <'.
	self assert: (PSInterpreter run: '5 2 mod') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '-5 3 mod') printString = '|| -2 <'.
	self should: [PSInterpreter run: '2 mod'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testMul [
	self assert: (PSInterpreter run: '5 3 mul') printString = '|| 15 <'.
	self assert: (PSInterpreter run: '5 2 mul') printString = '|| 10 <'.
	self assert: (PSInterpreter run: '-5 3 mul') printString = '|| -15 <'.
	self should: [PSInterpreter run: '2 mul'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testNe [
	self assert: (PSInterpreter run: '4.0 4 ne') printString = '|| false <'.
	self assert: (PSInterpreter run: '(abc) (abc) ne') printString = '|| false <'.
	self assert: (PSInterpreter run: '(abc) /abc ne') printString = '|| false <'.
	self assert: (PSInterpreter run: '[1 2 3] dup ne') printString = '|| false <'.
	self assert: (PSInterpreter run: '[1 2 3] [1 2 3] ne') printString = '|| true <'.
	self should: [PSInterpreter run: '4 ne'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testNeg [
	self assert: (PSInterpreter run: '4.5 neg') printString = '|| -4.5 <'.
	self assert: (PSInterpreter run: '-3 neg') printString = '|| 3 <'.
	self should: [PSInterpreter run: 'neg'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testNot [
	self assert: (PSInterpreter run: 'true not') printString = '|| false <'.
	self assert: (PSInterpreter run: 'false not') printString = '|| true <'.
	self assert: (PSInterpreter run: '52 not') printString = '|| -53 <'.
	self should: [PSInterpreter run: 'not'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testOr [
	self assert: (PSInterpreter run: 'true true or') printString = '|| true <'.
	self assert: (PSInterpreter run: 'true false or') printString = '|| true <'.
	self assert: (PSInterpreter run: 'false true or') printString = '|| true <'.
	self assert: (PSInterpreter run: 'false false or') printString = '|| false <'.
	self assert: (PSInterpreter run: '17 5 or') printString = '|| 21 <'.
	self assert: (PSInterpreter run: '52 7 or') printString = '|| 55 <'.
	self should: [PSInterpreter run: '4 or'] raise: PSStackunderflow
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testPop [
	self assert: (PSInterpreter run: '3 4 pop') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '3 4 pop pop') printString = '||  <'.
	self should: [PSInterpreter run: '3 4 pop pop pop'] raise: PSStackunderflow
]

{ #category : #'Testing Miscellaneous' }
PSOperatorTests >> testProduct [
	self assert: (PSInterpreter run: 'product') printString = '|| (PDFtalk PostScript) <'
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testPut [
	self assert: (PSInterpreter run: '
	/ar [5 17 3 8] def
	ar 2 (abcd) put
	ar') printString = '|| [5 17 (abcd) 8] <'.
	self assert: (PSInterpreter run: '
	/d 5 dict def
	d /abc 123 put
	d { } forall') printString = '|| /abc 123 <'.
	self assert: (PSInterpreter run: '
	/st (abc) def
	st 0 65 put
	st') printString = '|| (Abc) <'.
	self should: [PSInterpreter run: '(a) 0 put'] raise: PSStackunderflow
]

{ #category : #'Testing Collections' }
PSOperatorTests >> testPutinterval [
	self assert: (PSInterpreter run: '/ar [5 8 2 7 3] def
ar 1 [(a) (b) (c)] putinterval
ar') printString = '|| [5 (a) (b) (c) 3] <'.
	self assert: (PSInterpreter run: '/st (abc) def
st 1 (de) putinterval
st') printString = '|| (ade) <'.
	self should: [PSInterpreter run: '0 0 putinterval'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testRand [
	| stack |
	self assert: ((PSInterpreter run: 'rand') stack top isKindOf: Integer).
	self assert: (PSInterpreter run: 'rand') stack top positive.
	stack := (PSInterpreter run: 'rand rand') stack.
	self deny: stack top = (stack at: 1)
]

{ #category : #'Testing Control' }
PSOperatorTests >> testRepeat [
	self assert: (PSInterpreter run: '4 {(abc)} repeat') printString = '|| (abc) (abc) (abc) (abc) <'.
	self assert: (PSInterpreter run: '1 2 3 4 3 {pop} repeat') printString = '|| 1 <'.
	self assert: (PSInterpreter run: '4 { } repeat') printString = '||  <'.
	self assert: (PSInterpreter run: 'mark 0 {(will not happen)} repeat') printString = '|| *mark* <'.
	self should: [PSInterpreter run: '{add} repeat'] raise: PSStackunderflow
]

{ #category : #'Testing Control' }
PSOperatorTests >> testRepeatExit [
	self assert: (PSInterpreter run: '100 {count 4 ge {(end) exit} if (abc)} repeat') printString = '|| (abc) (abc) (abc) (abc) (end) <'
]

{ #category : #'Testing Miscellaneous' }
PSOperatorTests >> testRevision [
	self assert: ((PSInterpreter run: #revision asString) pop isKindOf: Integer)
]

{ #category : #'Testing Operand Stack Manipulation' }
PSOperatorTests >> testRoll [
	self assert: (PSInterpreter run: '(a) (b) (c) 3 -1 roll') printString = '|| (b) (c) (a) <'.
	self assert: (PSInterpreter run: '(a) (b) (c) 3 1 roll') printString = '|| (c) (a) (b) <'.
	self assert: (PSInterpreter run: '(a) (b) (c) 3 0 roll') printString = '|| (a) (b) (c) <'.
	self should: [PSInterpreter run: '(a) (b) (c) 4 1 roll'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testRound [
	self assert: (PSInterpreter run: '3.2 round') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '6.5 round') printString = '|| 7 <'.
	self assert: (PSInterpreter run: '-4.8 round') printString = '|| -5 <'.
	self assert: (PSInterpreter run: '-6.5 round') printString = '|| -7 <'.	"different: PLRM says -6"
	self assert: (PSInterpreter run: '99 round') printString = '|| 99 <'.
	self should: [PSInterpreter run: 'round'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testRrand [
	| stack |
	self assert: ((PSInterpreter run: 'rrand') stack top isKindOf: Integer).
	self assert: (PSInterpreter run: 'rrand') stack top positive.
	stack := (PSInterpreter run: 'rrand rrand') stack.
	self assert: stack top = (stack at: 1)
]

{ #category : #'Testing String' }
PSOperatorTests >> testSearch [
	self assert: (PSInterpreter run: '(abbc) (ab) search') printString = '|| (bc) (ab) () true <'.
	self assert: (PSInterpreter run: '(abbc) (bb) search') printString = '|| (c) (bb) (a) true <'.
	self assert: (PSInterpreter run: '(abbc) (bc) search') printString = '|| () (bc) (ab) true <'.
	self assert: (PSInterpreter run: '(abbc) (B) search') printString = '|| (abbc) false <'.
	self should: [PSInterpreter run: '(ab) search'] raise: PSStackunderflow
]

{ #category : #'Testing Miscellaneous' }
PSOperatorTests >> testSerialnumber [
	self assert: (PSInterpreter run: 'serialnumber') printString = '|| 1 <'
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testSin [
	self assert: (PSInterpreter run: '0 sin') printString = '|| 0 <'.
	self assert: (PSInterpreter run: '90 sin') printString = '|| 1 <'.
	self should: [PSInterpreter run: 'sin'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testSqrt [
	self assert: (PSInterpreter run: '81 sqrt') printString = '|| 9 <'.
	self assert: (PSInterpreter run: '10 sqrt') printString = '|| 3.16227766 <'.
	self should: [PSInterpreter run: 'sqrt'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testSrand [
	self assert: (PSInterpreter run: '1 srand') printString = '||  <'.
	self assert: (PSInterpreter run: '1 srand rand') printString = '|| 784542783 <'.
	self assert: (PSInterpreter run: '1 srand rand') printString = '|| 784542783 <'.
	self assert: (PSInterpreter run: '2 srand rand') printString = '|| 1569085566 <'
]

{ #category : #'Testing Control' }
PSOperatorTests >> testStopped [
	self assert: (PSInterpreter run: '
		{100 {
			count 4 ge {
				(end) stop
			} if (abc)
		} repeat} stopped
			{(error occured)}
		if') printString = '|| (abc) (abc) (abc) (abc) (end) (error occured) <'
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testStore [
	self assert: (PSInterpreter run: '/abc 123 store currentdict') printString = '|| <</abc 123>> <'.
	self assert: (PSInterpreter run: '
		/abc 123 def
		/abc 456 store
		currentdict') printString = '|| <</abc 456>> <'.
	self should: [PSInterpreter run: '123 store'] raise: PSStackunderflow
]

{ #category : #'Testing String' }
PSOperatorTests >> testString [
	self assert: (PSInterpreter run: '3 string') printString = '|| (\000\000\000) <'.
	self should: [PSInterpreter run: 'string'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testSub [
	self assert: (PSInterpreter run: '32 4 sub') printString = '|| 28 <'.
	self assert: (PSInterpreter run: '3 4 sub') printString = '|| -1 <'.
	self assert: (PSInterpreter run: '9.9 1.1 sub') printString = '|| 8.8 <'.
	self should: [PSInterpreter run: '4 sub'] raise: PSStackunderflow
]

{ #category : #'Testing String' }
PSOperatorTests >> testToken [
	self assert: (PSInterpreter run: '(15 (St1) {1 2 add}) token') printString = '|| ((St1) {1 2 add}) 15 true <'.
	self assert: (PSInterpreter run: '((St1) {1 2 add}) token') printString = '|| ({1 2 add}) (St1) true <'.
	self assert: (PSInterpreter run: '({1 2 add}) token') printString = '|| () {1 2 add} true <'.
	self assert: (PSInterpreter run: '( ) token') printString = '|| false <'.
	self should: [PSInterpreter run: 'token'] raise: PSStackunderflow
]

{ #category : #'Testing Arithmetic and Math' }
PSOperatorTests >> testTruncate [
	self assert: (PSInterpreter run: '3.2 truncate') printString = '|| 3 <'.
	self assert: (PSInterpreter run: '-4.8 truncate') printString = '|| -4 <'.
	self assert: (PSInterpreter run: '99 truncate') printString = '|| 99 <'.
	self should: [PSInterpreter run: 'truncate'] raise: PSStackunderflow
]

{ #category : #'Testing Type, Attribute, and Conversion' }
PSOperatorTests >> testType [
	self assert: (PSInterpreter run: '[1 2 3] type') printString = '|| arraytype <'.
	self assert: (PSInterpreter run: 'true type') printString = '|| booleantype <'.
	self assert: (PSInterpreter run: '<</a 1>> type') printString = '|| dicttype <'.
	self assert: (PSInterpreter run: '47 type') printString = '|| integertype <'.
	self assert: (PSInterpreter run: 'mark type') printString = '|| marktype <'.
	self assert: (PSInterpreter run: '/name type') printString = '|| nametype <'.
	self assert: (PSInterpreter run: '/name cvx type') printString = '|| operatortype <'.
	self assert: (PSInterpreter run: 'null type') printString = '|| nulltype <'.
	self assert: (PSInterpreter run: '-47.8 type') printString = '|| realtype <'.
	self assert: (PSInterpreter run: '(3.3E1) type') printString = '|| stringtype <'.
	self assert: (PSInterpreter run: '(3.3E1) cvx type') printString = '|| stringtype <'.
	self should: [PSInterpreter run: 'type'] raise: PSStackunderflow
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testUndef [
	self assert: (PSInterpreter run: '
		/abc 123 def
		currentdict') printString = '|| <</abc 123>> <'.
	self assert: (PSInterpreter run: '
		/abc 123 def
		currentdict /abc undef
		currentdict') printString = '|| <<>> <'.
	self should: [PSInterpreter run: '/a undef'] raise: PSStackunderflow
]

{ #category : #'Testing Miscellaneous' }
PSOperatorTests >> testVersion [
	"runs only when the proper store is connected"

	self assert: ('2.5.*' match: (PSInterpreter run: 'version') pop)
]

{ #category : #'Testing Dictionary' }
PSOperatorTests >> testWhere [
	self assert: (PSInterpreter run: '
		/abc 123 def
		3 dict begin /a 1 def 
		/abc where') printString = '|| <</abc 123>> true <'.
	self assert: (PSInterpreter run: '
		/abc 123 def
		3 dict begin /a 1 def 
		/a where') printString = '|| <</a 1>> true <'.
	self assert: (PSInterpreter run: '
		/abc 123 def
		3 dict begin /a 1 def 
		/ab where') printString = '|| false <'.
	self should: [PSInterpreter run: 'where'] raise: PSStackunderflow
]

{ #category : #'Testing Relational, Boolean, and Bitwise' }
PSOperatorTests >> testXor [
	self assert: (PSInterpreter run: 'true true xor') printString = '|| false <'.
	self assert: (PSInterpreter run: 'true false xor') printString = '|| true <'.
	self assert: (PSInterpreter run: 'false true xor') printString = '|| true <'.
	self assert: (PSInterpreter run: 'false false xor') printString = '|| false <'.
	self assert: (PSInterpreter run: '7 3 xor') printString = '|| 4 <'.
	self assert: (PSInterpreter run: '12 3 xor') printString = '|| 15 <'.
	self should: [PSInterpreter run: '4 xor'] raise: PSStackunderflow
]

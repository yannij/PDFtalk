Class {
	#name : #PSScannerTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #Testing }
PSScannerTests >> testArrayDefinition [
	| scanner object |
	scanner := PSScanner on: '	[0.1 abc (tx) /bbb] ff'.
	object := scanner nextPostScriptObject.
	self assert: object value = #'['.
	self assert: (object isKindOf: Symbol).
	object := scanner nextPostScriptObject.
	self assert: object value = 0.1.
	self assert: (object isKindOf: Number).
	object := scanner nextPostScriptObject.
	self assert: object value = #abc.
	self assert: (object isKindOf: Symbol).
	object := scanner nextPostScriptObject.
	self assert: object = 'tx'.
	self assert: (object isKindOf: String).
	object := scanner nextPostScriptObject.
	self assert: object object = #bbb.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object value = #']'.
	self assert: (object isKindOf: Symbol).
	object := scanner nextPostScriptObject.
	self assert: object value = #ff.
	self assert: (object isKindOf: Symbol)
]

{ #category : #Testing }
PSScannerTests >> testArrayDefinitionBook [
	| scanner object |
	scanner := PSScanner on: '	[ 123 /abc (xyz) ]'.
	object := scanner nextPostScriptObject.
	self assert: object value = #'['.
	self assert: (object isKindOf: Symbol).
	object := scanner nextPostScriptObject.
	self assert: object value = 123.
	self assert: (object isKindOf: Number).
	object := scanner nextPostScriptObject.
	self assert: object object = #abc.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object = 'xyz'.
	self assert: (object isKindOf: String).
	object := scanner nextPostScriptObject.
	self assert: object value = #']'.
	self assert: (object isKindOf: Symbol)
]

{ #category : #Testing }
PSScannerTests >> testComment [
	| scanner |
	scanner := PSScanner on: '		12.3 45.6 m	% a comment
78.9'.
	self assert: scanner nextPostScriptObject = 12.3.
	self assert: scanner nextPostScriptObject = 45.6.
	self assert: scanner nextPostScriptObject printPostScript = 'm'.
	self assert: scanner nextPostScriptObject = 78.9.
]

{ #category : #Testing }
PSScannerTests >> testDictionaryDefinition [
	| scanner object |
	scanner := PSScanner on: '	<</a 0.1 /abc (tx) /bbb {pop pop}>>ff'.
	object := scanner nextPostScriptObject.
	self assert: object value = #<<.
	self assert: (object isKindOf: Symbol).
	object := scanner nextPostScriptObject.
	self assert: object object = #a.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object value = 0.1.
	self assert: (object isKindOf: Number).
	object := scanner nextPostScriptObject.
	self assert: object object = #abc.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object = 'tx'.
	self assert: (object isKindOf: String).
	object := scanner nextPostScriptObject.
	self assert: object object = #bbb.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object printString = '{pop pop}'.
	self assert: (object isKindOf: PSProcedure).
	object := scanner nextPostScriptObject.
	self assert: object value = #>>.
	self assert: (object isKindOf: Symbol).
	object := scanner nextPostScriptObject.
	self assert: object value = #ff.
	self assert: (object isKindOf: Symbol)
]

{ #category : #Testing }
PSScannerTests >> testEmptyWhitespace [
	| scanner |
	scanner := PSScanner on: '   '.
	self should: [scanner nextPostScriptObject] raise: PSEndOfTokenStreamNotification.
]

{ #category : #Testing }
PSScannerTests >> testEmptyWhitespace2 [
	| scanner |
	scanner := PSScanner on: ' 		
	
  123'.
	self assert: scanner nextPostScriptObject = 123
]

{ #category : #Testing }
PSScannerTests >> testFloatToken [
	| scanner object |
	scanner := PSScanner on: '123.456'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Number).
	self assert: object = 123.456.
]

{ #category : #Testing }
PSScannerTests >> testLiteralNames [
	self assert: ((PSScanner on: '/abc') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/abc') nextPostScriptObject object = #abc.
	self assert: ((PSScanner on: '/Offset') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/Offset') nextPostScriptObject object = #Offset.
	self assert: ((PSScanner on: '/$$') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/$$') nextPostScriptObject object = #'$$'.
	self assert: ((PSScanner on: '/23A') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/23A') nextPostScriptObject object = #'23A'.
	self assert: ((PSScanner on: '/13-456') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/13-456') nextPostScriptObject object = #'13-456'.
	self assert: ((PSScanner on: '/a.b') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/a.b') nextPostScriptObject object = #'a.b'.
	self assert: ((PSScanner on: '/$MyDict') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/$MyDict') nextPostScriptObject object = #'$MyDict'.
	self assert: ((PSScanner on: '/@pattern') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/@pattern') nextPostScriptObject object = #'@pattern'.
	self assert: ((PSScanner on: '23A') nextPostScriptObject isKindOf: Symbol).
	self assert: ((PSScanner on: '23E1') nextPostScriptObject isKindOf: Number).
	self assert: ((PSScanner on: '23#1') nextPostScriptObject isKindOf: Number)
]

{ #category : #Testing }
PSScannerTests >> testNames [
	self assert: (PSScanner on: 'abc') nextPostScriptObject = #abc.
	self assert: (PSScanner on: 'Offset') nextPostScriptObject = #Offset.
	self assert: (PSScanner on: '$$') nextPostScriptObject = #'$$'.
	self assert: (PSScanner on: '23A') nextPostScriptObject = #'23A'.
	self assert: (PSScanner on: '13-456') nextPostScriptObject = #'13-456'.
	self assert: (PSScanner on: 'a.b') nextPostScriptObject = #'a.b'.
	self assert: (PSScanner on: '$MyDict') nextPostScriptObject = #'$MyDict'.
	self assert: (PSScanner on: '@pattern') nextPostScriptObject = #'@pattern'.
	self assert: ((PSScanner on: '/') nextPostScriptObject isKindOf: PSLiteralName).
	self assert: (PSScanner on: '/') nextPostScriptObject object = #''.
	self assert: (PSScanner on: '/ abc') nextPostScriptObject object = #''.
	self assert: ((PSScanner on: '23A') nextPostScriptObject isKindOf: Symbol).
	self assert: ((PSScanner on: '23E1') nextPostScriptObject isKindOf: Number).
	self assert: ((PSScanner on: '23#1') nextPostScriptObject isKindOf: Number)
]

{ #category : #Testing }
PSScannerTests >> testNumberToken [
	| scanner object |
	scanner := PSScanner on: '123'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object value = 123.
]

{ #category : #Testing }
PSScannerTests >> testNumberZeroToken [
	| scanner object |
	scanner := PSScanner on: '0'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object value = 0.
]

{ #category : #Testing }
PSScannerTests >> testProcedureDefinition [
	| scanner object |
	scanner := PSScanner on: '	/abc{2 dup mul}def'.
	object := scanner nextPostScriptObject.
	self assert: object object = #abc.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object printString = '{2 dup mul}'.
	self assert: (object isKindOf: PSProcedure).
	object := scanner nextPostScriptObject.
	self assert: object value = #def.
	self assert: (object isKindOf: Symbol)
]

{ #category : #Testing }
PSScannerTests >> testProcedureDefinitionWithWhitespace [
	| scanner object |
	scanner := PSScanner on: '	/abc {
	2 dup mul
}def'.
	object := scanner nextPostScriptObject.
	self assert: object object = #abc.
	self assert: (object isKindOf: PSLiteralName).
	object := scanner nextPostScriptObject.
	self assert: object printString = '{2 dup mul}'.
	self assert: (object isKindOf: PSProcedure).
	object := scanner nextPostScriptObject.
	self assert: object value = #def.
	self assert: (object isKindOf: Symbol)
]

{ #category : #Testing }
PSScannerTests >> testReturnComment [
	| scanner |
	scanner := PSScanner on: '		12.3 45.6 m	% a comment
78.9'.
	self assert: scanner nextPostScriptObject = 12.3.
	self assert: scanner nextPostScriptObject = 45.6.
	self assert: scanner nextPostScriptObject printPostScript = 'm'.
	self assert: scanner nextPostScriptObject = 78.9.
]

{ #category : #Testing }
PSScannerTests >> testStartComment [
	| scanner |
	scanner := PSScanner on: '	% a comment
78.9'.
	self assert: scanner nextPostScriptObject = 78.9.
]

{ #category : #Testing }
PSScannerTests >> testThreeNumberToken [
	| scanner object |
	scanner := PSScanner on: '123 456 7.89'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 123.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 456.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Number).
	self assert: object = 7.89
]

{ #category : #Testing }
PSScannerTests >> testTwoComments [
	| scanner |
	scanner := PSScanner on: '	% a comment
78.9	 %and another
m'.
	self assert: scanner nextPostScriptObject = 78.9.
	self assert: scanner nextPostScriptObject printPostScript = 'm'.
]

{ #category : #Testing }
PSScannerTests >> testTwoNumberToken [
	| scanner object |
	scanner := PSScanner on: '123 456'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 123.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 456.
]

{ #category : #Testing }
PSScannerTests >> testTwoRadixToken [
	| scanner object |
	scanner := PSScanner on: '8#23 16#1ff'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 19.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object = 511.
]

{ #category : #Testing }
PSScannerTests >> testTwoRealToken [
	| scanner object |
	scanner := PSScanner on: '1.23 +45.6e-23'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Number).
	self assert: object = 1.23.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Number).
	self assert: object asFloat printString = '4.56e-22'.
]

{ #category : #Testing }
PSScannerTests >> testWhitespaceAndNumberZeroToken [
	| scanner object |
	scanner := PSScanner on: ' 0'.
	object := scanner nextPostScriptObject.
	self assert: (object isKindOf: Integer).
	self assert: object value = 0.
]

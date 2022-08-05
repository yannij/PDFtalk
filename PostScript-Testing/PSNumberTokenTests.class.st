Class {
	#name : #PSNumberTokenTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #Testing }
PSNumberTokenTests >> testE1 [
	| scanner |
	scanner := PSScanner new.
	self deny: (scanner isReal: 'e1').
	self deny: (scanner isReal: '.e1').
	self assert: (scanner isReal: '.1e1').
	self assert: (scanner isReal: '1.e1').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsBigRadix [
	| scanner num1 num2 token1 token2 |
	scanner := PSScanner on: '36#HalloIchBinEineZahl 36#HALLOICHBINEINEZAHL'.
	num1 := scanner isRadix: '36#HalloIchBinEineZahl'.
	num2 := scanner isRadix: '36#HALLOICHBINEINEZAHL'.
	self assert: num1 = num2.
	token1 := scanner nextPostScriptObject.
	self assert: token1 = 178382264521767329680834841049.
	token2 := scanner nextPostScriptObject.
	self assert: token2 = 178382264521767329680834841049.
	self assert: token1 = token2
]

{ #category : #Testing }
PSNumberTokenTests >> testIsInteger [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isInteger: '123').
	self assert: (scanner isInteger: '-98').
	self assert: (scanner isInteger: '43445').
	self assert: (scanner isInteger: '0').
	self assert: (scanner isInteger: '+17').
	"mine"
	self assert: (scanner isInteger: '123456789012345678901234567890').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsIntegerNotReal [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isInteger: '123').
	self assert: (scanner isInteger: '-98').
	self assert: (scanner isInteger: '43445').
	self assert: (scanner isInteger: '0').
	self assert: (scanner isInteger: '+17').
	"mine"
	self assert: (scanner isInteger: '123456789012345678901234567890').
	self deny: (scanner isReal: '123').
	self deny: (scanner isReal: '-98').
	self deny: (scanner isReal: '43445').
	self deny: (scanner isReal: '0').
	self deny: (scanner isReal: '+17').
	"mine"
	self deny: (scanner isReal: '123456789012345678901234567890').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsIntegerNotRealNotRadix [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isInteger: '123').
	self assert: (scanner isInteger: '-98').
	self assert: (scanner isInteger: '43445').
	self assert: (scanner isInteger: '0').
	self assert: (scanner isInteger: '+17').
	"mine"
	self assert: (scanner isInteger: '123456789012345678901234567890').
	self deny: (scanner isReal: '123').
	self deny: (scanner isReal: '-98').
	self deny: (scanner isReal: '43445').
	self deny: (scanner isReal: '0').
	self deny: (scanner isReal: '+17').
	"mine"
	self deny: (scanner isReal: '123456789012345678901234567890').
	self deny: (scanner isRadix: '123').
	self deny: (scanner isRadix: '-98').
	self deny: (scanner isRadix: '43445').
	self deny: (scanner isRadix: '0').
	self deny: (scanner isRadix: '+17').
	"mine"
	self deny: (scanner isRadix: '123456789012345678901234567890').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsRadix [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isRadix: '8#1777').
	self assert: (scanner isRadix: '16#FFFE').
	self assert: (scanner isRadix: '2#1000').
	"mine"
	self deny: (scanner isRadix: '49#62tvs').
	self assert: (scanner isRadix: '36#HalloIchBinEineZahl').
	self deny: (scanner isRadix: '15#EF').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsRadixNotInteger [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isRadix: '8#1777').
	self assert: (scanner isRadix: '16#FFFE').
	self assert: (scanner isRadix: '2#1000').
	"mine"
	self assert: (scanner isRadix: '36#HalloIchBinEineZahl').
	self deny: (scanner isRadix: '49#62tvs').
	self deny: (scanner isRadix: '15#EF').

	self deny: (scanner isInteger: '8#1777').
	self deny: (scanner isInteger: '16#FFFE').
	self deny: (scanner isInteger: '2#1000').
	"mine"
	self deny: (scanner isInteger: '36#HalloIchBinEineZahl').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsRadixNotIntegerNotReal [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isRadix: '8#1777').
	self assert: (scanner isRadix: '16#FFFE').
	self assert: (scanner isRadix: '2#1000').
	"mine"
	self assert: (scanner isRadix: '36#HalloIchBinEineZahl').
	self deny: (scanner isRadix: '49#62tvs').
	self deny: (scanner isRadix: '15#EF').

	self deny: (scanner isInteger: '8#1777').
	self deny: (scanner isInteger: '16#FFFE').
	self deny: (scanner isInteger: '2#1000').
	"mine"
	self deny: (scanner isInteger: '36#HalloIchBinEineZahl').

	self deny: (scanner isReal: '8#1777').
	self deny: (scanner isReal: '16#FFFE').
	self deny: (scanner isReal: '2#1000').
	"mine"
	self deny: (scanner isReal: '36#HalloIchBinEineZahl').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsReal [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isReal: '-.002').
	self assert: (scanner isReal: '34.5').
	self assert: (scanner isReal: '-3.62').
	self assert: (scanner isReal: '123.6e10').
	self assert: (scanner isReal: '1.0E-5').
	self assert: (scanner isReal: '1E6').
	self assert: (scanner isReal: '-1.').
	self assert: (scanner isReal: '0.0').
	"mine"
	self deny: (scanner isReal: '0.0e2.3').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsRealNotInteger [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isReal: '-.002').
	self assert: (scanner isReal: '34.5').
	self assert: (scanner isReal: '-3.62').
	self assert: (scanner isReal: '123.6e10').
	self assert: (scanner isReal: '1.0E-5').
	self assert: (scanner isReal: '1E6').
	self assert: (scanner isReal: '-1.').
	self assert: (scanner isReal: '0.0').
	self deny: (scanner isInteger: '-.002').
	self deny: (scanner isInteger: '34.5').
	self deny: (scanner isInteger: '-3.62').
	self deny: (scanner isInteger: '123.6e10').
	self deny: (scanner isInteger: '1.0E-5').
	self deny: (scanner isInteger: '1E6').
	self deny: (scanner isInteger: '-1.').
	self deny: (scanner isInteger: '0.0').
]

{ #category : #Testing }
PSNumberTokenTests >> testIsRealNotIntegerNotRadix [
	| scanner |
	scanner := PSScanner new.
	self assert: (scanner isReal: '-.002').
	self assert: (scanner isReal: '34.5').
	self assert: (scanner isReal: '-3.62').
	self assert: (scanner isReal: '123.6e10').
	self assert: (scanner isReal: '1.0E-5').
	self assert: (scanner isReal: '1E6').
	self assert: (scanner isReal: '-1.').
	self assert: (scanner isReal: '0.0').
	self deny: (scanner isInteger: '-.002').
	self deny: (scanner isInteger: '34.5').
	self deny: (scanner isInteger: '-3.62').
	self deny: (scanner isInteger: '123.6e10').
	self deny: (scanner isInteger: '1.0E-5').
	self deny: (scanner isInteger: '1E6').
	self deny: (scanner isInteger: '-1.').
	self deny: (scanner isInteger: '0.0').
	self deny: (scanner isRadix: '-.002').
	self deny: (scanner isRadix: '34.5').
	self deny: (scanner isRadix: '-3.62').
	self deny: (scanner isRadix: '123.6e10').
	self deny: (scanner isRadix: '1.0E-5').
	self deny: (scanner isRadix: '1E6').
	self deny: (scanner isRadix: '-1.').
	self deny: (scanner isRadix: '0.0').
]

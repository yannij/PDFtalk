Class {
	#name : #PSCMapTests,
	#superclass : #TestCase,
	#category : #'PostScript-CIDInit Testing'
}

{ #category : #'testing canonical mappings' }
PSCMapTests >> testAsSimplestMapping [
	self assert: ((PSCode bytes: #[42]) --> 86) asSimplestMapping = ((PSCode bytes: #[42]) --> 86).
	self assert: (((PSCode bytes: #[0 0]) to: (PSCode bytes: #[0 55])) --> 42) asSimplestMapping = (((PSCode bytes: #[0 0]) to: (PSCode bytes: #[0 55])) --> 42).
	self assert: (((PSCode bytes: #[0 55]) to: (PSCode bytes: #[0 55])) --> 42) asSimplestMapping = ((PSCode bytes: #[0 55]) --> 42)
]

{ #category : #'testing decoding' }
PSCMapTests >> testBfMappingsCharacterAt [
	| mappings1 mappings2 |
	mappings1 := PSBfMappings
		fromMappings: (Array with: (PSCode bytes: #[22]) --> 65)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))).
	self assert: (mappings1 characterAt: (PSCode bytes: #[22])) = $A.
	self assert: (mappings1 characterAt: (PSCode bytes: #[21])) isNil.
	self assert: (mappings1 characterAt: (PSCode bytes: #[23])) isNil.
	self assert: (mappings1 characterAt: (PSCode bytes: #[1 21])) isNil.
	mappings2 := PSBfMappings
		fromMappings: (Array
			with: (PSCode bytes: #[21]) --> 50
			with: ((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 65)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))).
	self assert: (mappings2 characterAt: (PSCode bytes: #[21])) = $2.
	self assert: (mappings2 characterAt: (PSCode bytes: #[22])) = $A.
	self assert: (mappings2 characterAt: (PSCode bytes: #[42])) = $U.
	self assert: (mappings2 characterAt: (PSCode bytes: #[20])) isNil.
	self assert: (mappings2 characterAt: (PSCode bytes: #[43])) isNil.
	self assert: (mappings2 characterAt: (PSCode bytes: #[1 22])) isNil
]

{ #category : #'testing decoding' }
PSCMapTests >> testCIDMappingsCidAt [
	| mappings1 mappings2 |
	mappings1 := PSCIDMappings
		fromMappings: (Array with: (PSCode bytes: #[22]) --> 10)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))).
	self assert: (mappings1 cidAt: (PSCode bytes: #[22])) = 10.
	self assert: (mappings1 cidAt: (PSCode bytes: #[21])) isNil.
	self assert: (mappings1 cidAt: (PSCode bytes: #[23])) isNil.
	self assert: (mappings1 cidAt: (PSCode bytes: #[1 21])) isNil.
	mappings2 := PSCIDMappings
		fromMappings: (Array
			with: (PSCode bytes: #[21]) --> 10
			with: ((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 9)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))).
	self assert: ((PSCIDMappings
		fromMappings: (Array
			with: (PSCode bytes: #[21]) --> 10
			with: ((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 10)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) cidAt: (PSCode bytes: #[21])) = 10.
	self assert: (mappings2 cidAt: (PSCode bytes: #[22])) = 9.
	self assert: (mappings2 cidAt: (PSCode bytes: #[42])) = 29.
	self assert: (mappings2 cidAt: (PSCode bytes: #[20])) isNil.
	self assert: (mappings2 cidAt: (PSCode bytes: #[43])) isNil.
	self assert: (mappings2 cidAt: (PSCode bytes: #[1 22])) isNil
]

{ #category : #'testing neighbors' }
PSCMapTests >> testCharMappingIsNeighborOfCharMapping [
	self assert: ((PSCode bytes: #[42]) --> 86 isNext: (PSCode bytes: #[43]) --> 87).
	self deny: ((PSCode bytes: #[42]) --> 86 isNext: (PSCode bytes: #[42]) --> 86).
	self deny: ((PSCode bytes: #[42]) --> 86 isNext: (PSCode bytes: #[43]) --> 85).
	self assert: ((PSCode bytes: #[0 42]) --> 86 isNext: (PSCode bytes: #[0 43]) --> 87).
	self deny: ((PSCode bytes: #[0 42]) --> 86 isNext: (PSCode bytes: #[0 42]) --> 86).
	self deny: ((PSCode bytes: #[0 42]) --> 86 isNext: (PSCode bytes: #[0 43]) --> 85).
	self deny: ((PSCode bytes: #[0 42]) --> 86 isNext: (PSCode bytes: #[1 42]) --> 87)
]

{ #category : #'testing neighbors' }
PSCMapTests >> testCharMappingIsNeighborOfRangeMapping [
	| mapping1 mapping2 |
	mapping1 := (PSCode bytes: #[42]) --> 106.
	self assert: (mapping1 isNext: ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])) --> 107).
	self deny: (mapping1 isNext: ((PSCode bytes: #[42]) to: (PSCode bytes: #[48])) --> 107).
	self deny: (mapping1 isNext: ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])) --> 106).
	mapping2 := (PSCode bytes: #[0 42]) --> 106.
	self assert: (mapping2 isNext: ((PSCode bytes: #[0 43]) to: (PSCode bytes: #[0 48])) --> 107).
	self deny: (mapping2 isNext: ((PSCode bytes: #[0 42]) to: (PSCode bytes: #[0 48])) --> 106).
	self deny: (mapping2 isNext: ((PSCode bytes: #[0 43]) to: (PSCode bytes: #[0 48])) --> 105).
	self deny: (mapping2 isNext: ((PSCode bytes: #[1 42]) to: (PSCode bytes: #[1 48])) --> 107).
	self deny: ((PSCode bytes: #[0 255]) --> 86 isNext: ((PSCode bytes: #[1 00]) to: (PSCode bytes: #[1 10])) --> 87)
]

{ #category : #testing }
PSCMapTests >> testCodeLength [
	self assert: (PSCode bytes: #[0]) length = 1.
	self assert: (PSCode bytes: #[0 0]) length = 2.
	self assert: (PSCode bytes: #[0 0 0]) length = 3.
	self assert: (PSCode bytes: #[0 0 0 0]) length = 4.
	self assert: (PSCode bytes: #[]) length = 0
]

{ #category : #'testing decoding' }
PSCMapTests >> testCodeMappingDestinationCodeAt [
	self assert: ((PSCode bytes: #[22]) --> 10 destinationAt: (PSCode bytes: #[22])) = 10.
	"out of range - no errors"
	self assert: ((PSCode bytes: #[22]) --> 10 destinationAt: (PSCode bytes: #[20])) = 10.
	self assert: ((PSCode bytes: #[22]) --> 10 destinationAt: (PSCode bytes: #[0])) = 10.
	self assert: ((PSCode bytes: #[22]) --> 10 destinationAt: (PSCode bytes: #[255])) = 10.
	self assert: ((PSCode bytes: #[22]) --> 10 destinationAt: (PSCode bytes: #[255 255])) = 10
]

{ #category : #'testing order' }
PSCMapTests >> testCodeSmallerThanRange [
	self assert: (PSCode bytes: #[0]) <= ((PSCode bytes: #[20]) to: (PSCode bytes: #[200])).
	self assert: (PSCode bytes: #[42]) <= ((PSCode bytes: #[42]) to: (PSCode bytes: #[44])).
	self assert: (PSCode bytes: #[42]) <= ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])).
	self assert: (PSCode bytes: #[42 250]) <= ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])).
	self assert: (PSCode bytes: #[42]) <= ((PSCode bytes: #[43 250]) to: (PSCode bytes: #[48 255])).
	self assert: (PSCode bytes: #[42]) <= ((PSCode bytes: #[250]) to: (PSCode bytes: #[255])).
	self deny: (PSCode bytes: #[255]) <= ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])).
	self deny: (PSCode bytes: #[42]) <= ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])).
	self deny: (PSCode bytes: #[42]) <= ((PSCode bytes: #[0]) to: (PSCode bytes: #[10])).
]

{ #category : #'testing codespace' }
PSCMapTests >> testCodespace [
	| ordered unordered |
	ordered := (Array
		with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[127]))
		with: ((PSCode bytes: #[192 128]) to: (PSCode bytes: #[223 191]))
		with: ((PSCode bytes: #[224 128 128]) to: (PSCode bytes: #[239 191 191]))
		with: ((PSCode bytes: #[240 128 128 128]) to: (PSCode bytes: #[247 191 191 191]))).
	unordered := PSCMap sortedCodespaceranges: (Array
		with: ((PSCode bytes: #[224 128 128]) to: (PSCode bytes: #[239 191 191]))
		with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[127]))
		with: ((PSCode bytes: #[240 128 128 128]) to: (PSCode bytes: #[247 191 191 191]))
		with: ((PSCode bytes: #[192 128]) to: (PSCode bytes: #[223 191]))).
	self assert: ordered = unordered
]

{ #category : #'testing codespace' }
PSCMapTests >> testCodespaceIsValid [
	self should: [(PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[0] to: #[255]) with: (PSRange from: #[0 0] to: #[255 255])))] raise: Error.
	self should: [(PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[42] to: #[42]) with: (PSRange from: #[42] to: #[42])))] raise: Error.
	self should: [(PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[0] to: #[42]) with: (PSRange from: #[42] to: #[255])))] raise: Error.
	self should: [(PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[0] to: #[255]) with: (PSRange from: #[0] to: #[255])))] raise: Error.
	self should: [(PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[0] to: #[255]) with: (PSRange from: #[42] to: #[42])))] raise: Error.
	self should: [(PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[42] to: #[42]) with: (PSRange from: #[0] to: #[255])))] raise: Error.
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[0] to: #[42]) with: (PSRange from: #[43] to: #[255]))) = (Array with: (PSRange from: #[0] to: #[255])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[42] to: #[42]) with: (PSRange from: #[43] to: #[43]))) = (Array with: (PSRange from: #[42] to: #[43])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[43] to: #[43]) with: (PSRange from: #[42] to: #[42]))) = (Array with: (PSRange from: #[42] to: #[43])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[10 43] to: #[20 43]) with: (PSRange from: #[10 42] to: #[20 42]))) = (Array with: (PSRange from: #[10 42] to: #[20 43])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[43 57 10 43] to: #[43 57 20 43]) with: (PSRange from: #[43 57 10 42] to: #[43 57 20 42]))) = (Array with: (PSRange from: #[43 57 10 42] to: #[43 57 20 43])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[43 57 10 40] to: #[43 57 20 80]) with: (PSRange from: #[43 57 21 40] to: #[43 57 70 80]))) = (Array with: (PSRange from: #[43 57 10 40] to: #[43 57 70 80])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[43 57 10 40] to: #[43 57 20 80]) with: (PSRange from: #[43 58 10 40] to: #[43 77 20 80]))) = (Array with: (PSRange from: #[43 57 10 40] to: #[43 77 20 80])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[21 57 10 40] to: #[43 57 20 80]) with: (PSRange from: #[44 57 10 40] to: #[244 57 20 80]))) = (Array with: (PSRange from: #[21 57 10 40] to: #[244 57 20 80])).
	self assert: (PSCMap sortedCodespaceranges: (Array with: (PSRange from: #[21 57 10 40] to: #[43 57 20 80]) with: (PSRange from: #[44 57 10 81] to: #[244 57 20 90]))) = (Array with: (PSRange from: #[21 57 10 40] to: #[43 57 20 80]) with: (PSRange from: #[44 57 10 81] to: #[244 57 20 90])).
]

{ #category : #'testing codespace' }
PSCMapTests >> testCodespaceJoining [
	self assert: (PSCMap sortedCodespaceranges: (Array
		with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[127]))
		with: ((PSCode bytes: #[128]) to: (PSCode bytes: #[255])))) = (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))
]

{ #category : #'testing codespace' }
PSCMapTests >> testCodespaceJoining2 [
	self assert: (PSCMap sortedCodespaceranges: ((OrderedCollection new: 6)
		add: ((PSCode bytes: #[221]) to: (PSCode bytes: #[240]));
		add: ((PSCode bytes: #[32]) to: (PSCode bytes: #[127]));
		add: ((PSCode bytes: #[10]) to: (PSCode bytes: #[30]));
		add: ((PSCode bytes: #[210]) to: (PSCode bytes: #[220]));
		add: ((PSCode bytes: #[128]) to: (PSCode bytes: #[200]));
		add: ((PSCode bytes: #[3]) to: (PSCode bytes: #[9]));
		yourself)) = (Array
			with: ((PSCode bytes: #[3]) to: (PSCode bytes: #[30]))
			with: ((PSCode bytes: #[32]) to: (PSCode bytes: #[200]))
			with: ((PSCode bytes: #[210]) to: (PSCode bytes: #[240])))
]

{ #category : #testing }
PSCMapTests >> testCodespaceMappings [
	self assert: ((PSCode bytes: #[10]) to: (PSCode bytes: #[50])) asCodespace numberOfMappings = 0.
	self assert: ((PSCode bytes: #[10]) to: (PSCode bytes: #[50])) asCodespace numberOfCodes = 41.
	self assert: ((PSCode bytes: #[100 10]) to: (PSCode bytes: #[200 50])) asCodespace numberOfMappings = 0.
	self assert: ((PSCode bytes: #[100 10]) to: (PSCode bytes: #[200 50])) asCodespace numberOfCodes = 4141
]

{ #category : #testing }
PSCMapTests >> testCodespaceMappingsAccessing [
	| space1 space2 space3 |
	space1 := ((PSCode bytes: #[10]) to: (PSCode bytes: #[50])) asCodespace.
	self assert: (space1 at: (PSCode bytes: #[10])) isNil.
	space1 addMapping: (PSCode bytes: #[11]) --> 42.
	self assert: (space1 at: (PSCode bytes: #[11])) = ((PSCode bytes: #[11]) --> 42).
	space2 := ((PSCode bytes: #[100 10]) to: (PSCode bytes: #[200 50])) asCodespace.
	self assert: (space2 at: (PSCode bytes: #[100 10])) isNil.
	space2 addMapping: (PSCode bytes: #[110 11]) --> 42.
	self assert: (space2 at: (PSCode bytes: #[110 11])) = ((PSCode bytes: #[11]) --> 42).
	space3 := ((PSCode bytes: #[20 100 10]) to: (PSCode bytes: #[22 200 50])) asCodespace.
	self assert: (space3 at: (PSCode bytes: #[20 100 10])) isNil.
	space3 addMapping: (PSCode bytes: #[21 110 11]) --> 42.
	self assert: (space3 at: (PSCode bytes: #[21 110 11])) = ((PSCode bytes: #[11]) --> 42)
]

{ #category : #testing }
PSCMapTests >> testDestinations [
	| dict |
	dict := (PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
  <00> <7f>
endcodespacerange
3 beginbfchar
<10> <32>
<11> 42
<12> /yen
endbfchar
5 beginbfrange
<00> <03>  [/a /b /c /d]
<31> <33> [/A /C /D]
<41> <45> [1 2 3 4 5]
<51> <55> [<01> <04> <02> <03> <05>]
<61> <65> [<01> 4 <02> /yen 42]
endbfrange
endcmap') dictionaryStack top.
	self assert: (PSMappings
		fromChars: (dict at: #bfchar)
		andRanges: (dict at: #bfrange)
		in: (dict at: #codespacerange)) = (PSMappings codespaces: (Array with: (PSByteCodespace
			range: (PSRange from: #[0] to: #[127])
			mappings: ((OrderedCollection new: 16)
				add: (PSRange from: #[0] to: #[3]) --> 97;
				add: (PSCode bytes: #[16]) --> 50;
				add: (PSCode bytes: #[17]) --> 42;
				add: (PSCode bytes: #[18]) --> 165;
				add: (PSCode bytes: #[49]) --> 65;
				add: (PSRange from: #[50] to: #[51]) --> 67;
				add: (PSRange from: #[65] to: #[69]) --> 1;
				add: (PSCode bytes: #[81]) --> 1;
				add: (PSCode bytes: #[82]) --> 4;
				add: (PSRange from: #[83] to: #[84]) --> 2;
				add: (PSCode bytes: #[85]) --> 5;
				add: (PSCode bytes: #[97]) --> 1;
				add: (PSCode bytes: #[98]) --> 4;
				add: (PSCode bytes: #[99]) --> 2;
				add: (PSCode bytes: #[100]) --> 165;
				add: (PSCode bytes: #[101]) --> 42;
				yourself))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappings [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: (PSCode bytes: #[48]) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: (PSCode bytes: #[53]) --> 53)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: (PSCode bytes: #[48]) --> 48
				with: (PSCode bytes: #[53]) --> 53
				with: (PSCode bytes: #[57]) --> 57))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsIncluding [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: ((PSCode bytes: #[53]) to: (PSCode bytes: #[59])) --> 53)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
				with: ((PSCode bytes: #[53]) to: (PSCode bytes: #[59])) --> 53))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsJoinAfter [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: (PSCode bytes: #[48]) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: (PSCode bytes: #[56]) --> 56)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: (PSCode bytes: #[48]) --> 48
				with: ((PSCode bytes: #[56]) to: (PSCode bytes: #[57])) --> 56)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: ((PSCode bytes: #[53]) to: (PSCode bytes: #[56])) --> 53)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
				with: ((PSCode bytes: #[53]) to: (PSCode bytes: #[57])) --> 53))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsJoinBefore [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: (PSCode bytes: #[48]) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: (PSCode bytes: #[49]) --> 49)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[49])) --> 48
				with: (PSCode bytes: #[57]) --> 57)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: ((PSCode bytes: #[52]) to: (PSCode bytes: #[55])) --> 52)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[55])) --> 48
				with: (PSCode bytes: #[57]) --> 57))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsJoinBeforeAndAfter [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: (PSCode bytes: #[55]) --> 55
			with: (PSCode bytes: #[57]) --> 57
			with: (PSCode bytes: #[56]) --> 56)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array with: ((PSCode bytes: #[55]) to: (PSCode bytes: #[57])) --> 55)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: ((PSCode bytes: #[52]) to: (PSCode bytes: #[56])) --> 52)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[57])) --> 48))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsOrdering [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: (PSCode bytes: #[48]) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: (PSCode bytes: #[53]) --> 53)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: (PSCode bytes: #[48]) --> 48
				with: (PSCode bytes: #[53]) --> 53
				with: (PSCode bytes: #[57]) --> 57)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[57]) --> 57
			with: ((PSCode bytes: #[53]) to: (PSCode bytes: #[55])) --> 53)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
				with: ((PSCode bytes: #[53]) to: (PSCode bytes: #[55])) --> 53
				with: (PSCode bytes: #[57]) --> 57))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsOverwriteFirst [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: ((PSCode bytes: #[42]) to: (PSCode bytes: #[50])) --> 52)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[42]) to: (PSCode bytes: #[50])) --> 52
				with: (PSCode bytes: #[51]) --> 51)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[48]) --> 57)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: (PSCode bytes: #[48]) --> 57
				with: ((PSCode bytes: #[49]) to: (PSCode bytes: #[51])) --> 49))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsOverwriteLast [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: ((PSCode bytes: #[51]) to: (PSCode bytes: #[60])) --> 52)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[50])) --> 48
				with: ((PSCode bytes: #[51]) to: (PSCode bytes: #[60])) --> 52)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[51])) --> 48
			with: (PSCode bytes: #[51]) --> 57)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[50])) --> 48
				with: (PSCode bytes: #[51]) --> 57))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsOverwriteMiddle [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[58])) --> 48
			with: (PSCode bytes: #[51]) --> 52)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[50])) --> 48
				with: (PSCode bytes: #[51]) --> 52
				with: ((PSCode bytes: #[52]) to: (PSCode bytes: #[58])) --> 52)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[58])) --> 48
			with: ((PSCode bytes: #[51]) to: (PSCode bytes: #[55])) --> 52)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array
				with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[50])) --> 48
				with: ((PSCode bytes: #[51]) to: (PSCode bytes: #[55])) --> 52
				with: ((PSCode bytes: #[56]) to: (PSCode bytes: #[58])) --> 56))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testFromMappingsOverwriteMiddleWithSame [
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[58])) --> 48
			with: (PSCode bytes: #[51]) --> 51)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[58])) --> 48)))).
	self assert: (PSBfMappings
		fromMappings: (Array
			with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[58])) --> 48
			with: ((PSCode bytes: #[51]) to: (PSCode bytes: #[55])) --> 51)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])))) = (PSBfMappings codespaces: (Array with: (PSByteCodespace
			range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
			mappings: (Array with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[58])) --> 48))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testMappingsFromChars [
	| mappings |
	mappings := (OrderedCollection new: 11)
		add: (PSCode bytes: #[48]) --> 48;
		add: (PSCode bytes: #[49]) --> 49;
		add: (PSCode bytes: #[50]) --> 50;
		add: (PSCode bytes: #[51]) --> 51;
		add: (PSCode bytes: #[52]) --> 52;
		add: (PSCode bytes: #[53]) --> 53;
		add: (PSCode bytes: #[54]) --> 54;
		add: (PSCode bytes: #[55]) --> 55;
		add: (PSCode bytes: #[56]) --> 56;
		add: (PSCode bytes: #[57]) --> 57;
		add: (PSCode bytes: #[0 32]) --> 32;
		yourself.
	self assert: (PSBfMappings
		fromMappings: mappings
		in: (Array
			with: ((PSCode bytes: #[20]) to: (PSCode bytes: #[80]))
			with: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[0 255])))) = (PSBfMappings codespaces: (Array
			with: (PSByteCodespace
				range: ((PSCode bytes: #[20]) to: (PSCode bytes: #[80]))
				mappings: (Array with: ((PSCode bytes: #[48]) to: (PSCode bytes: #[57])) --> 48))
			with: (PSIndexedCodespace
				range: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[0 255]))
				codespaces: (Array with: (PSByteCodespace
					range: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))
					mappings: (Array with: (PSCode bytes: #[32]) --> 32))))))
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testMappingsOverwrittenCode [
	"overwrite code"

	self assert: ((PSCode bytes: #[55]) --> 55 mappingsOverwrittenBy: (PSCode bytes: #[55]) --> 56) = (Array with: (PSCode bytes: #[55]) --> 56).
	"overwrite code with range"
	self assert: ((PSCode bytes: #[55]) --> 55 mappingsOverwrittenBy: ((PSCode bytes: #[55]) to: (PSCode bytes: #[58])) --> 56) = (Array with: ((PSCode bytes: #[55]) to: (PSCode bytes: #[58])) --> 56).
	"attach in front"
	self assert: ((PSCode bytes: #[54]) --> 54 mappingsOverwrittenBy: ((PSCode bytes: #[55]) to: (PSCode bytes: #[58])) --> 55) = (Array with: ((PSCode bytes: #[54]) to: (PSCode bytes: #[58])) --> 54).
	"attach at the end"
	self assert: ((PSCode bytes: #[59]) --> 59 mappingsOverwrittenBy: ((PSCode bytes: #[55]) to: (PSCode bytes: #[58])) --> 55) = (Array with: ((PSCode bytes: #[55]) to: (PSCode bytes: #[59])) --> 55).
	"not touching -> ignored"
	self assert: ((PSCode bytes: #[54]) --> 53 mappingsOverwrittenBy: ((PSCode bytes: #[55]) to: (PSCode bytes: #[58])) --> 55) = (Array with: ((PSCode bytes: #[55]) to: (PSCode bytes: #[58])) --> 55)
]

{ #category : #'testing canonical mappings' }
PSCMapTests >> testMappingsOverwrittenRange [
	"overwrite inside range"

	self assert: (((PSCode bytes: #[52]) to: (PSCode bytes: #[56])) --> 30 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array with: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50).
	"attach in front"
	self assert: (((PSCode bytes: #[40]) to: (PSCode bytes: #[49])) --> 40 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array with: ((PSCode bytes: #[40]) to: (PSCode bytes: #[59])) --> 40).
	"attach at the end"
	self assert: (((PSCode bytes: #[60]) to: (PSCode bytes: #[69])) --> 60 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array with: ((PSCode bytes: #[50]) to: (PSCode bytes: #[69])) --> 50).
	"overlapping in front"
	self assert: (((PSCode bytes: #[40]) to: (PSCode bytes: #[55])) --> 10 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array
		with: ((PSCode bytes: #[40]) to: (PSCode bytes: #[49])) --> 10
		with: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50).
	"overlapping in front - joined"
	self assert: (((PSCode bytes: #[40]) to: (PSCode bytes: #[55])) --> 40 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array with: ((PSCode bytes: #[40]) to: (PSCode bytes: #[59])) --> 40).
	"overlapping at the end"
	self assert: (((PSCode bytes: #[55]) to: (PSCode bytes: #[69])) --> 10 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array
		with: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50
		with: ((PSCode bytes: #[60]) to: (PSCode bytes: #[69])) --> 15).
	"overlapping at the end - joined"
	self assert: (((PSCode bytes: #[55]) to: (PSCode bytes: #[69])) --> 55 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array with: ((PSCode bytes: #[50]) to: (PSCode bytes: #[69])) --> 50).
	"fully overlapping"
	self assert: (((PSCode bytes: #[40]) to: (PSCode bytes: #[69])) --> 10 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array
		with: ((PSCode bytes: #[40]) to: (PSCode bytes: #[49])) --> 10
		with: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50
		with: ((PSCode bytes: #[60]) to: (PSCode bytes: #[69])) --> 30).
	"fully overlapping - joined"
	self assert: (((PSCode bytes: #[40]) to: (PSCode bytes: #[69])) --> 40 mappingsOverwrittenBy: ((PSCode bytes: #[50]) to: (PSCode bytes: #[59])) --> 50) = (Array with: ((PSCode bytes: #[40]) to: (PSCode bytes: #[69])) --> 40)
]

{ #category : #'testing decoding' }
PSCMapTests >> testNotdefMappingsCidAt [
	| mappings1 mappings2 |
	mappings1 := PSNotdefMappings
		fromMappings: (Array with: (PSCode bytes: #[22]) --> 10)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))).
	self assert: (mappings1 cidAt: (PSCode bytes: #[22])) = 10.
	self assert: (mappings1 cidAt: (PSCode bytes: #[21])) isNil.
	self assert: (mappings1 cidAt: (PSCode bytes: #[23])) isNil.
	self assert: (mappings1 cidAt: (PSCode bytes: #[1 21])) isNil.
	mappings2 := PSNotdefMappings
		fromMappings: (Array
			with: (PSCode bytes: #[21]) --> 10
			with: ((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 9)
		in: (Array with: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255]))).
	self assert: (mappings2 cidAt: (PSCode bytes: #[21])) = 10.
	self assert: (mappings2 cidAt: (PSCode bytes: #[22])) = 9.
	self assert: (mappings2 cidAt: (PSCode bytes: #[42])) = 9.
	self assert: (mappings2 cidAt: (PSCode bytes: #[20])) isNil.
	self assert: (mappings2 cidAt: (PSCode bytes: #[43])) isNil.
	self assert: (mappings2 cidAt: (PSCode bytes: #[1 22])) isNil
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeErrors [
	self should: [(PSCode bytes: #[]) to: (PSCode bytes: #[42])] raise: Error.
	[(PSCode bytes: #[]) to: (PSCode bytes: #[42])] on: Error do: [:ex |
		self assert: ex messageText = 'The range is not valid'].
	self should: [(PSCode bytes: #[0 42]) to: (PSCode bytes: #[42])] raise: Error.
	[(PSCode bytes: #[0 42]) to: (PSCode bytes: #[42])] on: Error do: [:ex |
		self assert: ex messageText = 'The range is not valid'].
	self should: [(PSCode bytes: #[0 42]) to: (PSCode bytes: #[42 65 74])] raise: Error.
	[(PSCode bytes: #[0 42]) to: (PSCode bytes: #[42 65 74])] on: Error do: [:ex |
		self assert: ex messageText = 'The range is not valid'].
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeIncludes [
	self assert: (((PSCode bytes: #[42]) to: (PSCode bytes: #[42])) includesCode: (PSCode bytes: #[42])).
	self deny: (((PSCode bytes: #[42]) to: (PSCode bytes: #[42])) includesCode: (PSCode bytes: #[41])).
	self deny: (((PSCode bytes: #[42]) to: (PSCode bytes: #[42])) includesCode: (PSCode bytes: #[43])).
	self assert: (((PSCode bytes: #[0]) to: (PSCode bytes: #[255])) includesCode: (PSCode bytes: #[42])).
	self assert: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[42 42])).
	self assert: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[43 42])) includesCode: (PSCode bytes: #[42 42])).
	self assert: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 43])) includesCode: (PSCode bytes: #[42 42])).
	self assert: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[43 43])) includesCode: (PSCode bytes: #[42 42])).
	self assert: (((PSCode bytes: #[0 0]) to: (PSCode bytes: #[255 255])) includesCode: (PSCode bytes: #[42 42])).
	self assert: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[42 42])).
	self deny: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[43 42])).
	self deny: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[42 43])).
	self deny: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[43 43])).
	self assert: (((PSCode bytes: #[0 0 0]) to: (PSCode bytes: #[255 255 255])) includesCode: (PSCode bytes: #[42 42 42])).
	self assert: (((PSCode bytes: #[42 42 42]) to: (PSCode bytes: #[42 42 42])) includesCode: (PSCode bytes: #[42 42 42])).
	self deny: (((PSCode bytes: #[42 42 42]) to: (PSCode bytes: #[42 42 42])) includesCode: (PSCode bytes: #[42 41 42])).
	self assert: (((PSCode bytes: #[0 0 0 0]) to: (PSCode bytes: #[255 255 255 255])) includesCode: (PSCode bytes: #[42 42 42 42])).
	self assert: (((PSCode bytes: #[42 42 42 42]) to: (PSCode bytes: #[42 42 42 42])) includesCode: (PSCode bytes: #[42 42 42 42])).
	self deny: (((PSCode bytes: #[42 42 42 42]) to: (PSCode bytes: #[42 42 42 42])) includesCode: (PSCode bytes: #[42 42 41 42])).
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeIncludesDifferentLength [
	self deny: (((PSCode bytes: #[42]) to: (PSCode bytes: #[42])) includesCode: (PSCode bytes: #[])).
	self deny: (((PSCode bytes: #[42]) to: (PSCode bytes: #[42])) includesCode: (PSCode bytes: #[42 42])).
	self deny: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[42])).
	self deny: (((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) includesCode: (PSCode bytes: #[42 42 42])).
	self deny: (((PSCode bytes: #[42 42 42]) to: (PSCode bytes: #[42 42 42])) includesCode: (PSCode bytes: #[42 42])).
	self deny: (((PSCode bytes: #[42 42 42 42]) to: (PSCode bytes: #[42 42 42 42])) includesCode: (PSCode bytes: #[42 42 42])).
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeLength [
	self assert: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])) length = 1.
	self assert: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[255 255])) length = 2.
	self assert: ((PSCode bytes: #[0 0 0]) to: (PSCode bytes: #[255 255 255])) length = 3.
	self assert: ((PSCode bytes: #[0 0 0 0]) to: (PSCode bytes: #[255 255 255 255])) length = 4.
	self assert: ((PSCode bytes: #[]) to: (PSCode bytes: #[])) length = 0.
]

{ #category : #'testing decoding' }
PSCMapTests >> testRangeMappingDestinationCodeAt [
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[22])) = 86.
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[42])) = 106.
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[32])) = 96.
	"out of range - no errors"
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[21])) = 85.
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[0])) = 64.
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[43])) = 107.
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[255])) = 319.
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86 destinationAt: (PSCode bytes: #[2 255])) = 831.
	"out of range - negative"
	self assert: (((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 0 destinationAt: (PSCode bytes: #[10])) = -12
]

{ #category : #'testing neighbors' }
PSCMapTests >> testRangeMappingIsNeighborOfCharMapping [
	| mapping1 mapping2 |
	mapping1 := ((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86.
	self assert: mapping1 lastDestination = 106.
	self assert: (mapping1 isNext: (PSCode bytes: #[43]) --> 107).
	self deny: (mapping1 isNext: (PSCode bytes: #[42]) --> 107).
	self deny: (mapping1 isNext: (PSCode bytes: #[43]) --> 106).
	mapping2 := ((PSCode bytes: #[0 22]) to: (PSCode bytes: #[0 42])) --> 86.
	self assert: mapping2 lastDestination = 106.
	self assert: (mapping2 isNext: (PSCode bytes: #[0 43]) --> 107).
	self deny: (mapping2 isNext: (PSCode bytes: #[0 42]) --> 106).
	self deny: (mapping2 isNext: (PSCode bytes: #[0 43]) --> 105).
	self deny: (mapping2 isNext: (PSCode bytes: #[1 42]) --> 107).
	self deny: (((PSCode bytes: #[0 250]) to: (PSCode bytes: #[0 255])) --> 86 isNext: (PSCode bytes: #[1 00]) --> 92)
]

{ #category : #'testing neighbors' }
PSCMapTests >> testRangeMappingIsNeighborOfRangeMapping [
	| mapping1 mapping2 |
	mapping1 := ((PSCode bytes: #[22]) to: (PSCode bytes: #[42])) --> 86.
	self assert: mapping1 lastDestination = 106.
	self assert: (mapping1 isNext: ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])) --> 107).
	self deny: (mapping1 isNext: ((PSCode bytes: #[42]) to: (PSCode bytes: #[48])) --> 107).
	self deny: (mapping1 isNext: ((PSCode bytes: #[43]) to: (PSCode bytes: #[48])) --> 106).
	mapping2 := ((PSCode bytes: #[0 22]) to: (PSCode bytes: #[0 42])) --> 86.
	self assert: mapping2 lastDestination = 106.
	self assert: (mapping2 isNext: ((PSCode bytes: #[0 43]) to: (PSCode bytes: #[0 48])) --> 107).
	self deny: (mapping2 isNext: ((PSCode bytes: #[0 42]) to: (PSCode bytes: #[0 48])) --> 106).
	self deny: (mapping2 isNext: ((PSCode bytes: #[0 43]) to: (PSCode bytes: #[0 48])) --> 105).
	self deny: (mapping2 isNext: ((PSCode bytes: #[1 42]) to: (PSCode bytes: #[1 48])) --> 107).
	self deny: (((PSCode bytes: #[0 250]) to: (PSCode bytes: #[0 255])) --> 86 isNext: ((PSCode bytes: #[1 00]) to: (PSCode bytes: #[1 10])) --> 92)
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeNumberOfCodes [
	self assert: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])) class == PSRange.
	self assert: ((PSCode bytes: #[42]) to: (PSCode bytes: #[42])) numberOfCodes = 1.
	self assert: ((PSCode bytes: #[42]) to: (PSCode bytes: #[43])) numberOfCodes = 2.
	self assert: ((PSCode bytes: #[42]) to: (PSCode bytes: #[255])) numberOfCodes = 214.
	self assert: ((PSCode bytes: #[0]) to: (PSCode bytes: #[255])) numberOfCodes = 256.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 42])) numberOfCodes = 1.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 43])) numberOfCodes = 2.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[43 42])) numberOfCodes = 2.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[43 43])) numberOfCodes = 4.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[255 42])) numberOfCodes = 214.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[42 255])) numberOfCodes = 214.
	self assert: ((PSCode bytes: #[42 42]) to: (PSCode bytes: #[255 255])) numberOfCodes = 45796.
	self assert: ((PSCode bytes: #[0 0]) to: (PSCode bytes: #[255 255])) numberOfCodes = 65536.
	self assert: ((PSCode bytes: #[0 0 0]) to: (PSCode bytes: #[255 255 255])) numberOfCodes = 16777216.
	self assert: ((PSCode bytes: #[42 42 42]) to: (PSCode bytes: #[42 42 42])) numberOfCodes = 1.
	self assert: ((PSCode bytes: #[0 0 0 0]) to: (PSCode bytes: #[255 255 255 255])) numberOfCodes = 4294967296.
	self assert: ((PSCode bytes: #[42 42 42 42]) to: (PSCode bytes: #[42 42 42 42])) numberOfCodes = 1.
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeOverlaps1 [
	self assert: ((PSRange from: #[42] to: #[42]) overlaps: (PSRange from: #[42] to: #[42])).
	self assert: ((PSRange from: #[0] to: #[42]) overlaps: (PSRange from: #[42] to: #[255])).
	self assert: ((PSRange from: #[0] to: #[255]) overlaps: (PSRange from: #[0] to: #[255])).
	self assert: ((PSRange from: #[0] to: #[255]) overlaps: (PSRange from: #[42] to: #[42])).
	self assert: ((PSRange from: #[42] to: #[42]) overlaps: (PSRange from: #[0] to: #[255])).
	self deny: ((PSRange from: #[0] to: #[42]) overlaps: (PSRange from: #[43] to: #[255])).
	self deny: ((PSRange from: #[42] to: #[42]) overlaps: (PSRange from: #[43] to: #[43])).
	self deny: ((PSRange from: #[43] to: #[43]) overlaps: (PSRange from: #[42] to: #[42])).
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeOverlaps12 [
	self assert: ((PSRange from: #[42] to: #[42]) overlaps: (PSRange from: #[42 42] to: #[42 42])).
	self assert: ((PSRange from: #[42 42] to: #[42 42]) overlaps: (PSRange from: #[42] to: #[42])).
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeOverlaps2 [
	self assert: ((PSRange from: #[42 42] to: #[42 42]) overlaps: (PSRange from: #[42 42] to: #[42 42])).
	self assert: ((PSRange from: #[42 0] to: #[42 42]) overlaps: (PSRange from: #[42 42] to: #[42 255])).
	self assert: ((PSRange from: #[0 42] to: #[42 42]) overlaps: (PSRange from: #[42 42] to: #[255 42])).
	self assert: ((PSRange from: #[42 0] to: #[42 255]) overlaps: (PSRange from: #[42 0] to: #[42 255])).
	self assert: ((PSRange from: #[0 42] to: #[255 42]) overlaps: (PSRange from: #[0 42] to: #[255 42])).
	self assert: ((PSRange from: #[42 0] to: #[42 255]) overlaps: (PSRange from: #[42 42] to: #[42 42])).
	self assert: ((PSRange from: #[0 42] to: #[255 42]) overlaps: (PSRange from: #[42 42] to: #[42 42])).
	self assert: ((PSRange from: #[42 42] to: #[42 42]) overlaps: (PSRange from: #[42 0] to: #[42 255])).
	self assert: ((PSRange from: #[42 42] to: #[42 42]) overlaps: (PSRange from: #[0 42] to: #[255 42])).
	self deny: ((PSRange from: #[42 0] to: #[42 42]) overlaps: (PSRange from: #[42 43] to: #[42 255])).
	self deny: ((PSRange from: #[0 42] to: #[42 42]) overlaps: (PSRange from: #[43 42] to: #[255 42])).
	self deny: ((PSRange from: #[42 42] to: #[42 42]) overlaps: (PSRange from: #[42 43] to: #[42 43])).
	self deny: ((PSRange from: #[42 43] to: #[42 43]) overlaps: (PSRange from: #[42 42] to: #[42 42])).
]

{ #category : #'testing order' }
PSCMapTests >> testRangeSmallerThanCode [
	self assert: ((PSCode bytes: #[0]) to: (PSCode bytes: #[200])) <= (PSCode bytes: #[255]).
	self assert: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[42]).
	self assert: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[43]).
	self assert: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[255]).
	self assert: ((PSCode bytes: #[40 0]) to: (PSCode bytes: #[42 255])) <= (PSCode bytes: #[43]).
	self deny: ((PSCode bytes: #[40 0]) to: (PSCode bytes: #[42 255])) <= (PSCode bytes: #[40]).
	self deny: ((PSCode bytes: #[40]) to: (PSCode bytes: #[255])) <= (PSCode bytes: #[0]).
	self deny: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[39]).
	self deny: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[39 255]).
	self deny: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[0]).
	self deny: ((PSCode bytes: #[40]) to: (PSCode bytes: #[42])) <= (PSCode bytes: #[0 255]).
]

{ #category : #'testing ranges' }
PSCMapTests >> testRangeWith [
	self assert: ((PSCode bytes: #[48]) --> 48 rangeWith: (PSCode bytes: #[49]) --> 49) = (((PSCode bytes: #[48]) to: (PSCode bytes: #[49])) --> 48).
	self assert: (((PSCode bytes: #[48]) to: (PSCode bytes: #[49])) --> 48 rangeWith: (PSCode bytes: #[50]) --> 50) = (((PSCode bytes: #[48]) to: (PSCode bytes: #[50])) --> 48).
	self assert: (((PSCode bytes: #[48]) to: (PSCode bytes: #[50])) --> 48 rangeWith: ((PSCode bytes: #[51]) to: (PSCode bytes: #[54])) --> 51) = (((PSCode bytes: #[48]) to: (PSCode bytes: #[54])) --> 48)
]

{ #category : #'testing order' }
PSCMapTests >> testSmaller [
	self assert: (PSCode bytes: #[0]) < (PSCode bytes: #[255]).
	self deny: (PSCode bytes: #[42]) < (PSCode bytes: #[42]).
	self assert: (PSCode bytes: #[42]) < (PSCode bytes: #[43]).
	self assert: (PSCode bytes: #[42]) < (PSCode bytes: #[255]).
	self deny: (PSCode bytes: #[255]) < (PSCode bytes: #[0]).
	self deny: (PSCode bytes: #[42]) < (PSCode bytes: #[41]).
	self deny: (PSCode bytes: #[42]) < (PSCode bytes: #[0]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmaller2 [
	self assert: (PSCode bytes: #[0 0]) < (PSCode bytes: #[255 255]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[42 42]).
	self assert: (PSCode bytes: #[42 42]) < (PSCode bytes: #[43 43]).
	self assert: (PSCode bytes: #[42 42]) < (PSCode bytes: #[42 43]).
	self assert: (PSCode bytes: #[42 42]) < (PSCode bytes: #[43 42]).
	self assert: (PSCode bytes: #[0 42]) < (PSCode bytes: #[255 42]).
	self assert: (PSCode bytes: #[0 42]) < (PSCode bytes: #[255 255]).
	self deny: (PSCode bytes: #[255 255]) < (PSCode bytes: #[0 0]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[41 41]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[41 42]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[42 41]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[0 42]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[0 255]).
	self assert: (PSCode bytes: #[42 42]) < (PSCode bytes: #[255 0]).
	self deny: (PSCode bytes: #[42 42]) < (PSCode bytes: #[0 0]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmaller3 [
	self assert: (PSCode bytes: #[0 0 0]) < (PSCode bytes: #[255 255 255]).
	self deny: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[42 42 42]).
	self assert: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[42 42 43]).
	self assert: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[42 43 42]).
	self assert: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[43 42 42]).
	self deny: (PSCode bytes: #[255 255 255]) < (PSCode bytes: #[0 0 0]).
	self deny: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[42 42 41]).
	self deny: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[42 41 42]).
	self deny: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[41 42 42]).
	self deny: (PSCode bytes: #[42 42 42]) < (PSCode bytes: #[41 41 41]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmaller4 [
	self assert: (PSCode bytes: #[0 0 0 0]) < (PSCode bytes: #[255 255 255 255]).
	self deny: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 42 42 42]).
	self assert: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 42 42 43]).
	self assert: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 42 43 42]).
	self assert: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 43 42 42]).
	self assert: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[43 42 42 42]).
	self deny: (PSCode bytes: #[255 255 255 255]) < (PSCode bytes: #[0 0 0 0]).
	self deny: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 42 42 41]).
	self deny: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 42 41 42]).
	self deny: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[42 41 42 42]).
	self deny: (PSCode bytes: #[42 42 42 42]) < (PSCode bytes: #[41 42 42 42]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmallerDifferentLength [
	self assert: (PSCode bytes: #[]) < (PSCode bytes: #[42]).
	self assert: (PSCode bytes: #[0 42]) < (PSCode bytes: #[42]).
	self assert: (PSCode bytes: #[42]) < (PSCode bytes: #[42 0]).
	self assert: (PSCode bytes: #[0 42]) < (PSCode bytes: #[42 65 74])
]

{ #category : #'testing order' }
PSCMapTests >> testSmallerThan [
	self assert: (PSCode bytes: #[0]) <= (PSCode bytes: #[255]).
	self assert: (PSCode bytes: #[42]) <= (PSCode bytes: #[42]).
	self assert: (PSCode bytes: #[42]) <= (PSCode bytes: #[43]).
	self assert: (PSCode bytes: #[42]) <= (PSCode bytes: #[255]).
	self deny: (PSCode bytes: #[255]) <= (PSCode bytes: #[0]).
	self deny: (PSCode bytes: #[42]) <= (PSCode bytes: #[41]).
	self deny: (PSCode bytes: #[42]) <= (PSCode bytes: #[0]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmallerThan2 [
	self assert: (PSCode bytes: #[0 0]) <= (PSCode bytes: #[255 255]).
	self assert: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[42 42]).
	self assert: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[43 43]).
	self assert: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[42 43]).
	self assert: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[43 42]).
	self assert: (PSCode bytes: #[0 42]) <= (PSCode bytes: #[255 42]).
	self assert: (PSCode bytes: #[0 42]) <= (PSCode bytes: #[255 255]).
	self deny: (PSCode bytes: #[255 255]) <= (PSCode bytes: #[0 0]).
	self deny: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[41 41]).
	self deny: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[41 42]).
	self deny: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[42 41]).
	self deny: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[0 42]).
	self deny: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[0 255]).
	self assert: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[255 0]).
	self deny: (PSCode bytes: #[42 42]) <= (PSCode bytes: #[0 0]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmallerThan3 [
	self assert: (PSCode bytes: #[0 0 0]) <= (PSCode bytes: #[255 255 255]).
	self assert: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[42 42 42]).
	self assert: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[42 42 43]).
	self assert: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[42 43 42]).
	self assert: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[43 42 42]).
	self deny: (PSCode bytes: #[255 255 255]) <= (PSCode bytes: #[0 0 0]).
	self deny: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[42 42 41]).
	self deny: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[42 41 42]).
	self deny: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[41 42 42]).
	self deny: (PSCode bytes: #[42 42 42]) <= (PSCode bytes: #[41 41 41]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmallerThan4 [
	self assert: (PSCode bytes: #[0 0 0 0]) <= (PSCode bytes: #[255 255 255 255]).
	self assert: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 42 42 42]).
	self assert: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 42 42 43]).
	self assert: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 42 43 42]).
	self assert: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 43 42 42]).
	self assert: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[43 42 42 42]).
	self deny: (PSCode bytes: #[255 255 255 255]) <= (PSCode bytes: #[0 0 0 0]).
	self deny: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 42 42 41]).
	self deny: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 42 41 42]).
	self deny: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[42 41 42 42]).
	self deny: (PSCode bytes: #[42 42 42 42]) <= (PSCode bytes: #[41 42 42 42]).
]

{ #category : #'testing order' }
PSCMapTests >> testSmallerThanDifferentLength [
	self assert: (PSCode bytes: #[]) <= (PSCode bytes: #[42]).
	self assert: (PSCode bytes: #[0 42]) <= (PSCode bytes: #[42]).
	self assert: (PSCode bytes: #[42]) <= (PSCode bytes: #[42 0]).
	self assert: (PSCode bytes: #[0 42]) <= (PSCode bytes: #[42 65 74])
]

"
Tests for the behavior of OrderedDictionary as Dictionary and as Value
"
Class {
	#name : #ValuemapTest,
	#superclass : #TestCase,
	#category : #'Values-Testing'
}

{ #category : #Testing }
ValuemapTest >> testAdding [
	| od od1 |
	od := Valuemap new.
	self assert: od isEmpty.
	od add: #foo -> 'bar'.
	self assert: od size = 1.
	self assert: (od atIndex: 1) = (#foo -> 'bar').
	self assert: (od at: #foo) = 'bar'.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: (od atIndex: 2) = (#baz -> 'xxx').
	self assert: (od at: #baz) = 'xxx'.
	od1 := Valuemap new.
	od1 add: #foo -> 'baz'.
	od1 at: #baz put: 'yyy'.
	od addAll: od1.
	self assert: od size = 2.
	self assert: (od at: #foo) = 'baz'.
	self assert: (od at: #baz) = 'yyy'.
]

{ #category : #Testing }
ValuemapTest >> testAddingWithGrowth [
	"add iteratively elements, so that the dictionary must grow"

	| letters od od1 |
	letters := #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).
	od := Valuemap new.
	self shouldnt: [letters do: [:symbol | od add: symbol -> symbol asString]] raise: Error.
	self assert: od keys asArray = #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).
	od1 := Valuemap new.
	self shouldnt: [letters do: [:symbol | od1 at: symbol put: symbol asString]] raise: Error.
	self assert: od1 keys asArray = #(#a #b #c #d #e #f #g #h #i #j #k #l #m #n #o #p #q #r #s #t #u #v #w #x #y #z).
]

{ #category : #Testing }
ValuemapTest >> testComparing [
	self assert: (Valuemap with: #foo -> 'bar') = (Valuemap with: #foo -> 'bar').
	self deny: (Valuemap with: #foo -> 'bar') == (Valuemap with: #foo -> 'bar').
	self deny: (Valuemap with: #foo -> 'bar') = (Dictionary with: #foo -> 'bar').
	self deny: (Dictionary with: #foo -> 'bar') = (Valuemap with: #foo -> 'bar').
	self assert: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bar' with: $a -> 123).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: $a -> 123 with: #foo -> 'bar' ).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 123 with: $a -> 'bar' ).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bar' with: $a -> 1234).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bars' with: $a -> 123).
	self deny: (Valuemap with: #foo -> 'bar' with: $a -> 123) = (Valuemap with: #foo -> 'bar' with: $a -> 123 with: '' -> 0).
]

{ #category : #Testing }
ValuemapTest >> testDescribeAndReadBackNew [
	| inst |
	inst := Valuemap new.
	self assert: inst asDescription = (Object compiler evaluate: inst asSource) asDescription
]

{ #category : #Testing }
ValuemapTest >> testEnumeration [
	| od keys |
	od := Valuemap new.
	od add: #foo -> 'bar'.
	od at: #baz put: 'xxx'.
	od associationsDo: [:assoc |
		self assert: (assoc isKindOf: Association).
		self assert: assoc key isSymbol.
		self assert: assoc value isString].
	self assert: od keys asArray = #(#foo #baz).
	self assert: od values asArray = #('bar' 'xxx').
	keys := OrderedCollection new.
	od keysDo: [:k | keys add: k].
	self assert: keys asArray = #(#foo #baz).
]

{ #category : #Testing }
ValuemapTest >> testExampleSource [
	self assert: Valuemap example asSource = 
'((Valuemap new: 17)
	add: #title -> ''Valuemap class example with examples of all basic values'';
	add: #boolean -> true;
	add: #character -> $A;
	add: #symbol -> #mySymbol;
	add: #string -> ''with umlauts and euro: äöüß€'';
	add: #schlüssel -> nil;
	add: #integer -> 42;
	add: #number -> 3.14;
	add: #date -> (Date d: 27 m: 3 y: 2022);
	add: #time -> (Time h: 12 m: 18);
	add: #timestamp -> (Timestamp d: 27 m: 3 y: 2022 h: 12 m: 18);
	add: #duration -> (Duration nanoseconds: 300000000000);
	add: #color -> (ColorValue fromBytesRed: 127 green: 0 blue: 0);
	add: #knownColor -> ColorValue red;
	add: #array -> #(#one ''two'' 3);
	add: #bytearray -> #[1 2 3];
	add: #valuemap -> (Valuemap
		with: #test -> true
		with: #two -> 2
		with: #none -> nil);
	yourself)'
]

{ #category : #Testing }
ValuemapTest >> testIndexOf [
	| od |
	od := Valuemap new.
	self assert: od isEmpty.
	self assert: (od indexOf: #foo) isZero.
	od add: #foo -> 'bar'.
	self assert: od size = 1.
	self assert: (od indexOf: #foo) = 1.
	self assert: (od indexOf: #baz) isZero.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: (od indexOf: #baz) = 2.
]

{ #category : #Testing }
ValuemapTest >> testIndexedAccess [
	| od |
	od := Valuemap new.
	od add: #foo -> 'bar'.
	self assert: od size = 1.
	self assert: (od atIndex: 1) = (#foo -> 'bar').
	self should: [od atIndex: 0] raise: Error.
	self should: [od atIndex: 2] raise: Error.
	self should: [od atIndex: #key] raise: Error.
	self should: [od atIndex: '1'] raise: Error.
]

{ #category : #Testing }
ValuemapTest >> testKeyedAccess [
	| od |
	od := Valuemap new.
	od add: #foo -> 'bar'.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: (od at: #foo) = 'bar'.
	self assert: (od at: #baz) = 'xxx'.
	self should: [od at: #bar] raise: KeyNotFound.
	self assert: (od at: #bar ifAbsent: [nil]) isNil.
]

{ #category : #Testing }
ValuemapTest >> testReadBackAllTestInstances [
	(Valuemap class organization listAtCategoryNamed: (Valuemap class whichCategoryIncludesSelector: #example)) do: [:sel |
		| inst readInst |
		inst := Valuemap perform: sel.
		self shouldnt: [readInst := Object compiler evaluate: inst asSource] raise: Error.
		self assert: inst asSource = readInst asSource]
]

{ #category : #Testing }
ValuemapTest >> testRemoving [
	| od |
	od := Valuemap new.
	self assert: od isEmpty.
	self should: [od removeKey: #foo] raise: KeyNotFound.
	self shouldnt: [od removeKey: #foo ifAbsent: nil] raise: KeyNotFound.
	self assert: (od removeKey: #foo ifAbsent: nil) isNil.
	od add: #foo -> 'bar'.
	self assert: od size = 1.
	self assert: od keys asArray = #(#foo).
	self assert: (od removeKey: #foo) = 'bar'.
	self assert: od size = 0.
	self assert: od keys asArray = #().
	od add: #foo -> 'bar'.
	od at: #baz put: 'xxx'.
	self assert: od size = 2.
	self assert: od keys asArray = #(#foo #baz).
	self should: [od removeKey: #zzz] raise: KeyNotFound.
	self shouldnt: [od removeKey: #zzz ifAbsent: nil] raise: KeyNotFound.
	self assert: od size = 2.
	self assert: od keys asArray = #(#foo #baz).
	self assert: (od removeKey: #foo) = 'bar'.
	self assert: od size = 1.
	self assert: od keys asArray = #(#baz)
]

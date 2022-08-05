Class {
	#name : #PtSimpleObjectTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtSimpleObjectTests >> testArrayRead [
	self assert: (PtFile readTesterOn: '[]') readObject = #() asPDF.
	self assert: (PtFile readTesterOn: '[ 	
]') readObject = (#() asPDF).
	self assert: (PtFile readTesterOn: '[ 549 3.14 ( Ralph ) /SomeName ]') readObject = (Array
		with: 549
		with: 3.14
		with: ' Ralph '
		with: #SomeName) asPDF.
	self assert: (PtFile readTesterOn: '[ 549 3.14 ( Ralph ) /SomeName ]') readObject = #(549 3.14 ' Ralph ' #SomeName) asPDF.
	self assert: (PtFile readTesterOn: '[ 3.14 false ( Ralph ) << /a 549 /b 3.14 /c ( Ralph ) /SomeName true>> ]') readObject = (Array
		with: 3.14
		with: false
		with: ' Ralph '
		with: (PtPDF Dictionary
			with: #a -> 549
			with: #b -> 3.14
			with: #c -> ' Ralph '
			with: #SomeName -> true)) asPDF
]

{ #category : #tests }
PtSimpleObjectTests >> testArrayReadErrors [
	self should: [(PtFile readTesterOn: '[') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '[') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'End of Array (]) expected'].
	self should: [(PtFile readTesterOn: '[ %abc') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '[ %abc') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'End of Array (]) expected'].
	self should: [(PtFile readTesterOn: '[ [] %abc') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '[ [] %abc') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'End of Array (]) expected']
]

{ #category : #tests }
PtSimpleObjectTests >> testArrayReadNested [
	self assert: (PtFile readTesterOn: '[[]]') readObject = (Array with: #()) asPDF.
	self assert: (PtFile readTesterOn: '[ 	[]
]') readObject = (Array with: #()) asPDF.
	self assert: (PtFile readTesterOn: '[ 549 3.14 ( Ralph ) [/SomeName] ]') readObject = (Array
		with: 549
		with: 3.14
		with: ' Ralph '
		with: (Array with: #SomeName)) asPDF.
	self assert: (PtFile readTesterOn: '[ 3.14 [false [( Ralph )]] /SomeName ]') readObject = (Array
		with: 3.14
		with: (Array
			with: false
			with: (Array with: ' Ralph '))
		with: #SomeName) asPDF.
	self assert: (PtFile readTesterOn: '[ 3.14 [false [( Ralph )]] /SomeName ]') readObject = (Array
		with: 3.14
		with: (Array
			with: false
			with: #(' Ralph '))
		with: #SomeName) asPDF.
	self assert: (PtFile readTesterOn: '[ 3.14 [false [( Ralph )]] /SomeName ]') readObject = (Array
		with: 3.14
		with: #(false #(' Ralph '))
		with: #SomeName) asPDF.
	self assert: (PtFile readTesterOn: '[ 3.14 [false [( Ralph )]] /SomeName ]') readObject = #(3.14 #(false #(' Ralph ')) #SomeName) asPDF
]

{ #category : #tests }
PtSimpleObjectTests >> testArrayWrite [
	self assert: PtPDF Array example pdfSource = '[549 3.14 false (Ralph) /SomeName]'.
	self assert: (PtFile readTesterOn: PtPDF Array example pdfSource) readObject = PtPDF Array example
]

{ #category : #tests }
PtSimpleObjectTests >> testBooleanRead [
	| file first second |
	self assert: (PtFile readTesterOn: ' true ') readObject = true.
	self assert: (PtFile readTesterOn: ' false ') readObject = false.
	file := PtFile readTesterOn: '/name false%with a comment'.
	first := file readObject.
	second := file readObject.
	self assert: first = #name asPDF.
	self assert: second = false.
	self assert: file readObject isNil
]

{ #category : #tests }
PtSimpleObjectTests >> testBooleanWrite [
	self assert: true asPDF pdfSource = 'true'.
	self assert: false asPDF pdfSource = 'false'
]

{ #category : #tests }
PtSimpleObjectTests >> testConvertChars [
	0 to: 255 do: [:i | self assert: i asCharacter asInteger = i]
]

{ #category : #tests }
PtSimpleObjectTests >> testDate [
	self assert: ((PtFile readTesterOn: '(D:199812231952-08''00)') readObject isKindOf: (PtPDF classAt: #Date)).
	self assert: ((PtFile readTesterOn: '(D:199812231952-08''00)') readObject asSmalltalkValue isKindOf: Timestamp).
	self assert: (PtFile readTesterOn: '(D:199812231952-08''00)') readObject asSmalltalkValue = (TimeZone default universalToLocal: (Timestamp d: 24 m: 12 y: 1998 h: 3 m: 52)).
	self assert: (PtFile readTesterOn: '(D:199812231952-08''00)') readObject asUTC = (PtFile readTesterOn: '(D:19981224045200+01'')') readObject asUTC
]

{ #category : #tests }
PtSimpleObjectTests >> testDictionaryAccess [
	| dict |
	dict := PtPDF Dictionary example.
	self assert: (dict at: #Type) = #Example asPDF.
	self should: [dict Type] raise: MessageNotUnderstood.
	self should: [dict at: 'Null'] raise: KeyNotFound.
	self assert: (dict at: #Type ifAbsent: [nil]) = #Example asPDF.
	self shouldnt: [dict at: #Null put: #Null] raise: PtError.
	self assert: (dict at: #Null) = #Null asPDF.
	self should: [dict at: 'Null' put: 'Null'] raise: PtError.
	[dict at: 'Null' put: 'Null'] on: PtError do: [:ex |
		self assert: ex description = 'PDF dictionaries use only symbols as keys'].
	self shouldnt: [dict at: #Null put: nil] raise: PtError.
	self should: [dict at: #Null] raise: KeyNotFound.
	self assert: (dict at: #Null ifAbsent: [nil]) isNil.
	self shouldnt: [dict at: #Null put: nil] raise: PtError.
	self should: [dict at: #Null] raise: KeyNotFound.
	self assert: (dict at: #Null ifAbsent: [nil]) isNil
]

{ #category : #tests }
PtSimpleObjectTests >> testDictionaryRead [
	self assert: (PtFile readTesterOn: '<<>>') readObject = PtPDF Dictionary new.
	self assert: (PtFile readTesterOn: '<< 	
>>') readObject = PtPDF Dictionary new.
	self assert: (PtFile readTesterOn: '<< /a 549 /b 3.14 /c ( Ralph ) /SomeName true>>') readObject = (PtPDF Dictionary
		with: #a -> 549
		with: #b -> 3.14
		with: #c -> ' Ralph '
		with: #SomeName -> true).
	self assert: (PtFile readTesterOn: '<< / 3.14 /x#20y false /Name ( Ralph ) /A [/SomeName] >>') readObject = (PtPDF Dictionary
		with: #'' -> 3.14
		with: #'x y' -> false
		with: #Name -> ' Ralph '
		with: #A -> (Array with: #SomeName) asPDF)
]

{ #category : #tests }
PtSimpleObjectTests >> testDictionaryReadErrors [
	self should: [(PtFile readTesterOn: '<<') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<<') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read nil but $/ or $> expected'].
	self should: [(PtFile readTesterOn: '<</a 549') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<</a 549') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read nil but $/ or $> expected'].
	self should: [(PtFile readTesterOn: '<<true 549') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<<true 549') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read $t but $/ or $> expected'].
	self should: [(PtFile readTesterOn: '<<1 549') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<<1 549') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read $1 but $/ or $> expected'].
	self should: [(PtFile readTesterOn: '<</a ') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<</a ') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read nil but $/ or $> expected'].
	self should: [(PtFile readTesterOn: '<</a <<>>') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<</a <<>>') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read nil but $/ or $> expected']
]

{ #category : #tests }
PtSimpleObjectTests >> testDictionaryReadNested [
	self assert: (PtFile readTesterOn: '<</<<>>>>') readObject = (PtPDF Dictionary with: #'' -> PtPDF Dictionary new).
	self assert: (PtFile readTesterOn: '<< 	/  <<		>>
>>') readObject = (PtPDF Dictionary with: #'' -> PtPDF Dictionary new).
	self assert: (PtFile readTesterOn: '<< /a 549 /dict <</b 3.14 /c ( Ralph )>> /SomeName true>>') readObject = (PtPDF Dictionary
		with: #a -> 549
		with: #dict -> (PtPDF Dictionary
			with: #b -> 3.14
			with: #c -> ' Ralph ')
		with: #SomeName -> true)
]

{ #category : #tests }
PtSimpleObjectTests >> testDictionaryWrite [
	self assert: PtPDF Dictionary example pdfSource = '<<	/Type /Example
	/Subtype /DictionaryExample
	/Version 0.01
	/IntegerItem 12
	/StringItem (a string)
	/Subdictionary <<
		/Item1 0.4
		/Item2 true
		/LastItem (not !)
		/VeryLastItem (OK)	>>	>>' withLf.
	self assert: (PtFile readTesterOn: PtPDF Dictionary example pdfSource) readObject = PtPDF Dictionary example
]

{ #category : #tests }
PtSimpleObjectTests >> testHeaderRead [
	self assert: (PtFile readTesterOn: '%PDF-1.2') parser readHeaderVersion = PtVersion pdf1_2.
	self assert: (PtFile readTesterOn: '%PDF-1.7') parser readHeaderVersion = PtVersion pdf1_7.
	self assert: (PtFile readTesterOn: '%PDF-1.0') parser readHeaderVersion = PtVersion pdf1_0.
	self assert: (PtFile readTesterOn: '%PDF-2.0') parser readHeaderVersion = PtVersion pdf2_0.
	self assert: (PtFile readTesterOn: '%PDF-1.12345') parser readHeaderVersion = (PtVersion major: 1 minor: 12345).
	self assert: (PtFile readTesterOn: '%PDF-1.2
 %âãÏÓ') parser readHeaderVersion = PtVersion pdf1_2
]

{ #category : #tests }
PtSimpleObjectTests >> testHeaderReadErrors [
	self should: [(PtFile readTesterOn: '%%PDF-1.0') parser readHeaderVersion] raise: PtReadError.
	[(PtFile readTesterOn: '%%PDF-1.0') parser readHeaderVersion] on: PtReadError do: [:ex |
		self assert: ex description = '"%%PDF" is no PDF header! "%PDF-" expected.'].
	self should: [(PtFile readTesterOn: 'PDF-1.0') parser readHeaderVersion] raise: PtReadError.
	[(PtFile readTesterOn: 'PDF-1.0') parser readHeaderVersion] on: PtReadError do: [:ex |
		self assert: ex description = '"PDF-1" is no PDF header! "%PDF-" expected.']
]

{ #category : #tests }
PtSimpleObjectTests >> testHeaderVersion [
	self assert: PtHeader example pdfVersion = PtVersion pdf1_0.
	self assert: PtHeader example version = PtVersion pdf1_7.
	self assert: PtHeader example version pdfSource = 'PDF-1.7'.
]

{ #category : #tests }
PtSimpleObjectTests >> testHeaderWrite [
	self assert: PtHeader example pdfSource = '%PDF-1.7'.
	self assert: (PtHeader version: (PtVersion major: 1 minor: 12345)) pdfSource = '%PDF-1.12345'.
]

{ #category : #tests }
PtSimpleObjectTests >> testNameLimits [
	self shouldnt: [#abcdefghijklmnopqrstuvwxyz asPDF] raise: PtError.
	self shouldnt: [(String new: 127 withAll: $X) asSymbol asPDF] raise: PtError.
	self should: [(String new: 128 withAll: $X) asSymbol asPDF] raise: PtError
]

{ #category : #tests }
PtSimpleObjectTests >> testNameRead [
	self assert: (PtFile readTesterOn: '/ /Name1') readObject = #'' asPDF.
	self assert: (PtFile readTesterOn: '/Name1') readObject = #Name1 asPDF.
	self assert: (PtFile readTesterOn: '/ASomewhatLongerName') readObject = #ASomewhatLongerName asPDF.
	self assert: (PtFile readTesterOn: '/A;Name_With-Various***Characters?') readObject = #'A;Name_With-Various***Characters?' asPDF.
	self assert: (PtFile readTesterOn: '/1.2') readObject = #'1.2' asPDF.
	self assert: (PtFile readTesterOn: '/$$') readObject = #'$$' asPDF.
	self assert: (PtFile readTesterOn: '/@pattern') readObject = #'@pattern' asPDF.
	self assert: (PtFile readTesterOn: '/.notdef') readObject = #'.notdef' asPDF.
	self assert: (PtFile readTesterOn: '/lime#20Green') readObject = #'lime Green' asPDF.
	self assert: (PtFile readTesterOn: '/paired#28#29parentheses') readObject = #'paired()parentheses' asPDF.
	self assert: (PtFile readTesterOn: '/The_Key_of_F#23_Minor') readObject = #'The_Key_of_F#_Minor' asPDF.
	self assert: (PtFile readTesterOn: '/A#42') readObject = #AB asPDF
]

{ #category : #tests }
PtSimpleObjectTests >> testNameReadValues [
	self assert: (PtFile readTesterOn: '/') readObject asSmalltalkValue = #''.
	self assert: (PtFile readTesterOn: '/Name1') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/Name1 ') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/Name1]') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/Name1%') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/Name1(') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/Name1 /anotherName') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/Name1
/anotherName') readObject asSmalltalkValue = #Name1.
	self assert: (PtFile readTesterOn: '/ASomewhatLongerName') readObject asSmalltalkValue = #ASomewhatLongerName.
	self assert: (PtFile readTesterOn: '/A;Name_With-Various***Characters?') readObject asSmalltalkValue = #'A;Name_With-Various***Characters?'.
	self assert: (PtFile readTesterOn: '/1.2') readObject asSmalltalkValue = #'1.2'.
	self assert: (PtFile readTesterOn: '/$$') readObject asSmalltalkValue = #'$$'.
	self assert: (PtFile readTesterOn: '/@pattern') readObject asSmalltalkValue = #'@pattern'.
	self assert: (PtFile readTesterOn: '/.notdef') readObject asSmalltalkValue = #'.notdef'.
	self assert: (PtFile readTesterOn: '/lime#20Green') readObject asSmalltalkValue = #'lime Green'.
	self assert: (PtFile readTesterOn: '/paired#28#29parentheses') readObject asSmalltalkValue = #'paired()parentheses'.
	self assert: (PtFile readTesterOn: '/The_Key_of_F#23_Minor') readObject asSmalltalkValue = #'The_Key_of_F#_Minor'.
	self assert: (PtFile readTesterOn: '/A#42') readObject asSmalltalkValue = #AB
]

{ #category : #tests }
PtSimpleObjectTests >> testNameVersion [
	self assert: (PtFile readTesterOn: '/Name1') readObject pdfVersion = PtVersion pdf1_0.
	self assert: (PtFile readTesterOn: '/Name#A8') readObject pdfVersion = PtVersion pdf1_2.
	self assert: (PtFile readTesterOn: '123') readObject pdfVersion = PtVersion pdf1_0.
	self assert: (PtFile readTesterOn: '( This is a string )') readObject pdfVersion = PtVersion pdf1_0
]

{ #category : #tests }
PtSimpleObjectTests >> testNameWrite [
	self assert: #'' asPDF pdfSource = '/'.
	self assert: #Name1 asPDF pdfSource = '/Name1'.
	self assert: #ASomewhatLongerName asPDF pdfSource = '/ASomewhatLongerName'.
	self assert: #'A;Name_With-Various***Characters?' asPDF pdfSource = '/A;Name_With-Various***Characters?'.
	self assert: #'1.2' asPDF pdfSource = '/1.2'.
	self assert: #'$$' asPDF pdfSource = '/$$'.
	self assert: #'@pattern' asPDF pdfSource = '/@pattern'.
	self assert: #'.notdef' asPDF pdfSource = '/.notdef'.
	self assert: #'lime Green' asPDF pdfSource = '/lime#20Green'.
	self assert: #'paired()parentheses' asPDF pdfSource = '/paired#28#29parentheses'.
	self assert: #'The_Key_of_F#_Minor' asPDF pdfSource = '/The_Key_of_F#23_Minor'.
	self assert: #AB asPDF pdfSource = '/AB'.
	self assert: #'A B' asPDF pdfSource = '/A#20B'
]

{ #category : #tests }
PtSimpleObjectTests >> testNullRead [
	| file first second |
	self assert: (PtFile readTesterOn: ' null ') readObject = nil.
	self assert: (PtFile readTesterOn: 'null%with a comment') readObject = nil.
	file := PtFile readTesterOn: '/name null%with a comment'.
	first := file readObject.
	second := file readObject.
	self assert: first = #name asPDF.
	self assert: second = nil.
	self assert: file readObject isNil
]

{ #category : #tests }
PtSimpleObjectTests >> testNullWrite [
	self assert: nil pdfSource = 'null'
]

{ #category : #tests }
PtSimpleObjectTests >> testNumberRead [
	self assert: (PtFile readTesterOn: '123') readObject = 123 asPDF.
	self assert: (PtFile readTesterOn: ' 	123 	') readObject = 123 asPDF.
	self assert: (PtFile readTesterOn: '43445') readObject = 43445 asPDF.
	self assert: (PtFile readTesterOn: '+17') readObject = 17 asPDF.
	self assert: (PtFile readTesterOn: '-98') readObject = -98 asPDF.
	self assert: (PtFile readTesterOn: '0') readObject = 0 asPDF.
	self assert: (PtFile readTesterOn: '34.5') readObject = 34.5 asPDF.
	self assert: (PtFile readTesterOn: '-3.62') readObject = -3.62 asPDF.
	self assert: (PtFile readTesterOn: '+123.6') readObject = 123.6 asPDF.
	self assert: (PtFile readTesterOn: '4.') readObject printString = '4'.
	self assert: (PtFile readTesterOn: '-.002') readObject = -0.002 asPDF.
	self assert: (PtFile readTesterOn: '0.0') readObject = 0 asPDF.
	self assert: (PtFile readTesterOn: '-0.0') readObject = 0 asPDF.
	self assert: (PtFile readTesterOn: '0.0000012345') readObject printString = '0'.
	self deny: (PtFile readTesterOn: '0.0000012345') readObject = 0 asPDF.
	self assert: (PtFile readTesterOn: '0.0000012345') readObject content = 1.2345e-6.
]

{ #category : #tests }
PtSimpleObjectTests >> testNumberWrite [
	self assert: 123 asPDF pdfSource = '123'.
	self assert: 43445 asPDF pdfSource = '43445'.
	self assert: 17 asPDF pdfSource = '17'.
	self assert: -98 asPDF pdfSource = '-98'.
	self assert: 0 asPDF pdfSource = '0'.
	self assert: 0 negated asPDF pdfSource = '0'.
	self assert: 34.5 asPDF pdfSource = '34.5'.
	self assert: -3.62 asPDF pdfSource = '-3.62'.
	self assert: 123.6 asPDF pdfSource = '123.6'.
	self assert: 4 asPDF pdfSource = '4'.
	self assert: -0.002 asPDF pdfSource = '-0.002'.
	self assert: 0.123456789 asPDF pdfSource = '0.12346'.
	self assert: 0.00000123 asPDF pdfSource = '0'.
	self assert: (55 - 0.000005) asPDF pdfSource = '55'.
	self assert: (55 - 0.00000191) asPDF pdfSource = '55'.
	self assert: (55 - 0.00001) asPDF pdfSource = '54.99999'.
	self assert: (55 + 0.00001) asPDF pdfSource = '55.00001'.
	self assert: (55 + 0.000001) asPDF pdfSource = '55'.
]

{ #category : #tests }
PtSimpleObjectTests >> testRead [
	self assert: (PtFile readTesterOn: ' null ') readObject = nil.
	self assert: (PtFile readTesterOn: ' true ') readObject = true.
	self assert: (PtFile readTesterOn: ' false ') readObject = false.
	self assert: (PtFile readTesterOn: '123') readObject = (PtNumber on: 123).
	self assert: (PtFile readTesterOn: '123') readObject = 123 asPDF.
	self assert: (PtFile readTesterOn: '43445') readObject = 43445 asPDF.
	self assert: (PtFile readTesterOn: '+17') readObject = 17 asPDF.
	self assert: (PtFile readTesterOn: '-98') readObject = -98 asPDF.
	self assert: (PtFile readTesterOn: '0') readObject = 0 asPDF.
	self assert: (PtFile readTesterOn: '34.5') readObject = 34.5 asPDF.
	self assert: (PtFile readTesterOn: '-3.62') readObject = -3.62 asPDF.
	self assert: (PtFile readTesterOn: '+123.6') readObject = 123.6 asPDF.
	self assert: (PtFile readTesterOn: '4.') readObject printString = '4'.
	self assert: (PtFile readTesterOn: '-.002') readObject = -0.002 asPDF.
	self assert: (PtFile readTesterOn: '0.0') readObject = 0 asPDF.
	self assert: (PtFile readTesterOn: '/') readObject = #'' asPDF.
	self assert: (PtFile readTesterOn: '/Name1') readObject = #Name1 asPDF.
	self assert: (PtFile readTesterOn: '  /Name1 ') readObject = #Name1 asPDF.
	self assert: (PtFile readTesterOn: '/Name1]') readObject = #Name1 asPDF.
	self assert: (PtFile readTesterOn: '/A;Name_With-Various***Characters?') readObject = #'A;Name_With-Various***Characters?' asPDF.
	self assert: (PtFile readTesterOn: '/1.2') readObject = #'1.2' asPDF.
	self assert: (PtFile readTesterOn: '/$$') readObject = #'$$' asPDF.
	self assert: (PtFile readTesterOn: '/@pattern') readObject = #'@pattern' asPDF.
	self assert: (PtFile readTesterOn: '/.notdef') readObject = #'.notdef' asPDF.
	self assert: (PtFile readTesterOn: '/lime#20Green') readObject = #'lime Green' asPDF.
	self assert: (PtFile readTesterOn: '/A#42') readObject = #AB asPDF.
	self assert: (PtFile readTesterOn: '( This is a string )') readObject = ' This is a string ' asPDF.
	self assert: (PtFile readTesterOn: '(Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ) .)') readObject = 'Strings may contain balanced parentheses ( ) and
special characters ( * ! & } ^ % and so on ) .' asPDF.
	self assert: (PtFile readTesterOn: '()') readObject = String new asPDF.
	self assert: (PtFile readTesterOn: '(Unbalanced parenthesis \(...\)\) quoted.)') readObject = 'Unbalanced parenthesis (...)) quoted.' asPDF.
	self assert: (PtFile readTesterOn: '(This string contains \245two octal characters\307.)') readObject pdfSource = '(This string contains \245two octal characters\307.)'.
	self assert: (PtFile readTesterOn: '  		
		(leading whitespace)') readObject = 'leading whitespace' asPDF.
	self assert: (PtFile readTesterOn: '<4E6F762073686D6F7A206B6120706F702E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '< 4E6F762073686D6F7A206B6120706F702E >') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<4e6f762073686d6f7a206b6120706f702e>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<4E6F76207	3686D6F7A20
6B6120706F7
02E>') readObject = 'Nov shmoz ka pop.' asPDF.
	self assert: (PtFile readTesterOn: '<901FA3>') readObject = ((PtPDF classAt: #EncodedString) content: #[144 31 163])
]

{ #category : #tests }
PtSimpleObjectTests >> testReadObjects [
	| file first |
	self assert: (PtFile readTesterOn: '/abc') readObject = #abc asPDF.
	self should: [(PtFile readTesterOn: 'abc') readObject] raise: PtReadError.
	[(PtFile readTesterOn: 'abc') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Token "abc" not recognized'].
	file := PtFile readTesterOn: '/abc% comment ( /% ) blah blah blah
123'.
	first := file readObject.
	self assert: first = #abc asPDF.
	self assert: file readObject = 123 asPDF
]

{ #category : #tests }
PtSimpleObjectTests >> testReadTokens [
	| rst |
	rst := (PtFile readTesterOn: 'abc% comment ( /% ) blah blah blah
123') parser.
	self assert: rst nextToken = #abc.
	self assert: rst nextToken = '123'.
	rst := (PtFile readTesterOn: ' /abc (bb()bb) [ true << <aa> false % ') parser.
	self assert: rst nextToken = '/'.
	self assert: rst nextToken = #abc.
	self assert: rst nextToken = '('.
	self assert: rst nextToken = #bb.
	self assert: rst nextToken = '('.
	self assert: rst nextToken = ')'.
	self assert: rst nextToken = #bb.
	self assert: rst nextToken = ')'.
	self assert: rst nextToken = '['.
	self assert: rst nextToken = #true.
	self assert: rst nextToken = '<<'.
	self assert: rst nextToken = '<'.
	self assert: rst nextToken = #aa.
	self assert: rst nextToken = '>'.
	self assert: rst nextToken = #false.
	self assert: rst atEnd not.
	self assert: rst nextToken isNil.
	self assert: rst atEnd
]

{ #category : #tests }
PtSimpleObjectTests >> testSkipWhitespace [
	| parser |
	parser := (PtFile readTesterOn: '   ( This is a string )') parser.
	parser skipWhitespace.
	self assert: parser next = $(.
	parser := (PtFile readTesterOn: '  		 ( This is a string )') parser.
	parser skipWhitespace.
	self assert: parser next = $(.
	parser := (PtFile readTesterOn: '  	% blah blah blah...
	 ( This is a string )') parser.
	parser skipWhitespace.
	self assert: parser next = $(
]

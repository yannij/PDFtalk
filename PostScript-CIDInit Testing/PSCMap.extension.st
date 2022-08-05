Extension { #name : #PSCMap }

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCMap class >> allCMaps [
	"this loads all 181 CMaps"
	"Tools.TimeProfiler profile: [self allCMaps]"
	"self allCMaps"

	^(PSInterpreter run: '(*) {cvn /CMap findresource} 10 string /CMap resourceforall') stack objects collect: [:dict |
		self newWith: dict]
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCMap class >> example [
	| ps cmap |
	ps := PSInterpreter run: '/CIDInit /ProcSet findresource begin
12 dict begin
begincmap
/CIDSystemInfo
<< /Registry (Adobe)
/Ordering (UCS) /Supplement 0 >> def
/CMapName /Adobe-Identity-UCS def
/CMapType 2 def
1 begincodespacerange
<0000> <FFFF>
endcodespacerange
15 beginbfchar
<0003> <0020>
<000F> <002C>
<0010> <002D>
<0011> <002E>
<0013> <0030>
<0014> <0031>
<0015> <0032>
<0016> <0033>
<0017> <0034>
<0018> <0035>
<0019> <0036>
<001A> <0037>
<001B> <0038>
<001C> <0039>
<001D> <003A>
endbfchar
endcmap CMapName currentdict /CMap defineresource pop end end'.
	cmap := (ps resources at: #CMap) at: #'Adobe-Identity-UCS'.
	^self newWith: cmap
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCMap class >> exampleWrong [
	"self exampleWrong"
	"the 3rd operator >find< is not PostScript. We can use the correct /findresource instead"

	| ps |
	ps := [PSInterpreter run: self exampleWrongSource] on: KeyNotFound do: [:ex |
		(ex selector = #valueAt: and: [
		ex parameter = #find])
				ifTrue: [ex resume: (ex receiver valueAt: #findresource)]
				ifFalse: [ex pass]].
	^self newWith: ((ps resources at: #CMap) at: #F1)
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCMap class >> exampleWrongFixBefore [
	"self exampleWrongFixBefore"
	"the 3rd operator >find< is not PostScript. We can define it as alias before"

	| source ps resources |
	source := self exampleWrongSource.
	ps := PSInterpreter new.
	resources := [(ps run: source) resources] on: KeyNotFound do: [:ex |
		(ex selector = #valueAt: and: [
		ex parameter = #find])
				ifTrue: [
				| ps1 |
				ps1 := PSInterpreter run: '/find /findresource cvx def'.
				ex return: (ps1 run: source) resources]
				ifFalse: [
				ex pass]].
	^self newWith: ((resources at: #CMap) at: #F1)
]

{ #category : #'*PostScript-CIDInit Testing-test instances' }
PSCMap class >> exampleWrongSource [
	"the 3rd operator >find< is not PostScript. We can define it as alias before"

	^'/CIDInit/ProcSet
find begin 12 dict begin begincmap /CIDSystemInfo<</Registry(Adobe)
/Ordering(Identity)
/Supplement 0
>>
def
/CMapName/F1 def
1 begincodespacerange <0000> <FFFF> endcodespacerange
54 beginbfrange
<20> <20> <0020>
<21> <21> <0055>
<22> <22> <0073>
<23> <23> <0074>
<24> <24> <002D>
<25> <25> <0049>
<26> <26> <0044>
<27> <27> <0064>
<28> <28> <0065>
<29> <29> <0072>
<2A> <2A> <0053>
<2B> <2B> <0050>
<2C> <2C> <004B>
<2D> <2D> <007A>
<2E> <2E> <0075>
<2F> <2F> <004C>
<30> <30> <00FC>
<31> <31> <0062>
<32> <32> <0063>
<33> <33> <006B>
<34> <34> <0041>
<35> <35> <0047>
<36> <36> <003A>
<37> <37> <0045>
<38> <38> <0038>
<39> <39> <0031>
<3A> <3A> <0034>
<3B> <3B> <0030>
<3C> <3C> <0033>
<3D> <3D> <0036>
<3E> <3E> <0037>
<3F> <3F> <0042>
<40> <40> <0069>
<41> <41> <0052>
<42> <42> <0066>
<43> <43> <0061>
<44> <44> <0067>
<45> <45> <006E>
<46> <46> <0077>
<47> <47> <0068>
<48> <48> <0043>
<49> <49> <0076>
<4A> <4A> <006D>
<4B> <4B> <0048>
<4C> <4C> <006F>
<4D> <4D> <0032>
<4E> <4E> <0054>
<4F> <4F> <006C>
<50> <50> <002F>
<51> <51> <0039>
<52> <52> <0035>
<53> <53> <0078>
<54> <54> <004E>
<55> <55> <002E>
endbfrange
endcmap CMapName currentdict /CMap defineresource pop end end
'
]

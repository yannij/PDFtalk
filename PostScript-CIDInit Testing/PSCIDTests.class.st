Class {
	#name : #PSCIDTests,
	#superclass : #TestCase,
	#category : #'PostScript-CIDInit Testing'
}

{ #category : #testing }
PSCIDTests >> testBfChar [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginbfchar
<27> /quotesingle
<5c> /yen
endbfchar') dictionaryStack top at: #bfchar) asArray prettyPrintString = '[[<27> /quotesingle] [<5C> /yen]]'.
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginbfchar
<27> <42>
<5c> 51
endbfchar') dictionaryStack top at: #bfchar) asArray prettyPrintString = '[[<27> <42>] [<5C> 51]]'
]

{ #category : #testing }
PSCIDTests >> testBfCharMultiple [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginbfchar
<27> /quotesingle
<5c> /yen
endbfchar
2 beginbfchar
<37> <42>
<6c> 51
endbfchar') dictionaryStack top at: #bfchar) asArray prettyPrintString = '[[<27> /quotesingle] [<5C> /yen] [<37> <42>] [<6C> 51]]'
]

{ #category : #testing }
PSCIDTests >> testBfCharOutOfRange [
	| source cmap |
	source := '/CIDInit /ProcSet findresource begin
begincmap
/CMapName /test def
/CIDSystemInfo <</Registry (Adobe) /Ordering (UCS) /Supplement 0>> def
1 begincodespacerange
<00> <F0>
endcodespacerange
4 beginbfchar
<27> /quotesingle
<5c> /yen
<37> <42>
<FA> <77>
endbfchar
endcmap'.
	cmap := PSCMap newWith: (PSInterpreter run: source) dictionaryStack top.
	self deny: cmap isValid.
	self deny: cmap bfMappings isValid.
	self assert: cmap bfMappings unmapped first = ((PSCode bytes: #[250]) --> 119).
	self assert: cmap cidMappings isValid.
	self assert: cmap notdefMappings isValid
]

{ #category : #testing }
PSCIDTests >> testBfRange [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
2 begincodespacerange
  <00> <7f>
  <8121> <EE9E>
endcodespacerange

2 beginbfrange
<00> <26>  <00>
<61> <7d> <61>
endbfrange

2 beginbfrange
<8152> <8153> <8152>
<ed80> <ed96> <ed80>
endbfrange') dictionaryStack top at: #bfrange) asArray prettyPrintString = '[[<00> <26> <00>] [<61> <7D> <61>] [<8152> <8153> <8152>] [<ED80> <ED96> <ED80>]]'
]

{ #category : #testing }
PSCIDTests >> testBfRangeNames [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
2 begincodespacerange
  <00> <7f>
  <8121> <EE7E>
endcodespacerange

2 beginbfrange
<00> <03>  [/a /b /c /d]
<61> <63> [/A /B /C]
endbfrange') dictionaryStack top at: #bfrange) asArray prettyPrintString = '[[<00> <03> [/a /b /c /d]] [<61> <63> [/A /B /C]]]'
]

{ #category : #testing }
PSCIDTests >> testCID [
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
	self assert: cmap prettyPrintString = '<<
	/CIDSystemInfo <<
		/Registry (Adobe)
		/Ordering (UCS)
		/Supplement 0>>
	/CMapName /Adobe-Identity-UCS
	/CMapType 2
	/codespacerange [<0000>..<FFFF>]
	/bfchar [[<0003> <0020>] [<000F> <002C>] [<0010> <002D>] [<0011> <002E>] [<0013> <0030>] [<0014> <0031>] [<0015> <0032>] [<0016> <0033>] [<0017> <0034>] [<0018> <0035>] [<0019> <0036>] [<001A> <0037>] [<001B> <0038>] [<001C> <0039>] [<001D> <003A>]]>>'
]

{ #category : #testing }
PSCIDTests >> testCIDChar [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
2 begincodespacerange
  <8100> <83ff>
  <6400> <65FF>
endcodespacerange

5 begincidchar
<8143> 8286
<8144> 8274
<814a>  8272
<8387>  7936
<838e>  7937
endcidchar

2 begincidchar
<6421> 5970
<6521> 6064
endcidchar') dictionaryStack top at: #cidchar) asArray prettyPrintString = '[[<8143> 8286] [<8144> 8274] [<814A> 8272] [<8387> 7936] [<838E> 7937] [<6421> 5970] [<6521> 6064]]'
]

{ #category : #testing }
PSCIDTests >> testCIDRange [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
  <2121> <7E7E>
endcodespacerange

6 begincidrange
<2121> <217e>  633
<2221> <222e>  727
<223a> <2241>  741
<224a> <2250>  749
<225c> <226a>  756
<2272> <2279>  771
endcidrange

2 begincidrange
<6421> <647e> 5970
<6521> <657e> 6064
endcidrange') dictionaryStack top at: #cidrange) asArray prettyPrintString = '[[<2121> <217E> 633] [<2221> <222E> 727] [<223A> <2241> 741] [<224A> <2250> 749] [<225C> <226A> 756] [<2272> <2279> 771] [<6421> <647E> 5970] [<6521> <657E> 6064]]'
]

{ #category : #testing }
PSCIDTests >> testCMapResources [
	self assert: (PSInterpreter run: '/Identity-H /CMap findresource') stack top size = 8.
	self assert: (PSInterpreter run: '(*) {} 10 string /CMap resourceforall') stack size = 181
]

{ #category : #testing }
PSCIDTests >> testCodeSpaceOverlappingCodes [
	| source cmap |
	source := '/CIDInit /ProcSet findresource begin
begincmap
/CMapName /GBK2K-V def
/CIDSystemInfo <</Registry (Adobe) /Ordering (GB1) /Supplement 5>> def
3 begincodespacerange
	<00><7F>
	<81308130><FE39FE39>
	<8140><FEFE>
endcodespacerange'.
	cmap := PSCMap newWith: (PSInterpreter run: source) dictionaryStack top.
	self assert: cmap isValid.
	self assert: (cmap coderanges collect: [:e | e printString]) asSource = '#(''<00>..<7F>'' ''<81308130>..<FE39FE39>'' ''<8140>..<FEFE>'')'.
]

{ #category : #testing }
PSCIDTests >> testCodeSpaceRange [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<0000> <FFFF>
endcodespacerange') dictionaryStack top at: #codespacerange) printPostScript = '[<0000>..<FFFF>]'
]

{ #category : #testing }
PSCIDTests >> testCodeSpaceRangeFromSpec [
	"from 5014.CIDFont_Spec.pdf p. 75"

	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
4 begincodespacerange
	<00>    <80>
	<8140> <9FFC>
	<A0>    <DF>
	<E040> <FBFC>
endcodespacerange') dictionaryStack top at: #codespacerange) printPostScript = '[<00>..<80> <8140>..<9FFC> <A0>..<DF> <E040>..<FBFC>]'
]

{ #category : #testing }
PSCIDTests >> testCodeSpaceRangeFromSpecOverlappingCodes [
	"from 5014.CIDFont_Spec.pdf p. 75"

	| source |
	source := '/CIDInit /ProcSet findresource begin
begincmap
/CMapName /test def
/CIDSystemInfo <</Registry (Adobe) /Ordering (UCS) /Supplement 0>> def
4 begincodespacerange
	<00>    <80>
	<8140> <9FFC>
	<79>    <DF>
	<E040> <FBFC>
endcodespacerange'.
	self should: [PSCMap newWith: (PSInterpreter run: source) dictionaryStack top] raise: Error.
	[PSCMap newWith: (PSInterpreter run: source) dictionaryStack top] on: Error do: [:ex |
		self assert: ex messageText = 'code space is invalid: ranges overlap']
]

{ #category : #testing }
PSCIDTests >> testCodeSpaceRangeFromSpecWrongCount [
	"from 5014.CIDFont_Spec.pdf p. 75"

	self
		should: [
		PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
3 begincodespacerange
	<00>    <80>
	<8140> <9FFC>
	<A0>    <DF>
	<E040> <FBFC>
endcodespacerange']
		raise: Error.
	[
	PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
3 begincodespacerange
	<00>    <80>
	<8140> <9FFC>
	<A0>    <DF>
	<E040> <FBFC>
endcodespacerange'] on: Error do: [:ex |
			self assert: ex messageText = 'codespacerange count is wrong']
]

{ #category : #testing }
PSCIDTests >> testCodeSpaceRangeMultiple [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
1 begincodespacerange
<A000> <FFFF>
endcodespacerange') dictionaryStack top at: #codespacerange) printPostScript = '[<00>..<FF> <A000>..<FFFF>]'
]

{ #category : #testing }
PSCIDTests >> testNotdefChar [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginnotdefchar
<03> 1
<0F> 2
endnotdefchar') dictionaryStack top at: #notdefchar) asArray prettyPrintString = '[[<03> 1] [<0F> 2]]'.
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginnotdefchar
<03> 1
<0F> 2
endnotdefchar
2 beginnotdefchar
<05> 3
<07> 4
endnotdefchar') dictionaryStack top at: #notdefchar) asArray prettyPrintString = '[[<03> 1] [<0F> 2] [<05> 3] [<07> 4]]'
]

{ #category : #testing }
PSCIDTests >> testNotdefRange [
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginnotdefrange
<00> <1f> 1
<fc> <ff> 231
endnotdefrange') dictionaryStack top at: #notdefrange) asArray prettyPrintString = '[[<00> <1F> 1] [<FC> <FF> 231]]'.
	self assert: ((PSInterpreter run: '/CIDInit /ProcSet findresource begin
begincmap
1 begincodespacerange
<00> <FF>
endcodespacerange
2 beginnotdefrange
<00> <1f> 1
<fc> <ff> 231
endnotdefrange
2 beginnotdefrange
<30> <39> 56
<64> <66> 78
endnotdefrange') dictionaryStack top at: #notdefrange) asArray prettyPrintString = '[[<00> <1F> 1] [<FC> <FF> 231] [<30> <39> 56] [<64> <66> 78]]'
]

{ #category : #testing }
PSCIDTests >> testPrintCode [
	self assert: (PSCode bytes: #[0]) printPostScript = '<00>'.
	self assert: (PSCode bytes: #[255]) printPostScript = '<FF>'.
	self assert: (PSCode bytes: #[0 0]) printPostScript = '<0000>'.
	self assert: (PSCode bytes: #[42 89]) printPostScript = '<2A59>'.
	self assert: (PSCode bytes: #[0 0 0 0]) printPostScript = '<00000000>'.
	self assert: (PSCode bytes: #[42 89 23 74]) printPostScript = '<2A59174A>'.
]

{ #category : #testing }
PSCIDTests >> testRearrangedFont [
	| ps |
	ps := PSInterpreter run: (String fromASCII85: '%51(?6qM91F<E55Ec5GdATT&,Bl7I%ATMd4EarZ''@V''1dD@I%.8p,#+0JP.QBkM+$/P@Zc/Q+/[1N7ME;G0q\/P$=T#qnnnDD<h"/PKkkBQPgc1N7Lh;G0q\/P$<W02QRuFD55n/OO2[DI[6uGtD$G#qo4jBl8!''BhMlK/OMj''9//"X1N7Lh;G0q\/P$<W01L)+Db"_40eb=66>p[N/N>P*FtHTb;bAW4%1+[WF`_OrBl63k0JP.GDerr93&>Ms/Q,5?8hERC#qnhJ9keKH1Ikkf1GBp\>p*TfB5)7(ARTV"@;]^hA7fatF:A[6+C\npBl8''7ASkjtEbTb@>;76S+>=om+>=ol/ho4h+D#G$F`V,2@<?O(GRZAMF`V,+Df0Y+%5f8;AS5^p@V0+`@<)f>1,hB>06),QFCfN-DJ*cs%6QLX4s2M(ASqr>2D@<;05#<6G%D+F2e>/q06CoEA7Z342eG5r4?$k9%:sEf@V0+`@<)ed1*C%;B5)6mAo_<tB4VN70JG[54>JfY+<Wd#0Koq.2DIB<4?$e7+?VP:4q2(@A7B.k@;]^h%1P''8F`V,+Df0Y+%5K&8AS5^p@V0+`@<)f>3&*:#4s2sI0f<H)%6S322D[N>4Cqt[1Hl7ZDId3g@q]:k%1P''8@V''1dDIR3u@;]^h%6QU)1bh0:4?,&P2a/?,4?,&P0g6%/AR[W/4s2t!@Q7m^+?X4E3+G,]ASu$fAo_<tB4VM]1E^g]AS,juF:A[7+C\npBl7BlEa`iuAIUa]0f:^M+?VV<2)@E=+?VV<2)7?)4Cr%_0KpUAARmeZ4s2t!A2l8,%:sEf@V0XhDJ*Mi%5]2MF(Js%DKH<s1*C%;B5)6mAo_<tB4VN73&*9I4s2sI0f:gP+<Wd+0f:dO%6S333G(Gt4Cr#70g6^BARd`44q2(@A7B.k@;]^h%1P0;F`V,+Df0Y+%5Au7AS5^p@V0XhDJ*Mi4D$9$0KpUAAh[h/4s1t%%:sEf@V0XhDJ*Mi%:sEfEb/["Ea`iuARoCkDKH>!DIa1c,pbutA5Zu[Dfp)1AITq378HA^~>').
	self assert: ps printString = '||  <'.
	self assert: ((ps resources at: #Font) at: #'Jun101-Light-K-G-R-83pv_RKSJ-H') prettyPrintString = '<<
	/name #''Jun101-Light-K-G-R-83pv_RKSJ-H''
	/fonts [/Jun101-Light-83pv-RKSJ-H /Poetica-ChanceryIV /ShinseiKai-CBSK1-83pv-RKSJ-H /FutoGoB101-Bold-83pv-RKSJ-H /FutoMinA101-Bold-83pv-RKSJ-H /HSMinW3Gai30]
	/Jun101-Light-83pv-RKSJ-H <<
		/name #''Jun101-Light-83pv-RKSJ-H''
		/usematrix [1 0 0 1 0 0.15]
		/bfchar [[<27> /quotesingle] [<5C> /yen] [<60> /grave] [<7E> /tilde] [<7F> <7F>]]
		/bfrange [[<00> <26> <00>] [<61> <7D> <61>]]>>
	/Poetica-ChanceryIV <<
		/name #''Poetica-ChanceryIV''
		/bfchar [[<815C> <815C>] [<EB63> <EB63>]]
		/bfrange [[<8141> <8147> <8141>] [<EB8C> <EB8D> <EB8C>]]>>
	/ShinseiKai-CBSK1-83pv-RKSJ-H <<
		/name #''ShinseiKai-CBSK1-83pv-RKSJ-H''
		/bfrange [[<8152> <8153> <8152>] [<ED80> <ED96> <ED80>]]>>
	/FutoGoB101-Bold-83pv-RKSJ-H <<
		/name #''FutoGoB101-Bold-83pv-RKSJ-H''
		/bfrange [[<8154> <8155> <8154>] [<EC9F> <ECF1> <EC9F>]]>>
	/FutoMinA101-Bold-83pv-RKSJ-H <<
		/name #''FutoMinA101-Bold-83pv-RKSJ-H''
		/bfrange [[<F000> <F0FF> 0]]>>>>'
]

{ #category : #testing }
PSCIDTests >> testUseCMap [
	| ps cmap map1Source map2Source |
	map1Source := '
/CIDInit /ProcSet findresource begin 12 dict begin
begincmap
/CIDSystemInfo 3 dict dup begin /Registry (Adobe) def /Ordering (Japan1) def /Supplement 0 def end def
/CMapName /Test-H def
/CMapVersion 1 def
/CMapType 0 def
/WMode 0 def
1 begincodespacerange
  <00> <FF>
endcodespacerange
5 begincidchar
<43> 86
<44> 74
<4a> 72
<87> 36
<8e> 37
endcidchar
1 begincidrange
<41> <42> 78
endcidrange
endcmap
CMapName currentdict /CMap defineresource pop end end'.
	map2Source := '
/CIDInit /ProcSet findresource begin 12 dict begin
begincmap
/CIDSystemInfo 3 dict dup begin /Registry (Adobe) def /Ordering (Japan1) def /Supplement 0 def end def
/Test-H usecmap
/CMapName /Test-V def
/CMapVersion 1 def
/CMapType 0 def
/WMode 1 def
1 begincidrange
<81> <83> 87
endcidrange
2 begincidchar
<84> 86
<85> 82
endcidchar
endcmap
CMapName currentdict /CMap defineresource pop end end'.
	ps := PSInterpreter run: map1Source.
	ps run: map2Source.
	cmap := (ps resources at: #CMap) at: #'Test-V'.
	self assert: cmap prettyPrintString = '<<
	/CIDSystemInfo <<
		/Registry (Adobe)
		/Ordering (Japan1)
		/Supplement 0>>
	/codespacerange [<00>..<FF>]
	/cidchar [[<43> 86] [<44> 74] [<4A> 72] [<87> 36] [<8E> 37] [<84> 86] [<85> 82]]
	/cidrange [[<41> <42> 78] [<81> <83> 87]]
	/CMapName /Test-V
	/CMapVersion 1
	/CMapType 0
	/WMode 1>>'
]

{ #category : #testing }
PSCIDTests >> testUseCMap_Ext_RKSJ [
	| ps cmap cmapUsed |
	(PSCategory respondsTo: #cmapExt_RKSJ_H) ifFalse: [
		"the CMap instances are not loaded"
		^self].
	ps := PSInterpreter run: '
/CIDInit /ProcSet findresource begin

12 dict begin

begincmap

/CIDSystemInfo 3 dict dup begin
	/Registry (Adobe) def
	/Ordering (Japan1) def
	/Supplement 0 def
end def

/Ext-RKSJ-H usecmap

/CMapName /Ext-RKSJ-V def
/CMapVersion 1 def
/CMapType 0 def

/UIDOffset 800 def
/XUID [1 10 25335] def

/WMode 1 def

1 begincidrange
<8141> <8142> 7887
endcidrange

5 begincidchar
<8143> 8286
<8144> 8274
<814a> 8272
<8387> 7936
<838e> 7937
endcidchar

endcmap

CMapName currentdict /CMap defineresource pop

end
end'.
	cmap := (ps resources at: #CMap) at: #'Ext-RKSJ-V'.
	cmapUsed := (ps resources at: #CMap) at: #'Ext-RKSJ-H'.
	self assert: (cmap at: #CIDSystemInfo) prettyPrintString = '<<
	/Registry (Adobe)
	/Ordering (Japan1)
	/Supplement 0>>'.
	self assert: (cmap at: #CMapName) object = #'Ext-RKSJ-V'.
	self assert: (cmapUsed at: #CMapName) object = #'Ext-RKSJ-H'.
	self assert: (cmap at: #CMapType) = 0.
	self assert: (cmap at: #codespacerange) prettyPrintString = '[<00>..<80> <8140>..<9FFC> <A0>..<DF> <E040>..<FCFC>]'.
	self assert: (cmap at: #cidrange) size = 666.
	self assert: (cmapUsed at: #cidrange) size = 665.
	self assert: (cmap at: #cidchar) prettyPrintString = '[[<8143> 8286] [<8144> 8274] [<814A> 8272] [<8387> 7936] [<838E> 7937]]'.
	self assert: (cmapUsed includesKey: #cidchar) not.
	self assert: (cmap at: #WMode) = 1.
	self assert: (cmapUsed at: #WMode) = 0
]

{ #category : #testing }
PSCIDTests >> testUseMatrix [
	self assert: (PSInterpreter run: '
/CIDInit /ProcSet findresource begin

/Jun101-Light-K-G-R-83pv_RKSJ-H
[	/Jun101-Light-83pv-RKSJ-H
	/Poetica-ChanceryIV
	/ShinseiKai-CBSK1-83pv-RKSJ-H
	/FutoGoB101-Bold-83pv-RKSJ-H
	/FutoMinA101-Bold-83pv-RKSJ-H
	/HSMinW3Gai30 
] beginrearrangedfont

1 beginusematrix [1 0 0 1 0 0.15] endusematrix

') dictionaryStack top prettyPrintString = '<<
	/name #''Jun101-Light-K-G-R-83pv_RKSJ-H''
	/fonts [/Jun101-Light-83pv-RKSJ-H /Poetica-ChanceryIV /ShinseiKai-CBSK1-83pv-RKSJ-H /FutoGoB101-Bold-83pv-RKSJ-H /FutoMinA101-Bold-83pv-RKSJ-H /HSMinW3Gai30]
	/Jun101-Light-83pv-RKSJ-H <<
		/name #''Jun101-Light-83pv-RKSJ-H''
		/usematrix [1 0 0 1 0 0.15]>>>>'
]

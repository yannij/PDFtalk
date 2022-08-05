"
Global class for utilities used from anywhere.

There are no instances; all functionality is implemented as class methods.
"
Class {
	#name : #PtPDF,
	#superclass : #Object,
	#classVars : [
		'MacRomanEncoder',
		'PDFDocEncoder',
		'PDFSpecification',
		'PDFSpecificationFilenameString',
		'StandardEncoder',
		'WinAnsiEncoder'
	],
	#classInstVars : [
		'types'
	],
	#category : #'PDFtalk-Basics'
}

{ #category : #'accessing encoders' }
PtPDF class >> d2LatinCharacterSetAndEncodings [
	"<Dictionary key: String value: (Array of: characterCode stdInteger macInteger winInteger pdfInteger)>
PDF 32000_2008.pdf pp. 653.
D.2, 'Latin Character Set and Encodings', describes the entire character set for the Adobe standard Latin-text fonts.
This character set shall be supported by the Times, Helvetica, and Courier font families, which are among the standard 14 predefined fonts.
For each named character, an octal character code is defined for four different encodings:
		StandardEncoding, MacRomanEncoding, WinAnsiEncoding, and PDFDocEncoding.
Unencoded characters are indicated by a dash (—)."
	"the last element is the character code in Smalltalk"

	| dict |
	dict := IdentityDictionary new.
	dict    "Name 					Std 	Mac 	Win 	PDF 	#asCharacter"
		at: 'A'				put: #(	8r101 	8r101 	8r101 	8r101 	8r101);
		at: 'AE'				put: #(	8r341 	8r256 	8r306 	8r306 	8r306);
		at: 'Aacute'			put: #(	nil		8r347 	8r301 	8r301 	8r301);
		at: 'Acircumflex'		put: #(	nil		8r345 	8r302 	8r302 	8r302);
		at: 'Adieresis'		put: #(	nil		8r200 	8r304 	8r304 	8r304);
		at: 'Agrave'			put: #(	nil		8r313 	8r300 	8r300 	8r300);
		at: 'Aring'			put: #(	nil		8r201 	8r305 	8r305 	8r305);
		at: 'Atilde'			put: #(	nil		8r314 	8r303 	8r303 	8r303);
		at: 'B'				put: #(	8r102 	8r102 	8r102 	8r102 	8r102);
		at: 'C'				put: #(	8r103 	8r103 	8r103 	8r103 	8r103);
		at: 'Ccedilla'			put: #(	nil		8r202 	8r307 	8r307 	8r307);
		at: 'D'				put: #(	8r104 	8r104 	8r104 	8r104 	8r104);
		at: 'E'				put: #(	8r105 	8r105 	8r105 	8r105 	8r105);
		at: 'Eacute'			put: #(	nil		8r203 	8r311 	8r311 	8r311);
		at: 'Ecircumflex'		put: #(	nil		8r346 	8r312 	8r312 	8r312);
		at: 'Edieresis'		put: #(	nil		8r350 	8r313 	8r313 	8r313);
		at: 'Egrave'			put: #(	nil		8r351 	8r310 	8r310 	8r310);
		at: 'Eth'				put: #(	nil		nil		8r320 	8r320 	8r320);
		at: 'Euro'			put: #(	nil		nil		8r200 	8r240 	16r20AC);
		at: 'F'				put: #(	8r106 	8r106 	8r106 	8r106 	8r106);
		at: 'G'				put: #(	8r107 	8r107 	8r107 	8r107 	8r107);
		at: 'H'				put: #(	8r110 	8r110 	8r110 	8r110 	8r110);
		at: 'I'				put: #(	8r111 	8r111 	8r111 	8r111 	8r111);
		at: 'Iacute'			put: #(	nil		8r352 	8r315 	8r315 	8r315);
		at: 'Icircumflex'		put: #(	nil		8r353 	8r316 	8r316 	8r316);
		at: 'Idieresis'			put: #(	nil		8r354 	8r317 	8r317 	8r317);
		at: 'Igrave'			put: #(	nil		8r355 	8r314 	8r314 	8r314);
		at: 'J'				put: #(	8r112 	8r112 	8r112 	8r112 	8r112);
		at: 'K'				put: #(	8r113 	8r113 	8r113 	8r113 	8r113);
		at: 'L'				put: #(	8r114 	8r114 	8r114 	8r114 	8r114);
		at: 'Lslash'			put: #(	8r350	nil		nil		8r225	16r141);
		at: 'M'				put: #(	8r115 	8r115 	8r115 	8r115 	8r115);
		at: 'N'				put: #(	8r116 	8r116 	8r116 	8r116 	8r116);
		at: 'Ntilde'			put: #(	nil		8r204 	8r321 	8r321 	8r321);
		at: 'O'				put: #(	8r117 	8r117 	8r117 	8r117 	8r117);
		at: 'OE'				put: #(	8r352 	8r316 	8r214 	8r226	16r152);
		at: 'Oacute'			put: #(	nil		8r356 	8r323 	8r323 	8r323);
		at: 'Ocircumflex'		put: #(	nil		8r357 	8r324 	8r324 	8r324);
		at: 'Odieresis'		put: #(	nil		8r205 	8r326 	8r326 	8r326);
		at: 'Ograve'			put: #(	nil		8r361 	8r322 	8r322 	8r322);
		at: 'Oslash'			put: #(	8r351 	8r257 	8r330 	8r330 	8r330);
		at: 'Otilde'			put: #(	nil		8r315 	8r325 	8r325 	8r325);
		at: 'P'				put: #(	8r120 	8r120 	8r120 	8r120 	8r120);
		at: 'Q'				put: #(	8r121 	8r121 	8r121 	8r121 	8r121);
		at: 'R'				put: #(	8r122 	8r122 	8r122 	8r122 	8r122);
		at: 'S'				put: #(	8r123 	8r123 	8r123 	8r123 	8r123);
		at: 'Scaron'			put: #(	nil		nil	 	8r212 	8r227 	16r160);
		at: 'T'				put: #(	8r124 	8r124 	8r124 	8r124 	8r124);
		at: 'Thorn'			put: #(	nil		nil	 	8r336 	8r336 	8r336);
		at: 'U'				put: #(	8r125 	8r125 	8r125 	8r125 	8r125);
		at: 'Uacute'			put: #(	nil		8r362 	8r332 	8r332 	8r332);
		at: 'Ucircumflex'		put: #(	nil		8r363 	8r333 	8r333 	8r333);
		at: 'Udieresis'		put: #(	nil		8r206 	8r334 	8r334 	8r334);
		at: 'Ugrave'			put: #(	nil		8r364 	8r331 	8r331 	8r331);
		at: 'V'				put: #(	8r126 	8r126 	8r126 	8r126 	8r126);
		at: 'W'				put: #(	8r127 	8r127 	8r127 	8r127 	8r127);
		at: 'X'				put: #(	8r130 	8r130 	8r130 	8r130 	8r130);
		at: 'Y'				put: #(	8r131 	8r131 	8r131 	8r131 	8r131);
		at: 'Yacute'			put: #(	nil		nil	 	8r335 	8r335 	8r335);
		at: 'Ydieresis'		put: #(	nil		8r331 	8r237 	8r230 	16r178);
		at: 'Z'				put: #(	8r132 	8r132 	8r132 	8r132 	8r132);
		at: 'Zcaron'			put: #(	nil		nil	 	8r216 	8r231 	16r17D);
		at: 'a'				put: #(	8r141 	8r141 	8r141 	8r141 	8r141);
		at: 'aacute'			put: #(	nil		8r207 	8r341 	8r341 	8r341);
		at: 'acircumflex'		put: #(	nil		8r211 	8r342 	8r342 	8r342);
		at: 'acute'			put: #(	8r302	8r253 	8r264 	8r264 	8r264);
		at: 'adieresis'		put: #(	nil		8r212 	8r344 	8r344 	8r344);
		at: 'ae'				put: #(	8r361 	8r276 	8r346 	8r346 	8r346);
		at: 'agrave'			put: #(	nil		8r210 	8r340 	8r340 	8r340);
		at: 'ampersand'		put: #(	8r046 	8r046 	8r046 	8r046 	8r046);
		at: 'aring'			put: #(	nil		8r214 	8r345 	8r345 	8r345);
		at: 'asciicircum'		put: #(	8r136 	8r136 	8r136 	8r136 	8r136);
		at: 'asciitilde'		put: #(	8r176 	8r176 	8r176 	8r176 	8r176);
		at: 'asterisk'			put: #(	8r052 	8r052 	8r052 	8r052 	8r052);
		at: 'at'				put: #(	8r100 	8r100 	8r100 	8r100 	8r100);
		at: 'atilde'			put: #(	nil		8r213 	8r343 	8r343 	8r343);
		at: 'b'				put: #(	8r142 	8r142 	8r142 	8r142 	8r142);
		at: 'backslash'		put: #(	8r134 	8r134 	8r134 	8r134 	8r134);
		at: 'bar'				put: #(	8r174 	8r174 	8r174 	8r174 	8r174);
		at: 'braceleft'		put: #(	8r173 	8r173 	8r173 	8r173 	8r173);
		at: 'braceright'		put: #(	8r175 	8r175 	8r175 	8r175 	8r175);
		at: 'bracketleft'		put: #(	8r133 	8r133 	8r133 	8r133 	8r133);
		at: 'bracketright'		put: #(	8r135 	8r135 	8r135 	8r135 	8r135);
		at: 'breve'			put: #(	8r306 	8r371 	nil 	 	8r030 	16r2D8);
		at: 'brokenbar'		put: #(	nil 	 	nil 	 	8r246 	8r246 	8r246);
		at: 'bullet'			put: #(	8r267 	8r245 	8r225 	8r200 	16r2022);
		at: 'c'				put: #(	8r143 	8r143 	8r143 	8r143 	8r143);
		at: 'caron'			put: #(	8r317 	8r377 	nil 	 	8r031 	16r2C7);
		at: 'ccedilla'			put: #(	nil		8r215 	8r347 	8r347 	8r347);
		at: 'cedilla'			put: #(	8r313 	8r374 	8r270 	8r270 	8r270);
		at: 'cent'			put: #(	8r242 	8r242 	8r242 	8r242 	8r242);
		at: 'circumflex'		put: #(	8r303 	8r366 	8r210 	8r032 	16r2C6);
		at: 'colon'			put: #(	8r072 	8r072 	8r072 	8r072 	8r072);
		at: 'comma'			put: #(	8r054 	8r054 	8r054 	8r054 	8r054);
		at: 'copyright'		put: #(	nil		8r251 	8r251 	8r251 	8r251);
		at: 'currency'		put: #(	8r250 	8r333 	8r244 	8r244 	8r244);
		at: 'd'				put: #(	8r144 	8r144 	8r144 	8r144 	8r144);
		at: 'dagger'			put: #(	8r262 	8r240 	8r206 	8r201 	16r2020);
		at: 'daggerdbl'		put: #(	8r263 	8r340 	8r207 	8r202	16r2021);
		at: 'degree'			put: #(	nil		8r241 	8r260 	8r260 	8r260);
		at: 'dieresis'			put: #(	8r310 	8r254 	8r250 	8r250 	8r250);
		at: 'divide'			put: #(	nil		8r326 	8r367 	8r367 	8r367);
		at: 'dollar'			put: #(	8r044 	8r044 	8r044 	8r044 	8r044);
		at: 'dotaccent'		put: #(	8r307 	8r372 	nil 	 	8r033 	16r2D9);
		at: 'dotlessi'			put: #(	8r365 	8r365 	nil 	 	8r232 	16r131);
		at: 'e'				put: #(	8r145 	8r145 	8r145 	8r145 	8r145);
		at: 'eacute'			put: #(	nil		8r216 	8r351 	8r351 	8r351);
		at: 'ecircumflex'		put: #(	nil		8r220 	8r352 	8r352 	8r352);
		at: 'edieresis'		put: #(	nil		8r221 	8r353 	8r353 	8r353);
		at: 'egrave'			put: #(	nil		8r217 	8r350 	8r350 	8r350);
		at: 'eight'			put: #(	8r070 	8r070 	8r070 	8r070 	8r070);
		at: 'ellipsis'			put: #(	8r274 	8r311 	8r205 	8r203 	16r2026);
		at: 'emdash'			put: #(	8r320 	8r321 	8r227 	8r204 	16r2014);
		at: 'endash'			put: #(	8r261 	8r320 	8r226 	8r205 	16r2013);
		at: 'equal'			put: #(	8r075 	8r075 	8r075 	8r075 	8r075);
		at: 'eth'				put: #(	nil		nil 	 	8r360 	8r360 	8r360);
		at: 'exclam'			put: #(	8r041 	8r041 	8r041 	8r041 	8r041);
		at: 'exclamdown'		put: #(	8r241 	8r301 	8r241 	8r241 	8r241);
		at: 'f'				put: #(	8r146 	8r146 	8r146 	8r146 	8r146);
		at: 'fi'				put: #(	8r256 	8r336 	nil 	 	8r223 	16rFB01);
		at: 'five'				put: #(	8r065 	8r065 	8r065 	8r065 	8r065);
		at: 'fl'				put: #(	8r257 	8r337 	nil 	 	8r224 	16rFB02);
		at: 'florin'			put: #(	8r246 	8r304 	8r203 	8r206 	16r192);
		at: 'four'				put: #(	8r064 	8r064 	8r064 	8r064 	8r064);
		at: 'fraction'			put: #(	8r244 	8r332 	nil 	 	8r207 	16r2215);
		at: 'g'				put: #(	8r147 	8r147 	8r147 	8r147 	8r147);
		at: 'germandbls'		put: #(	8r373 	8r247 	8r337 	8r337 	8r337);
		at: 'grave'			put: #(	8r301 	8r140 	8r140 	8r140 	8r140);
		at: 'greater'			put: #(	8r076 	8r076 	8r076 	8r076 	8r076);
		at: 'guillemotleft'		put: #(	8r253 	8r307 	8r253 	8r253 	8r253);
		at: 'guillemotright'	put: #(	8r273 	8r310 	8r273 	8r273 	8r273);
		at: 'guilsinglleft'		put: #(	8r254 	8r334 	8r213 	8r210 	16r2039);
		at: 'guilsinglright'		put: #(	8r255 	8r335 	8r233 	8r211 	16r203A);
		at: 'h'				put: #(	8r150 	8r150 	8r150 	8r150 	8r150);
		at: 'hungarumlaut'	put: #(	8r315 	8r375 	nil 	 	8r034 	16r2DD);
		at: 'hyphen'			put: #(	8r055 	8r055 	8r055 	8r055 	8r055);
		at: 'i'				put: #(	8r151 	8r151 	8r151 	8r151 	8r151);
		at: 'iacute'			put: #(	nil		8r222 	8r355 	8r355 	8r355);
		at: 'icircumflex'		put: #(	nil		8r224 	8r356 	8r356 	8r356);
		at: 'idieresis'			put: #(	nil		8r225 	8r357 	8r357 	8r357);
		at: 'igrave'			put: #(	nil		8r223 	8r354 	8r354 	8r354);
		at: 'j'				put: #(	8r152 	8r152 	8r152 	8r152 	8r152);
		at: 'k'				put: #(	8r153 	8r153 	8r153 	8r153 	8r153);
		at: 'l'				put: #(	8r154 	8r154 	8r154 	8r154 	8r154);
		at: 'less'				put: #(	8r074 	8r074 	8r074 	8r074 	8r074);
		at: 'logicalnot'		put: #(	nil		8r302 	8r254 	8r254 	8r254);
		at: 'lslash'			put: #(	8r370	nil		nil		8r233	16r142);
		at: 'm'				put: #(	8r155 	8r155 	8r155 	8r155 	8r155);
		at: 'macron'			put: #(	8r305	8r370 	8r257 	8r257 	8r257);
		at: 'minus'			put: #(	nil 		nil		nil		8r212	16r2212);
		at: 'mu'				put: #(	nil		8r265 	8r265 	8r265 	8r265);
		at: 'multiply'			put: #(	nil		nil 	 	8r327 	8r327 	8r327);
		at: 'n'				put: #(	8r156 	8r156 	8r156 	8r156 	8r156);
		at: 'nine'				put: #(	8r071 	8r071 	8r071 	8r071 	8r071);
		at: 'ntilde'			put: #(	nil		8r226 	8r361 	8r361 	8r361);
		at: 'numbersign'		put: #(	8r043 	8r043 	8r043 	8r043 	8r043);
		at: 'o'				put: #(	8r157 	8r157 	8r157 	8r157 	8r157);
		at: 'oacute'			put: #(	nil		8r227 	8r363 	8r363 	8r363);
		at: 'ocircumflex'		put: #(	nil		8r231 	8r364 	8r364 	8r364);
		at: 'odieresis'		put: #(	nil		8r232 	8r366 	8r366 	8r366);
		at: 'oe'				put: #(	8r372 	8r317 	8r234 	8r234 	16r153);
		at: 'ogonek'			put: #(	8r316 	8r376 	nil 	 	8r035 	16r2DB);
		at: 'ograve'			put: #(	nil		8r230 	8r362 	8r362 	8r362);
		at: 'one'				put: #(	8r061 	8r061 	8r061 	8r061 	8r061);
		at: 'onehalf'			put: #(	nil		nil 	 	8r275 	8r275 	8r275);
		at: 'onequarter'		put: #(	nil		nil 	 	8r274 	8r274 	8r274);
		at: 'onesuperior'		put: #(	nil		nil 	 	8r271 	8r271 	8r271);
		at: 'ordfeminine'		put: #(	8r343 	8r273 	8r252 	8r252 	8r252);
		at: 'ordmasculine'	put: #(	8r353 	8r274 	8r272 	8r272 	8r272);
		at: 'oslash'			put: #(	8r371 	8r277 	8r370 	8r370 	8r370);
		at: 'otilde'			put: #(	nil		8r233 	8r365 	8r365 	8r365);
		at: 'p'				put: #(	8r160 	8r160 	8r160 	8r160 	8r160);
		at: 'paragraph'		put: #(	8r266 	8r246 	8r266 	8r266 	8r266);
		at: 'parenleft'		put: #(	8r050 	8r050 	8r050 	8r050 	8r050);
		at: 'parenright'		put: #(	8r051 	8r051 	8r051 	8r051 	8r051);
		at: 'percent'			put: #(	8r045 	8r045 	8r045 	8r045 	8r045);
		at: 'period'			put: #(	8r056 	8r056 	8r056 	8r056 	8r056);
		at: 'periodcentered'	put: #(	8r264 	8r341 	8r267 	8r267 	8r267);
		at: 'perthousand'		put: #(	8r275 	8r344 	8r211 	8r213 	16r2030);
		at: 'plus'				put: #(	8r053 	8r053 	8r053 	8r053 	8r053);
		at: 'plusminus'		put: #(	nil 	 	8r261 	8r261 	8r261 	8r261);
		at: 'q'				put: #(	8r161 	8r161 	8r161 	8r161 	8r161);
		at: 'question'		put: #(	8r077 	8r077 	8r077 	8r077 	8r077);
		at: 'questiondown'	put: #(	8r277 	8r300 	8r277 	8r277 	8r277);
		at: 'quotedbl'		put: #(	8r042 	8r042 	8r042 	8r042 	8r042);
		at: 'quotedblbase'	put: #(	8r271 	8r343 	8r204 	8r214 	16r201E);
		at: 'quotedblleft'		put: #(	8r252 	8r322 	8r223 	8r215 	16r201C);
		at: 'quotedblright'	put: #(	8r272 	8r323 	8r224 	8r216 	16r201D);
		at: 'quoteleft'		put: #(	8r140 	8r324 	8r221 	8r217 	16r2018);
		at: 'quoteright'		put: #(	8r047 	8r325 	8r222 	8r220 	16r2019);
		at: 'quotesinglbase'	put: #(	8r270 	8r342 	8r202 	8r221 	16r201A);
		at: 'quotesingle'		put: #(	8r251 	8r047 	8r047 	8r047 	8r047);
		at: 'r'				put: #(	8r162 	8r162 	8r162 	8r162 	8r162);
		at: 'registered'		put: #(	nil 	 	8r250 	8r256 	8r256 	8r256);
		at: 'ring'				put: #(	8r312 	8r373 	nil 	 	8r036 	16r2DA);
		at: 's'				put: #(	8r163 	8r163 	8r163 	8r163 	8r163);
		at: 'scaron'			put: #(	nil		nil 	 	8r232 	8r235 	16r161);
		at: 'section'			put: #(	8r247 	8r244 	8r247 	8r247 	8r247);
		at: 'semicolon'		put: #(	8r073 	8r073 	8r073 	8r073 	8r073);
		at: 'seven'			put: #(	8r067 	8r067 	8r067 	8r067 	8r067);
		at: 'six'				put: #(	8r066 	8r066 	8r066 	8r066 	8r066);
		at: 'slash'			put: #(	8r057 	8r057 	8r057 	8r057 	8r057);
		at: 'space'			put: #(	8r040 	8r040 	8r040 	8r040 	8r040);
		at: 'sterling'			put: #(	8r243 	8r243 	8r243 	8r243 	8r243);
		at: 't'				put: #(	8r164 	8r164 	8r164 	8r164 	8r164);
		at: 'thorn'			put: #(	nil		nil 	 	8r376 	8r376 	8r376);
		at: 'three'			put: #(	8r063 	8r063 	8r063 	8r063 	8r063);
		at: 'threequarters'	put: #(	nil		nil 	 	8r276 	8r276 	8r276);
		at: 'threesuperior'	put: #(	nil		nil 	 	8r263 	8r263 	8r263);
		at: 'tilde'				put: #(	8r304 	8r367 	8r230 	8r037 	16r2DC);
		at: 'trademark'		put: #(	nil 	 	8r252 	8r231 	8r222 	16r2122);
		at: 'two'				put: #(	8r062 	8r062 	8r062 	8r062 	8r062);
		at: 'twosuperior'	put: #(	nil		nil 	 	8r262 	8r262 	8r262);
		at: 'u'				put: #(	8r165 	8r165 	8r165 	8r165 	8r165);
		at: 'uacute'			put: #(	nil		8r234 	8r372 	8r372 	8r372);
		at: 'ucircumflex'		put: #(	nil		8r236 	8r373 	8r373 	8r373);
		at: 'udieresis'		put: #(	nil		8r237 	8r374 	8r374 	8r374);
		at: 'ugrave'			put: #(	nil		8r235 	8r371 	8r371 	8r371);
		at: 'underscore'		put: #(	8r137 	8r137 	8r137 	8r137 	8r137);
		at: 'v'				put: #(	8r166 	8r166 	8r166 	8r166 	8r166);
		at: 'w'				put: #(	8r167 	8r167 	8r167 	8r167 	8r167);
		at: 'x'				put: #(	8r170 	8r170 	8r170 	8r170 	8r170);
		at: 'y'				put: #(	8r171 	8r171 	8r171 	8r171 	8r171);
		at: 'yacute'			put: #(	nil		nil 	 	8r375 	8r375 	8r375);
		at: 'ydieresis'		put: #(	nil		8r330 	8r377 	8r377 	8r377);
		at: 'yen'				put: #(	8r245 	8r264 	8r245 	8r245 	8r245);
		at: 'z'				put: #(	8r172 	8r172 	8r172 	8r172 	8r172);
		at: 'zcaron'			put: #(	nil		nil 	 	8r236 	8r236 	16r17E);
		at: 'zero'			put: #(	8r060 	8r060 	8r060 	8r060 	8r060);
	"extra from the footnotes - the names are not official"
		at: 'softhyphen'		put: #(	nil 	 	nil 	 	8r255 	nil 	 	8r255);
		at: 'nonbreakspace'	put: #(	nil 	 	8r312 	8r240 	nil 	 	8r240);
	"non printing ASCII characters"
		at: 'tab'				put: #(	8r011 	8r011 	8r011 	8r011 	8r011);
		at: 'line feed'			put: #(	8r012 	8r012 	8r012 	8r012 	8r012);
		at: 'carriage return'	put: #(	8r015 	8r015 	8r015 	8r015 	8r015);
		yourself.
	^dict
]

{ #category : #'accessing encoders' }
PtPDF class >> encoderAt: aSymbol [
	aSymbol = #WinAnsiEncoding ifTrue: [
		^self winAnsiEncoder].
	aSymbol = #MacRomanEncoding ifTrue: [
		^self macRomanEncoder].
	^nil
]

{ #category : #'accessing encoders' }
PtPDF class >> encoderNamed: nameSymbol at: column [
	| map |
	map := WordArray new: 256 withAll: Character illegalCode.
	self d2LatinCharacterSetAndEncodings do: [:array |
		| charsetCode character |
		charsetCode := array at: column.
		character := array at: 5.
		charsetCode ifNotNil: [
			(map at: charsetCode + 1) = Character illegalCode ifFalse: [
				self error: 'double encoding, please check the table'].
			map at: charsetCode + 1 put: character]].
	^PtCharacterMap named: nameSymbol withCodes: map
]

{ #category : #accessing }
PtPDF class >> libraryVersionString [
	"<String>
	the version of the PDFtalk library.
	This corresponds to the version in the public store.
	The version consists of 2 parts:
		major: 		gets increased with a major rewrite.
		minor: 		gets increased with new features or incompatible changes.
	The store version has a 3rd and 4th component:
		release: 	increases every time when a version is released.
		build:	denotes a build when changes are internally published"

	^'2.5'
]

{ #category : #'accessing encoders' }
PtPDF class >> macRomanEncoder [
	"<ByteCharacterEncoder>
Mac OS standard encoding for Latin text in Western writing systems. 
Conforming readers shall have a predefined encoding named MacRomanEncoding that may be used with both Type 1 and TrueType fonts."

	^MacRomanEncoder ifNil: [MacRomanEncoder := self encoderNamed: #MacRoman at: 2]
]

{ #category : #'instance creation' }
PtPDF class >> new [
	self shouldNotImplement
]

{ #category : #'accessing encoders' }
PtPDF class >> pdfDocEncoder [
	"<ByteCharacterEncoder>
Encoding for text strings in a PDF document outside the document’s content streams.
This is one of two encodings (the other being Unicode) that may be used to represent text strings.
PDF does not have a predefined encoding named PDFDocEncoding; it is not customary to use this encoding to show text from fonts."

	^PDFDocEncoder ifNil: [PDFDocEncoder := self encoderNamed: #PDFDoc at: 4]
]

{ #category : #'accessing encoders' }
PtPDF class >> standardEncoder [
	"<ByteCharacterEncoder>
Adobe standard Latin-text encoding. 
This is the built-in encoding defined in Type 1 Latin-text font programs (but generally not in TrueType font programs). 
Conforming readers shall not have a predefined encoding named StandardEncoding. 
However, it is necessary to describe this encoding, since a font’s built-in encoding can be used as the base encoding from which differences may be specified in an encoding dictionary."

	^StandardEncoder ifNil: [StandardEncoder := self encoderNamed: #Standard at: 1]
]

{ #category : #'accessing encoders' }
PtPDF class >> winAnsiEncoder [
	"<CharacterMap>
Windows Code Page 1252, often called the “Windows ANSI” encoding.
This is the standard Windows encoding for Latin text in Western writing systems.
Conforming readers shall have a predefined encoding named WinAnsiEncoding that may be used with both Type 1 and TrueType fonts."

	^WinAnsiEncoder ifNil: [WinAnsiEncoder := self encoderNamed: #WinAnsi at: 3]
]

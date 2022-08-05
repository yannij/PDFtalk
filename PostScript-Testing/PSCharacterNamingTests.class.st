"
These tests are for historical documentation only

They show the differences of the encodings of the standard Adobe fonts as implemented by Cincom and my improved version
"
Class {
	#name : #PSCharacterNamingTests,
	#superclass : #TestCase,
	#category : #'PostScript-Testing'
}

{ #category : #tests }
PSCharacterNamingTests >> testDifferenceToEncodingForNewFonts [
	"The encoding for new fonts is not that useful. Anyhow, here are the differences to the old encoding.
	It does show the buggy old encoding of #fraction and #mu"

	| decodingForNewFonts namesNotInNew notTheSame oldAndNewNames unicodeLink issues |
	decodingForNewFonts := PSCharacterNames adobeGlyphDecodingForNewFonts.
	namesNotInNew := Decodings keys - decodingForNewFonts keys.
	"1. the old decoding has many character names which are not in the encoding for new fonts"
	self assert: namesNotInNew size = 235.

	"2. there are different codes for 2 names"
	notTheSame := (Decodings keys - namesNotInNew reject: [:symbol |
		(Decodings at: symbol) = (decodingForNewFonts at: symbol)]) asSortedCollection.
	self assert: notTheSame asArray = #(#fraction #mu).
	"the new mapping of the old codes"
	oldAndNewNames := notTheSame collect: [:symbol |
		symbol -> (PSCharacterNames unicodeToNames at: (Decodings at: symbol))].
	self assert: (oldAndNewNames collect: [:assoc |
		Array
			with: assoc key
			with: assoc value first]) asArray = #(#(#fraction #divisionslash) #(#mu #mugreek)).
	"for looking up the details of the characters"
	unicodeLink := ' http://www.fileformat.info/info/unicode/char/'.
	issues := notTheSame collect: [:symbol |
		symbol printString , unicodeLink , ((Decodings at: symbol) printStringRadix: 16) , unicodeLink , ((decodingForNewFonts at: symbol) printStringRadix: 16) , ' '].
	self assert: issues first = '#fraction http://www.fileformat.info/info/unicode/char/2215 http://www.fileformat.info/info/unicode/char/2044 '.
	self assert: issues last = '#mu http://www.fileformat.info/info/unicode/char/3BC http://www.fileformat.info/info/unicode/char/B5 '.

	"3. there are a more useful characters in the encoding for new fonts"
	self assert: Decodings size - namesNotInNew size = 328.
	self assert: decodingForNewFonts size = 586
]

{ #category : #tests }
PSCharacterNamingTests >> testDifferenceToNewEncoding [
	"The old encoding has several problems as can be seen below"
	"1. the old decoding has one illegal character name: #quotdbl (there is also the correct entry #quotedbl with the same code)"

	| namesNotInNew notTheSame issues unicodeLink oldAndNewNames |
	namesNotInNew := Decodings keys - PSCharacterNames nameToUnicode keys.
	self assert: namesNotInNew asArray = #(#quotdbl).

	"2. there are different codes for 45 names"
	notTheSame := (Decodings keys - namesNotInNew reject: [:symbol |
		(Decodings at: symbol) = (PSCharacterNames nameToUnicode at: symbol)]) asSortedCollection.
	self assert: notTheSame size = 45.
	"the new mapping of the old codes"
	oldAndNewNames := notTheSame collect: [:symbol |
		symbol -> (PSCharacterNames unicodeToNames at: (Decodings at: symbol) ifAbsent: [
			#()])].
	"16 names map to codes which are not in the new encoding"
	self assert: ((oldAndNewNames select: [:assoc | assoc value isEmpty]) collect: #key) asArray = #(#a205 #a206 #a85 #a86 #a89 #a90 #a91 #a92 #a93 #a94 #a95 #a96 #copyrightsans #parenrightbt #registersans #trademarksans).
	"29 names map to codes which are mapped to other names in the new encoding"
	self assert: ((oldAndNewNames reject: [:assoc | assoc value isEmpty]) collect: [:assoc |
		Array
			with: assoc key
			with: assoc value first]) asArray = #(#(#a87 #tortoiseshellbracketleft) #(#a88 #tortoiseshellbracketright) #(#arrowhorizex #Aacutesmall) #(#arrowvertex #Agravesmall) #(#braceex #Ntildesmall) #(#braceleftbt #Ethsmall) #(#braceleftmid #Idieresissmall) #(#bracelefttp #Icircumflexsmall) #(#bracerightbt #Yacutesmall) #(#bracerightmid #Udieresissmall) #(#bracerighttp #Ucircumflexsmall) #(#bracketleftbt #Iacutesmall) #(#bracketleftex #Igravesmall) #(#bracketlefttp #Edieresissmall) #(#bracketrightbt #Uacutesmall) #(#bracketrightex #Ugravesmall) #(#bracketrighttp #Oslashsmall) #(#copyrightserif #copyright) #(#fraction #divisionslash) #(#integralex #Oacutesmall) #(#mu #mugreek) #(#parenleftbt #Ecircumflexsmall) #(#parenleftex #Eacutesmall) #(#parenlefttp #Egravesmall) #(#parenrightex #Odieresissmall) #(#parenrighttp #Otildesmall) #(#radicalex #overline) #(#registerserif #registered) #(#trademarkserif #trademark)).
	"for looking up the details of the characters"
	unicodeLink := ' http://unicode.org/cldr/utility/character.jsp?a='.
	unicodeLink := ' http://www.fileformat.info/info/unicode/char/'.
	issues := notTheSame collect: [:symbol |
		symbol printString , unicodeLink , ((Decodings at: symbol) printStringRadix: 16) , unicodeLink , ((PSCharacterNames nameToUnicode at: symbol) printStringRadix: 16) , ' '].
	self assert: (issues at: 1) = '#a205 http://www.fileformat.info/info/unicode/char/27C0 http://www.fileformat.info/info/unicode/char/276E '.
	self assert: (issues at: 2) = '#a206 http://www.fileformat.info/info/unicode/char/27C2 http://www.fileformat.info/info/unicode/char/2770 '.
	self assert: (issues at: 3) = '#a85 http://www.fileformat.info/info/unicode/char/27C1 http://www.fileformat.info/info/unicode/char/276F '.
	self assert: (issues at: 4) = '#a86 http://www.fileformat.info/info/unicode/char/27C3 http://www.fileformat.info/info/unicode/char/2771 '.
	self assert: (issues at: 5) = '#a87 http://www.fileformat.info/info/unicode/char/3014 http://www.fileformat.info/info/unicode/char/2772 '.
	self assert: (issues at: 6) = '#a88 http://www.fileformat.info/info/unicode/char/3015 http://www.fileformat.info/info/unicode/char/2773 '.
	self assert: (issues at: 7) = '#a89 http://www.fileformat.info/info/unicode/char/27C4 http://www.fileformat.info/info/unicode/char/2768 '.
	self assert: (issues at: 8) = '#a90 http://www.fileformat.info/info/unicode/char/27C5 http://www.fileformat.info/info/unicode/char/2769 '.
	self assert: (issues at: 9) = '#a91 http://www.fileformat.info/info/unicode/char/27C6 http://www.fileformat.info/info/unicode/char/276C '.
	self assert: (issues at: 10) = '#a92 http://www.fileformat.info/info/unicode/char/27C7 http://www.fileformat.info/info/unicode/char/276D '.
	self assert: (issues at: 11) = '#a93 http://www.fileformat.info/info/unicode/char/27C8 http://www.fileformat.info/info/unicode/char/276A '.
	self assert: (issues at: 12) = '#a94 http://www.fileformat.info/info/unicode/char/27C9 http://www.fileformat.info/info/unicode/char/276B '.
	self assert: (issues at: 13) = '#a95 http://www.fileformat.info/info/unicode/char/27CA http://www.fileformat.info/info/unicode/char/2774 '.
	self assert: (issues at: 14) = '#a96 http://www.fileformat.info/info/unicode/char/27CB http://www.fileformat.info/info/unicode/char/2775 '.
	self assert: (issues at: 15) = '#arrowhorizex http://www.fileformat.info/info/unicode/char/F7E1 http://www.fileformat.info/info/unicode/char/F8E7 '.
	self assert: (issues at: 16) = '#arrowvertex http://www.fileformat.info/info/unicode/char/F7E0 http://www.fileformat.info/info/unicode/char/F8E6 '.
	self assert: (issues at: 17) = '#braceex http://www.fileformat.info/info/unicode/char/F7F1 http://www.fileformat.info/info/unicode/char/F8F4 '.
	self assert: (issues at: 18) = '#braceleftbt http://www.fileformat.info/info/unicode/char/F7F0 http://www.fileformat.info/info/unicode/char/F8F3 '.
	self assert: (issues at: 19) = '#braceleftmid http://www.fileformat.info/info/unicode/char/F7EF http://www.fileformat.info/info/unicode/char/F8F2 '.
	self assert: (issues at: 20) = '#bracelefttp http://www.fileformat.info/info/unicode/char/F7EE http://www.fileformat.info/info/unicode/char/F8F1 '.
	self assert: (issues at: 21) = '#bracerightbt http://www.fileformat.info/info/unicode/char/F7FD http://www.fileformat.info/info/unicode/char/F8FE '.
	self assert: (issues at: 22) = '#bracerightmid http://www.fileformat.info/info/unicode/char/F7FC http://www.fileformat.info/info/unicode/char/F8FD '.
	self assert: (issues at: 23) = '#bracerighttp http://www.fileformat.info/info/unicode/char/F7FB http://www.fileformat.info/info/unicode/char/F8FC '.
	self assert: (issues at: 24) = '#bracketleftbt http://www.fileformat.info/info/unicode/char/F7ED http://www.fileformat.info/info/unicode/char/F8F0 '.
	self assert: (issues at: 25) = '#bracketleftex http://www.fileformat.info/info/unicode/char/F7EC http://www.fileformat.info/info/unicode/char/F8EF '.
	self assert: (issues at: 26) = '#bracketlefttp http://www.fileformat.info/info/unicode/char/F7EB http://www.fileformat.info/info/unicode/char/F8EE '.
	self assert: (issues at: 27) = '#bracketrightbt http://www.fileformat.info/info/unicode/char/F7FA http://www.fileformat.info/info/unicode/char/F8FB '.
	self assert: (issues at: 28) = '#bracketrightex http://www.fileformat.info/info/unicode/char/F7F9 http://www.fileformat.info/info/unicode/char/F8FA '.
	self assert: (issues at: 29) = '#bracketrighttp http://www.fileformat.info/info/unicode/char/F7F8 http://www.fileformat.info/info/unicode/char/F8F9 '.
	self assert: (issues at: 30) = '#copyrightsans http://www.fileformat.info/info/unicode/char/F701 http://www.fileformat.info/info/unicode/char/F8E9 '.
	self assert: (issues at: 31) = '#copyrightserif http://www.fileformat.info/info/unicode/char/A9 http://www.fileformat.info/info/unicode/char/F6D9 '.
	self assert: (issues at: 32) = '#fraction http://www.fileformat.info/info/unicode/char/2215 http://www.fileformat.info/info/unicode/char/2044 '.
	self assert: (issues at: 33) = '#integralex http://www.fileformat.info/info/unicode/char/F7F3 http://www.fileformat.info/info/unicode/char/F8F5 '.
	self assert: (issues at: 34) = '#mu http://www.fileformat.info/info/unicode/char/3BC http://www.fileformat.info/info/unicode/char/B5 '.
	self assert: (issues at: 35) = '#parenleftbt http://www.fileformat.info/info/unicode/char/F7EA http://www.fileformat.info/info/unicode/char/F8ED '.
	self assert: (issues at: 36) = '#parenleftex http://www.fileformat.info/info/unicode/char/F7E9 http://www.fileformat.info/info/unicode/char/F8EC '.
	self assert: (issues at: 37) = '#parenlefttp http://www.fileformat.info/info/unicode/char/F7E8 http://www.fileformat.info/info/unicode/char/F8EB '.
	self assert: (issues at: 38) = '#parenrightbt http://www.fileformat.info/info/unicode/char/F7F7 http://www.fileformat.info/info/unicode/char/F8F8 '.
	self assert: (issues at: 39) = '#parenrightex http://www.fileformat.info/info/unicode/char/F7F6 http://www.fileformat.info/info/unicode/char/F8F7 '.
	self assert: (issues at: 40) = '#parenrighttp http://www.fileformat.info/info/unicode/char/F7F5 http://www.fileformat.info/info/unicode/char/F8F6 '.
	self assert: (issues at: 41) = '#radicalex http://www.fileformat.info/info/unicode/char/203E http://www.fileformat.info/info/unicode/char/F8E5 '.
	self assert: (issues at: 42) = '#registersans http://www.fileformat.info/info/unicode/char/F700 http://www.fileformat.info/info/unicode/char/F8E8 '.
	self assert: (issues at: 43) = '#registerserif http://www.fileformat.info/info/unicode/char/AE http://www.fileformat.info/info/unicode/char/F6DA '.
	self assert: (issues at: 44) = '#trademarksans http://www.fileformat.info/info/unicode/char/F702 http://www.fileformat.info/info/unicode/char/F8EA '.
	self assert: (issues at: 45) = '#trademarkserif http://www.fileformat.info/info/unicode/char/2122 http://www.fileformat.info/info/unicode/char/F6DB '.

	"3. there are a lot more characters in the Adobe encoding"
	self assert: Decodings size = 563.
	self assert: PSCharacterNames nameToUnicode size = 4483
]

{ #category : #tests }
PSCharacterNamingTests >> testPrivateUseAreaNames [
	"The old and new encoding use characters from the Private Use Areas (PUA),
	but that are not many, so that omitting them does not have much effect"

	| isPrivateUseBlock privateUseOld privateUseNew privateUseForNewFonts |
	isPrivateUseBlock := [:code |
	(code between: 16rE000 and: 16rF8FF) or: [
	(code between: 16rF0000 and: 16rFFFFD) or: [
	code between: 16r100000 and: 16r10FFFD]]].
	privateUseOld := Decodings associations select: [:assoc |
		isPrivateUseBlock value: assoc value].
	self assert: privateUseOld size = 26.
	self assert: (privateUseOld collect: #key) sorted asArray = #(#apple #arrowhorizex #arrowvertex #braceex #braceleftbt #braceleftmid #bracelefttp #bracerightbt #bracerightmid #bracerighttp #bracketleftbt #bracketleftex #bracketlefttp #bracketrightbt #bracketrightex #bracketrighttp #copyrightsans #integralex #parenleftbt #parenleftex #parenlefttp #parenrightbt #parenrightex #parenrighttp #registersans #trademarksans).
	privateUseNew := PSCharacterNames nameToUnicode associations select: [:assoc |
		isPrivateUseBlock value: assoc value].
	self assert: privateUseNew size = 192.
	privateUseForNewFonts := PSCharacterNames adobeGlyphDecodingForNewFonts associations select: [:assoc |
		isPrivateUseBlock value: assoc value].
	self assert: privateUseForNewFonts isEmpty
]

{ #category : #'test fonts' }
PSCharacterNamingTests >> testStandardFontsGlyphNames [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #abreve #Abreve #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #amacron #Amacron #ampersand #aogonek #Aogonek #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #cacute #Cacute #caron #ccaron #Ccaron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #commaaccent #copyright #currency #d #D #dagger #daggerdbl #dcaron #Dcaron #dcroat #Dcroat #degree #Delta #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecaron #Ecaron #ecircumflex #Ecircumflex #edieresis #Edieresis #edotaccent #Edotaccent #egrave #Egrave #eight #ellipsis #emacron #Emacron #emdash #endash #eogonek #Eogonek #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #gbreve #Gbreve #gcommaaccent #Gcommaaccent #germandbls #grave #greater #greaterequal #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #Idotaccent #igrave #Igrave #imacron #Imacron #iogonek #Iogonek #j #J #k #K #kcommaaccent #Kcommaaccent #l #L #lacute #Lacute #lcaron #Lcaron #lcommaaccent #Lcommaaccent #less #lessequal #logicalnot #lozenge #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nacute #Nacute #ncaron #Ncaron #ncommaaccent #Ncommaaccent #nine #notequal #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #ohungarumlaut #Ohungarumlaut #omacron #Omacron #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #partialdiff #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #racute #Racute #radical #rcaron #Rcaron #rcommaaccent #Rcommaaccent #registered #ring #s #S #sacute #Sacute #scaron #Scaron #scedilla #Scedilla #scommaaccent #Scommaaccent #section #semicolon #seven #six #slash #space #sterling #summation #t #T #tcaron #Tcaron #tcommaaccent #Tcommaaccent #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #uhungarumlaut #Uhungarumlaut #umacron #Umacron #underscore #uogonek #Uogonek #uring #Uring #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zacute #Zacute #zcaron #Zcaron #zdotaccent #Zdotaccent #zero) asSet.
	self assert: used size = 315.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 92.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#abreve #Abreve #amacron #Amacron #aogonek #Aogonek #brokenbar #cacute #Cacute #ccaron #Ccaron #commaaccent #dcaron #Dcaron #dcroat #Dcroat #ecaron #Ecaron #edotaccent #Edotaccent #emacron #Emacron #eogonek #Eogonek #eth #Eth #Euro #gbreve #Gbreve #gcommaaccent #Gcommaaccent #Idotaccent #imacron #Imacron #iogonek #Iogonek #kcommaaccent #Kcommaaccent #lacute #Lacute #lcaron #Lcaron #lcommaaccent #Lcommaaccent #nacute #Nacute #ncaron #Ncaron #ncommaaccent #Ncommaaccent #ohungarumlaut #Ohungarumlaut #omacron #Omacron #onehalf #onequarter #onesuperior #racute #Racute #rcaron #Rcaron #rcommaaccent #Rcommaaccent #sacute #Sacute #scedilla #Scedilla #scommaaccent #Scommaaccent #tcaron #Tcaron #tcommaaccent #Tcommaaccent #thorn #Thorn #threequarters #threesuperior #twosuperior #uhungarumlaut #Uhungarumlaut #umacron #Umacron #uogonek #Uogonek #uring #Uring #yacute #Yacute #zacute #Zacute #zdotaccent #Zdotaccent)
]

{ #category : #'test fonts' }
PSCharacterNamingTests >> testSymbol [
	| used notInOld notInNew |
	used := #(#aleph #alpha #Alpha #ampersand #angle #angleleft #angleright #apple #approxequal #arrowboth #arrowdblboth #arrowdbldown #arrowdblleft #arrowdblright #arrowdblup #arrowdown #arrowhorizex #arrowleft #arrowright #arrowup #arrowvertex #asteriskmath #bar #beta #Beta #braceex #braceleft #braceleftbt #braceleftmid #bracelefttp #braceright #bracerightbt #bracerightmid #bracerighttp #bracketleft #bracketleftbt #bracketleftex #bracketlefttp #bracketright #bracketrightbt #bracketrightex #bracketrighttp #bullet #carriagereturn #chi #Chi #circlemultiply #circleplus #club #colon #comma #congruent #copyrightsans #copyrightserif #degree #delta #Delta #diamond #divide #dotmath #eight #element #ellipsis #emptyset #epsilon #Epsilon #equal #equivalence #eta #Eta #Euro #exclam #existential #five #florin #four #fraction #gamma #Gamma #gradient #greater #greaterequal #heart #Ifraktur #infinity #integral #integralbt #integralex #integraltp #intersection #iota #Iota #kappa #Kappa #lambda #Lambda #less #lessequal #logicaland #logicalnot #logicalor #lozenge #minus #minute #mu #Mu #multiply #nine #notelement #notequal #notsubset #nu #Nu #numbersign #omega #Omega #omega1 #omicron #Omicron #one #parenleft #parenleftbt #parenleftex #parenlefttp #parenright #parenrightbt #parenrightex #parenrighttp #partialdiff #percent #period #perpendicular #phi #Phi #phi1 #pi #Pi #plus #plusminus #product #propersubset #propersuperset #proportional #psi #Psi #question #radical #radicalex #reflexsubset #reflexsuperset #registersans #registerserif #Rfraktur #rho #Rho #second #semicolon #seven #sigma #Sigma #sigma1 #similar #six #slash #space #spade #suchthat #summation #tau #Tau #therefore #theta #Theta #theta1 #three #trademarksans #trademarkserif #two #underscore #union #universal #upsilon #Upsilon #Upsilon1 #weierstrass #xi #Xi #zero #zeta #Zeta) asSet.
	self assert: used size = 190.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld asArray = #(#Euro).
	self assert: notInNew isEmpty
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWCourier [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #arrowboth #arrowdown #arrowleft #arrowright #arrowup #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #center #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #dectab #degree #dieresis #divide #dollar #dotaccent #dotlessi #down #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #format #four #fraction #g #G #gcaron #Gcaron #germandbls #grave #graybox #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #Idot #igrave #Igrave #ij #IJ #indent #j #J #k #K #l #L #largebullet #left #less #lira #ll #LL #logicalnot #lslash #Lslash #m #M #macron #merge #minus #mu #multiply #n #N #nine #notegraphic #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #overscore #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #prescription #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #return #ring #s #S #scaron #Scaron #scedilla #Scedilla #section #semicolon #seven #six #slash #space #square #sterling #stop #t #T #tab #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #up #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 261.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 41.
	self assert: notInNew size = 15.
	self assert: notInNew asArray sorted = #(#center #dectab #down #format #graybox #indent #largebullet #left #merge #notegraphic #return #square #stop #tab #up)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWCourierBold [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #arrowboth #arrowdown #arrowleft #arrowright #arrowup #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #center #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #dectab #degree #dieresis #divide #dollar #dotaccent #dotlessi #down #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #format #four #fraction #g #G #gcaron #Gcaron #germandbls #grave #graybox #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #Idot #igrave #Igrave #ij #IJ #indent #j #J #k #K #l #L #largebullet #left #less #lira #ll #LL #logicalnot #lslash #Lslash #m #M #macron #merge #minus #mu #multiply #n #N #nine #notegraphic #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #overscore #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #prescription #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #return #ring #s #S #scaron #Scaron #scedilla #Scedilla #section #semicolon #seven #six #slash #space #square #sterling #stop #t #T #tab #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #up #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 261.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 41.
	self assert: notInNew size = 15.
	self assert: notInNew asArray sorted = #(#center #dectab #down #format #graybox #indent #largebullet #left #merge #notegraphic #return #square #stop #tab #up)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWCourierBoldOblique [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #arrowboth #arrowdown #arrowleft #arrowright #arrowup #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #center #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #dectab #degree #dieresis #divide #dollar #dotaccent #dotlessi #down #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #format #four #fraction #g #G #gcaron #Gcaron #germandbls #grave #graybox #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #Idot #igrave #Igrave #ij #IJ #indent #j #J #k #K #l #L #largebullet #left #less #lira #ll #LL #logicalnot #lslash #Lslash #m #M #macron #merge #minus #mu #multiply #n #N #nine #notegraphic #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #overscore #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #prescription #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #return #ring #s #S #scaron #Scaron #scedilla #Scedilla #section #semicolon #seven #six #slash #space #square #sterling #stop #t #T #tab #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #up #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 261.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 41.
	self assert: notInNew size = 15.
	self assert: notInNew asArray sorted = #(#center #dectab #down #format #graybox #indent #largebullet #left #merge #notegraphic #return #square #stop #tab #up)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWCourierOblique [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #arrowboth #arrowdown #arrowleft #arrowright #arrowup #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #center #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #dectab #degree #dieresis #divide #dollar #dotaccent #dotlessi #down #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #format #four #fraction #g #G #gcaron #Gcaron #germandbls #grave #graybox #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #Idot #igrave #Igrave #ij #IJ #indent #j #J #k #K #l #L #largebullet #left #less #lira #ll #LL #logicalnot #lslash #Lslash #m #M #macron #merge #minus #mu #multiply #n #N #nine #notegraphic #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #overscore #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #prescription #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #return #ring #s #S #scaron #Scaron #scedilla #Scedilla #section #semicolon #seven #six #slash #space #square #sterling #stop #t #T #tab #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #up #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 261.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 41.
	self assert: notInNew size = 15.
	self assert: notInNew asArray sorted = #(#center #dectab #down #format #graybox #indent #largebullet #left #merge #notegraphic #return #square #stop #tab #up)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWHelvetica [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWHelveticaBold [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWHelveticaBoldOblique [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWHelveticaOblique [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWSymbol [
	| used notInOld notInNew |
	used := #(#aleph #alpha #Alpha #ampersand #angle #angleleft #angleright #apple #approxequal #arrowboth #arrowdblboth #arrowdbldown #arrowdblleft #arrowdblright #arrowdblup #arrowdown #arrowhorizex #arrowleft #arrowright #arrowup #arrowvertex #asteriskmath #bar #beta #Beta #braceex #braceleft #braceleftbt #braceleftmid #bracelefttp #braceright #bracerightbt #bracerightmid #bracerighttp #bracketleft #bracketleftbt #bracketleftex #bracketlefttp #bracketright #bracketrightbt #bracketrightex #bracketrighttp #bullet #carriagereturn #chi #Chi #circlemultiply #circleplus #club #colon #comma #congruent #copyrightsans #copyrightserif #degree #delta #Delta #diamond #divide #dotmath #eight #element #ellipsis #emptyset #epsilon #Epsilon #equal #equivalence #eta #Eta #Euro #exclam #existential #five #florin #four #fraction #gamma #Gamma #gradient #greater #greaterequal #heart #Ifraktur #infinity #integral #integralbt #integralex #integraltp #intersection #iota #Iota #kappa #Kappa #lambda #Lambda #less #lessequal #logicaland #logicalnot #logicalor #lozenge #minus #minute #mu #Mu #multiply #nine #notelement #notequal #notsubset #nu #Nu #numbersign #omega #Omega #omega1 #omicron #Omicron #one #parenleft #parenleftbt #parenleftex #parenlefttp #parenright #parenrightbt #parenrightex #parenrighttp #partialdiff #percent #period #perpendicular #phi #Phi #phi1 #pi #Pi #plus #plusminus #product #propersubset #propersuperset #proportional #psi #Psi #question #radical #radicalex #reflexsubset #reflexsuperset #registersans #registerserif #Rfraktur #rho #Rho #second #semicolon #seven #sigma #Sigma #sigma1 #similar #six #slash #space #spade #suchthat #summation #tau #Tau #therefore #theta #Theta #theta1 #three #trademarksans #trademarkserif #two #underscore #union #universal #upsilon #Upsilon #Upsilon1 #weierstrass #xi #Xi #zero #zeta #Zeta) asSet.
	self assert: used size = 190.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld asArray = #(#Euro).
	self assert: notInNew isEmpty
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWTimesBold [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWTimesBoldItalic [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWTimesItalic [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWTimesRoman [
	| used notInOld notInNew |
	used := #(#a #A #aacute #Aacute #acircumflex #Acircumflex #acute #adieresis #Adieresis #ae #AE #agrave #Agrave #ampersand #aring #Aring #asciicircum #asciitilde #asterisk #at #atilde #Atilde #b #B #backslash #bar #braceleft #braceright #bracketleft #bracketright #breve #brokenbar #bullet #c #C #caron #ccedilla #Ccedilla #cedilla #cent #circumflex #colon #comma #copyright #currency #d #D #dagger #daggerdbl #degree #dieresis #divide #dollar #dotaccent #dotlessi #e #E #eacute #Eacute #ecircumflex #Ecircumflex #edieresis #Edieresis #egrave #Egrave #eight #ellipsis #emdash #endash #equal #eth #Eth #Euro #exclam #exclamdown #f #F #fi #five #fl #florin #four #fraction #g #G #germandbls #grave #greater #guillemotleft #guillemotright #guilsinglleft #guilsinglright #h #H #hungarumlaut #hyphen #i #I #iacute #Iacute #icircumflex #Icircumflex #idieresis #Idieresis #igrave #Igrave #j #J #k #K #l #L #less #logicalnot #lslash #Lslash #m #M #macron #minus #mu #multiply #n #N #nine #ntilde #Ntilde #numbersign #o #O #oacute #Oacute #ocircumflex #Ocircumflex #odieresis #Odieresis #oe #OE #ogonek #ograve #Ograve #one #onehalf #onequarter #onesuperior #ordfeminine #ordmasculine #oslash #Oslash #otilde #Otilde #p #P #paragraph #parenleft #parenright #percent #period #periodcentered #perthousand #plus #plusminus #q #Q #question #questiondown #quotedbl #quotedblbase #quotedblleft #quotedblright #quoteleft #quoteright #quotesinglbase #quotesingle #r #R #registered #ring #s #S #scaron #Scaron #section #semicolon #seven #six #slash #space #sterling #t #T #thorn #Thorn #three #threequarters #threesuperior #tilde #trademark #two #twosuperior #u #U #uacute #Uacute #ucircumflex #Ucircumflex #udieresis #Udieresis #ugrave #Ugrave #underscore #v #V #w #W #x #X #y #Y #yacute #Yacute #ydieresis #Ydieresis #yen #z #Z #zcaron #Zcaron #zero) asSet.
	self assert: used size = 229.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld size = 14.
	self assert: notInNew isEmpty.
	self assert: notInOld asArray sorted = #(#brokenbar #eth #Eth #Euro #onehalf #onequarter #onesuperior #thorn #Thorn #threequarters #threesuperior #twosuperior #yacute #Yacute)
]

{ #category : #'test VW fonts' }
PSCharacterNamingTests >> testVWZapfDingbats [
	| used notInOld notInNew |
	used := #(#a1 #a10 #a100 #a101 #a102 #a103 #a104 #a105 #a106 #a107 #a108 #a109 #a11 #a110 #a111 #a112 #a117 #a118 #a119 #a12 #a120 #a121 #a122 #a123 #a124 #a125 #a126 #a127 #a128 #a129 #a13 #a130 #a131 #a132 #a133 #a134 #a135 #a136 #a137 #a138 #a139 #a14 #a140 #a141 #a142 #a143 #a144 #a145 #a146 #a147 #a148 #a149 #a15 #a150 #a151 #a152 #a153 #a154 #a155 #a156 #a157 #a158 #a159 #a16 #a160 #a161 #a162 #a163 #a164 #a165 #a166 #a167 #a168 #a169 #a17 #a170 #a171 #a172 #a173 #a174 #a175 #a176 #a177 #a178 #a179 #a18 #a180 #a181 #a182 #a183 #a184 #a185 #a186 #a187 #a188 #a189 #a19 #a190 #a191 #a192 #a193 #a194 #a195 #a196 #a197 #a198 #a199 #a2 #a20 #a200 #a201 #a202 #a203 #a204 #a205 #a206 #a21 #a22 #a23 #a24 #a25 #a26 #a27 #a28 #a29 #a3 #a30 #a31 #a32 #a33 #a34 #a35 #a36 #a37 #a38 #a39 #a4 #a40 #a41 #a42 #a43 #a44 #a45 #a46 #a47 #a48 #a49 #a5 #a50 #a51 #a52 #a53 #a54 #a55 #a56 #a57 #a58 #a59 #a6 #a60 #a61 #a62 #a63 #a64 #a65 #a66 #a67 #a68 #a69 #a7 #a70 #a71 #a72 #a73 #a74 #a75 #a76 #a77 #a78 #a79 #a8 #a81 #a82 #a83 #a84 #a85 #a86 #a87 #a88 #a89 #a9 #a90 #a91 #a92 #a93 #a94 #a95 #a96 #a97 #a98 #a99 #space) asSet.
	self assert: used size = 202.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld isEmpty.
	self assert: notInNew isEmpty
]

{ #category : #'test fonts' }
PSCharacterNamingTests >> testZapfDingbats [
	"all ZapfDingbats characters are encoded by the old and new encoding, but not by the EncodingForNewFonts"

	| used notInOld notInNew |
	used := #(#a1 #a10 #a100 #a101 #a102 #a103 #a104 #a105 #a106 #a107 #a108 #a109 #a11 #a110 #a111 #a112 #a117 #a118 #a119 #a12 #a120 #a121 #a122 #a123 #a124 #a125 #a126 #a127 #a128 #a129 #a13 #a130 #a131 #a132 #a133 #a134 #a135 #a136 #a137 #a138 #a139 #a14 #a140 #a141 #a142 #a143 #a144 #a145 #a146 #a147 #a148 #a149 #a15 #a150 #a151 #a152 #a153 #a154 #a155 #a156 #a157 #a158 #a159 #a16 #a160 #a161 #a162 #a163 #a164 #a165 #a166 #a167 #a168 #a169 #a17 #a170 #a171 #a172 #a173 #a174 #a175 #a176 #a177 #a178 #a179 #a18 #a180 #a181 #a182 #a183 #a184 #a185 #a186 #a187 #a188 #a189 #a19 #a190 #a191 #a192 #a193 #a194 #a195 #a196 #a197 #a198 #a199 #a2 #a20 #a200 #a201 #a202 #a203 #a204 #a205 #a206 #a21 #a22 #a23 #a24 #a25 #a26 #a27 #a28 #a29 #a3 #a30 #a31 #a32 #a33 #a34 #a35 #a36 #a37 #a38 #a39 #a4 #a40 #a41 #a42 #a43 #a44 #a45 #a46 #a47 #a48 #a49 #a5 #a50 #a51 #a52 #a53 #a54 #a55 #a56 #a57 #a58 #a59 #a6 #a60 #a61 #a62 #a63 #a64 #a65 #a66 #a67 #a68 #a69 #a7 #a70 #a71 #a72 #a73 #a74 #a75 #a76 #a77 #a78 #a79 #a8 #a81 #a82 #a83 #a84 #a85 #a86 #a87 #a88 #a89 #a9 #a90 #a91 #a92 #a93 #a94 #a95 #a96 #a97 #a98 #a99 #space) asSet.
	self assert: used size = 202.
	notInOld := used - Decodings keys.
	notInNew := used - PSCharacterNames nameToUnicode keys.
	self assert: notInOld isEmpty.
	self assert: notInNew isEmpty
]

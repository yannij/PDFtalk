Extension { #name : #PtFCustomFont }

{ #category : #'*PDFtalk-test resources-fonts' }
PtFCustomFont class >> nimbusSansLRegu [
	"one of the Adobe core 35 fonts.
	Free with the GNU General Public License (see method comment of #nimbusSansLReguCOPYING) - part of the GhostScript package"

	<font: #NimbusSansLRegu>
	^self file: 'uhvr8a' pfb: self nimbusSansLReguPfb afm: self nimbusSansLReguAfm
]

{ #category : #'*PDFtalk-test resources-fonts' }
PtFCustomFont class >> nimbusSansLReguAfm [
	^'StartFontMetrics 3.0
Comment Copyright (URW)++,Copyright 1999 by (URW)++ Design & Development
Comment Creation Date: 12/22/1999
Comment See the file COPYING (GNU General Public License) for license conditions.
FontName NimbusSanL-Regu
FullName Nimbus Sans L Regular
FamilyName Nimbus Sans L
Weight Regular
ItalicAngle 0.0
IsFixedPitch false
UnderlinePosition -151
UnderlineThickness 50
Version 1.05
Notice (URW)++,Copyright 1999 by (URW)++ Design & Development
EncodingScheme AdobeStandardEncoding
FontBBox -174 -285 1001 953
CapHeight 729
XHeight 524
Descender -218
Ascender 729
StartCharMetrics 316
C 32 ; WX 278 ; N space ; B 191 0 191 0 ;
C 33 ; WX 278 ; N exclam ; B 124 0 208 729 ;
C 34 ; WX 355 ; N quotedbl ; B 52 464 305 709 ;
C 35 ; WX 556 ; N numbersign ; B 14 -20 542 697 ;
C 36 ; WX 556 ; N dollar ; B 26 -126 518 770 ;
C 37 ; WX 889 ; N percent ; B 29 -20 859 709 ;
C 38 ; WX 667 ; N ampersand ; B 52 -23 637 709 ;
C 39 ; WX 221 ; N quoteright ; B 64 497 157 729 ;
C 40 ; WX 333 ; N parenleft ; B 73 -212 291 729 ;
C 41 ; WX 333 ; N parenright ; B 38 -212 256 729 ;
C 42 ; WX 389 ; N asterisk ; B 40 441 343 729 ;
C 43 ; WX 584 ; N plus ; B 50 -10 534 474 ;
C 44 ; WX 278 ; N comma ; B 87 -147 192 104 ;
C 45 ; WX 333 ; N hyphen ; B 46 240 284 312 ;
C 46 ; WX 278 ; N period ; B 87 0 191 104 ;
C 47 ; WX 278 ; N slash ; B -8 -20 284 729 ;
C 48 ; WX 556 ; N zero ; B 43 -23 507 709 ;
C 49 ; WX 556 ; N one ; B 102 0 347 709 ;
C 50 ; WX 556 ; N two ; B 34 0 511 709 ;
C 51 ; WX 556 ; N three ; B 32 -23 506 709 ;
C 52 ; WX 556 ; N four ; B 28 0 520 709 ;
C 53 ; WX 556 ; N five ; B 35 -23 513 709 ;
C 54 ; WX 556 ; N six ; B 43 -23 513 709 ;
C 55 ; WX 556 ; N seven ; B 46 0 520 709 ;
C 56 ; WX 556 ; N eight ; B 37 -23 513 709 ;
C 57 ; WX 556 ; N nine ; B 38 -23 509 709 ;
C 58 ; WX 278 ; N colon ; B 110 0 214 524 ;
C 59 ; WX 278 ; N semicolon ; B 110 -147 215 524 ;
C 60 ; WX 584 ; N less ; B 45 -9 534 474 ;
C 61 ; WX 584 ; N equal ; B 50 111 534 353 ;
C 62 ; WX 584 ; N greater ; B 50 -9 539 474 ;
C 63 ; WX 556 ; N question ; B 77 0 509 741 ;
C 64 ; WX 1015 ; N at ; B 34 -142 951 741 ;
C 65 ; WX 667 ; N A ; B 17 0 653 729 ;
C 66 ; WX 667 ; N B ; B 79 0 623 729 ;
C 67 ; WX 722 ; N C ; B 48 -23 677 741 ;
C 68 ; WX 722 ; N D ; B 89 0 667 729 ;
C 69 ; WX 667 ; N E ; B 90 0 613 729 ;
C 70 ; WX 611 ; N F ; B 90 0 579 729 ;
C 71 ; WX 778 ; N G ; B 44 -23 709 741 ;
C 72 ; WX 722 ; N H ; B 83 0 644 729 ;
C 73 ; WX 278 ; N I ; B 100 0 194 729 ;
C 74 ; WX 500 ; N J ; B 17 -23 426 729 ;
C 75 ; WX 667 ; N K ; B 79 0 658 729 ;
C 76 ; WX 556 ; N L ; B 80 0 533 729 ;
C 77 ; WX 833 ; N M ; B 75 0 761 729 ;
C 78 ; WX 722 ; N N ; B 76 0 646 729 ;
C 79 ; WX 778 ; N O ; B 38 -23 742 741 ;
C 80 ; WX 667 ; N P ; B 91 0 617 729 ;
C 81 ; WX 778 ; N Q ; B 38 -59 742 741 ;
C 82 ; WX 722 ; N R ; B 93 0 679 729 ;
C 83 ; WX 667 ; N S ; B 48 -23 621 741 ;
C 84 ; WX 611 ; N T ; B 21 0 593 729 ;
C 85 ; WX 722 ; N U ; B 85 -23 645 729 ;
C 86 ; WX 667 ; N V ; B 30 0 645 729 ;
C 87 ; WX 944 ; N W ; B 22 0 929 729 ;
C 88 ; WX 667 ; N X ; B 22 0 649 729 ;
C 89 ; WX 667 ; N Y ; B 13 0 661 729 ;
C 90 ; WX 611 ; N Z ; B 28 0 583 729 ;
C 91 ; WX 278 ; N bracketleft ; B 64 -212 250 729 ;
C 92 ; WX 278 ; N backslash ; B -8 -20 284 729 ;
C 93 ; WX 278 ; N bracketright ; B 23 -212 209 729 ;
C 94 ; WX 469 ; N asciicircum ; B 44 329 425 709 ;
C 95 ; WX 556 ; N underscore ; B -22 -176 578 -126 ;
C 96 ; WX 222 ; N quoteleft ; B 65 477 158 709 ;
C 97 ; WX 556 ; N a ; B 42 -23 535 539 ;
C 98 ; WX 556 ; N b ; B 54 -23 523 729 ;
C 99 ; WX 500 ; N c ; B 31 -23 477 539 ;
C 100 ; WX 556 ; N d ; B 26 -23 495 729 ;
C 101 ; WX 556 ; N e ; B 40 -23 513 539 ;
C 102 ; WX 278 ; N f ; B 18 0 258 732 ;
C 103 ; WX 556 ; N g ; B 29 -218 489 539 ;
C 104 ; WX 556 ; N h ; B 70 0 486 729 ;
C 105 ; WX 222 ; N i ; B 66 0 150 729 ;
C 106 ; WX 222 ; N j ; B -18 -218 153 729 ;
C 107 ; WX 500 ; N k ; B 58 0 502 729 ;
C 108 ; WX 222 ; N l ; B 68 0 152 729 ;
C 109 ; WX 833 ; N m ; B 70 0 762 539 ;
C 110 ; WX 556 ; N n ; B 70 0 487 539 ;
C 111 ; WX 556 ; N o ; B 36 -23 510 539 ;
C 112 ; WX 556 ; N p ; B 54 -218 523 539 ;
C 113 ; WX 556 ; N q ; B 26 -218 495 539 ;
C 114 ; WX 333 ; N r ; B 69 0 321 539 ;
C 115 ; WX 500 ; N s ; B 34 -23 459 539 ;
C 116 ; WX 278 ; N t ; B 14 -23 254 668 ;
C 117 ; WX 556 ; N u ; B 65 -23 482 524 ;
C 118 ; WX 500 ; N v ; B 10 0 486 524 ;
C 119 ; WX 722 ; N w ; B 6 0 708 524 ;
C 120 ; WX 500 ; N x ; B 17 0 473 524 ;
C 121 ; WX 500 ; N y ; B 20 -218 478 524 ;
C 122 ; WX 500 ; N z ; B 31 0 457 524 ;
C 123 ; WX 334 ; N braceleft ; B 43 -212 276 729 ;
C 124 ; WX 260 ; N bar ; B 100 -212 160 729 ;
C 125 ; WX 334 ; N braceright ; B 29 -212 262 729 ;
C 126 ; WX 584 ; N asciitilde ; B 75 268 508 438 ;
C 161 ; WX 333 ; N exclamdown ; B 121 -205 205 524 ;
C 162 ; WX 556 ; N cent ; B 52 -120 510 628 ;
C 163 ; WX 556 ; N sterling ; B 26 -23 535 729 ;
C 164 ; WX 167 ; N fraction ; B -174 -20 336 709 ;
C 165 ; WX 556 ; N yen ; B 11 0 545 709 ;
C 166 ; WX 556 ; N florin ; B 11 -212 542 738 ;
C 167 ; WX 556 ; N section ; B 43 -213 506 729 ;
C 168 ; WX 556 ; N currency ; B 67 133 489 551 ;
C 169 ; WX 191 ; N quotesingle ; B 48 464 142 709 ;
C 170 ; WX 333 ; N quotedblleft ; B 48 477 299 709 ;
C 171 ; WX 556 ; N guillemotleft ; B 98 106 455 438 ;
C 172 ; WX 333 ; N guilsinglleft ; B 91 106 243 438 ;
C 173 ; WX 333 ; N guilsinglright ; B 85 106 239 438 ;
C 174 ; WX 500 ; N fi ; B 12 0 436 732 ;
C 175 ; WX 500 ; N fl ; B 17 0 430 732 ;
C 177 ; WX 556 ; N endash ; B -5 240 561 312 ;
C 178 ; WX 556 ; N dagger ; B 38 -177 513 709 ;
C 179 ; WX 556 ; N daggerdbl ; B 38 -177 513 709 ;
C 180 ; WX 278 ; N periodcentered ; B 87 302 211 427 ;
C 182 ; WX 537 ; N paragraph ; B 48 -177 522 729 ;
C 183 ; WX 350 ; N bullet ; B 50 220 300 470 ;
C 184 ; WX 222 ; N quotesinglbase ; B 64 -128 158 104 ;
C 185 ; WX 333 ; N quotedblbase ; B 47 -128 300 104 ;
C 186 ; WX 333 ; N quotedblright ; B 49 477 302 709 ;
C 187 ; WX 556 ; N guillemotright ; B 98 106 451 438 ;
C 188 ; WX 1000 ; N ellipsis ; B 115 0 885 104 ;
C 189 ; WX 1000 ; N perthousand ; B 9 -22 993 738 ;
C 191 ; WX 611 ; N questiondown ; B 95 -217 528 524 ;
C 193 ; WX 333 ; N grave ; B 22 592 231 740 ;
C 194 ; WX 333 ; N acute ; B 92 592 301 740 ;
C 195 ; WX 333 ; N circumflex ; B 20 591 307 741 ;
C 196 ; WX 333 ; N tilde ; B 5 613 319 717 ;
C 197 ; WX 333 ; N macron ; B 28 631 302 701 ;
C 198 ; WX 333 ; N breve ; B 15 597 316 732 ;
C 199 ; WX 333 ; N dotaccent ; B 115 612 219 716 ;
C 200 ; WX 333 ; N dieresis ; B 30 612 296 715 ;
C 202 ; WX 333 ; N ring ; B 79 579 255 754 ;
C 203 ; WX 333 ; N cedilla ; B 39 -214 287 0 ;
C 205 ; WX 333 ; N hungarumlaut ; B -35 590 348 740 ;
C 206 ; WX 333 ; N ogonek ; B 57 -205 265 0 ;
C 207 ; WX 333 ; N caron ; B 19 591 306 741 ;
C 208 ; WX 1000 ; N emdash ; B -9 240 1001 312 ;
C 225 ; WX 1000 ; N AE ; B 11 0 950 729 ;
C 227 ; WX 370 ; N ordfeminine ; B 37 303 333 742 ;
C 232 ; WX 556 ; N Lslash ; B 0 0 552 729 ;
C 233 ; WX 778 ; N Oslash ; B 30 -23 744 755 ;
C 234 ; WX 1000 ; N OE ; B 43 -20 959 741 ;
C 235 ; WX 365 ; N ordmasculine ; B 40 303 324 742 ;
C 241 ; WX 889 ; N ae ; B 34 -23 845 539 ;
C 245 ; WX 278 ; N dotlessi ; B 94 0 178 524 ;
C 248 ; WX 222 ; N lslash ; B 0 0 212 729 ;
C 249 ; WX 611 ; N oslash ; B 18 -30 529 539 ;
C 250 ; WX 944 ; N oe ; B 40 -23 899 539 ;
C 251 ; WX 611 ; N germandbls ; B 126 -20 566 729 ;
C -1 ; WX 722 ; N Udieresis ; B 85 -23 645 914 ;
C -1 ; WX 722 ; N Uacute ; B 85 -23 645 939 ;
C -1 ; WX 667 ; N Scedilla ; B 45 -214 621 741 ;
C -1 ; WX 611 ; N Tcaron ; B 21 0 593 940 ;
C -1 ; WX 667 ; N Scaron ; B 48 -23 621 940 ;
C -1 ; WX 722 ; N Rcaron ; B 93 0 679 940 ;
C -1 ; WX 722 ; N Racute ; B 93 0 679 939 ;
C -1 ; WX 667 ; N Sacute ; B 48 -23 621 939 ;
C -1 ; WX 778 ; N Otilde ; B 38 -23 742 916 ;
C -1 ; WX 556 ; N ucircumflex ; B 65 -23 482 741 ;
C -1 ; WX 778 ; N Ohungarumlaut ; B 38 -23 742 939 ;
C -1 ; WX 722 ; N Uhungarumlaut ; B 85 -23 645 939 ;
C -1 ; WX 666 ; N Yacute ; B 13 0 661 939 ;
C -1 ; WX 722 ; N Eth ; B 20 0 667 729 ;
C -1 ; WX 722 ; N Dcroat ; B 20 0 667 729 ;
C -1 ; WX 611 ; N Zacute ; B 28 0 583 939 ;
C -1 ; WX 722 ; N Uring ; B 85 -23 645 953 ;
C -1 ; WX 556 ; N gbreve ; B 29 -218 489 732 ;
C -1 ; WX 556 ; N eogonek ; B 40 -204 514 539 ;
C -1 ; WX 556 ; N edotaccent ; B 40 -23 513 716 ;
C -1 ; WX 556 ; N ecaron ; B 40 -23 513 741 ;
C -1 ; WX 722 ; N Ugrave ; B 85 -23 645 939 ;
C -1 ; WX 666 ; N Thorn ; B 91 0 616 729 ;
C -1 ; WX 556 ; N eacute ; B 40 -23 513 740 ;
C -1 ; WX 556 ; N edieresis ; B 40 -23 513 715 ;
C -1 ; WX 635 ; N dcaron ; B 26 -23 648 729 ;
C -1 ; WX 500 ; N ccedilla ; B 31 -214 477 539 ;
C -1 ; WX 500 ; N ccaron ; B 31 -23 477 741 ;
C -1 ; WX 500 ; N cacute ; B 31 -23 477 740 ;
C -1 ; WX 556 ; N aogonek ; B 43 -205 596 539 ;
C -1 ; WX 556 ; N aring ; B 42 -23 535 754 ;
C -1 ; WX 556 ; N atilde ; B 42 -23 535 717 ;
C -1 ; WX 556 ; N abreve ; B 42 -23 535 732 ;
C -1 ; WX 556 ; N egrave ; B 40 -23 513 740 ;
C -1 ; WX 556 ; N agrave ; B 42 -23 535 740 ;
C -1 ; WX 556 ; N aacute ; B 42 -23 535 740 ;
C -1 ; WX 556 ; N adieresis ; B 42 -23 535 715 ;
C -1 ; WX 722 ; N Uogonek ; B 85 -205 645 729 ;
C -1 ; WX 556 ; N ugrave ; B 65 -23 482 740 ;
C -1 ; WX 556 ; N uacute ; B 65 -23 482 740 ;
C -1 ; WX 556 ; N udieresis ; B 65 -23 482 715 ;
C -1 ; WX 308 ; N tcaron ; B 14 -23 321 800 ;
C -1 ; WX 500 ; N scommaaccent ; B 34 -285 459 539 ;
C -1 ; WX 611 ; N Zcaron ; B 28 0 583 940 ;
C -1 ; WX 556 ; N ecircumflex ; B 40 -23 513 741 ;
C -1 ; WX 722 ; N Ucircumflex ; B 85 -23 645 940 ;
C -1 ; WX 556 ; N acircumflex ; B 42 -23 535 741 ;
C -1 ; WX 611 ; N Zdotaccent ; B 28 0 583 915 ;
C -1 ; WX 500 ; N scaron ; B 34 -23 459 741 ;
C -1 ; WX 667 ; N Amacron ; B 17 0 653 900 ;
C -1 ; WX 500 ; N sacute ; B 34 -23 459 740 ;
C -1 ; WX 611 ; N Tcommaaccent ; B 21 -285 593 729 ;
C -1 ; WX 667 ; N Ydieresis ; B 13 0 661 914 ;
C -1 ; WX 555 ; N thorn ; B 54 -218 522 714 ;
C -1 ; WX 667 ; N Emacron ; B 90 0 613 900 ;
C -1 ; WX 778 ; N Ograve ; B 38 -23 742 939 ;
C -1 ; WX 778 ; N Oacute ; B 38 -23 742 939 ;
C -1 ; WX 778 ; N Odieresis ; B 38 -23 742 914 ;
C -1 ; WX 722 ; N Ntilde ; B 76 0 646 916 ;
C -1 ; WX 722 ; N Ncaron ; B 76 0 646 940 ;
C -1 ; WX 722 ; N Nacute ; B 76 0 646 939 ;
C -1 ; WX 556 ; N Lcaron ; B 80 0 533 729 ;
C -1 ; WX 556 ; N Lacute ; B 70 0 533 939 ;
C -1 ; WX 278 ; N Idotaccent ; B 92 0 196 915 ;
C -1 ; WX 333 ; N racute ; B 69 0 331 740 ;
C -1 ; WX 278 ; N Icircumflex ; B -1 0 286 940 ;
C -1 ; WX 556 ; N ohungarumlaut ; B 36 -23 526 740 ;
C -1 ; WX 556 ; N otilde ; B 36 -23 510 717 ;
C -1 ; WX 556 ; N Euro ; B 2 -23 543 709 ;
C -1 ; WX 556 ; N ocircumflex ; B 36 -23 510 741 ;
C -1 ; WX 351 ; N onesuperior ; B 61 284 222 709 ;
C -1 ; WX 351 ; N twosuperior ; B 19 284 326 709 ;
C -1 ; WX 351 ; N threesuperior ; B 16 270 322 709 ;
C -1 ; WX 278 ; N Igrave ; B 1 0 210 939 ;
C -1 ; WX 278 ; N Iacute ; B 71 0 280 939 ;
C -1 ; WX 278 ; N Imacron ; B 20 0 274 900 ;
C -1 ; WX 278 ; N Iogonek ; B 66 -204 234 729 ;
C -1 ; WX 278 ; N Idieresis ; B 9 0 275 907 ;
C -1 ; WX 778 ; N Gbreve ; B 44 -23 709 931 ;
C -1 ; WX 722 ; N Umacron ; B 85 -23 645 900 ;
C -1 ; WX 667 ; N Kcommaaccent ; B 79 -285 658 729 ;
C -1 ; WX 556 ; N ograve ; B 36 -23 510 740 ;
C -1 ; WX 667 ; N Scommaaccent ; B 48 -285 621 741 ;
C -1 ; WX 667 ; N Eogonek ; B 90 -205 652 729 ;
C -1 ; WX 556 ; N oacute ; B 36 -23 510 740 ;
C -1 ; WX 667 ; N Edotaccent ; B 90 0 613 915 ;
C -1 ; WX 222 ; N iogonek ; B 25 -204 190 729 ;
C -1 ; WX 556 ; N gcommaaccent ; B 29 -218 489 817 ;
C -1 ; WX 556 ; N odieresis ; B 36 -23 510 715 ;
C -1 ; WX 556 ; N ntilde ; B 70 0 487 717 ;
C -1 ; WX 556 ; N ncaron ; B 70 0 487 741 ;
C -1 ; WX 667 ; N Ecaron ; B 90 0 613 940 ;
C -1 ; WX 667 ; N Ecircumflex ; B 90 0 613 940 ;
C -1 ; WX 500 ; N scedilla ; B 34 -214 459 539 ;
C -1 ; WX 333 ; N rcaron ; B 48 0 335 741 ;
C -1 ; WX 667 ; N Egrave ; B 90 0 613 939 ;
C -1 ; WX 667 ; N Eacute ; B 90 0 613 939 ;
C -1 ; WX 778 ; N Gcommaaccent ; B 44 -285 709 741 ;
C -1 ; WX 722 ; N Rcommaaccent ; B 93 -285 679 729 ;
C -1 ; WX 667 ; N Edieresis ; B 90 0 613 914 ;
C -1 ; WX 556 ; N nacute ; B 70 0 487 740 ;
C -1 ; WX 556 ; N uogonek ; B 65 -204 521 524 ;
C -1 ; WX 556 ; N umacron ; B 65 -23 482 701 ;
C -1 ; WX 722 ; N Dcaron ; B 89 0 667 940 ;
C -1 ; WX 292 ; N lcaron ; B 68 0 305 729 ;
C -1 ; WX 722 ; N Ccaron ; B 48 -23 677 940 ;
C -1 ; WX 722 ; N Cacute ; B 48 -23 677 939 ;
C -1 ; WX 722 ; N Ccedilla ; B 48 -214 677 741 ;
C -1 ; WX 606 ; N degree ; B 151 383 454 686 ;
C -1 ; WX 667 ; N Aogonek ; B 17 -205 692 729 ;
C -1 ; WX 584 ; N minus ; B 40 197 544 267 ;
C -1 ; WX 584 ; N multiply ; B 95 34 488 427 ;
C -1 ; WX 584 ; N divide ; B 50 0 534 472 ;
C -1 ; WX 667 ; N Aring ; B 17 0 653 953 ;
C -1 ; WX 1000 ; N trademark ; B 63 292 938 729 ;
C -1 ; WX 333 ; N rcommaaccent ; B 65 -285 321 539 ;
C -1 ; WX 222 ; N lacute ; B 63 0 272 939 ;
C -1 ; WX 556 ; N omacron ; B 36 -23 510 701 ;
C -1 ; WX 667 ; N Atilde ; B 17 0 653 916 ;
C -1 ; WX 278 ; N icircumflex ; B -7 0 280 741 ;
C -1 ; WX 278 ; N igrave ; B -5 0 204 740 ;
C -1 ; WX 556 ; N ncommaaccent ; B 70 -285 487 539 ;
C -1 ; WX 222 ; N lcommaaccent ; B 63 -285 163 729 ;
C -1 ; WX 584 ; N plusminus ; B 50 -11 534 623 ;
C -1 ; WX 869 ; N onehalf ; B 61 -20 844 709 ;
C -1 ; WX 869 ; N onequarter ; B 61 -20 849 709 ;
C -1 ; WX 869 ; N threequarters ; B 16 -20 849 709 ;
C -1 ; WX 278 ; N iacute ; B 65 0 274 740 ;
C -1 ; WX 667 ; N Abreve ; B 17 0 653 931 ;
C -1 ; WX 500 ; N kcommaaccent ; B 58 -285 502 729 ;
C -1 ; WX 778 ; N Omacron ; B 38 -23 742 900 ;
C -1 ; WX 222 ; N imacron ; B -16 0 231 701 ;
C -1 ; WX 556 ; N emacron ; B 40 -23 513 701 ;
C -1 ; WX 556 ; N amacron ; B 42 -23 535 701 ;
C -1 ; WX 278 ; N tcommaaccent ; B 14 -285 254 668 ;
C -1 ; WX 500 ; N ydieresis ; B 20 -218 478 715 ;
C -1 ; WX 500 ; N zdotaccent ; B 31 0 457 716 ;
C -1 ; WX 500 ; N zcaron ; B 31 0 457 741 ;
C -1 ; WX 500 ; N zacute ; B 31 0 457 740 ;
C -1 ; WX 500 ; N yacute ; B 20 -218 478 740 ;
C -1 ; WX 556 ; N uhungarumlaut ; B 65 -23 530 740 ;
C -1 ; WX 556 ; N eth ; B 36 -23 510 743 ;
C -1 ; WX 556 ; N uring ; B 65 -23 482 754 ;
C -1 ; WX 778 ; N Ocircumflex ; B 38 -23 742 940 ;
C -1 ; WX 333 ; N commaaccent ; B 116 -285 216 -60 ;
C -1 ; WX 737 ; N copyright ; B -13 -22 751 742 ;
C -1 ; WX 737 ; N registered ; B -13 -22 751 742 ;
C -1 ; WX 667 ; N Acircumflex ; B 17 0 653 940 ;
C -1 ; WX 278 ; N idieresis ; B 3 0 269 708 ;
C -1 ; WX 489 ; N lozenge ; B 16 0 462 744 ;
C -1 ; WX 711 ; N Delta ; B 10 0 701 729 ;
C -1 ; WX 548 ; N notequal ; B 32 -25 516 486 ;
C -1 ; WX 542 ; N radical ; B 7 -36 512 913 ;
C -1 ; WX 667 ; N Agrave ; B 17 0 653 939 ;
C -1 ; WX 667 ; N Aacute ; B 17 0 653 939 ;
C -1 ; WX 584 ; N lessequal ; B 45 -11 534 639 ;
C -1 ; WX 584 ; N greaterequal ; B 45 -11 534 639 ;
C -1 ; WX 584 ; N logicalnot ; B 40 86 544 375 ;
C -1 ; WX 711 ; N summation ; B 17 -97 694 760 ;
C -1 ; WX 490 ; N partialdiff ; B 22 -15 458 750 ;
C -1 ; WX 722 ; N Ncommaaccent ; B 76 -285 646 729 ;
C -1 ; WX 556 ; N dcroat ; B 26 -23 557 729 ;
C -1 ; WX 260 ; N brokenbar ; B 100 -212 160 729 ;
C -1 ; WX 556 ; N Lcommaaccent ; B 80 -285 533 729 ;
C -1 ; WX 667 ; N Adieresis ; B 17 0 653 914 ;
C -1 ; WX 556 ; N mu ; B 65 -220 544 524 ;
C -1 ; WX 278 ; N .notdef ; B 191 0 191 0 ;
EndCharMetrics
StartKernData
StartKernPairs 998
KPX A C -36
KPX A Ccedilla -36
KPX A G -35
KPX A O -33
KPX A Odieresis -33
KPX A Q -32
KPX A T -93
KPX A U -37
KPX A Uacute -37
KPX A Ucircumflex -37
KPX A Udieresis -37
KPX A Ugrave -37
KPX A V -75
KPX A W -51
KPX A Y -99
KPX A a -4
KPX A b 4
KPX A c -11
KPX A ccedilla -10
KPX A comma 5
KPX A d -8
KPX A e -16
KPX A g -10
KPX A guillemotleft -44
KPX A guilsinglleft -40
KPX A hyphen -3
KPX A o -13
KPX A period 5
KPX A q -8
KPX A quotedblright -56
KPX A quoteright -65
KPX A t -16
KPX A u -12
KPX A v -31
KPX A w -21
KPX A y -34
KPX Aacute C -36
KPX Aacute G -35
KPX Aacute O -33
KPX Aacute Q -32
KPX Aacute T -93
KPX Aacute U -37
KPX Aacute V -75
KPX Aacute W -51
KPX Aacute Y -99
KPX Aacute a -4
KPX Aacute b 4
KPX Aacute c -11
KPX Aacute comma 5
KPX Aacute d -8
KPX Aacute e -16
KPX Aacute g -10
KPX Aacute guillemotleft -44
KPX Aacute guilsinglleft -40
KPX Aacute hyphen -3
KPX Aacute o -13
KPX Aacute period 5
KPX Aacute q -8
KPX Aacute quoteright -65
KPX Aacute t -16
KPX Aacute u -12
KPX Aacute v -31
KPX Aacute w -21
KPX Aacute y -34
KPX Acircumflex C -36
KPX Acircumflex G -35
KPX Acircumflex O -33
KPX Acircumflex Q -32
KPX Acircumflex T -93
KPX Acircumflex U -37
KPX Acircumflex V -75
KPX Acircumflex W -51
KPX Acircumflex Y -99
KPX Acircumflex comma 5
KPX Acircumflex period 5
KPX Adieresis C -36
KPX Adieresis G -35
KPX Adieresis O -33
KPX Adieresis Q -32
KPX Adieresis T -93
KPX Adieresis U -37
KPX Adieresis V -75
KPX Adieresis W -51
KPX Adieresis Y -99
KPX Adieresis a -4
KPX Adieresis b 4
KPX Adieresis c -11
KPX Adieresis comma 5
KPX Adieresis d -8
KPX Adieresis g -10
KPX Adieresis guillemotleft -44
KPX Adieresis guilsinglleft -40
KPX Adieresis hyphen -3
KPX Adieresis o -13
KPX Adieresis period 5
KPX Adieresis q -8
KPX Adieresis quotedblright -56
KPX Adieresis quoteright -65
KPX Adieresis t -16
KPX Adieresis u -12
KPX Adieresis v -31
KPX Adieresis w -21
KPX Adieresis y -34
KPX Agrave C -36
KPX Agrave G -35
KPX Agrave O -33
KPX Agrave Q -32
KPX Agrave T -93
KPX Agrave U -37
KPX Agrave V -75
KPX Agrave W -51
KPX Agrave Y -99
KPX Agrave comma 5
KPX Agrave period 5
KPX Aring C -36
KPX Aring G -35
KPX Aring O -33
KPX Aring Q -32
KPX Aring T -93
KPX Aring U -37
KPX Aring V -75
KPX Aring W -51
KPX Aring Y -99
KPX Aring a -4
KPX Aring b 4
KPX Aring c -11
KPX Aring comma 5
KPX Aring d -8
KPX Aring e -16
KPX Aring g -10
KPX Aring guillemotleft -44
KPX Aring guilsinglleft -40
KPX Aring hyphen -3
KPX Aring o -13
KPX Aring period 5
KPX Aring q -8
KPX Aring quotedblright -56
KPX Aring quoteright -65
KPX Aring t -16
KPX Aring u -12
KPX Aring v -31
KPX Aring w -21
KPX Aring y -34
KPX Atilde C -36
KPX Atilde G -35
KPX Atilde O -33
KPX Atilde Q -32
KPX Atilde T -93
KPX Atilde U -37
KPX Atilde V -75
KPX Atilde W -51
KPX Atilde Y -99
KPX Atilde comma 5
KPX Atilde period 5
KPX B A -21
KPX B AE -21
KPX B Aacute -21
KPX B Acircumflex -21
KPX B Adieresis -21
KPX B Aring -21
KPX B Atilde -21
KPX B O -7
KPX B OE -5
KPX B Oacute -7
KPX B Ocircumflex -7
KPX B Odieresis -7
KPX B Ograve -7
KPX B Oslash -1
KPX B V -41
KPX B W -25
KPX B Y -44
KPX C A -32
KPX C AE -33
KPX C Aacute -32
KPX C Adieresis -32
KPX C Aring -32
KPX C H -12
KPX C K -10
KPX C O -8
KPX C Oacute -8
KPX C Odieresis -8
KPX Ccedilla A -31
KPX D A -42
KPX D Aacute -42
KPX D Acircumflex -42
KPX D Adieresis -42
KPX D Agrave -42
KPX D Aring -42
KPX D Atilde -42
KPX D J -5
KPX D T -45
KPX D V -51
KPX D W -29
KPX D X -53
KPX D Y -63
KPX F A -69
KPX F Aacute -69
KPX F Acircumflex -69
KPX F Adieresis -69
KPX F Agrave -69
KPX F Aring -69
KPX F Atilde -69
KPX F J -51
KPX F O -22
KPX F Odieresis -22
KPX F a -33
KPX F aacute -33
KPX F adieresis -33
KPX F ae -29
KPX F aring -33
KPX F comma -108
KPX F e -24
KPX F eacute -24
KPX F hyphen -14
KPX F i -10
KPX F j -12
KPX F o -21
KPX F oacute -21
KPX F odieresis -21
KPX F oe -23
KPX F oslash -21
KPX F period -108
KPX F r -35
KPX F u -33
KPX G A -6
KPX G AE -3
KPX G Aacute -6
KPX G Acircumflex -6
KPX G Adieresis -6
KPX G Agrave -6
KPX G Aring -6
KPX G Atilde -6
KPX G T -44
KPX G V -50
KPX G W -28
KPX G Y -62
KPX J A -32
KPX J AE -31
KPX J Adieresis -32
KPX J Aring -32
KPX K C -51
KPX K G -51
KPX K O -48
KPX K OE -45
KPX K Oacute -48
KPX K Odieresis -48
KPX K S -38
KPX K T 20
KPX K a -11
KPX K adieresis -11
KPX K ae -7
KPX K aring -11
KPX K e -32
KPX K hyphen -47
KPX K o -29
KPX K oacute -29
KPX K odieresis -29
KPX K u -19
KPX K udieresis -19
KPX K y -62
KPX L A 17
KPX L AE 20
KPX L Aacute 17
KPX L Adieresis 17
KPX L Aring 17
KPX L C -41
KPX L Ccedilla -37
KPX L G -42
KPX L O -41
KPX L Oacute -41
KPX L Ocircumflex -41
KPX L Odieresis -41
KPX L Ograve -41
KPX L Otilde -41
KPX L S -19
KPX L T -105
KPX L U -35
KPX L Udieresis -35
KPX L V -105
KPX L W -68
KPX L Y -121
KPX L hyphen -125
KPX L quotedblright -141
KPX L quoteright -149
KPX L u -7
KPX L udieresis -7
KPX L y -56
KPX N A -9
KPX N AE -6
KPX N Aacute -9
KPX N Adieresis -9
KPX N Aring -9
KPX N C -3
KPX N Ccedilla -3
KPX N G -2
KPX N O 0
KPX N Oacute 0
KPX N Odieresis 0
KPX N a -5
KPX N aacute -5
KPX N adieresis -5
KPX N ae -2
KPX N aring -5
KPX N comma -7
KPX N e 0
KPX N eacute 0
KPX N o 2
KPX N oacute 2
KPX N odieresis 2
KPX N oslash 4
KPX N period -7
KPX N u 0
KPX N udieresis 0
KPX O A -35
KPX O AE -39
KPX O Aacute -35
KPX O Adieresis -35
KPX O Aring -35
KPX O T -42
KPX O V -45
KPX O W -23
KPX O X -46
KPX O Y -59
KPX Oacute A -35
KPX Oacute T -42
KPX Oacute V -45
KPX Oacute W -23
KPX Oacute Y -59
KPX Ocircumflex T -42
KPX Ocircumflex V -45
KPX Ocircumflex Y -59
KPX Odieresis A -35
KPX Odieresis T -42
KPX Odieresis V -45
KPX Odieresis W -23
KPX Odieresis X -46
KPX Odieresis Y -59
KPX Ograve T -42
KPX Ograve V -45
KPX Ograve Y -59
KPX Oslash A -33
KPX Otilde T -42
KPX Otilde V -45
KPX Otilde Y -59
KPX P A -78
KPX P AE -86
KPX P Aacute -78
KPX P Adieresis -78
KPX P Aring -78
KPX P J -78
KPX P a -28
KPX P aacute -28
KPX P adieresis -28
KPX P ae -24
KPX P aring -28
KPX P comma -135
KPX P e -31
KPX P eacute -31
KPX P hyphen -40
KPX P o -27
KPX P oacute -27
KPX P odieresis -27
KPX P oe -28
KPX P oslash -27
KPX P period -135
KPX R C -16
KPX R Ccedilla -16
KPX R G -15
KPX R O -13
KPX R OE -11
KPX R Oacute -13
KPX R Odieresis -13
KPX R T -23
KPX R U -17
KPX R Udieresis -17
KPX R V -39
KPX R W -27
KPX R Y -43
KPX R a -15
KPX R aacute -15
KPX R adieresis -15
KPX R ae -12
KPX R aring -15
KPX R e -12
KPX R eacute -12
KPX R hyphen -2
KPX R o -9
KPX R oacute -9
KPX R odieresis -9
KPX R oe -11
KPX R u -9
KPX R uacute -9
KPX R udieresis -9
KPX R y -8
KPX S A -22
KPX S AE -22
KPX S Aacute -22
KPX S Adieresis -22
KPX S Aring -22
KPX S T -28
KPX S V -42
KPX S W -28
KPX S Y -48
KPX S t -3
KPX T A -95
KPX T AE -97
KPX T Aacute -95
KPX T Acircumflex -95
KPX T Adieresis -95
KPX T Agrave -95
KPX T Aring -95
KPX T Atilde -95
KPX T C -44
KPX T G -45
KPX T J -100
KPX T O -42
KPX T OE -35
KPX T Oacute -42
KPX T Ocircumflex -42
KPX T Odieresis -42
KPX T Ograve -42
KPX T Oslash -41
KPX T Otilde -42
KPX T S -24
KPX T V 12
KPX T W 16
KPX T Y 20
KPX T a -100
KPX T ae -97
KPX T c -90
KPX T colon -133
KPX T comma -100
KPX T e -95
KPX T g -89
KPX T guillemotleft -121
KPX T guilsinglleft -117
KPX T hyphen -77
KPX T i -3
KPX T j -5
KPX T o -92
KPX T oslash -87
KPX T period -100
KPX T r -92
KPX T s -92
KPX T semicolon -129
KPX T u -91
KPX T v -95
KPX T w -93
KPX T y -100
KPX U A -36
KPX U AE -39
KPX U Aacute -36
KPX U Acircumflex -36
KPX U Adieresis -36
KPX U Aring -36
KPX U Atilde -36
KPX U comma -27
KPX U m -4
KPX U n -4
KPX U p 3
KPX U period -25
KPX U r -4
KPX Uacute A -36
KPX Uacute comma -27
KPX Uacute m -4
KPX Uacute n -4
KPX Uacute p 3
KPX Uacute period -25
KPX Uacute r -4
KPX Ucircumflex A -36
KPX Udieresis A -36
KPX Udieresis b 3
KPX Udieresis comma -27
KPX Udieresis m -4
KPX Udieresis n -4
KPX Udieresis p 3
KPX Udieresis period -25
KPX Udieresis r -4
KPX Ugrave A -36
KPX V A -71
KPX V AE -78
KPX V Aacute -71
KPX V Acircumflex -71
KPX V Adieresis -71
KPX V Agrave -71
KPX V Aring -71
KPX V Atilde -71
KPX V C -43
KPX V G -42
KPX V O -40
KPX V Oacute -40
KPX V Ocircumflex -40
KPX V Odieresis -40
KPX V Ograve -40
KPX V Oslash -33
KPX V Otilde -40
KPX V S -35
KPX V T 15
KPX V a -59
KPX V ae -55
KPX V colon -66
KPX V comma -89
KPX V e -57
KPX V g -50
KPX V guillemotleft -83
KPX V guilsinglleft -80
KPX V hyphen -38
KPX V i -5
KPX V o -54
KPX V oslash -50
KPX V period -89
KPX V r -42
KPX V semicolon -66
KPX V u -41
KPX V y -20
KPX W A -50
KPX W AE -56
KPX W Aacute -50
KPX W Acircumflex -50
KPX W Adieresis -50
KPX W Agrave -50
KPX W Aring -50
KPX W Atilde -50
KPX W C -23
KPX W G -22
KPX W O -20
KPX W Oacute -20
KPX W Ocircumflex -20
KPX W Odieresis -20
KPX W Ograve -20
KPX W Oslash -13
KPX W Otilde -20
KPX W S -24
KPX W T 19
KPX W a -38
KPX W ae -34
KPX W colon -52
KPX W comma -56
KPX W e -32
KPX W g -25
KPX W guillemotleft -58
KPX W guilsinglleft -54
KPX W hyphen -13
KPX W i -1
KPX W o -29
KPX W oslash -25
KPX W period -56
KPX W r -28
KPX W semicolon -53
KPX W u -28
KPX W y -6
KPX X C -48
KPX X O -45
KPX X Odieresis -45
KPX X Q -44
KPX X a -15
KPX X e -36
KPX X hyphen -51
KPX X o -33
KPX X u -24
KPX X y -61
KPX Y A -96
KPX Y AE -103
KPX Y Aacute -96
KPX Y Acircumflex -96
KPX Y Adieresis -96
KPX Y Agrave -96
KPX Y Aring -96
KPX Y Atilde -96
KPX Y C -58
KPX Y G -58
KPX Y O -56
KPX Y Oacute -56
KPX Y Ocircumflex -56
KPX Y Odieresis -56
KPX Y Ograve -56
KPX Y Oslash -54
KPX Y Otilde -56
KPX Y S -41
KPX Y T 23
KPX Y a -88
KPX Y ae -84
KPX Y colon -87
KPX Y comma -111
KPX Y e -89
KPX Y g -83
KPX Y guillemotleft -123
KPX Y guilsinglleft -119
KPX Y hyphen -84
KPX Y i 3
KPX Y o -86
KPX Y oslash -82
KPX Y p -54
KPX Y period -111
KPX Y semicolon -88
KPX Y u -63
KPX Y v -36
KPX Z v -33
KPX Z y -38
KPX a j -4
KPX a quoteright -23
KPX a v -21
KPX a w -13
KPX a y -26
KPX aacute v -21
KPX aacute w -13
KPX aacute y -26
KPX adieresis v -21
KPX adieresis w -13
KPX adieresis y -26
KPX ae v -16
KPX ae w -10
KPX ae y -20
KPX agrave v -21
KPX agrave w -13
KPX agrave y -26
KPX aring v -21
KPX aring w -13
KPX aring y -26
KPX b v -11
KPX b w -3
KPX b y -15
KPX c h 1
KPX c k 7
KPX comma one -100
KPX comma quotedblright -41
KPX comma quoteright -50
KPX e quoteright -18
KPX e t -10
KPX e v -15
KPX e w -9
KPX e x -27
KPX e y -19
KPX eacute v -15
KPX eacute w -9
KPX eacute y -19
KPX ecircumflex v -15
KPX ecircumflex w -9
KPX ecircumflex y -19
KPX eight four 1
KPX eight one -48
KPX eight seven -33
KPX f a -9
KPX f aacute -9
KPX f adieresis -9
KPX f ae -5
KPX f aring -9
KPX f e -15
KPX f eacute -15
KPX f f 22
KPX f i -2
KPX f j -4
KPX f l -3
KPX f o -10
KPX f oacute -10
KPX f odieresis -10
KPX f oe -12
KPX f oslash -9
KPX f quoteright 0
KPX f s 0
KPX f t 24
KPX five four 1
KPX five one -76
KPX five seven -26
KPX four four 5
KPX four one -84
KPX four seven -56
KPX g a -5
KPX g adieresis -5
KPX g ae -1
KPX g aring -5
KPX g e 0
KPX g eacute 0
KPX g l 0
KPX g oacute 3
KPX g odieresis 3
KPX g r 0
KPX guillemotright A -50
KPX guillemotright AE -54
KPX guillemotright Aacute -50
KPX guillemotright Adieresis -50
KPX guillemotright Aring -50
KPX guillemotright T -126
KPX guillemotright V -93
KPX guillemotright W -66
KPX guillemotright Y -133
KPX guilsinglright A -44
KPX guilsinglright AE -48
KPX guilsinglright Aacute -44
KPX guilsinglright Adieresis -44
KPX guilsinglright Aring -44
KPX guilsinglright T -121
KPX guilsinglright V -88
KPX guilsinglright W -60
KPX guilsinglright Y -128
KPX h quoteright -15
KPX h y -18
KPX hyphen A -7
KPX hyphen AE -11
KPX hyphen Aacute -7
KPX hyphen Adieresis -7
KPX hyphen Aring -7
KPX hyphen T -80
KPX hyphen V -46
KPX hyphen W -19
KPX hyphen Y -92
KPX i T -7
KPX i j -3
KPX k a -2
KPX k aacute -2
KPX k adieresis -2
KPX k ae 2
KPX k aring -2
KPX k comma 0
KPX k e -21
KPX k eacute -21
KPX k g -16
KPX k hyphen -41
KPX k o -19
KPX k oacute -19
KPX k odieresis -19
KPX k period 0
KPX k s -3
KPX k u -11
KPX k udieresis -6
KPX l v 0
KPX l y -5
KPX m p 5
KPX m v -13
KPX m w -7
KPX m y -18
KPX n T -96
KPX n p 5
KPX n quoteright -14
KPX n v -13
KPX n w -7
KPX n y -18
KPX nine four -3
KPX nine one -43
KPX nine seven -37
KPX o T -99
KPX o quoteright -21
KPX o t -10
KPX o v -18
KPX o w -10
KPX o x -27
KPX o y -22
KPX oacute v -18
KPX oacute w -10
KPX oacute y -22
KPX ocircumflex t -10
KPX odieresis t -10
KPX odieresis v -18
KPX odieresis w -10
KPX odieresis x -27
KPX odieresis y -22
KPX ograve v -18
KPX ograve w -10
KPX ograve y -22
KPX one comma -74
KPX one eight -65
KPX one five -67
KPX one four -81
KPX one nine -65
KPX one one -118
KPX one period -74
KPX one seven -90
KPX one six -62
KPX one three -67
KPX one two -69
KPX one zero -62
KPX p t -4
KPX p y -16
KPX period one -101
KPX period quotedblright -41
KPX period quoteright -51
KPX q c 8
KPX q u 4
KPX quotedblbase A 30
KPX quotedblbase AE 30
KPX quotedblbase T -75
KPX quotedblbase V -69
KPX quotedblbase W -34
KPX quotedblbase Y -91
KPX quotedblleft A -52
KPX quotedblleft AE -64
KPX quotedblleft Aacute -52
KPX quotedblleft Adieresis -52
KPX quotedblleft Aring -52
KPX quotedblleft T 9
KPX quotedblleft V 15
KPX quotedblleft W 27
KPX quotedblleft Y 5
KPX quotedblright A -53
KPX quotedblright AE -66
KPX quotedblright Aacute -53
KPX quotedblright Adieresis -53
KPX quotedblright Aring -53
KPX quotedblright T 11
KPX quotedblright V 15
KPX quotedblright W 26
KPX quotedblright Y 7
KPX quoteleft A -67
KPX quoteleft AE -79
KPX quoteleft Aacute -67
KPX quoteleft Adieresis -67
KPX quoteleft Aring -67
KPX quoteleft T -5
KPX quoteleft V 0
KPX quoteleft W 12
KPX quoteleft Y -9
KPX quoteright A -72
KPX quoteright AE -85
KPX quoteright Aacute -72
KPX quoteright Adieresis -72
KPX quoteright Aring -72
KPX quoteright comma -60
KPX quoteright d -20
KPX quoteright o -26
KPX quoteright period -60
KPX quoteright r -18
KPX quoteright s -18
KPX quoteright t -7
KPX quoteright v -2
KPX quoteright w 2
KPX quoteright y -6
KPX r a -5
KPX r aacute -5
KPX r acircumflex -5
KPX r adieresis -5
KPX r ae -1
KPX r agrave -5
KPX r aring -5
KPX r c -6
KPX r ccedilla -9
KPX r colon -22
KPX r comma -69
KPX r d -1
KPX r e -11
KPX r eacute -11
KPX r ecircumflex -11
KPX r egrave -11
KPX r f 26
KPX r g -4
KPX r h 0
KPX r hyphen -47
KPX r i 1
KPX r j 0
KPX r k 6
KPX r l 1
KPX r m 0
KPX r n 0
KPX r o -6
KPX r oacute -6
KPX r ocircumflex -6
KPX r odieresis -6
KPX r oe -8
KPX r ograve -6
KPX r oslash -6
KPX r p 8
KPX r period -69
KPX r q -3
KPX r quoteright 1
KPX r r 0
KPX r s 4
KPX r semicolon -22
KPX r t 28
KPX r u 2
KPX r v 29
KPX r w 31
KPX r x 20
KPX r y 24
KPX r z 9
KPX s quoteright -22
KPX s t -3
KPX seven colon -77
KPX seven comma -119
KPX seven eight -28
KPX seven five -30
KPX seven four -93
KPX seven one -53
KPX seven period -119
KPX seven seven -4
KPX seven six -40
KPX seven three -23
KPX seven two -28
KPX six four 1
KPX six one -43
KPX six seven -30
KPX t S -8
KPX t a -1
KPX t aacute -1
KPX t adieresis -1
KPX t ae 2
KPX t aring -1
KPX t colon -28
KPX t e -14
KPX t eacute -14
KPX t h -3
KPX t o -12
KPX t oacute -12
KPX t odieresis -12
KPX t quoteright -1
KPX t semicolon -28
KPX three four -2
KPX three one -49
KPX three seven -33
KPX two four -37
KPX two one -36
KPX two seven -25
KPX u quoteright -8
KPX v a -18
KPX v aacute -18
KPX v acircumflex -18
KPX v adieresis -18
KPX v ae -14
KPX v agrave -18
KPX v aring -18
KPX v atilde -18
KPX v c -16
KPX v colon -23
KPX v comma -69
KPX v e -21
KPX v eacute -21
KPX v ecircumflex -21
KPX v egrave -21
KPX v g -14
KPX v hyphen -12
KPX v l 0
KPX v o -17
KPX v oacute -17
KPX v odieresis -17
KPX v ograve -17
KPX v oslash -17
KPX v period -69
KPX v s -9
KPX v semicolon -23
KPX w a -15
KPX w aacute -15
KPX w acircumflex -15
KPX w adieresis -15
KPX w ae -11
KPX w agrave -15
KPX w aring -15
KPX w atilde -15
KPX w c -7
KPX w colon -23
KPX w comma -50
KPX w e -12
KPX w eacute -12
KPX w ecircumflex -12
KPX w egrave -12
KPX w g -6
KPX w hyphen -1
KPX w l 0
KPX w o -9
KPX w oacute -9
KPX w odieresis -9
KPX w ograve -9
KPX w oslash -6
KPX w period -50
KPX w s -5
KPX w semicolon -23
KPX x a -17
KPX x c -23
KPX x e -28
KPX x eacute -28
KPX x o -25
KPX x q -20
KPX y a -22
KPX y aacute -22
KPX y acircumflex -22
KPX y adieresis -22
KPX y ae -18
KPX y agrave -22
KPX y aring -22
KPX y atilde -22
KPX y c -19
KPX y colon -27
KPX y comma -70
KPX y e -24
KPX y eacute -24
KPX y ecircumflex -24
KPX y egrave -24
KPX y g -17
KPX y hyphen -14
KPX y l -4
KPX y o -20
KPX y oacute -20
KPX y odieresis -20
KPX y ograve -20
KPX y oslash -19
KPX y period -70
KPX y s -12
KPX y semicolon -27
KPX zero four -2
KPX zero one -46
KPX zero seven -39
EndKernPairs
EndKernData
EndFontMetrics
'
]

{ #category : #'*PDFtalk-test resources-fonts' }
PtFCustomFont class >> nimbusSansLReguCOPYING [
"		    GNU GENERAL PUBLIC LICENSE
		       Version 2, June 1991

 Copyright (C) 1989, 1991 Free Software Foundation, Inc.
     59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

			    Preamble

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation's software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Library General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps: (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author's protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone's free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.

		    GNU GENERAL PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The 'Program', below,
refers to any such program or work, and a 'work based on the Program'
means either the Program or any derivative work under copyright law:
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term 'modification'.)  Each licensee is addressed as 'you'.

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program's
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.

  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.

  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and 'any
later version', you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

			    NO WARRANTY

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM 'AS IS' WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

		     END OF TERMS AND CONDITIONS

	    How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
convey the exclusion of warranty; and each file should have at least
the 'copyright' line and a pointer to where the full notice is found.

    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


Also add information on how to contact you by electronic and paper mail.

If the program is interactive, make it output a short notice like this
when it starts in an interactive mode:

    Gnomovision version 69, Copyright (C) year  name of author
    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, the commands you use may
be called something other than `show w' and `show c'; they could even be
mouse-clicks or menu items--whatever suits your program.

You should also get your employer (if you work as a programmer) or your
school, if any, to sign a 'copyright disclaimer' for the program, if
necessary.  Here is a sample; alter the names:

  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
  `Gnomovision' (which makes passes at compilers) written by James Hacker.

  <signature of Ty Coon>, 1 April 1989
  Ty Coon, President of Vice

This General Public License does not permit incorporating your program into
proprietary programs.  If your program is a subroutine library, you may
consider it more useful to permit linking proprietary applications with the
library.  If this is what you want to do, use the GNU Library General
Public License instead of this License."
]

{ #category : #'*PDFtalk-test resources-fonts' }
PtFCustomFont class >> nimbusSansLReguPfb [
	"included for completeness - not used by the system"

	^ByteArray fromASCII85String: 'J,t`7!!";g:fAr3A8bpg7W30d/MSk33Zq13D.7X/;djQ;/Q-.mFW`Ck0K!8G,pcN)FDPML+AQWf@Wc`
j@;\aj;IsK`$7-ucEb/[$Bl@lW@<?''A+B3#s+AH9b+>PVn0ebXB3''&oO+>PW)1C>ES6ZQaHFDl1\+A
d)mD/X_C:h=`[EboH-$7-udDe!p,ASuTgF`;;9Bk:gQATMd4Ear[%3Zr$QDKI!rBl.=%F&QLb9J''.RB
6=P-+@C''dH#dV3BQP@F<DlmI.k</<DfBuBBkM+$+>Gl:3?VdV+=L5f=",XM+@Kd^BkM<+-6P]fG%GK.
E,B0(F:''<:7qHRLEaa''$A0>?,+AcZY7:^+S+>GK&+=LoFFDs8o05tN3ARoLs/otVWDImoC.1.@I7;c
X''Df''?&DKKq,7W30d6tp[Q@ruX0GqVp,D.7X/;djQ;/Q-.mFWbI;Dg-)G02?4u@Wc`j@;\aj;IsK`+
D,>*A7fatF<G+:E%b4/BlS9,8OO\:DJs`:HXq8<$85CsBlS9,8OO\6ATT%P0JY=B0JXb^E?Jh;@q[MbD
f0YrH#R=;B4Z0-0d(%I+CT.uI=#pOE$/b$Cia09BkCpmF(G]*F(''6''+EVXHAUSo;@;L!rI;*;)Cia0
9HY-]&F(Kc6An>e"AI:.H+Co1rF<G%(B5)5j01KktFB!O)AKW]MA7]?[01KktFA61cEbTb@>;.Z`0JO\
(+>=ol/het6+>=ol+C0#!@:X:oCj@.6AS)9&7W30d:18!N+>6K(D.7X/;djQ;/Q-.mFWb4+AdU1\Df0Y
`6>q)k>:hQg1a"A*3&Mg50JG4(3AiT8?#jLbA8c@%Gp$X/AdU1kDJ=*5AP#942)$d>3A<32A7]?[02Q(
kDKJj''E+L.G+Co%q$84keDKJHfAoAeP+Co1rF<G+:E$/V$B5)5j+>7nLEcYr5DBL>^/hf.k.3NYB@:X
:oCj@.6AS)8l02?G-Bk(]s-pqolH#dV3BQPA%0JtOa;HI*W2)-U3/44>pH#dV3BQP@O3B9)B@X0)$0Jt
Oa;HI*W2)-U3+@Kd^BkM<+-6P]fG%GK.E,B0(F=A>QART+fDJXS@A7]?[+>63,ChujTD.Oh<:2+QSF`S
[(@;^-/9H[5EB6A$!E[`,OART+fDJXS@A7]?[+>62mD/!g3:18!N+=L!!D.7X/+B)]dF!+.*+ED%%A8c
@%Gp$X/AdTY6=(Q)YBQP@F;IsK`Cgh?5+ED%%A8c@%Gp$X/AdTY68T\BWBk''GHB5D-%0Han;AdTY6Bl
caXG\(D^Blmiu+D,%uF(HJ)AS)8l03)n#ATDU$DIlX_F(o`1Df-[L0f:[.A7]?[+>6`4A7]dtBl7K]BP
CslDImm1+>khqA7]?[ASu$$Eb/ZiDf0B:+Co%q$84hc@rGmlDJ((jFCB&t@<,mIDI[TqBl7Q+A7]?[@s
)g4ASuU#Bk)6-ASu#c@s)g4ASuU%Bl%?''AS$*t@g[_fUo+1mC"WJP6o<"K&p"UprDRN"%h09cbqjK2-
?dXAC0Ru1_$L@C]p!X8.Ntou(eCPEEl,*Pl&Wj=q^u]5=S5YL*eo%>9*_F]25Veni3#WL)Qk(5SuKD<$
n>NZJTlMUru#..DhV4`>7NG0qR!b=IaNTiW/KJ''m2g#1iTa@T<ndo-\MD2"E=YhHLcRL_S%Aq-qR)(0
YL.`?_T6BFKpCiofoMRa=roS;3$XQQ6''@bV:LE84TK,6n]c@gU[eetZSJAQOHTOD:)fSDJh%,JdhZ^7
7FH]nQH=hJ`LI8@rODEkhNgW8@&5^q8!/>=DX(_ZD>/1&XI[.LCb0n;S;h4mN@EcAbQj=q>%Dhgg`>s6
/;X3d\$N,;ZEchFiUf8J[A7GR*DptBTp,-4j(lLH\/=S]?i1:N%B(?&69.9XYi%Iq8o9u2Rg6RUoLH$i
-3[EdsZD"P6%Jr?`''&kp;UE:(PT5F+HZ/=#DlP`sFG=O_d/(a;k88On=D^ZGi#T9g:q@8**pkK0n5"-
[OB$H7_Ln0o^>a''IN!K1Kl9W%h0_II^gSh>R2B>G%VGuHgI[MoGbe.rqp5++K?G>j`n^8peI`Y27#Lk
djm*7#uri<=Q_YQ!03q7qD]@n_6:cc)53+KJQHk$H_;Ka.J.*>G.Oh56qu]93Gl,DVVOa?VQ48\TN=-2
cXZ-9:AfMbe=1WD"3V=2#g$R<&XHoC4K,fg&pH)DS\$GGf4;K#PSI(011]"!c"92\,[VJ,Vh%mP",3%j
@=jlDYMl+\H4);j]h[-[''CcE^.*hPj?/U;NZmQ5rL?D"S%O''M5N%p:G]bX0kTs-bN[(C@n[F)`*$FV
^1%\WHi>VEgiEJ]/hO2$k1^OI*G''+mQQtb%=m1q:JCi*_PhkW6K2Zft-pYShj"A)s]hu>EU:br_''8r
4!^VI*^*)0665**(`g!%Mc?W<!o^Q7b17N3jYDkrLqW3=#Q6VBG<%I,eX.e;sj$F0B$gd@Lu"Jm%:.>3
08"$MZ'')-`eS.!r;rqg$I\a(8;5k#6lpM6n6ga*TB`5P2+X<n6jdMThfeX4ku?/@Z-)!]s$KcnN$Y#h
_jdpg@?Ec\lCT],*lT2-q26&`e]''1"(8_AeGUfPmbgerqXD_cE.\0''Q''N@]I32$B5[Bo1ZB(!m+8X
9''oQNR>\1p*pes2P3C*]SlegUIbjagjNtBD\d7/k"8]l?$"Y^KtWnCu\XB:<S9@KhBH39IE-$:D^T?5
''Fnl?^-&VZp@]Op$T(jaA.%Vo?_4s]6pn%X.]^liC?c@bHlA/B)d_*o;CcK(p3m53i#77Zq`^%+#3dr
+Y9,SF0UNgU+Mc26,U[)PY4''1$kdGJ0hL1`J(gf&Z&C,6d''?io,+8RF3Z:i8J!P(W&nk"R:TAr_YUS
5:efiO.iUpiu0Z*Q)h&rJTX/tk?1T0L_,DHF[aW*<g^*uW1prsJ#sbaL9cl5&C:#a3(O$<>MqF-M/E9$
+1I7/rNPePMO5%_%C8lf]?@#s:O&a35`kC(G%=`a_c=A"MbRXTaa%lHp1d\DZ!hI,rG=N%bO+(eoN#qJ
nr1LGioAN>cHAip>-@\DkR;#ml=du_;j:X:[9`t4gaUP^"Djk*@uD!A"6tb<L@=;sicOhhUZ_hAkDXiV
EeuNjS"FYIhNpV\2@"NWTR@i<Wi$&C7/PLB&7^R4`kddeEW?SlVsmfh<1gn-odJQ_gZgI96lh]rn4ffl
g"k[AMMU[*VgVJF?pm07h6$.5Z0nflp?`JV%..Blq%Jl%,&gHa]p-''?I!r4?ZR?"+=16:;M0RO5W7V)
!-,j-d+KFg/0r.UE-4)^QZL`.rMOhho\9^/$I<aD$S)*Z>VLl2/=B47\,V:_c[ok;:!E'')Mk$)>I@24
=fiBfV>l/''GjMo69Bn\B*aot82_`Eds*-Lnc]rP>(VOL2`&mK";lKlK=*dlfHjnTs^-_pD_6\pVmWNm
?(36>&;s3cS/uF+9YgIBYGsX^HYX,/Y;dAG-F5N&@`aW7f\Q@?2JhOIbUS8a''I(nRc=rr9VgnpeWWD>
(inNR9LnAbClLV3+F!kRbU2i?#++o?%aenCu\mg;oM)9$KT`UROmgJTe8m"W9If&Qf@[%:NS&FPP@[[Y
d''G?&9HNpWmm40C\g/.keSmBQ)\3SoK"+<<jQ2@bL<<B1E^k5hVs]D`/oZ5\G)S9X&^ak,UDH$bm*N(
-1d4OT!XWn\*^Z`ZYWTb;pUMG\%Mj2imf,(d]61*4CcEc;Y9;6]ORq54.''Pr`*6*+m$%K&Q>)7)WU\V
Qh$WVG"]5;l[/SE^@i-e1Fd2sEVd^rE](D`fW/O)dJ"X"/1e2%B<W$)C!;FoSeipM?6a%/K;\_35VJlR
G7"F,1B1''O$Z<CoE.]c5/1o4p-TK2*:U^D''k00us?=9,8!ki4UKFOQdP*NEbdoW<[`b^l^jZHg7`,u
5otg51[.FW9nA%%eaI1/V1+*rpDm[]1On(>!1f@EWAZUo5.jYkLi$KsA5P^h$\sQqM5$OS#mG.fHo>&7
!XF+TJIFP''''*`^BT$i&u?9f*!2+hbJi%]k<E1-2="]Q@?/?c_u+i+;5Nr5M&#`)RB<Q8WYVj&d0u[_
Od%pcYMA5q6pj*-(-6EO!ki&rg@(Udq80[4:W0.j^b45DE9TZF\4X_>>r:%-X2#f.V\fT/`Ch022R08)
i=R=/#EmCf>H4Fq,:K=eCf"ni\<VFU+(J''<@t2pF''\8fZGh)TW)M:</To,_MUV"*gZi<[J8cW6B"lP
(:`I)!Of$hZ4p,I=;ZCJq6>::*0@C''r=GJ<u0N)&DkACPL"AZ:5seSC9`Ru3Bf&GJmJ!k?mR\)$_]&j
kX$H82b](Zg_ii0Gn&E0BH:D#Eoh5is6"DAYh"O,56WdfD)tKh?\N2dhOD(<l0/(Mupt;[7dt;&?%biO
0*H>(\)9A*&sHmKD:6q-gXKMLOn,fch3o!`n9pBY.8)iIN9cJc.JhiB4'',%F9ttq%Y#!r&@@lX!djD8
5&)p0IeC=>&6GF8`2qO>EhEM''g.o]s#!h55iK.Gp"1:>V$C;g9HK))GbkfpZ>I^4R@$5G''9.+GNjSn
f6R-\gfeQB*Z*gdnP_i#gJ8SP6Q2[6[''Yi''$3b(f]\]])''\Ig)Zcj_tFFc.m40`$u.OE"a9Q)u-8H
\*8qCNZ3$^4Z=k?&T8)NOaSZ+B^tiRpEY+2<2?PpL[)>?19W^q+P^[m$+EZ3iTrI?l&"3(Z_0fjN5K;6
`,\KkY_Djo]ua''<''Acr#9G.a_-pj"$F8@DL\]n2-1uQ;N''>c;-Lq.<(c8k[7''6Kh9?4p!GP:50lJ
V54d!9?loN(pUQW7=tHjM<F<n_6lVa9bkjWg,7k$#7mIMAn@nsL0''o^)O-f*12B9U1-0,T/MfTRIpT=
"?a#TC!s_;Mt,;m"i!?HN?-YQoHTL-g03Y[*gMf!L+8kC4Ve="'';]C;K1fhpLI]2,;9<<MjeG"4ensj
)<nO^ae)5#&o:LOmn,E@07H]a"%.)R%4a?%@jtmp3&b%3MqL["*h#+Yal(dPK3U`2ZU(i=;s@cO_eh`.
G#`eQ8^^)H#m3;`]k3kGVCW=DlI?4NPG"FU,#G>WmAq-ODo''f]_5@0Zp,ba:9;ust^Tq7;7;>D.Drn^
tm\-f$oA,fRXLl53g3$0EL:a(HCoe)C*Z''-aOmU<m0718mb8_1k3@:EI>dGnQN%\Y48!tWFF\$c."m+
TnL^5VU;ZV!hUgfq.*rsk?,uco%kt:*VrqC2sT[E#lM`IHb&%9Al<<u@CmW&9G^Zi"Jd7E^p)G''dbY-
&f3)V(]1<FG)fjA%f30QmQ+,]G9=.:l3j*ST7e`d#bZOGL3tJmflu\]:[*gf#[O-#5?TTNuc3q0E7p;(
Q2u3tu@TSi%J+eL:KWKcDA<5)F8UN]kL)K(Fbr,U]W@m+;4=FMU*Y!/foUfT\X?X04tTV?T?h4AP$,q''
k5*!.H\.W38ODUn%0YS-3sZl6YMJYB0dKX?B#k\r:hlLMkSk_WZ9]A(95M(i>4*TjEa!mg(7-ecg^Yib
KZ]93_6W#r[E)aUf(EZ=2!ZVP4OU?.4UalhuL7%@8`)+''FUdf!nq`J%h(BQ@(b:4CTT6Gj-93"k)#s.
L@4im4UmKnH^la)Bp?L$nZV>HR:fK''_="!gQ[SqJDC</j''EQ+(J"TS,6RKP[lT;gfjmAb.]=:-6W[+
G`b"iFrNIia_2n7[Y;Z"o+eJs4>@cBGhQC&9&c9?#_/t$_rT,"3N^k#D`/CWnGH>]fRE5QYN+9^SndP*
Y0,JRdF,C\^%:0i)9psV/k^KrHa2%IgjLSJ.%B\.)k''l7pKO1!NrJc+AO3W935+NmmDER_%+!C`be,<
WPb_Hc4%4$T#<_ik!Z^h8_j!X"53S(1S]G-E1h3o3--D\U=D*;3+DK*n8\t''sgig4p8r,f/]YNr\>j>
La.br^CF@jcH$cg59`ItA(gB*"uQOh;\i2X8coq$0aPgM=&GPn@Il$u-ORTY#FoO++pGC)gsO$-tNFce
g-/&B!16U_F*`F4L503*s6BNu4TjQn=4G8ZUj,EO;1</>JsR9)nn$;cnb0M7QtF]\mh0T8+9"m9_eH(p
,qNd`A\W&O.%SoJp`N[Kt#/l''s&[BVFh(KQk`,(Bm$AdBZ(fmb[B9U6]D?.$b1!a&_Q&Ppb7EUN=0bW
2j\''p^T83066%^?CDiRaG"jF92f*-ZFOY/G3rJ2]''gpm7B%EC61WUS(N<\m8f*pKo6se+Qj$3ce+j3
e[n_232UMtj%ef!""1B3Jbu#Y>/NVI<^G86o11/p8%]klD?6cakTNfYVcR.QYeiUaq`;l&Nmo]Xs1@J&
J>feqt:.UM<SK."(kSlY*@]":M><kBR+-AhJJIEmCUXr7:\9c4+GkleB8"\@(qiQ2\ml)J[iT<pXLZS/
3D!W6P1KN,n?UjI[!ccuE,&M$JdDY())Z\3LiJ/,Dm10WVT`P>)?lu.br%ZR%o]uP*LcI%X!Iu"K;$Jj
p^sUJ&4HJJ7,Z"q55:%8qBGrsN#%,+=>]U1hfI[B#Ula30@t<9Hpo''/9ARcl*mFap-SF7n7lr5*mrlN
r29h#f9*t@?22UJrj]bsWc+1F?9Fa_1P.P"9d<J\Croc.4$JV:rq7fl7UJrP7uO46+G=<!T!iGDH5''u
?49M#tS.+%uMIN@F@0VHR%BM7=>.i0EkD\lKJ$!ue,d/1L+o@8di,cZ8kk<aY7r@''JG,1rm8F;_H\NW
>3f+Qg=J(Oq1BIOCB]c]OP_2j&@35]R\/L2[E@dArG>fd,C&+8D+)rm-FW5ZN$#]L$<S=`E_V$WAE4#Z
8oW6,a?d.HNgDL4g(E?e\tjO+n9DUUKJCDh2C7T$VVFhC.^OfW-.6)rPj%I_?9>Xjspu#04S^28B<RY*
*b+0-_k/#JO&$Q/dhN2r''74O`(9EarJUn!0!9;M%0]J>T%O`FD]RPhC4RM,`@m=C''c6B0ed@6G*r@=
##Xr#\Zr02>*J_<,$BH!rj5#R;\64RmN[R)VeiSBV;#HoY4A#?!>%NV8&>1>Hlq%^e!f,E/Qh8F\.m3_
lgYZE1XNi%+[$VJI3s&,EW9:c@^B+*8#Zt?5n!l^YglE[b''c;hR6ULh!?OOkCe)s5r;Zi(g\pAe11/b
/f/Jp4qG[,j4C6+Q!!@u%(];U0ai8;=J/emPQgga-X/6g(3;f+9?g;<sNi6QO`4S:JJ!)?q!4jD<VAf\
L\W*dI1o?''iODe^fQ_uHCH%"Qc^d\`o8dq29Z"'',-''X=\C0e8bRO_X%sdY)a88fm[)U<mFei%<bli
7b66Zk=!nl=H2homrH7Oli,l961*,[FW%5.@kKmp_`i_''1(?dZ(o&U,6P>iFDm<QT%C&tiP3Xd''r94
("_u]lKV''<7\0XuNM,gg$To]rN*Y+U_X(7IE8F''%bTX''7A;9\3i0;Bi,cB/a6bCFRA?^kd`=,OD_r
JN"!Q+BSH9L,[0jgQK=2k`i66GCmQ/:,:RCV]_4qU:gD''],>$$3.%QC6m)EOf&6F)n''[Gqd0\2F4^,
cU922:Ej<8Vu]9cNB`B":h7jq5D"L0;b&TTZA#;_j?LHiG)l<?>bH[Q7HgcbioK*X0V<a0ksn\*IKdMg
/@10W4$55PB5B3$cXeF<OXZX`kn+cDGLWqE.4qef%mGM0F>i]QNojdM!%F=BY60M.WH9au3FIDKNT''%
+([#C!Y5K&JN3rA@ca1,6cS4&rQM5ke8<)UE"8g8;BUlnc_Pi1dEi[T$q@(9`/%KD4b-@VJ_jkg8EsD1
(Wj.@Ao:.>\p0QVCDgml!6#X/=O^%2D`Od3MH(;@m+4#..''ncQd319t\UQ^D-$qJ[rFnFd>Jg_KlHgj
g;PNj+PK_XRZG?_AB;rabLhMCs295K63XclM4AEbBcp:Fa]aM(3q908L.e/E8L8"6%nFGGXATLbp##9(
kc-p.l[R5c-Y&o^).U")mdkNiMro1hJ,5%#X2^u+ZAtRbZ[#nFDW)''[f_FpL%d9AicJHcGgjoir),Fs
,@$;Ai5jfO>2FK"BR1.@fO9ud2=!VFOReQ@83?Ln4Y#,O1iGeaT#A$&$)+cUBjhR.s&uB*3@Po''h(#J
3r-;VgY/PMZ^hT`(HE!B:U7Y<DX;j,WpU0d*O8Rp2-E''9''Yr!lmk]^P<=+he@-`fZ8EYF40[m$G7<%
1DNdFS>c7Kf8U$;<BZDQ)uVlK4@D1_RBPUJoR!hdK1(4cUdMhV3e#MT9*)5jD@c8I''rBNU._0L!sbu''
KcuR)Z2,GPW"G%PHEY\n2H?Np%@C(4GYl=c5%4[\JW04jW66E)#P18Z.''d]<J?''@11=**8#TJuL("f
''"4a@=1Z$=nQ3BV4HV8+#X5L"p+Yd''5&`4b:$.mslgPfAK-*!j-bL4psb9Pd-YLB@ec7cdu1]*+LhG
cTqGL7jlIVs:4_>TLu''Z#3EfeBj(:G7"II@P.*)P7Q#Hj2U!C;pjb1kQ8\8#9c#cp1CdS=`]W<Q#X(5
hW;CNG8MXp$E50m6e4CmhK9`SD2<mn8gYdCAo_/ZOC,[>p4W<5)KD*pD*j\s-5g&gpK,(#lqjl9MLe>M
k&*Pb![,>Jr`f"qf,WWb6][HPs>&%7*''?%Za\I4UV\''V4;W=6VjbFNajS[n(!GAT4M*N#Em8!!r6DU
je,0"QgC?&`Kpl?d`V7AaSrbu]*CLOM@(h_m*pK])^]BOhr/gYTi&4<pbma0X^R19HoDG!3)-a)$7l"j
i#h0ePl7:LT(bTNkr;BC.r3PBVBCI$.21tl_[69__])&;`PL)+2"b,QTTj++3Zc&NR4qi53%^OCZ`ULo
Bq9e6m>*:gqQIn4^6.@C01VLT`V%h58rn_po#JnU,M)nPnDjF4$Dnh3m%/9:.h\7iZ&M&T8=e^,.k!''
Mrc8"H;A77gcZDYaoa)\H8#((A&4;[sV7Haa:0/&KB-Xuc!`\:$(i;7n4b#ldbcb*lPp?H^%no3\;e<a
6@LO;(tX=+2S$Ebb^e1P+$9PGkA8MIiAIqs-GPZ>)@PgY[e^)$''n)^8?m:"i[f5P(gi#QCLoW$P]REj
cGhk+>LSoTX4K"^3k_4^)bPAVT^+Gb!7E=9+_`r9LPt''>+ska$S4FU.h`p=iF0G=!:k=/`9j,/Wm;*Y
''C0''E''h=P!nD40c%MB8^V\_IE_CZ`[OZh,Y,))B^\GpR>!.u?GE+:1LHcNhd6h,f=^q*a)BZ(UPfo
"kcPZTDFhF\R%NsDo$&D7,X=5(sH>R-ec`.AhnNF>m`\eZO<0.dEfSJ+1T!/MkbA1''c.!.-@1)RGggV
`ofEWuK#KdZESc/Z!(RpiZ;YejapT#C)o&Y6\"oU"g9#"5UlV6k8Aj<MA([\ZS=]@lYM4YAF-<eNQ^c=
@oI!6(3!d:<He?M5L2cB'',ZjQVtm%Cr3TF3D-=d5$4[Qi0Gek-u3bX"`[@rG76fWdiTXkC4m;3dOY!H
^m?eKe''AE&0$W>a1-qGl)nO&-''.6$(Ih$%V"0C_fuE\.OEP=73aM"nNq&L]$0H\mi?iqgkjFO/ZG3*
``q+dWeYRR_EiVK]7JB55(JRb!S4.m[^OASlVL.,R&pT4Z[[53NbjNUCH)2j:E-3mnY`r.o^jJ_<7^d9
6$ll,+]dORUrUB]42W$<&5+q\e/HK?&ptd1OZ]''0nBcb(-2I\"J"05$KIr$\_oPBrf<iN"oV%@:dqJ]
.rIU_N>&l/Q>MoCohUFYQco:LrJkpfZ(ad].4.k5=HnEKugq/!\LHE"XK6#T5%:h5&7UM/gp/''HgGUG
,CbakTp[%IHp*<Pg]gG+2V=3^0baZ)2$TP_$lEM+H`"/WRo8j2=%cnA2&L0\<;4"7oDVUWf<-(0un&m?
K%HZDIY2L!o<C[(M4&;CjDLS[,:#$r\;]56PZ9LXh4rQ]d,)CBRp;F45RirnD,%g1GIu#![<<10D!hi>
"Wb0=@TnJqREM%,%JD:lus`^!Uf+!%r;<Af"1m5b$tX!Dm2b(Z[gQ<jfk#M1RgAT&3I2\(&G)oc>a9Xs
>J<`:Op-s,Dlg/ai3<&I>&Y*SkScX#82pWt38Lp+bE@^GZ+3a]\t)Jb^PWEeprG;5c_d,6]MT,`r4)&X
8Q&8R(uR#4+a;$@4;u:V_F6+df<-CVr[OST"mc\jol"SXib0>HX%I\>7;">O,1GX@S2&MMR^Z67;.L\Z
!h''g$"JB:r[H%X]uegb+l:uR-GDn;g,F0[A1Xi8O5ssTRWDSCPb[\Ttm)FIEG5"$(GYTXs%A!PTt.Pd
tI;#8<7p.9cb:PI3^.1g8j<]pj<Z]/GBeQ>(M#-R+^Rp_u$eZ%J/$i)3Km%R_obJIi-I,]Wl1%6h1#dg
M@;?''=T<[IJo-5cG;hZ?RQn/liNO]Y.SM0GJSgA=&ZgPbc4Nn,I\/rD)54n;"]?/#a&%Nj,7RS$o3*O
"69O4;7EVK`n=OZ/-9gi"n$lji5NOL%_(RpN7[SHn&/^+NY>''j./+7(\S1IVY0!fSb7<k<mUcU,mGQV
o>\`3=YX".!UT"mF+!E$<Gk./KdPf6Jc:%0Dq5G+Mfrj#:UX;18Ii-2t1NHucVdge(Y''@8u!a$QEg%<
nh2.RjAE-[AQIo47T>7mg7L/io.RWh=#\Hb_sbWIfh`g)%G[#dn7X(p:<nM-Y"()7''RD[Y4qb*'',Zl
OnX"Sh?sT_EdrK(F_CtZdAEUfl:<80Q06e?P_!5LCNeQ?+p99eFfWNZ/>819\iIsQ@HrCZ">=??.cQ9d
=''FEa*%N==7<FUQe''-5*lCr\8OHAKI!Q2Zbp>eH>d,o''quKG2/XMW<eQ`9>oJ57Rb7WSog_(6/.lA
C4WnaS3gUd*VN3SWQ(VVlh''[Jeo\S$)?KS4hDC50BraU<Mk2\E>a;s9Aj+)jbm#no50Ji9PT7MeH]OR
&!0Z%YoP%WK0"/@5Dr&?cj%=pD8_$R`rd''IOk0ab''4\+h+j\rc(T?DrN!cB0O<WFq9AI)\cg)aal2K
USqUoj)1TH#DKMW,PHTV8YMU%;O;utrB&#p^g;4$pNOuQ''%ic:@^Zt30EkS9,p6^5q,*_s)lqVQju0r
T)o"gi?,t=^,`#"PM+5S+CT6noU@)XV-,KFD!UJ$:`U:^cAR>>PDYOq8i7OAH-!nSINdQ:Z=o@&0*Uh*
Eq''++@/"8slMfL^`4RXeq_NFhg30DQNN7AVe@JTifgE$btYc<F)DC"m52U=kS4U0Ws,$5*lA>3W:EB<
;XIdrP]Y?mpYMX<FC,DNJAL.Q,i>Tu##Xn[J6Zk(j&i+AapGCRjh)ui7i5q@^I6BWJ-''q,>gaPa?U>C
n0=#l&Q[!2p;U#PrJDZQ"q1MRd0iEZ?%q#BOE+V_30).@7N_=0R\on7V/KFd)Vk_ehDrU1BU^=s(55"h
CeP)6DXY:c>;mJ%=VdamZj(N.1uBSfH*]PnSS''m\FX<Rc))k"ulHtppYh-33.!_@O"V]i8uW.=KH7K#
t&DTB66eBQqA/>oq-6<&9?OZHQJ<j_r!DEa;TFT>''(#2T<<FI,''ob9^[0,=A.s>XZH5N>L''=PuroU
_$!n''%"I%k&LojTJp./PaVm$g&fJmch!''?''>_)T_\`HL>QKH*?GR=12h_Cp.n`+]YdReFE)R=Qne8
&)?B$]Gd=p#W=TqLVL<8g4=#a:LJ0''K.!hg]#+a0bpsDaaq#6?Akr>[0P=a`c*gLTc+%D6e*)/j/Zn3
lC0-\Of3*iH;/0BT6F:5?2/''sGa-HTJV9t:opT2E0b=q/eMR(jheTNR\6(;<6;cZF09?)ic=+h,*;9b
!tA9[t[B%[CU3Jc#Ni7&kaI`Zc^[W2!BM,Tt54./iV''jB>hNYeGV/sLST=,[TN.h`B64N?SeOEJIrK6
Z!j.e?(l*`rXi/h75O)Kagm=`O:3AiR5_OgTMr"''h1mJQK0I(H@[@-F81D11):f<Qpeg:\sglC\+Am8
>ob#AreQ)*A:*f<#C=uFLXOT?Xs_GV]2#r:7RipU-8iEn\Gm0;ICIEBOtu:F,lZGR_XZ@a7m:WZ3AK8=
 %La,6Nt7kJ*;]>^>FEC%PQr3j4?Sqe!&%(jFt56''VQ`J?rU0gg@BZs''t8f^3Un7,9H6dd))r8>1;d]
7MZjh"IglN[p)k4J!1''=i@2e:tg&''GHi@%#X4L`33Fsk??CCakeQ_CG/&EES&]]=D/9u`F/UWOAV$C
aYp\h/edYb8c3%t\CLg3`$COeT[uQL<.''Me[9W>ZD-p)2nsdDPUq,eQ!;U^>R)?OO3''SA#5.8rgX;"
!o,6m$<oru''q;AD-d-<bJsN42Pg#atCW/nPDX%''Nl5>=?67e(9Be@/Gm[jbj;^_o,N)jc5N%!npb.W
j&TkPsDDFNB?k0>L6:#Rrn.B0p`i3Z0Lii:J=q,+i2(g9Tf`rj_("Om>2Z:"/2cA4$V''s>R(V2.pF);
_U[L21dnWf'']cc$7O&ifNM&cq''FIlVu9re[ZfTec/Y?MI#:hJR/n1:9>*Sb[djg,\tA24la<>&Y#WA
V@=Ga%"S0VL]S.blc4eOad.E22NHEHHfi@r[`*<q[e0V?NgmO,BXo\B''^C_*B&$KQ@=n9k<S;PZ;PB*
_^Ts*j=H8\,SoY/f0L]@-7"NflU\H5OcgU.al2YfS-n]7cJUo6%!*&Np*PD^UgesG2gKm\iBO?berM$s
4;BM!7d<Z,0oc,N[rWqH''MLgPs/b(0OSdRfV+0E;Jm)3LQEEEGK:EJe#J]RH-f2iK(7T^0'':@t?()P
$Qi;Ce.OK0JJQ<9.ojmYW%-gX_HUp(g*EjldmMX&\>n<3%gHkkq[srGe<bRnH">j3.N^''n)ricWDl,=
q;''/"(]a]n:&=Y5F&:c/p6%MiqC8&486dbDk''a=,F9%.JH8i]7lAkmJe4''#CrC9.dnofkP[$apf&X
FY)]^l-6c*nM<_i`J)XBSj\q_''_!hu:=O=3(goGeeGmI''s:<4%MW.L/q`7c-l1W.akhLWL7rbNKdCW
W)O)kg#q_b)L,=?]sg,2k&jC/J<.\2c#^nb0RgOU(M72c.<I<s*Q*n0QW]6ZD;*?n.AsOXfs\)2e%?:c
!BI"!mIC@qn.*8;F:+7A.j(+-K+''R]$9FK,G6/gs"a?1!WM+X,O`mJ0"t5jIB59''Si3/MNV9807B:U
o@%4l%T(b[CYEqUEZalsKO0p+m2g0b27j^(oW=NL:%429e@98S7ap.63Wu)qBA,mAP(>[V&B67L!BL@;
KJ#mXYYbJs>XW^@?e+n`bhl"V$g4Ku4P''m0@0X;9qcf,oS;][O\Bic%<mF$D2f2V+NOJmHp,t''G3%]
lP(EDMWUS6ll(mLFr''d686:U0?C.S)r''l`1AeN!nX=!=^K:l?=(2''qYB9=gEiT'';a4Em%(Bg1%\t
D-_4<Pp09&50OS#FC''rh1kL^%^O"K)VDVbd@CT1!.i=;p!8n(5r:8Z<'']HMqhVk,Q\<P''H(krQ*,\
8*BlV>bkh,?#?t\Y/M16*Q[?pAuJ`F3E8[S>2U"?iG''"Z=T-RUFAgI.#E>6^A@8PfCX)4o/%t8-%0Ai
i1M;7ID/Xn.7-+\-NrfSTcZeR?#r"PF4B;EI2Fi>BrrRbT-`YjUTF7OI$Ji@M\u&b"/:cPMn.a7Fkbpa
CR[:6KbM6M4ku3;p#_Xe[&p8Np(G?Vqh3SB+H4o;NDbeW9-.,oW5Z6mdZ>rP5oi&Vi/qTAe$@B;ZT7+m
Zi%N<"Icdt<IAkWA/[C>uMo$A-O^Y#EM:4,BK,M)W0t4-[g5<^k^*S?t2s<4IrU_2X6"*n+^X0dNZ$n!
pdat*$/03U''RJdS-*Z.d4$OpscYsJ20!Z)QB/p.UK''0kjJhk9T9VOJf-`A;Y7>7R.JEgQRc'',/mkO
<K`Xjtih$GuP@`a6ZNHa0k$ZE!Y%pI"2tuib4kD/-bHcKm%M3$!9p$:;^JPOSfu+UK7sUeLg3I\qCE\^
02?0Ik3XB3(pu''mVV&aXrCi%a7U6M&#Kb[(?GVblDRlFN@aN@)/AsKaH+QD%%_%,kpk/Oc1Ncdq0\t`
Sqp!1?r\*a6/oRG`ea`?,+u&j?@gF4&%M<Kf(#s=CE^%n&1D;!<r[s*HIL@mq?q?ohdd5j@=ZYB(Ff<t
<.UFp0&uM$/!?*1k@Fk#S-kSfeZE\:+9f@il[.C4X$e3U`1Dc.4>p5Kj/RZ2&N93%E%5]argR3Gmo1!''
N([Z[OVITsY<fDS52U##iiAtO:S\"fiI6kDc@J8[G&+-A>4OZ^72`"Z*0lTQfk2P]=)WW;W?cL!).P0m
;nab#j+3AE>-2bP/LWH"X''!lOIL".qAcL_(Z?M7?Hbm]/CX(^IT3M6gBUP[(AKq\8I-m)UZ]O3DgYu8
//%*9b?Tc02iC0Lt"Bn35I@ht^3`J`H-ksB<Xk6;"oiNTs_AIie(">`tP7bDKO0j\1[#*bcZc''*4ODh
+2:d<U;!\4cGJd=La"sfA+,qTA5lGjU*^`5N?;:7NB`VH?/j*!eWFojS@=b@ONACG"I]--''LSls2@Q*
4(`3f>UZ<ouH5X%9Q#krDmSZVm8agKKPd2Vs5XSgBU%J&lGDcf%[2rbf[-4Y21S+I3_u86NYK(&0&9Fp
pK\jum>/!N-S=G[`gY<Uok&Vhi/,U.u8>&4Mp6rnblJ`4Mmsfrn-\HN=DCn-s5[Ch+GhVb"KS`#K#[*f
kX$qVI69?A*b=&AS6CfIF1s:TVtmqFKnR\KH9)=_Rp3(&/#)V''+Xt3TD4_o_AH8bK4((K\<SSGrD#IG
oo_B5?4iISob9$8lCJ)p2HcPdHMe\6Q`)uW5C.5RS(P71]jGaQ3GZ09P*Wk/8D\9*jl)uetAT]BXi_5g
-+m]36:s?PNGQgG''KZ>[-]3DpdA@NMg1pJ"44CA\bBS1-kCY)?Ytu#oHpc&aIrNl%<G)/jHg)7jZ4Z^
r2%U\5lT_>5Mu=nWhJW_cC^F5nKkjK549J+_Y6!VCP[\(*QA?<--\oim+c9RQ$);]eslM;g(U?Rh[N9A
#+9gsUK3F3H19*o>WJp?,D.qMSGXZa]2C1\7UrM]XR*tl!''K^*o9*^0542L."0TcJ<)6ckpYX,]P_I$
=I-3''3HUcgMI(;Z;pRmqLjnEP_JB^S_R_5_4"L`,*"KkZ(oq;.FFnMkkbV+W]Pd$d(X37u-gL"CdCP@
m=+c3H:K^rM[:UI[b/Pp9[)en"=/uZu>Pe#sOfj`g"`enE2*O5XO12,)DDW&`Y$mi''ZdY:o25G1G27q
\`U*DrLke+rV"Qn\7T\D2fNrVBPu.XttoEonLl#D)u\67r+:Bf<$UFGTGgn0LEt\6C_FF">Q%Lc>TI0d
q@oXJ$RR5`Han$SP+R$HGRSU^]@]*1;%:p)YCs]/Ur#+W)[Q2kApV7Fe1[h^_o/i2k[^k3j&=C3>sNW8
>04d+mTjFj->4Y/!0kN_olV69*q.Q;a\sb/ul0BmupM]42Q/]ia>nhh_uiaIWsFee''XAFqs;o#DctR1
*n"+k1P!l-h1\IFf''>Ba/hqZJ2DP9S6^D\IT+#T@H@.%9E#A8l2!2d>MhrtM\c<I)_3.iicpW1_djkr
JlPF\eN5l=IO(;bmY_$4pU6QkDQ;q?C,=sAdZbS//tkZ(@@h!.V3u8#pGDu*>,,-_:O(`t!icO6&0UO_
]D\.KlP;l-(AQPjAo6cj;_P<MdWm\&IVL=3AjX9:W;tSY#ds4s!D1reZV5)PBCBbB//6s0#Q1MCX=?SO
d+U3M]*\%nU-a\_OU@+&#">M3d9(9$pq$jS3B!P3(o[Tn5o"#>k$dA/-L)SN=),0-$-,''k%ECEfoO1''
CP>b]9S-g1Y[tt$<*6n.(,CC,IHFi$82Y\cRAbh'',@84-+<=FOV_*Z0<&9MI"W:1(B*2e!B>#V,#puA
(,[S5)1)[+#ASmrA)oT]sM3V)0SECN8Kd@Qe\U,T:B#cdi6qCa+<-r\7Y[bUX4<eB>,Z[lLD:%di20D*
#U/fbK>FtO8`cJuqS>WcReQcF?Kp7PDsG`-XUGq(3YVTM=?.T^)ujn>?!&M]tpUm)m;NuTnaP*O)ko''
=t>N2](?lrGbcS=3!;j)3V#jrpM^Rt"^#dtp7YdO((a-2=V)`pC[.CL1Z4/dRjb+uHuQk50J5?"''jMC
)G%6;GlLc+8s=<TfHu`h\J2]pbV3tDA;HjE-m!bEYpRJ/M]7i]C#\)",22Oi3(0E6Js<J1;/^I0\lh?K
L1sP)$VSeL0<X&Din>?BriB90db0"!J-s5K"cr0.hbn=HAif7JBlH;4B"#nch>%G2ro<8\h;EhC+tb3?
^s"mhJ;4Fo>`*FI3?S%(>^\oX_>gl"+30F&Zo,>bFe/!&Aq:&ig$8\C?scC`W8efYo:H/oeReK?=<[$R
5R6<)l$:7ag`7S,cZR\a,][9+*$sW0(B]G]%KCbI]ru5^60-?qPND(?s@3^aW6&=59SM(+rL+Z9T[PTC
''91Q#QihbWF@(J0(>J*J8NkcoMCMqTVebr.gSNpm8n)$#G!"8;X8.tfasZc1LnD#>jkj`r_L7=YJN$t
.[J>Q(Klb@+dBp#iur`H$,&g>B.j=ta\aoG''HKK(nN\\#k^EXr\K@F.-N4aR*''C;>1ShWFWro)k*P&
D&?-rcr_R[/;(drXF"U(B4T<R2F(P72gAn-4B8%>Eu#%\?]Jn<i%H;,>McYKl=\TSd72]M:Z_7s(>FO5
m\FgKHTOne;%@Y6D5!k"E/BcdG5[u/SZ%B2D<$0*j1="OIb.K&T*UZW.q+;41=f5)L\L3p/[8Ap.[j\J
.4''pPdJFV`\@;ilTo.n;ZF0'''',CFu83FlFhKF&KR6IH_E1o@tPuQe^Scr>aMIuRrcMMB<ZJ"?oH:`
B[rFS&aIuJKMrlR)j.YD/\Fa/65[&LFo?t4ffo>:JVr''gbb4iG7/E+-:WcgRTik66(T\<t!s0VEPnB+
B[IR0/Ub5Jj#F;W1Hro?!2=e78%Q:l4"?7HsJe''V3R4=g:$fC(=7[+O.i>.6j+,P]cXel]9d/4>Zej:
Yc\XO@5FehCs<LZT+XS@"3;HCQ(ri6?uN+cX!Gb,&A?+_lLFCX/h,?VD/np[Pd@[nQ+;sMEi-?0dHFt5
J:Bkhm).?FW''&8XOdBL1#eQ!*8Hj(>NP"HeC"/cpBA6iJ5n"V>6\<[)N(CuS4(9$Ven`cTdQ/LIR0Q@
4s?Fr^YDa)"bN`%R`g"FTXc=bK;UE3#j*&''A@O]R)0Bn''2libC4",fhSXLWA4d6Bd?XQUrpPA!OX\F
D2ErRWF:p<62FX$VQg1cY\+J+j`$7cb+].K#bjLeO7Bs.89.Ns846NnD=.lt9Z^#?=GhZ*o24&u/kJVa
VguJrjNTK2;B&J8@Mp<#\@XQ6>=UZCS3,5L/p+7Y`I<F]@sM?glP[SF#BHj/XDh$T$/!</%nPK8K#NiF
dBY(0U4X3`3/(<+&AEKhndMIiD:L%DY68#chp[d;WDefqiABp0]A^L)''s\=n[Ujdg!]kG"K9C[mp<4o
Aa_]SL''BEe>Zp/4e_T7o%-0pPWT]3E)m>P0i/[_*>c\\pKNml+Z,3mO&X+68=1N\eM`NYL]ho1]?#tp
IdG*EPT@p)#C=T2uh#Z\pin`8;P)=b=URDV0,7lN&95WUT$G>@.8HX[2ki:(5(DZRSA:u!D:ePd5SLX*
(KHlDQ&7W<,fC^W/)T95V=!EKg*b)CZU$r;%jmXXQ6ESj9-J$idONJ#/48^.Y;mFNP8NMi7r_$?9)Tml
$5Qg_@YpLB2VAN<H0[5)ZASZ(D59PkJASRar<qo[*=n+2"EKs/k&2^hgbFOZ\V<Qi!%f8-[<L,EZ=\A&
d=_T`E^D)V*(mQckQjep0A\i`00NA2d\T>qCeV%9W.Om_`s#Mnso(E-3^@+-aU/>oqjReINABd>,2iUY
!_aD/UH4P6''Kla%aIQFNpZgTAEMf<8E2h5m+E&1\7_o%T&/*3XSaE-afBZr6^>jnYJhB%!R3?C2!''9
01u3$G[]8glL<qUH\O9!ZNPgbRHj;>6!U:N446LcP$$2H+/@NO@?@5UIMGKp.]Q^<FL]_/rup8`@3[R0
,GmY)l]+*Oq3m[&\;)i`:]]F?IG"/-g-_]''ZgTZ/>8d2`DODcrY.kSIoGrp-AMD=AgQq*r&>3s`5B*E
/oBLI>PC],]ZjsNWnUMe#''u^77-kh`<f0JY4e<7Y(.iP^.!*cR;,IOYcg9i5+UNj45UclA_''GUbQuo
WcaoJOQ@[84E3MYS<]ddOpk.Oee6qda/EHp<mj]R!)X59/Y;9hGh*K2$i0bfHf,@$3?;\d:Ua7SG4YN$
ekU7<@?l70!E*e=G9,''DC:Seo!6olbC?F:m+>?2-iDW)@jj>*cEN1gL<um]0F!mYo@e*SQd`LbR''96
3)ba5?u53@V-_Ic8GTd(4J*;!43Y]O6U3:(!@PUhUrA7#?tP1nPk%2oHHc$P4>>LV=tto"3=^a$UGPFe
!S$9Yp9sufj&krDFo*(.,i$f[&!dL8gHFmYOc02JG;7Onh0U1AfM-BWTZ\p%%/H\K(f<\''''AN)j-%;
D1XoNW9=nrgab!54UICGOOj''.nm:^L7WCT''XMDkm'':M\s=N74t\HcOR#R;DP0r4BCF6[b8BH"2<eZ
NMpc$LM*''i-659="j:tLG3^>q^kb;K"QdsDrNBO:M"4E\*\u[5^,hojKmkcC07n)S0#T,UF;5/\F69b
?AXD-&,m=*AK$u+-kSjs6uM>^URbSI+"L3idqZuR""["gHLejfC<Er]&3DJla[b+5&=C&#J$O,"h.LeW
aXY<N?4RCKEq\XOR7YR&*ek7Pa3^/qk-''$Phc!_+,aRs:"55>L!N0/FVpn.;ncXt0fY%.g?8?L#Qb%=
H>,n0rl3b4D6]%L$A35]-A@e82pNBs<_hb?tQ9LarQqDSj/]PEM*INO''^dUr;=@%sWSUf>#4(l(OSET
H^H9Gc0YDnr,V"]fZo38,T@aE-33_]^"(d_+J$[)(VTV28/2q0=6M8BV0N<h/B8#)p''I]u!\e0g@Z2.
j@7G+/C6qFq:L<<@UAjJiQha''<NYB_2C=j$_=)#RcV&Zefro/oNk.&S9&''O%,Ms=&F1GHgCejm`A5h
h<h`]I#OGUb)gjb"LnE^&;ORs2LrD/mmb[fc[5ZRHY$`La?$-jg*eme4=cA4`>r:=`O!$I^CpoFih$$S
XXT<*$l:<=)\Un2ESf56-:5!VFiTA8O)-''N@lJS''K9!hq^4?Ve"OS6%?^APsq]p9!#s:F;Oge2+NUa
''A4JKisQMP6)UE:Yn_+ZF/+bDiQcks./S3SMT+is01(fO8j\X4_M,5r8Ccf<[)nePc\RmY?:?JisRdd
.0gcEP`H6cNY4+]s$[g/g''W>FNQK%UfH''E!6Vi*rDK53gH'';;ZUc/mu!#"&pk\*\plPsR&=6[l-B_
&_(G-!fBD4]FY3$#^8WT#9R#TqDrM:4L53/pjJ(BDc.FIQS-nf]*ApE/a7%`co%J"HGE=4Gja2[s_;mb
kCIDd''6(TW[AV\DOjm%"/oW$Z.:lLVb!2.B(A%lK7l"+?Jc1u,1!&s47h)CZ6rd!XalW:BZ?4>W[h)q
*hU(2Zg.:5^gAr$hoO6t]![sm=gBViG4VFt)o(=n>:fLe+Z[DR#*)$o\NAkLtMd_Pt5EAnqfr=M!hX,K
:<I&(5qLa\^:l9d#WgXJ%EW<GAN;ldhonX"+M"Fk*<l.=2jY<neihYVdX#9dSS((Ha-Bt"M%i-RsT=o:
U#/j''L-2+PkH&6f&\1`r@lK1#]4bJron%QT9BW0S5b[n?8"o)GEo+/hO+X:Q89KHc(QK,XC0dm$1lrM
,jQ`IC;R9d1FZ$igX;7H4XB2*,.W6L0@]Ek0L^b0<^P5fFuSJk5\mPI$_,ak=a=,2qX9Sn=]^2^I35a_
L2NFE:tPs6e3q/<_4Of)F0ZW!,+`o+.)%)(WI([:FZ,%iWMK7VdkGJ00KO9j\@4Ksc?!("''"S*]@WfD
jI`[5n&7o;m+@a^]KcQN5PiLpeaL)=2e`%Er^t%IIX8A*_`M\/bK-[IkW6ZkE2F,SOM2+:UCHS)biI+d
oNZHB7V:2A_ZrfON.Z@8fV$A>''oG229_\XMlFU!J1NNm$"ggRC`!_0M]5`gl(*O&Ugb"RaMqocq[TDA
h2O_''96_)eaj(["/XAG1N:n-:h7.NS-t0`c8+lj4nUhO&<b0O->G4AVGsHJkqYEn?DAnZaF8s^%:L04
AJ\J(T$JgSL`1,9RYqiNjo>C"n1r=>&L/TrhN;gdUA/$$9Bt:a7%.qJPmgltb=WVDtT`@3h?>Eno4Dhp
bks%o5mcI7g/(=ku@kj6,4n8+[L!sK@>un2IF@=BFn:)h`(KDFV1<AtO[j*=o0T2FAi.nWT>".omKG2a
O41jL8lS5b^Fi8Y@p0jq_Zm:)uXo-''7&*@p\_!/I%BrCDgTh+LJJ(B#,A(Z,i`cXf4D/MTlVQ1nJL*?
q?P"Oi]*0D5@S:#bD\`!g]7Kj,.GE=n"g@D4ti2,hSai4!KpSsfS3Iaq_\c28Z(l6\57S%MMahul]ci!
,CY@*s>G\GW!?gQI+ed`EN_:Tf99PWkZ0piiS(pjT[$SBBLUXaP%Ki#nB&iVtZBS]_0;DUi@KIP4NG^s
kZ<n))=)j%k>&tdchGJ^J;[1AW]5Ka8JF%r`r\5l@FOq8]:''l)4LPkApS-9M'',.%GT&F42FN]@o)0&
B`2<,aL4k-*LG0rsPk=6c-KMSFJ7-`W;$p[S?tj7(#8&`^iFSO[kJ;RjKf$!@n<IRo]h\8H9j\Ir/Que
oO)?*Q=OZ-''-ng$l22U!Hc(6KSQs@^@+UnRh&4rQ#3L]]i];2Mk7,:r!n-q"p?lg.WZ3nIj''"4lC8-
/C@8CTG^i21"@+,&\Z/S$*RXH:VXV+2rDu"`mmJA[=o&P,p?mGWnk/klY4Koe\rbUA=M/u:oM2^;ie0"
TK\NE12(f#/$$h93^_7UZjq\BB8qRB]''nb"WYN6$@\/K2%^>fr6ZG%7`=U-;;%(A''>gQEE?l@)''\=
7f!dBS!nfjhX5M\2*8)7''oX0!P_A<j8,!Y[q%"JSaM&p2Olfr%S,-4=Ni(bPK*t9$cM8a6%=n5''i_H
-Te28sc/:Y*fp62W.H$r+F<`s7<J6+Li*W]5ZWC''^c''N?^?d)%q8.@;u\&dWi`e+`d7.B`qNdX''L\
[-\F@`oD(e`$TJIFVc-&T?\%m,E4ck.h(j];g3PD.9L#fJ7Pl=4U?<>oh669Kd<JX(G,DAu@g:D0qAMo
WP;"TJBUpSabs=dg9+2j$i6f_/=KGYc[.11bD8V)@8=Q=gE2OY$PN?Ih"K''moYKBRh0JaC0tei6,(?^
;/m=@2?YA6DD41-T"`-[B6c1C_;r8MZ>Ya/JMtP2qO&[?VnH0U1tL_rgA:o@DRD3%^C;W!c''e-sU/q8
&+cmLs)7:4^4P7s[NA]\dl?[VUn?]#DP$"N*>?s5q*8`f4&D(C9(oP%A8m,#c_DioLM\''aIQ3KVK[Ge
D[5;(^X^aZ]^&l?s^9pkY@1[]5)[ELkTU-O.!C[-<.O-(pS0lmZXDc<l:i(jX8EO)&4]!n&cmi<H"ZhE
(-IOhi0Fl>FH,Ie<YpW\M;j-P*ZVb5&@''AcKs=smDR)ei@gFnU,7#kjLi!P#bQs,7@,=1]_U<0quqX>
cT5[?sNgkujcsdjW[<52MIW)-\o^GHR:o+=G5r/FN027H%''jBS0JTef4j4oLLNdn.VZi1Z[!b$-i\>r
j/-nL*J)t;0CA%7QZsTQ@`>JT"8a*<5q$90F_Eg3k(&_5ZnngbIW5f^UqZiRln(Vd3kf5XpV4:F<"''J
)SckFYE!UdN"''RDZPZMg;q0a3ZbVD=J:[F@f1]<c87J9I"mWn!*CL[odB4\UBYT7g(::]>fo%:_CblI
K8ZsYqpVj=WenG1?5^NrlAl1"%+Fhp:2TbEj]2+6/B_+F4\Y_YCC<EU+($Yl1>q/X=oUG)fdB[mRQtkU
sAFG==r,KKVWcl7Lc"?,dNk]_uN$!4N8tSi''@;@`n!Z''.,"e^/(\fTG,`HcOk-_`a=LlUlPi/Wc#+Q
H/Zg-m:f"YeR%E5$>a=%]u3R_[:O=*:et=g,V<0WGQR.l%c_jVo<B</n''41`<XoL76AbTn-M_W@T&8S
K)[ZSRgoI.E*oZWC''C-+J''s-gM)2:T4psV,aQ_MChkZe#[":'':*HtK*GC1@4(5?ijVU=la0U(/GGY
uDAhCY/CUT!^^-d[S2Z^7ih\_^PE:$H4#X^BhodnQ1?7*U_;5f.6g`3)0Z65pO[:T;a4/oIf[VM!liJ0
:C9N<&<B,d^cb"1]uPcX1;d$ET+Wp%i=_R:dR>X"R*''T1par=GJV;$M\j^hFpLTUt]s"''0ID\aiU5!
^6[0-TSRGj[B7YXPu^@o-j1.ck+"Dre''s1''B&t33"r2WH$P"As"Eb3BlHU>M_hsoH_6-#J+jJPeol\
`Dao=1-fB2qh_4lq6R],pYJ81"%Ah.drp<I'')@UAF^bL9FqoZ[AXJ*4!(E9p[>or8\[>%@dY''[h2jP
ctsDla8jLpY"ASNCP''Z*C^+-2gdc334@@cJ<^m\1gaY]^5^RTtFadm.kj''.$BHrJHEX))Al@_rsCWQ
2kF]=324><Ll0ilI-"B>Ak(raEq=ct6@Iq=B.1_''J-PW:PoVr6CbP13.*<mX>K%pc0%2gcLfKuZ9!dK
 %*,$o8<c1j^WO:L\Ter:l<`Rh=/[g`/e@fIc*RTbd[b*''_R@m7+_IklTjNM[$h2i6Nf9G5S#hC.7Qc3
:o<j;OfT],RQ3fAQH/O_c1O3*5Zs*(`!.9/)<eUBG_0($&"l^5XS)''f!<]JWIS]+),n>,25Z"t2DTAt
C^]7J+Yk,p;N\cDZB89U[/HntX+#,:][dSkpQ%N(<0''j_jr)rClM_PqE-0dk2Uqd*#<ci<.FG*#B,GD
I/eJ>m->neE4W\rqskdH+8uK$IEGe?%Vrn8!rQ@H%N/e4IJW6*UZJVbATh59PIi%3ed,7E:XAqN,5F*L
f!GOTanX=F.(B;H96ZE$tqb+N?)83>imXVo#UDa#:#IIs24hZ5Y0s[`M7-q:edS)/W$2rCZIs,?m%)9e
t>J`H_r9u7r>7;#`;`h*KC@?774DKGrZ0sJ4dOjRs6a1%=XQO("<cV2\J(FGl:mO,!5,R7L%V/b^37b!
Y]pn>KWfg-^$et,3+US?".g8e`7/a%:AX,d?jAN(kokh2%!ZP=f<XGJgPThqMsAfXk!+%'')aY3N@Rf`
dr?Lfnb?@R3%4TUD!qTDU]B''GT<&XY)9W\rC"$K6?rs/*6Ys`UF*5X+*/P-V+YI,`Cr9Kl_Y-!*l-6&
TBG9T=.dH!L3\"L<"K8<os)hhcjV_#o<Z:!gKHO[c(Um\R!_qeQ;AS6&AP:"Xm.`eXaf/H[HVBUh@3>k
O(fEK[X5`pq`eQQa3-_j[N$KFc.JDWj:9+tK%@C#^-11l#U6)+l]b6E?D.Ar0f.''SgZ`3!C?Nu^7Fb-
q$E)sKE??:%r3YU_B:YiG(b@e8R+\N;=$"FoSo"QG''h_Z?(S5,k%''%L:IDB68K-Sa2u3kAC!AC&<d''
S1.'',AM&,GHhaF/`7n>=''@*Jb!cP.q"Z]"HMCK3U$9DKp6lXa3_rlOa=sdmmkP9CSK\P`/kApM="na
J<J>f\YI5kj<X]=MY"J"D!HMDTCOAdN]EZc1X#n[-(Hsa`Y:l_=PR+DmccT*8Jr?CamOiODm2PC]>G;[
MnO/Wm=F">M;*Aa3O!60$IrER2L(D;\frcQ&J-G8W7d+lON[oLfiJ52g&O#o''OjRB>&OE9I@Yk7E-"q
3KKN(G@>aG9shN\SRPt_m#k&JBglk,!''\7WL.A"\p'':blesqYnI[X2g6fq0JbF+9LPL:l"=P[XGPRa
dRNeO\ZmOAVo_P+g7NK>K=gipL=*IHVJacm5fo13lEqd:,2%-[Zmp8kDN:&!sbX%[a[L/QSqk^PHIS0!
05a=OC\3cE?mnq.K.e<-e$''XhirYQX/@]n`-0M_U#5uoC/*!bKfZidU-,Ni!VQRlE)V-p]DXU_Wu;\X
bQ=(<.X?Y&O:I.QF[VAUJ8TjS43HKk?(.S`DKnD"RQ8K]0PHh4n`fC*n-#QL&;D=uIDP0K3''bbCcTpY
?*D=o+5_7sjc&@TikQK^NOTi`S^TlrU%sXZ?Q+aOpfXnO>j''/*[@7Rm7@)G$Gjm3e%DZN`aG#\*(4F?
W,Tl=IQ-TL__SZf''[%rRD*K\25+dLSoc(/FO6l>UcU[B''0E<r5<+,;tS9OGc?h=''DLH2C:OKEZ&\b
^n2Tb(!pR;XN(qO$&WN2r7t<tFUYM''l1$JtEUrFj>qeEk@Y]Fb&k&/Mo$j=2fc@E7PI2W<YCV8aEnP*
_aO\?knNsm.9&-e[ndXm9[Tme(A?8WEQ:Z^9(mg`OhFgmOkUVe`mbN9GMn4hj=SVgBS<Hc/p/0k`!haY
`qW&d:7d@">%3>=7noO#F''''=MUcX3f^h3(q;#-g+84Ie-iWN+T\qBiA\#U-h_7hI#`8TXe#U`Z@o;g
X\T3f1WO^?B]GEF8-hX7?aQp>bF)3"j2=Lg%DjYQV[>Z\Quc*R#RT1*o!85kVcg*O7EoOY<fM+_"2S-B
KcP+:RE7)Zh/7).s$MN,haeIeE"3-i(q_%X4k+T4XQ@7bM"1s77DSMS^tR?<q886IqrCLYYg6JLgY/03
b?]*#.hr`gHu_<RG>g5ZfN^P(:J@2;$o,3\W@#"E!NT:kW>:/Wp/BeGm#FG69H?\"9X:$5,b*gJj"&P;
89XK:`DB4b<.[WJU2#j''X[D''am1A\?&2od1ae(S.]"XeR0VlS2lrkKaB)XkmrNVUufMl&k)!L/_&\S
Fn.5AL=YYP=?/JG=OfT9pT7>iHbM#sP3_*32o(L2C#/Ui0o?/P(O1#TSioLXI^pT4''@6+Dj*[8Mc6#1
ra0s+[6F9)U^q.L``c0Q#n2U`,$>c:4=F(H5Y@_0^ErGP@SLH[h]Ir(V8g`)r[OCHPq^(4PZkT:8C<#D
!%<!:,[K$8ViG9GjdMCTpCg+I@`",]H0kBJNL7PWDETY?->5b:Teia2\GF+;OBbUCLJG!"tN\!-lj_Gd
2lfBPW_WjHH>C$WbV73geJ%0b`Ti#]Y/S%Wu?qO&["t&q/.f]uV9p&/=Xrri7R8Du]::u-d9&&rb6ZZa
l?K,AA+''It9:`\SWGGX"R6K5q<PI;R;0t=;''Re!TZ4#]npd6J=oER_@"V''8m7?"/T/&)>W\5t<Nfc
Q+K<0Si?)"s2;&WlmXn%+E:n5($)\*#HJgUi0Te*Bhaa(>tad[#1@->fAd1ld-itAM;aoEcuR-7pH\sp
+4^,;X''IVF$pn<i''*6KH64Ld!)T@ArBO,@JVp:akSgdA''Y(]iAoWV>F+1p>3=Z7D",''eRp^:k#=-
B+-UWU&g5RM:Hm?Uu:f6]Wc4eaC:@,qkb<EXIdq@osqHR<PM9"Yphm?8J7?#TOs8''l#^OK!3NXP))H&
`KHkV7)XY@IB_U2>;RIM<hAD!9i/H_.t+?%+[UG>$[[@a,^mcq?@/^IWn&jV7`_Z*4Bk*Zup&iG1nOD)
<m>7GB''T/A3M$rd>=6\ZL;fq*Y^A$#o&u1]U\W7L8pNb''].Stas@5MCKouGlP;WQ;1m<+jPKJE8dQ5
UO.[e''6Bj.0QONlYRb:Hoh^&`J_eQUaFn`rZ@rh]PjHjU-p*&hnCR#''&(`&Fp<*hGP"7af.[G^Eoit
Nj`3+)m9-89u;gjQZJ7pF-Jc"-msd4=''88+<K3bN+s+0@t:5-17m1r5G;E^%D/m[R@!pbhC$V<G":X\
C]O1[Q`#,gVE*p]GsI#[`e)B/@M;-"-?tQF&$Egd;3X<6*IWO"#a^ZIg6sGYiL"^+<[l.G,_k+-OLsA&
IM"#/k<)]r[XRq0UQ6.7fS9lUAq3E!Jp&G[I#L>3Sa0WF,W\FFHr_M0Qbi<JJSiK/-Mu*[.meS<@aiWk
m"sn7ULQ5hVHr*8Zg5Xr^H&C_G\LG#VtA,O#4>R<2gSfc!rd_cK$/a2\XYHMKYqfDDIg]''aF6ii5BhI
4YB2Mo-\K,H_tt7b*a)Uk[)Un<>.@3Gc?_7Fq,aR4oMa9d(EZC,Ma28A7lIVs/*Ve;57MA0HIR-_Y@[@
SfKGeO''>Te="f&O^sj-7Oc(0pS_tEUqoj2?#''IOCEVC;BJCqElD4;iSmO8%C.9c[XAuA[Z*3bNT>YE
.bmpidpfE2Q,VC,A9-!][)4/m(tW?6m:1NU7(aSAM6R"fjP0^''b":6D<oTc^p?46<hY/Vb>!Sm,@`8#
\7@obZKM:Id@2DFpa_g=jdH''4qIk(kbh*KTuT%<C@AT7W"g914mU-QYZ9A.36k*,qiQ1rMBcCetY#,L
!kE?ro=(Wnp$WI_"/^J>Y-%^QTZ\ZbG[`)4/.lu+7hSa7)mi+[Uc;r=]f@C#P2G5bAdhTU6S<C6Cg%CN
uMPnF&V1]aIjG\or+frodrl!iuc:TmH2os_#(<mLn''Ui\)s^e9/^L/bi''D:]$p9`=5,st]J9)\66qA
#"''mkBjeR_2i2B76D4-/KDe`pIJZ9>m>:.r`rALo4dJ7I<Jb.Z]8h&Ufqi8)\`Qe&WqR5QqRtYWRWN[
hdQ9`YH$0N16d%.d@$NFJo;AJC+hs%L!(L#;d\.+H*R[d@eZuLHu<gtTC''?7iD3>eiVCG`VNrZ9i^o$
7!<<Kj?;[n%u!a.XtLB39mjH<J1uB2;hU6ZeTbBO"g"IO/t4+tKp4jPnPIdH6^1I2#/14,)%7o''*,3B
?4?]";@BYji-!pZkcT+8)5H''^+(.^C(XB*q_)l\AtB(N/%#?49R+MrEMo7*oe2UW)d=`0^`<^9^eos[
W8];IV3Z`3o80#MZ[eWDLPtTVj-B?6cG#tOlcWVGl,3?LgnK`",0VEVkm0-*h3]_4keN^-/F=''O&''g
ICK_p6Q,Ch+@ZQ!i73:/;`HN7d$B!QNuZ0\:[T^-&Q=.WBLSCc6<93.=OlY`c*&l+9Kb_Y^mXG/mY0<(
+-S\/11b2:Ir6J85O-0$JX^)DEee1+,M&N%hPJ4A+qZYE74$W8^tKm1Zc68_BpAii;@;rsP?PG6UOlhq
4YEfI9NA$;Y4MK4M",@*^/K#d9^XlDt<''''p0j@mu''AQh0''&qj4NuV@>gVAR6DP_=Qp61s-9m^6n_
HrY468k)c^$*ZkoSNjM\/M]sJ3A/,*p:AMG5Ypg=G2PYrT+''6OerSr5`ZDcTq:X+b(>S;VOL_/.6<[S
+`ao6*LK[i0?QJ?IA?_c&97D8Z>s#Ft?`$Rqff]m?e!iNujH6f>YM^,q5?Q_>W;"*"$&-uR+Mt^[V0X;
2aJ#/[lJ"G,FPV+?m:FVoK(/0GbLsTd0,PdQ(">C3@)FP"&D[tRC)]j+q+'''':`=`lMQL[//D&]Fel''
enkJgPhUOkJg6/#H(io:6(e2-fpW'',RsSbcs\jtOO`]__b154bcI741p?u>XeO@75qTZ`b_pVM#It#E
,;q9X/dK7GVfPI/%$FfjUArbP,)''1XkNjeXgbufj!iOJ4;qO,s>^rqE4%8KOWn11]fbQmEb5"@\Y#O&
>QJ\O7"D*EOWOa-B]bjAU)kpeuX,2t[Vj''O6D0Y-9feg"o:X`r&PPHD!VqhR0VHl?]Le+t.3Bfe#l!;
rn@SYbUgJh+Mlj!i)H@N?qc!Y`^4\QjjA%d&kg^m5WR$:G^`#s>q>3:/,hYig?0gZdcV?4OmS6L:i_We
MYc1fc(`?g0e<[@l;P%0jj=L;=\Ej-WD@q+ob^0F%_=S?bk?kV-trGYtsWa%Pt07RCilY"tSY$T>e.FB
h9aVRc.AS(XaE_&N^IVk_i:A);;M"B"lKXD^[*EFUGc]7Xh9W]gO=kC&\Mh!r9+>SZtI_!-eAqT;BCQu
#Pi6:m^_&`R4,:LlJFak.^DU]VLYS3R"IY:`<(,G]\!CIf3qeFJceE*).kfMgs3`7NC]s,I%e259(?^O
)l:/]am.]NkmK]kT-_9%]ibOI9A2"=tc-.^2#4*FV[,:-RSpW8jC1Cb=8@`J+&PukqIm=fM3#cH!PCI`
Y^2A/`NVHPORDhg9''rlITul9C34Y;p>f&MCO2!+P)8dDg/sYW(5(I,MY(!L,C:6^&i8rI3[nEi]UP/h
4%rbA/SugK^"cM`_hLs)Q$Zm^_eA2En5g_jXr9LeLn9nE<Hggo4QN#''''''(cd`cl!#@46^L`!bUgI0
!PUs>%E>-\FVB]i#ZGD3S@0cL=goM2SdAZ[Y)=.hp6(%LJ9Q<L>B_gs%>,tS:#GH<706M"?ips/cN6Y(
/:Eh9g08D$g?:gBu`$n''\ohiuj&:eBF1/5M9]sfKZ5V$6:`>jV4I7G9j@)Sup[:geTm;XC%Yu"]08O\
/M`uQtRpi/64''^ohXh[J)8W1uW)d?%M8BR$pHm8DncK1LIV,;:\Jf00(FL"cT0,iUYO%7=IfH[RE/=N
1<HT!O$YM8cU!fg@LNr9lrT5q&d3h-U5/"VU-q^lph><uHe0C`n:7\nK3rDSKVF,P%%-kE:>RFHn.rR@
HI+1=pB&/csJc#kT2)L4r''gS_hOCD+l*S6hIj&\":f:=C0Rtof,Mlj@>&@LmbE2X<q7TU3lJWmQYY0f
PX07fZ7qH+#SJ@Wq\iJgO+tplW>M?[&nE+\C$&;c_RS`l,s7S`4WG9X0$/?+mrr38Ca@P[?I<W4Vo%pN
''bG5bH;@8,YVK*kmTKc%m!shN]rI(_I(T2E)S;KSkq&m^V2:08Q=<adg>06hZ;JF^_*p4]O$[n=''FO
)@-q5SPAD?lZI3kXFO^T\44*D`OR)u*H6AqUs.tn[WDY\YGl.FVbC;[9''of2i:tq=]]Q]chKnS<UIc3
a"9X>d\^Pikohqbc^el]U91dC?IQX1SiJ9t@eNI[cS-G>6!orY$l.!u32c]jpL01dIDU4nES6`a/-gV2
!47p2?r=#.rV(iGVVdp,Y@4l14aZd@D.XriOrj$u''UmUG8E>iH7g''@.ks-YBYWc,:EQ-]Yi-98];)K
7,a\^ljF)5FIrdX=9YA5G]O''4j!/?,`[ARWWccms4:M>rkAqe^QUFK>4Y]T9_Rjpp\RVJC<GFdBZqE+
ls;''.ebn228B))DUXU.cJsJg^!VF4hC''963I$17]Ag8JGLet1^ee87URBG6j0V=&$3XE*2.nAO_W&*
Y[\7U;s6`#>e+%a@Iqrc5&K*as/8Kf:/9]6CrW-F=B26''8Ra3p=i0(KpSZ#^Cif5*6up9G?;R[J>9F:
hHGr#Ao8i.UD,)-D!*OO,d)c:hATJE)YA8T7K)+nQ(5))/OoV.&;l6jl1lhqu=j4XA11PJ;P4!?.s6H%
c+k3$m*j$"ah]!`uJ2Y?aft,$EH:U:\EChY&J@Ai-<j4_0$t-RIPQ3(Y9ICYcB;U0Ug%"/3s]6=Mcm(.
hcD''m?ab!FQ2`]*-OGaXFULU#:J0DCL(UBVoO.!8JZYZJrtc:3/Aqr3,tiQ3Ad.!>e9^.Is?Cel%D.q
JC$.)kQ_`0WRFQUPa&JUm*kl`hA,UGt`A#NUX2''[7.JC))tAEnQkfnTh5uUq&''\!MBP9s@%W>l!Dp"
qTe20grKKcU?"0%\i]<tX=oKBL21B"V-YEoR@e*rm9F+bAr8gp.(E6^l:2KIg!,_^s<ZGA]8=b,>Ksoq
aZ.Q1[1.&=G%-SU@r)H(4<dgqQGWO.FE,1A#<oLboaAgQAaf:Ouk4i?[E#Ad:BN[I''NY3#<)aQcZ2L%
aPacn^n\aL\/crMZRdip]:-)?$C4uPI$6''.B&`sXgF"A:PTfmCUjk6Gf3[8hH/`;=m0U"u@ZX$+>7*I
_gh/&U"]^9LgkFS_$J!_Vb?18A_Ld.*\@P+q]TAQA%-57_Wo^$gWBOa\a-''D/6+)Mcjf8%PEF%;B@42
XJ\@]rKQ#k/C\_/LIQq,er8Zj?iO;M(WC*\C8_d'':VCKi*_#u=KAFS(,`#G5.Qad6Je2PQ/0nS$5J!L
ff/*7^g)J-anb?""I_<\a\=''HMZ*qF-ejRqb&agKpkL_;>Y*Si6kUKm47RcBFB$B[:+<3)%l9L+GTgk
B&As%T%H2qVEqk=Kh5io''Z''t8+c>mT1b-n0''K.Os.*_XqIB@HTU=4j2FCjAHb=V)''<\[R''U+Y0a
f-Qj?ao1pG+oe:GO.r,;^oWIX=SbJ0B4d]uVku%Xi>I.7%,3?UU`?u;C?0U"m6Bc8;R*%URP''t1o7e=
FuFc]9338?n3<:ZoDm6lPGW(,@;F&aI3YC;''C)iZWbVf"`;NO;/5%X?6a\-I2Yc.qFhOBu8O)6NCYA''
>XaIn=b6jV`r+H$E<:>(YXVn9I1*W%(fLD+1n[XLBrChGIg/LfRG7Xdi8Al@2*"Rr6^#r5.''mK5p:?1
P;%!q12bbfrN`i\e/l18R3l5*U@?dQR_P2(.Fh+6uZc,kk(s81s_%E1VpFqd5<C&f!GuP]-;^%N^R939
?X<;`6QDf6MTH-UYo`+oE(8]ku`20;2#t*OtMl%C._[oHHKD.]+*J.CS?b<06eXXHRIR.j<cPaRS[+@\
+W^P&3H!oAq1T6CI=13e;9]5^G.J$()#er$/%-V\iAO-[WEEf+2@e-MZ!QUSh1GKjUK(a0Ou.tErbI6*
#1JtEE56=:.n;ZYV\NCoK%[+Q%p,*ft3_"ISFFkabnhfN*CZ6lMQ)+\`A5@eCNWAK"''rpN>b%1ZU;BB
(X8]%^8%r<[f56cf.OF\!IP[="0H^8*Fb+T;;Vam=h5TXEP$k7>>?.bKj1DVPuE:\Z/K+J*V<s^=?uqj
S@&#E@TUed%G<[i$-mm7]dVIr\GT\''/m+1=(>T+rXBEThCEQ%!KeFIianCu3W]k4Ms''uXNPQCPjO7-
P:?B\R#g09Si8:;I=nk(f7XRdl6/gt0e/1#iX@\1=Se#47HfQT*L]0mLIX''#''>:V=Qf.[Qt6$@7s*>
A;KY1Ld!Lce`C2]\kT*=N3X+Sp@Ne;mn9".rb_@GsT5j)g`5/%BFRECXi=F@%0L@h4]j^:Ga57p(;+lr
Q''3T."GZbD+''/4e8i6:Yk9]X7l3<Xq&A8mRGg0bLahG<,3,rr/Is]L[q:Iu&t^bcGLNGp,HUR]MPtO
HJLd81\Oi.uB?Pr#Y::9I@oUXh6Elk>1tHsV+kQ")%K/k?(Yt5>6:F,8k$gZ4IoY"]$Glb''9Zs4;6Hi
X]V_&(Mp8NK(A%K8n66;%jI_f6R:eOMbB[Y<kRJ@C1%pZr?=g7s\K)a>&PShR?^qTm;=LKCjrKO0-gcA
^B4[9m+:R5"Td%&>\[[Qkg^L3u]lAu2:s)L>biVc\3&''tO)#b]Gnf]#2_h][_g%a`KHKKMe#;:jAsYR
1j3,hW"2B"Ra(K4cns+6S+3oZ4(EO>9)roN0u(#W9"%."1;(38+<s![+8rq5+R%+1jt/kcZjB$sKhJ+`
I^!?t0)-fqSk9F[[cBGEF^\,B?qfbGhjpZ,n>bS\F,Up!E@L&rXc,`:Ykr)2am`C3WC''qk4MZ(]P9r.
`UIueCdF*7"1\_6Br=GT[pp>Q^GMqpb`d,XkA`-S0]*FHZ5g:0u*X.P*u"jJu[8*.1F6"%CArh&PtG2Y
W.am^XACqJgh*scO[#"W+V@reK(g(jsWQs8Bh9L\E6E-.XJJc"8''BcZB-5$)h0bOK\(p^Mdi`K#$u_G
fPP\1*@ZT32Xq%j7,4/l3N/X@.8dQ=*_cA.me]E$,UV)pBS![iqc\SGmejj=2rY;ql7MT]7(BY$;SL2l
p"0LnpUMsPX:grD;e3u8=''K9^g;gm\13][K4DiU$In0WlO-lB3cH.kecrg(Kh&QeoCJnS:]M`$D*<bn
`#K4[PkV&Ip''&<J"KY&8u3Vb;_k>.C>0D8T.#J4oV>q"3Le=p0Fr5%7''?k"sPp&hDDoj,3#RU''d;b
3S\&?b.u5dZ:oamqF@T>M.^lKi#K23;g_>/WiFTH''j.uEBa>R*_.sqqLCNtB/mRL!JRAe9"D^]UYu.T
lC!>_\sG2ecc"L06F>E1>8g@t>?p4Hm$%>SIMD.[/6V;:8K7l18i%k?G,Sj''3ALu!)A&d2eGLpSc2UH
[>G:K%-9P0MlOO/I.d1IE^MleZib$=1"W"V%7Xg"4pMV)8BM6njpcuEpG:bdRn;h!^i@6iY@;ltTJ-q;
.dl6NQOTQVJYa;\k"&>+V(CNSQ?;R)TT9Jb@a;=>];[D./35i;dAY8IT>!aKu_n4g1:\o>&pTH\%9dIf
8M78hOkCgTe_OTb,<T0%)O,mA7,o*p&X03^rjo$Z[54>:5k9S.d]OYDS+.IO"INkZI!Sm6"[]sGE.A*9
g!In\h_7`T&`L_OcV7oTbU8@CFXPNp!7eISjcjY1Te)19/1m%Ku9L+Za(!O?C''Z=s15qJ[X/MugL<#2
pG;u1]Q_N#O#O2l3TL&^`.",AHX9MRfpR>mJ1n<7RCneK((^SnWZ5Y$fsk:*=5;k7f.+3UA:gB_p*I.B
cV3Tu0#fs.Wc(75c+GO%ijCK<_?g^bN7aCi5gM?KK8\j5<=OeO#7Q;k<4#H;1''r%&R=d#79"gHkuUm5
?14mFh4fY\bn6ir:=EpqX*"%;j>&3Sj0\Q:^$h3Stp7f4lu9i+udF"?=<:FjXg`2=]I`6,@V2Dp@602R
Q3''rtP)4h_''a!jK]E$(rj7u7j`@C(`C=Z$8*+cB[F`UT6Mu=bBGm57NMd4=+T8A2S_al^\Jm5S"YKr
\Or(rYpnK2%.;hdi%)GMXXBq5AG$ioQKa,0+Z&`SVd.=5$B`lJBN.&oG@2)2AKLTT.qP]8\ZM#Kj3g?4
Eiel,CP-@:]SOK/>H_kFC\k^$.ksXtNT"DcgoL+1!g!#8:IHeURaVO5c15V9h5TH)dqOZ9O-mD_JLFN(
CK7!:1bHc-\B#KQpuPaCbp6q2<d2]]O_/bV,<9lH*rP(GpG(5G)"nKH?-5W*SrZXnjVB?^ar`lf/:?''
"%7UQVmB-uQIB,2eLoI_&j2Nq6W&"2i5-YD@n@ZeAb>l]>aQIQ**R<f:WQ$/LgA:$P#K3_!K\M*h^Drk
q?*;W(h\4u`Sej]d3W)YDl=t=D;GI-IXka22(M>c&BuJ:>FamFk>=OjX@`N4D^s1*1GoLiu23A^-4qt]
PVU6+pBf[n@g]2Eb1-U<?s2p.,C991YI:`''@r=h_Ne6F]N>]Ja#GKm-oW_@b8c\qL7nUCck"tl<eNW<
W,Nt9VmhuIfrq2J95S$s87-1DSUE4oe9C:@ms67Y6s-\b"0WXal]?=kYDoJL8B9J(^T`$F7XL<t;o1pM
tf''jTP0PRPAg]13pO$C/8;9*ZJjm2Z*j^1/h+At_sWYHoi:HY1pK$S-9ikFpW/<TQNnS5]?k]rqql#b
1b"1Nc\qX2#K=''ul\V9FT#?l..%n"NPc=l=/d.-1GMK/S0WR6185;c-FO''Q@]7).-Ai1)\o#5R9Li-
PnP''CN_.Q^=F*''cT!Ug%ci8KEqss$l6UuFCUa#MMJA^-''jER0Pjcg39nBl=Vacq3s&JJ"A<b"ScfF
dr''Pdu6K/=)TNYr7l[.+i$k?''LGB%kJ\LRVu@64IYg*Diu]m#D@+%#jI]8IR8N@P0D(6E4?kJ&o8IS
77LG\q7YLe5#+GbYj-F2e(l]EMeeAXcK]9O8\1F.rTJcOPSBmra7@?;re[8R_gP3]d2/B?%W*gaG?mrq
U/ObLF@)r7;O+$!RU#Ish2SDi>CjjAjae1]Q@3T"K]HR8E-''F;E#j=3+70A]"!n#Y,^fF9gSC-,mlT.
`^J_YtJ%QPD](`HcG3f=pmKD0n\p\\h_/!YOYUlIgnrXE<#9"oKo]R<X''thcUr#Dga.c)Zdf]"^8J5A
0t5@)Xfj:i^eaKjNle]9FYCKC&(=@iF/G-C,p3d,C3$[h&18>`u=hTU&BX/R@,AcrBs=R=?F?&o<)qYU
/Be,=5c;`G[W,SUt/3R9mqh_dXZi5"un)eq_WrG7X+8;<Ap''J$H5((A5qaklrX,-R''&OYp6>??F%eh
#8[-UG.d(I0Wg+T!X8Kd7&7VgaK7Z[2,2pTdV)u2O00?Yd/,@W5-E"G()b7_7=SaB3fjmGLl0iK!KpQG
!WeHPP_!t:jN"NB&gI''?VU4MWgHaTS+.!7KDjZL?IrjW32bM<[\kbq#JO0o0*o\7qI#*pX(73h`#f3U
ehor\*SFYb]Z<-<C?XXqOu&\`ndjrjbQQjk?LgngME\(@oiB<j]4(<.p;R^C.G#S1r25&J>H+;=n*7tk
H''r%CRqfT6iD58jWtD<9_2rOG[Eb9V:LdDk\_3%I''t5\ZBf!oa5C%/4X*l&TSR,`C8`P\_ajNs`VUS
:P8HS,%SiAfeKn\p\gf8N=cNY4CA47p^?a''rHlK!dIKVV_G!JX1\^MDEdpE@J@D>dCD@X+cHE>%iUBC
S<*cH''`o0G)iLr8''A-X.k>`QH3@rgiJ:ZS3.BtB>U8";D<"2Kf[@=^;lOoDEP9JN+/2:opn*g4V%So
I>&!E?[@[V,DkIZk_^YK+s0fE:E#pT8B7bMi9WCs7n?jAhPC#/KHM;I$\!mVDB4`H[E;W''579(UQ2B=
6nGK^d:$)8s/D@tqij1B)Y`\huEt`f:RZ"?7+mU![=2+T[;$bVkfZ!J>%Rr^Y\7UJQTOIZ:O4UU\0p6d
n@jd2RM;UY3jJQQ3S$lA''>#C+Io*"%IT@N0Mba!!G>ed2!cWQMGE$h1IL=lU@6cQB8-:W"7gLYV&]Jd
JaF+?f`SD%5RM>9]=6<KuLNa`R:^6+6t2r@Y1$aJ8"9M80M!@NQ`JX,bj"p>AMg2)K:VAbtTlEd^ln)8
OJRd.20bg:a@8p*E00F"+W?H@&gDN_\5''UmuKCZgk$OQkDV0]XYHXi]b=[ku`7*kk*m$2ub%?1:8M?N
N`-`jFlk>$T!SBlT.f0ih6?;`fF@"&-<q&R3URC''t)D)o)H$(dI)I?D!3+)8!6Yq]Z5aOg)=Q/YT;[.
RVrjF]"W#]1;!S#=0W:nr]:''s5#._7\$BI1;sK]2l#nmftI''ae.QKqPqE-!,d";U?t6FO]S#O)g;::
9r$0&E(uW0,AB2A.Z6eHW4l>$qWl\Vc<O^K\+i=AN50qVKaZ%I!-Y#]:*2>,S&=u>q)E8''=+)]o)$</
dJ,,T+4[kj*MEu9OX%KY;seC:c)96H+S^;fIHA%5AgjBq_OLsLGGM+]k8Q@@!pNAA?sm,qm0oIS@GDOo
*/VNH+tc__UUPGn+19ZL_%E9K]D1gt7ZhG''tZ,N_''Q@K/iOa;CqVdM*XTDt_LUIU+AC*.S^LIm&9/C
4)0\EA;*(dU4gd=]ej&.gP!rWIW8ok7r/(9G(B2"?:K+Z,emHgknrRfT&ot?;!Z!@dD\k1u''B*qn!.A
U*/<rJ3r@gNG+2UK[=eCkq6"/2BNJCq%`6Mb#68oFSA.d7H,\#^!"+Vo.Sq`Q,X7[HBK=;T(`EHSK5Gf
)4$F3Psn`UCV/[!RndVh"\:cu2dBPU/b\-TfmP:@ZpC!Z"Nq0G7sW*jK<;tC+ME^KP@22rCjW07ZRAkT
Lu6''B+RRocC.(BFe:4R4P]"?j]*r3$h.`M_l7Ii=+$+7;UE9?Y!6LD7:7Uq9M9sR?+?)_.H''j!N=s8
qsk&]qN-g0bOdLEN(2W(Gt&g];cmC8:@duIWBeVC*HHI/>tB>f`/je/pfDZdrtN5P/=QoYop5@f6$R<u
OHY9-p;*%k&l;e#,X''fCnm<A2XGCES9b$f>Pq:\qJhBX(d89`(;sb''?`=-G5sL0#SgCpFoMt-HMKj6
MX)O4a1;2#DpN9^6_\YQTAKukeTI\''#EDGj0AYK2&R1[a\/F>jGNBp),3#W;um\ImU&A*l$R-$#I/`g
=L=E:>E,8=m-ipdoGIs;=jo:]eiSVW5nF''EZgS!`]WS1ErEYDHc&\[O(9f$,RQKMn681-sHr]@eF3R''
_A2iO3[ZY];s$$?`C1i:4T8\>tQI`(u/"F+=bO?<>&_JgaUBoXU>n-J>TIRA6PoW*S$@)^JAY@''5-dQ
NQDF]qEA)O#GiMn6T\iuiZ''1QXcL_@e6qIX*>pWG+1*7M18k''jR]-1T2GE$g2`,B$fg\E_%!^uDo24
u;,rn''Pq/GrSoXidHqc=E@2<6fV8lfs]5)-.LE.*\KAR`8@EIXm-\F1rA+up3Js-%GGrF!VtL8/0K8;
9]s%DOjn&JhEN\2;&kq\,r=bO6j\KjR\ZfN;K5ljcgPs^B7SdZI7DRT>U5$7\c]`eIq$"$JK4I(0S<;(
=L9q62UA.71?D[Gs+nJ^At`,*dl@im#Q0-(ZiKHqMJb-m=lC&"1lAiKVb!Vf#4pIn>,*[nY`dAfp?)`i
-k1Enm-2ZZ=LK1,Z7(+Q)H/CB0[!Z+XoG0[ou<u<T2n3En(mP4VWOWHBkJ1b;<Gd3Nt"r;!A?juHFoL\
QC)Ka1fr@`=^%op?h6NL3s:O.?sO$MNDu0jZ[#uk*,<$:_/Mi4:CaReXW]&8/7P>i#G\7a/n,:n47aL7
lSn5u(C)FR<jUNk9/#fZMZV`Cf0Hn:,JFffX11[!AqYD''qF.H/o1?S_=Fh)`4dp)kr2BrGdmZFjNQ,q
CctqI?BW<nkg9R2gN6aApCK:p>YpImU1<0WqD3=DATsXU.-Fk2o93S*qK&"f9(@[5Gj+rEml!!u61kap
WRmHKuN`PWF<$W_=m=AE[JK.sX+tq;4V6(^[<.M%*fhWJP;bUg!7&2/SC>^C-`93!.e.lnYEnmFk*.KX
ZA2kEt=NZQ\''LqU7_i''u(FlNS^W0<h+-.NQI8-"u%ZZ3a7][1Fp!h=!r7gPfjqtRCrLrB[52`E;W1!
4,?8O%p]9I(41cci,#&''j9`ZAe$q:/P)3M110''>UI''-69bo(8h$s>82O@3@:ON/OBZ/kZL:O/f1tG
(c@?(T*Q#b''<^%i<cr5r?#H-1=CU"qpngAI"M`EU=H>:B.HJK0:_d+pNZ58)I?<r%8K`sGD?pmqbAQq
iO5/Ma\je!`"n.peG-@B`Kk9!F@SmaYu*W;uX)ZFHlO211R\>00U_3=Oa90Jl@ZS$/26CrVQ(f@J>.>=
XclS@J8KMlOq7,\d)8u]AcAd\fTFkspU8;1ddXoY_pjjSdAH;S-(YLOT0=AS,4^u$=K^#&-;cT+n5@bS
_cF[d(/jrQl2fsCG"]9Zk.DkGW"__[d%70ulgcUcYR[d\bX<-)#3#MRsd.Ic7l1bGU40G$h+(KFQ@c[:
ld]<mMtW<]2lSW$CFMdf:Q2i4NY?jrbc/U,SCkQprC,/TQsmZ&c1k4%T\^)LRin$1m"YFTPc*o[W2c!^
l_?ua\Wl)I)$7Q@m68O,G=/N.6DNTasQXH,P=T:G_!CN?Ur9''^>&YL0kFZ!YU1,9%.=>Z_(,451uQ[6
$o<Ra[VHIoJNrMa`"CPXFQP5a3u\c8D\b)SX=R6>2!+&.7\cr<R*6fkUr+qNZlk;gCM9Rd)s8*<IJ@Bl
C\;V5*mjDm)`8^5Y8jYsBTQ8''7XZFDf$%GDHRZBook&=r6oP<22U7/,ZFj/U,/K_YnmXND12Jq(gEF\
c=hOD;\D>B+R6VG44A&0$IkF.*?8jYo=[uC.([mik7Nnm=^qLg,5=N+YEc?]-gFhs4RtWS,s.`3*.,YD
''''stnpOQfaq_%qVk54(`$c(-F%(!pK^^94R''6&\DZf06B5e5hZ*)-JL$Q"tL69''%%to2g/;V#-*!
aS2XMX:=^,JT<+Sc`0h:obNK5apjeHB0u3*+,m[]0Wt""O(_Uia0:H6F@]4s)=S2(odZ>Sp$Xc3NoqTK
c;u_*!HI)7XKV:1A`q1''qm]qYdq4?N:rc`^!!e9WoGI4uVTJn8<1r/S;DVAN#U=h$0pTLe0EcNZIcM^
+G"bPKW]jh#h''O=U$(iIITFe]qnm"TV-_Pl-8Yl@^0A7a=f3fe,R;1c-?t.ol3)!QMfsR`uWeWVNePU
O@CR.S/gS-pn%DNOc&V?X&J&8MDf6g,g''.s=q/`fcT1i=6$m)m[4ki`C-m"T`1MntjSRNt[3*M;Ku''
MmrfQe(AsL]L`1^V.:9B&DFN$4_=fZDA[q"suBiJ$V-79RrFJFLr>[iu7$Cs:X9bb/H8KIhHjuh%CZ:S
p7[69]nKmF3]=)`#Pd@bpC`OH:L5]YVaW3dp8:+O)d/$3GGP!$[`&BrkEkE\H($''kC[R8WNhdUHjcYB
iM.F4`-`E">=pA+\<rpS8/sT1=6.h''Z=3gm"3DholU:O\Vm7MCQ;$F#R_J]D*SSp$i2ZYTK#PQu69''
,4W&F#F080jaSDo$rq"g%HXB%U*oTe-I&S1G&KoNl<gr@GT7$S?;tVE,fPO.L.L)BiULbqV\:jQq:!g:
PBT7LAaod(.ufB,O?ocq,n#GM<$N*>!9H59bFXobe>j#rnQYc8K6+hC#kU?3%G@tkgXjq>(o-ZZT[$cq
pgXn$eT/.H>&R$X#48,K\LhMb8;GG<2o@aSY6pi-0^k=g:jXu+dau4k#@,*6M!kNolL&Q-6Ccq]+TEFn
h<ZLk\fg?N!Hg(BpD::"icra6DBCqJ@_T9n5ojF.S0&C#<J&1X_G[MB''=-lF]?HWimH&plLjFnhWsH$
=/gMrCGhC+jO%ig]$i#jKhsIM/c%t9E2k<.%JFe4r/_L9VZ%(EE@mG@48o4`1JT7''mHFT_?`u8cC>:L
6$0#Gu,Dh;!t@#ei9AHUp1>>o/#b+YRV/*V64!<P*gnJ*QAbr5GYQZe^KS@bYC0S:_:("1foR=(1gRpZ
JV_2#21).O52PY3("mDG51-U"0pgufsH6::7dI/F''i>3Pp5;W2k.UK!+?^pi-!<r#''>0"N1X=;.3s3
Z*nYs+3NT?]=opH`l\r@S@njEu_"<bPt7Md&BYKO/uG5`Pekj5<*pTDI8W+mI\PA]`%gh4a,uk,c$<qd
iQ.V0j;et)Qd]G(4hhfdQ1C,EjfQ`RK<c>`-33KQrF%RCIsL_(4;:f>!mr6#RZs3hNT"lg@C_+I.=j*M
K2Z#1f+'''';sR''gVsOp!Na<-6g!i\;,P#<b!0."0:HTdm.W11>!\W<%Mm@Z)fL*JC1/jRP`Vg>Z:(,
4i&"[+WO`"fuTjGrk/IQmQgKW3u@U@YjE\2b85D)EF[c6ffBsZLh-n/^ug/%''<GH3:UlZPqD7hR)*n8
?F53Z)ZoKfbjNCuJji]&giB7qfDl(PjlAd*tt\2FV]''Y.eY="NbG.bWEk[+DoUX-\V0leL[[\`!dWsb
j!QNY%6Bc1WG/d6pC(soVMH)B0G9/[uG**HOTLbT>''jaX"9:kn.MUV7H]4sGc11Tr"%oIo5QU@Ej9<H
_#?F4>5HrEbWr+l2:jD+AscS''Ta$_,HaId(q+7`''=W&8Kb?KZN&KIpG6Tt%BMAN=5;@iGj$]u:p[.P
t;j^D/jC%7-F&.e]Cf5S,rg5s@o-(ELa&*RX8A3PEBC?:i6nk.X/a:];alhO_;Y\i;B8qa)^WXLUdA`_
I&ar?N!E]40fVi9P=:.oN[Hu''n\oM?@cNMLm9X1DsO;O5^*O*aYWNR78$9Q)$*0''g[''[er_3hDBe&
rHlUJ!%G^Lo\qK?q)\$/Eg]kBHeV7L259]Skn0#aU$B$*=0t)d#J6/8@dfWK9W^%;W.Y.1_Pik%StJK_
B#0;hF@6%$]J"?`f!#ZmCEm-fA>@d:f:!ZPNTeoHlmqOF51:D]FJd4$b,4$@]*s@=b,Q:bke&</N_6-8
9k-GDI1E[SS3pl:)T,a7A0j!.G[Qm&Hr)WZ5hT5aJh*S@=Uc+Rkks'':fM=mXD*?GF-)d;t5ZY6WH-/d
M",ku#N!40L`P?!R.$MPg!5nWkaS=t''+lsVPm!6#`\q:WrI!+?]R=:##=R[d%4hjQE&7Qg25i6Q)4dd
jopsNCP;\*L:UeCVtcQA-JM(&I9\G2/+k?k_AVY+DXB,s_R31:)r_>0":kf19%VT%4JZ''iQ\N4LSnWA
aDUqMILoo.UEniaf@#;=/5)k.1r&AX*WM)m[6+Vul,''ZiT=!Lo[n.G^]0C3a1''_&Xda6o%Z!Pf[[2M
mS^eI+AZL&MGF`>P''I:nVGZd"b]g9eq8%th1B)ccTXdp(&''[7$^\g1Z7gVe4ksBGThGI:qBpfe&#@2
A@p<;0gCr:TrGb.=d)@-WNk]L1W(HIB&A4Hqc8N.?anE8/o*''@6uoa/dQr=]SR.eg=-k-^a%&b^Mj''
Xq''OM`74'')_9V.IQ&!Sn.G7;^7k\LDUaQiim"?-it7D_BNs"8R+a5^"cZ)o#ku8cos0<UOY!T''<I\
2Rn;EBX8T6Fl;U(H''BjBg@)<b&J((EQ2TLLUEmoF%"X^$MP3Z,IWUiX<]31DG3%#MajS(kdbV8RZa/n
r<W%n#"P$Qlb<iT!@WN%X,RV@l6=4kKDif:_uj*ebsb6fNHmWm+59P^$5odnD,!m[@@QCpLf>\A?2h=4
j%Y@S;)a03+m&E:"9lr:@TF`T5A9X%p1n6"o$S:mOOf@PJpV@,C54=$Y!!Y#gJAS_>icj3?[uF?5ALT(
?c-fPiM"g<OQ0V#''J@MM^Y;l1P_Jr^nb#_(b_1pX=0b%:''''gXuspZK,&h#R?F&WI9FU;JCnNm,%Je
''eO-)i"29nL5;%`1I&`6=dap""[\92ZV$46$N*U^YK\ORKG,;_h/a''U?7/&1Sk(\854m6`jn::,?;M
SKG^Rg^Laj#"5W_J4<qh!I<:t#c0P-''8hKBfLI-t[UK^S]j^[qK-I+,!Yi+/!=T47mpB$jMZLoaK\8.
Cr4W<6!H6i2-gZWoo_eqqW?j;P''q2A.;ZLraMjUN@!oT^cq/gX.R%PK:X$2Qq=s`&Jo<Xs1JdXjSuD:
!M>caf&mQY$:`h_5JF+$RO3u-(\Z]p6sM3Lo+ihZ`8Xd<"po:akQ-ViK)eb"-26P]]K)I::fb/jY!i`J
)[o=C=(mk_WR89h$\k2RWOR[W<-6,Yd[>lZZ1+:O"^gr4FgU0]D:3Y]>E;o(clW@qs$;fK/NG.=?Xb%r
IMl"XpVli`(]JZ3R(Ed_f-F7KD!6T`^sLP0dDurBlX''mU3ZbARjd0WqHI2PFj<Z1T1)LPabSnAoE:*5
''JkUf-L?R^am><FAr^*!ZM$=?gp4f+Vb3V*,FhNeE""kq;"FeY&+j$rtop*pH?M6]"a`Db0>nssPA.c
AQD3DiHSCCZ1.0+tKU.kstQG@3->U10^3Y]nt0K>''EW(3`3f3K-Dk":!%5!F.4:ED(b2R1Zf-Ll&HLk
4NFW%g%1R^<5BHNRQ-1pND\c]7<TofTij65m]$%i,&Pm/(!GrUoRuk-@8Rc)0BoT*4=rq6!kc!"A#5&j
MAVnk#ds\RDbp1BIfeF3E]o;(XL1%Mp;$.K80FR+ddGHLju2^%f+K214($djQ%D_k*$pf3''G\ICFFBQ
19AFlje8g3(1Pg[OcCh23jM:RNpRS9L6:R1I(Cb-eXjA%S/l2p"$;''\_2Y`DBTpg6Z6i;4:_Hf0:.nc
`Zsg8YOtcd(dU7!j-P^;mK;.Z1?#<-.>u>tQi>g&)fRTL,WA%k*>4(UB''cGsfF_d*f0cK2IXNUdgGD)
W+s`Bb")b^4W2<R1_@rZT(dL=rQ68I*()+&pkP>%,h4<mkY,Skk.Z!9sa[AlN?Y4#F5Dlq370aLT:%D@
u7`WIL8o'',,_gj%H%m7j`P5-Qia"s*p9;!e:I+%j.6oa0,hm-OukAS]d/lV''EKH&77%]fi)<Nd=8C''
V8Q2_W>I)LR?(CTkdJ=l''gd_Uq1BGdoWq2+fHU>3bt5ck:I"VK*7q\k/ULE/c.FUs4qKrj]T^WjB+H?
LDsA)F4#/<-@TF$VNrJL5c_sXbS^XC`JSbc$8]R6q9Vlc$QKXIubi]3d$S!llS2jMk.X8PE9uej9*03>
!L;r<Tb/MnS%W85]k"E([i&r=-_NF]::tXD6N3&3\je^gB;QD^sE40r>Z3l/D;U''=k_$1><4#&c.8Y*
Okpi!53?j80_h'')`0j<*rpt@o)''?h<Ksc3^h</WM-^[#Sp@8ffEo=(D;.''!fd3oKA''"&Noll''=S
RBWm%,Yi9Pmkaqn%P_2ZGd/ZK&Hq"t8V9fr_1mV-pgD%H1[u?0K^S$fB*0YbZb6-0VfkatHqsk$qig*s
S<i"CYUF`?NL?ROL[&ELYL--ODUaWk:&DId,g./7VF2Yp46c!c/oZ2IFu)5gU\=-QUa2\n&,;+XDFLW_
d&''+gARd1V^<FRE''>(hD=Dq7bVV:5Z>TSQkA0K35AXh\#T`n_>#qf:nY*4!tAM^uhNq#;;OprZL?+W
u6a%@7,$X24ZG[A_N,[Eem@f2iaHV''#.''(+Y\]d4J,KTHn"gTu4Oo)_8YcE$dGd7GlCYJ>;I/a-2,B
$X_>5$A:,:9jT?=<4n4P5)0:V@H4L:"h2%6!@Hu#*SR($2UofLErN+eeaGjj<iSY@-Gg>Y36^Pk,J#u''
#@b0,^WD0iB]%>WWWZc8obKMRtQ4uj6AX]7e#*DN"NNrA1EdPSN3Cp<SUa-kN;UXcR]K]]+Sj">o7:8@
:L,E7e@7jn\b\U8WF3QJi/ZVA%d%&$\Ba$JC%GT8H!DtBfD!`q@,P6$7)Ve5r,^)^]`qj"Msgt7i2I#c
tiWsP8?d(P?#FCnt&\$3R7bVTe?snEjF7G3%aiX"/sU7&Znp2mZN4!,''p%dd-JR()\mIKrZ\XdT*nBg
aQMXjgqtZE$Z,`B&J,.?:`B2oZlHRoD<b^YmCe$i"+!Mfqc=i5OPZ_"''gPpg`?A&6#+)4pQ=oM-VVoR
;Uc!PA7-D(49KC/[!+a._$?(D=4#`5$O3V]FH#ITmYkKeY#%8%#+G]]Q$kkHP=^MCON9:M79EX7T^^3L
#p(Sc7`:Vt(ViASVH[$.4Mp,m"dstq!q0r&^<af4Ia)iEpUuiMl.6.(OA!o!TAJaM2-n^39cA)NqeE/<
&U5CSAN1U]Ga+mn%-''u0b6B@."h4Z;db.%*+YB[kI,7&sm>idpCS`6:$*1>%QM]BO%^JtBs8Er8RMNR
d''K8[<DVl.aI,!''_MnPQr&0XBdXN1@g3(OfU,f*Q(*P-)k(?\6X6eb+E%q60T<Di(gZ91;T7T)HL^l
k6=$S&]:3lY[1,XommN#R?qQ;''=A0CS4o.)9*(i."NF5mLgg1?!K`EFe.2rdT6-=d.-Vf&gr[deAC4Q
"`fHknHhc3jPe.V?8DWb+a;IZ$"2At,l8%ph_2+q3MDF2CM*BJG@''cY"G]oMq=AGmM5R)B5Yn"THCrP
N7nHf9]%\-rb3Kl%&3bNg<09]:XWp3V87+QoYI>]#ZV5@e\R?=4(K:LTD`buA0r/e&^K,.1.F,`T<;94
.hNmBo&hlD?:ROidiLibu5Zq1L[P<#b]KttCh-KeZb1Va/IXcjtb6r''V96[Z9p\8T%l1QmWUELJOB),
=*BkdZ)/mt^O6Y"=;i]J@5-K`QT6r=D7\g4N,UHp"U-.NGD1#=bM5P`:R>+U2?,q@t%qNr*N`@s`!-(i
O,]81H#8aX8Yn:hmNP+gqI-RkD[8X\W''8Y0KCZ_/I\8@&-gqbB;(0M_DV4Z)L)2bh>qH^([Q)hO0<ZP
Qu''Fp$o4l?"j(;lo;H5]dtQ(C4TN"Ku`:$WBCDpf]Q/o#9HCq<npI@Jt4,a=(>@''q?F&/P"D%^3%9<
p(%Lg;_uV=[Ds;@4@XY>^FVgmZHjF$Eu3W)oamDJmbu-"4R_!)5fn<''Qq"4tXhT$E-hX5GS?rQMQdD''
:q]&"#n[''^Fjb-FGkZl-5/k$hW#:0''pVhuAd*Y)@V7KCb"Z?TMDV.sbUj.M&RY.,-Y"asTPbK''ju,
YLW#EqVO26FL<nGbcb$Prk"*8#M)i<6n6R5aTUcBeOp7E]2+PUi/iqh:cYuE<MF]rNW[K\#=R70.,:?!
"ed76''NLQ/p!^fqMOfoM5&i''PS9s@51HC5,"qW_q#D6e7RN_n^@p-*lnsLG0$eNM.,$:PUu0<$LJlC
+!+rVZ]nNW%!KKM3rS''T]gMef^lJ`cFlX''Up5''f<iY.j(==bU''h,Zh`f!OEJT&,5ZSOM8kX5dd6e
+''7.JX<2tf-#)7''#r^eC?Rl&:(H\MC:!5s:/>*=ub9j#&mP\6T[GlUI^Gr^4+!Wg[!0om;Ep&aj,gc
Fe)U6f8<.o@:6BLOfIKDtmKu<iuNsP*N(!1mZ6KpMck5S#cmA7n6FUbPHF-+#"l''T6io,PAW$DN(<hQ
2&tK.BSn$c[)/VRTc?bo?/m]0^>snE,bmZ-4$q`f(47S:o0kFO0%?]F`uAor2)h^r_#H4p=Ahdc%Q:RP
cdMhO4Z/)s5o>4Q/$^[kWcqc&$,Jb^Q[#!3kt45\V29imHUDH`F)%OZsZ7ri\n7kN:"sA<&98FU=is!k
O;]VB;ZjJr;K9h]&2_''St;Gn_VXXUJ7D*n&e-0:lOs7WgPmiTae)^!I9*E7j)&aV4bTt5.e"&"t$Ql[
;)`?ch0B1O#%oc]"`N$"Q=AoX$(mY[_c-7B39B9m?RA`$>4[:MP@=^BSA&bihOHrIIX")#<r.\F!f@u)
)iN!hoVK*M6(Mq&Fo"d#+YSf''H;bd"aT,K1V3d+8MU+E1h3CB7hY`89>[51NIC-7hhk4qU<HPL$hmsY
A[HDbcRW&-D)hqCg\>`!oJX=q.(''DUC=cd/U^MGRDE8BD3r70RL^TmGC6=VNoV[)A!3t..k6-e73[(%
1dC%_fIb6.mrtX=`OZD,5!^O7T$cH7XkZL^V["I*J_m#5;9RUjNO^Qj@@S4HC%1aj1!2X[,?0Z5o&h%N
?4beF%8&?21`Sgh7fj1qtSm5;0Y\1nCbd8]>nf5''<?Y\mL@>#g!BZ19.m\ttZnBC%3#ZZ$TbiPDcOW`
2GYQ902P1d/\lAJQ;#IU3JWb5Ro[6a8$?VtD9Ym;g70t>#JI$^_=JLm7N3Am(o.<ZNbBF#"S-oOl`295
p_JQ(akcWrC-?n8rl>Xh+sIiraNh`u<BaQ8bS^)e.DZ['':t.rG)WGo+e3`i0,tCs40dIiOlS-=unsrM
jKtV;fVHCJgZ!\YQ+CBf2`>!\:nmG\Q)qU"tjaVfp<F<%cW+I`[!&b+5bO@7-]o3_drb''0u5fq$=:]&
jE`^b4`LT&UI;6N>j6QY)RE#nrc\n!j2ip`pjIb(TMa4bpNKl<dN/@]81''hkI;RO_eO74_AMQN7$F=*
C?59;0CXn7Z<X-[AZ@uSN6C''>0/gn2isaUF>T]mUQl];/enKI?]IpmrGW^H?c/V$%JiV<bZka"s#$_(
9S*X]2(j<_oS.-ZfL6[''G%,R-mQC2>Mg;$kr2Sdb3qU+/VLr)c@#W_Z;Pn7(iMWosFiCtJ]p;2YS4AE
`W,.co;6P5GWGoU:gVa=Yj.B0\Pf</0^5*)5j<cl5''4(E$87s+BI$N<_um-R7YU%*`<kr*t=/N=(YiB
LWbM17FWXSWN%<5p4Zjq5aQmZC2<%QZW\^QlVmc^8q-jE2EM!*M/`JmK9"GZ-8nX\dG9NiS^H2(<\=X/
5%i:P0@H&M(/JO%$t=D@=E;$9gpKKlXb!D5@Tf(H2pSW.`p>P''?MekL0o*.8oI[l$*ZDN.uSbn1nLjd
`49ZW<1-[j=gc@9i*kI$X>0A)-N7i>$HpE[dPg<&uWCc?!I%8\\uC]b`eSPS!#DTfD20H)8qL''8>I''
n)`]LX;H''gW++L!Q%XJN2a8lps+X(77/l$p"PC94E]V`5-c:,h;J7Rru%S3^,<Le^k>N.:r:6,qnL#G
CV@UOMfQG)a5VAmf*Xta"-R''dhtZ]8g$(3(3KPUO?5S+_"GWh9M.k"k50-%]65M)5nYF-crc&SfB_]R
iQO8A+@85@sFVmN"%E5#^q<OTsq00Qg+''?/[F!=M9"Q:H/U0`Ihl$eKV[[_4H@MNA%F9[.&5JJ&,ikW
TISmXpWi;m2k"af%sLJnL!bbhlYh[<n@<<QG_K-BJhb&aa[H(cGW#cNG^HfR$BBtX&@d"Qj[fFJCn[74
/6sM^1BFR9;+k<alirh@@)hdcWQBM+O]#60rBQt5:Yc?aP%%uetI`(3Z$n/aAL_n*kouA$SZaoW:1,EU
]C5"MX%j]M3c\m-kC"2BA12O>qCO580qp-`0'')#fT-R67!h:,h:9/C()gAj+cBXg3//1lB@A?kq+A.d
7F&[dR%44MFj(;j3#)s26N[aXETPc*?pk7cF$u:sDeNef57/qE)IHio**EZ(4MnPLAi".`V&adtb7Y3]
ZD4ntPMi?oIR?X+3uA6`S&q0]%\O''jZSB5!](BcMNtM''SMtPAY2P2_Xp+U%L(g0qVAGOL1[F4eXpq.
 %3!EB2''PIC$D!@k:@3E]M>c4LgB]G:8+\Xai/7,>@;kmKT<9q+X<SoKMVS9V;B''Lr8Cj)Y&^02V+e,
Ol8cIRFjCq`(]@QEOf`f"/cZ;,3I7+s+UkOl*F^r85mtbHL$-i-UM%dh)@DPbmWIH$-0(M=n!)U75ZrB
^)aO/2u>R^.N94)8K&fhS"pJeX95U>hL/3&P#%qFQMWFN6s>2pi:pd`!EGoF`5jsAEnSlU8sOZG@n+fa
D@!Sdh6OeA5Et_JH8[0f*@fP>(Gq4\8phl5"."S^5ZD0c0-b!%!n/"Kp@b`X>UbFAn<K]i5gecFn7X&^
7tJ>n#aH>Ddtpcj@6i1F$aYMA%GSU6%Lo_T)B6Y2M3_rQlL&$[QCCOcb?;f9l>:ib]YK]Sc_#WQQP<@r
YJlfToLJ3a^roWaLT,dE8WNU1V:nSR9NdbotZ&;oPkiL?lG,rfl1''HJ>15hRV0?G-m(c#_191_ZlIE(
[/s7%]+fXR4+m%nX=6E2c#2+GWsWn<0re*4g0t=hdT^tBcJ5''UYb&a^N5[uK9k@kZ;!G_A8]6N"bM-o
9lq?oDHK-9tPoJDfgBp(aD0>hHPoemo]LHn3IY>>$fm*l]I8QrH5[h1J-&1EpcfT\b;]&GK&0)?,(++9
mT8`5hnnn^B#OOqa$1&LNJ=c6cF%ij!VQ5fE3bfk#''9"&J1o/!LXs^m]#M>qV%kkJ7%"gX"@E+7J-nU
QMBUJJT?K3LuD1$^qjWcc.BI^SJ!I70/IWs`:RIb&ND:sp4Fb"+`l?u31A=!Z:@V.>]npN>hdQj*Y662
DW\E_K9dOfO=TYmW"$M>;;_(=Ti4EbOBqA[dP;Y$-hJAuk4C-mqDb1)Q1btdK''<VOeu$puj*Hk=8S7o
/U5ELL>=d^Y''._]8/Z2/3+aO7J3Af9j=E58FFtf.KIGTS7R=]1X;DnhY_I^<G3iJ`2s(>[6J*g,-\p)
i%ZQ.8&!Mr4QYY^"HK.>Wp_s6oBK89)&j1@fg>V-HtT8S=L72-i%;b\BsJ@6Sc4KbU9J-WaR''Y]''m4
5M^r%Y(GC?tI+=2^TQV!"R"@WtArX+J17)C$s$6Wpiq6g77DX$Ds3IB"]j.GjPoPcbX>7V/i*]ibO4VY
Y8G+EU;kR$b>30e=GkH`4N@hDE<JsR%55/k3O$BYedN?ZY#pEBijVWI*5Lc5`0o-?6JGh`e^6#5]1D#0
M$$!A(VnP.9q0;4Em`lm5G.uEl>Yu.]Xn,8HY=hm(H(t,(nsB&i!%&TuU`FWYr)7`f?rY[c$`-/j]b-2
?->#U^JSV0''0_XNlFO74$,\FeS(q&r''e.H^mVTA>+:$`gfg\gH3W,Og2X8a`ZQJMlGQ#j#S&;TG/lq
C;G.A?O2L-MigB<uqUO`D2cJfmqBHIOm$h0[0LE3Xk@^8ZtknmU;j66"!YgX)<BfCMcVAa9#BE*Oql;`
D)9gI%>X=rP3u0[S]C''qeo"Jot\GV%Me]Vf7r]WBS3dPVdL"=q+Z;0p=aq.W\Xt1Q(O!Ngb2hWNre9g
jI[fK8,VteS%gGSWucCOM30^;5J6`.muW^)ci]L]6tIa6NQ\>&3!JJ,fk0:S!;jClkRK!2CbR^f["1\-
#9e9'':o-M1V[apY#NHd$e,<"\D[;bjZVecl=ZhV]iZJaZX0auA%<(]''.M+I''*4X3kN`LK_:@>+2j4
EXAT1D;W[/s-=oI@1&nGCo46=JXZ`[eb`q<jNm/HdU1SSK:C''Gn>!''RlVTqTZ6Zi@Su:1>MX$jK)Em
<JF_5t";^b]:cLjE@]05CjNP4ZoLoM''chcc.adb[_9-*PD$s246FHh?Wk9Tmo/X%<1^.L5pJulk<bCG
L*.uA$e[]lOqF<]DlE,M2@/:GpLoTgTt4>uOrcHNM0mb]PD%%6!tj;sMo!SQlJ88WeOHo]0m3jAaQ[\O
]AcI"7c1<j>aloiO4D&7`dL@3,gGj38Q\,02rQlV;:;BA>3+"<7DEXI*L_p@5?JjVOhNcgh482m!^/J]
-,`AdDL$qHp%5pl9jH.&ec*5J*]:WF`r\_$.93&k$`C:THqm`l6Ln.''^jTF=fk*c^<t37Y>Hu<i''j[
\8?jJSnd6!:]kY%.C^\_;78g/3L1pOA#2_H*e_cYj*XaS5NE9SAsb).^&X_O*Q(=$L#Dn.u![HCtJB*R
0[2pUuT''.Q2X)X&YhdU^#DMGJQ$#a=+?)sKoZq!BDq.l$lZ$t5UEHgsuQVm=<$W3^64k`ePu04''L<h
Z6f]UWPtm8jlrRbM.<;_[9DOTk_GS?<1;gL63Pf*8ks59BUFl.MWV)GG?g.A?PpP`G(^[R7kW<.!.t*p
#t(^&\Il<.pQB"F!fFMUf\F`PlZBiX+]^GHU:(DT8AOf(Vq6-r.X29WEkEH=?G!c;o,3\P];^])VPP_3
>kgGIA%gBi16)3J4[7$RtEqcPfp0@2_r$WMH1E3VQ&[)g-r(E=b)W8I*d#tdPhN:hNaPMe0tqQ=pZPCf
p=#h_<mR^3p&Zs4g/Z-MX,qWim3p9kV>hXC/ps''86dp(Jrs''uKTY,/66N&Yh_K=[_kmhj6pK\e+s4p
_EbGcj71=BLB,j*8SW*><fN>7Q*DA<''bbeB/;cD856K)nVj+QI8EFA%/be;1^)t+5YKA`Ul2!7X5>^Z
9_e*&=\"SJ$rdu562q@e!lJpP4]0?e7s^(ZukC2SQHS@6f.5Hf@]HULk0KF,es5o1iHZ&\HR(iZ;1Uq`
+2jSG`Rei[/kRs;\''n_^%FrJ\c[2K&VhDe&R@J3*3uC13a2kR8?Lnae_pir#5=:lng)9;>K;%Y!6%Aa
 %D;Ru!"`X<)B,:S5a?Q^;*F!4J`LW"VA]J=b=V''hZ&P4Kr/##7A^lQPFu[AP?f*+t"X?Eiq''k3%Gb-
DhH0cXdYP.gsU%HJ@k!f\f)*a\](TTc[#&G%*k;YN8TIh/+$_./F6^$kD^''eJH,9_[#:2bgKYfs/TsR
=LPc>WoEI\Vh8M*n@fbk&,@6h\)/u8EFk[X$b?PPi''N4Q;e>QEb/p%JoH^W,#;aS;k\+:-5bF/?_K$g
)1qVPF;btg(6+M?8?0bfRZJ$7K^F%!>L=p\<B4+$`Mnbl5QYa].-s)`?cp?i$pLaDql6iNLicW"761]9
7WKi3bE`nZo,Y<(mYP=-:X\P[0oY''%t-WkQ.oWu`GoDMkmoTlaucVUXa2`CEsTWh(G4NrdY<[<=Nt&F
frZ4SuF4-AO7REsug*5K@9Ho#Dc!B*lV2#AGpRL@:p,KuTI\3"mLn%S=ngN4@R.;_Nr55M1]"RqFbd4[
DQ[;LEu/`_r!^Zm;`$kanrt(j#<''5)U6iNF/h+>)sk\Uj.nBr`$o$j1>r,baZKKO-B/=_<JOC4>H''H
orBBmGg?K57hteoEcL;J#RXn;-qG#W3?phJ3VVPYi"p[`6[X\<BW@SGSA$[$WYC>j.s.6fK>6UdDI.fD
.CT`H6FqR&X*=&Z_:pqs?@72]?8cnChbhHnb_l2Z>L:UY]eRiPcG:+*3`MCEV-DRc''R8k]C6^u*\IA3
jae3].j@nLjDp>c;"`N?-^P!YsCL@Jpae>-M=i1ob+-9#*]n"],g+2_Q[Y/2H"-u!`l>!26#IsT>EAtA
kEi''*acd[n[)fZ)s"R8-!1;jcqaBesIV:V-Y(XW6#F#2jKL&,rdXC.;dgJRIk>9hudB1>`g-W-VhL4T
(VMcGo@lopmll."KP9!e*P5_hf_BJ(,VU&]K9o$]rhgnqc=h^?K&62Su32SqXjY."93rKG''AM)qMqrO
eL_R^B(s:gZ3*";4Z;L1ZXdK,''9I$C\LJ&3*ABF4uJT=C18,%0o6h$L+\)9-DFRWF8$T-B2DI!M6Wu5
g;<,gDhE9gc>WDOkTK`IM)1ub#U!h67C8NSGg?d0eVA3[-PjkVD&k/%3TGFX-,Zt><6Y+BlGuf=FG(EU
uiK656"GkAeR\On?pe?n?f''&hS!f`f#S4a4k@CmqOhAG@QrZ<<ViMN64DX\#HK^Immmf"jUaU8Jd>%3
\QCK,D4TkH^N^]6=uW:sdDJP(dH-QPL5a9<\@kH5I[[(_bLX=,N(akZh7H''=1]nm?D7I5a2Bp8c0Q_i
1Qql5MjT9,^.<G4lHRa2/R!+eGY?%''2#4f''tH-c^!fn^J6QUeF7L;pNU+pR\\mDOSI;&qs.=NjkPNc
RlnXrQ=G?ak2q4LJps_&rn!m1Wk*"X>\5QKY\Q$?58]QRIu""X%`r6Z76Aa[f8XooNm"#IsfpC")3CL?
`=I1dDo/"3;lkLDmK7I:ac''P+F`&(Jd"&fM''/_*S6_a>P\er\*W`D*$Yda67TMlO=l0D''(=JE)?*p
,[eZ-D2X2qbTcb-\.SE`D&:19SMdQD$]pm3,EHA^N&Ub,UqEXu:@LbWlZ0tkIPfec0Wd234j!]d''\k`
U''G?>S(.<EJN3@>qmAsVTDp!2fZ"T_m]*)Sb##MD1q*?uk&eVTDqK<qC"O@)cQ)=8a1IP0;:\<Fpp;+
C4dK1KgZi"BfBhC0f9GfhA7e<O7hVb]kY>H5t]IdBs?;84g?,;=?1ne\i_Cm_qr$Q:N!S^h)-m@(Eq!(
sE(W+7_lVf!-J\*e4q![EV0]Ap?ddls/f1>\h''1;0$=m]nrn:.^u6f.Z7aR"pn2Xs(V<-ih_/<;J5j;
SN\PR''0VP8It@;=0VsV>?GT,&AoN^o8%"B#$LMEMgYu^;c;atF@P4;_E/3U:I*hIY]4NH7Se>.cK^db
GLDm9M(5L?OfFG=DBtp/Xm_ki95m%?5JB8ccM3e@S$N,VGE=([)uW#,o\VG7k)+)k;1+%.TaNRA8CFG+
''mo!7DX+u76BI&-_4]>tb>54VXPRp&o9<ca10ON(e\mV+T.$6X5!JGO?*Kqp6=_:CZg?i+:j,k;EAt?
J^Wm&_F''LbDBnY2OhQ2);>Va''Qim7^>pPfX1dRog08/V"FL0n2MREEt:PtK!:B*qVZcT!H1(F^/(TT
S8J0E,2G+j/5er-JsW`j"*)k5m=h&k-p`''XBS#C(E[:n!G?TNqrNn#WWXg+KSXhZo2m+l88%gVGe+IY
IHc+E"BrW*Mf'':T(.(/N.f=E8kH''#aG]a6#++"<"M`ae!J''s0q1]=Z<c5^rd^:8n,m4i7\YShZD.p
+^!=8j>#Ypkq4>Kg,+)i4+cgq0dA>eM(/(k6(;mc`$G!W=QpLga1#!J"a"+n%HoBGBB-<&^-4oIj-r9Q
b(Dgkg.<6_Skj#H<sPOO2kN*B&V4u@X)AWWR:X/Ej.nQrV#Z#=trcc(>"=$FjNiUmP\_4&D@A78MuomK
,,G#)VBEc*Ut3''0L\bD">?*_AW5,Md4V$__+6"Fm50,FCesZ%8=4Eq(:#LtnDbWRP+7\>n+,jAd<hTm
^%)F28n!OFR6`R\4ou7)mTn+<B<qqK6Y7goOi3BW4<''4PRVFn)W+$)''b,8#rJo0-rM4IH69J4m<0''
e>,TgP3OP%i@aVm(_Y)s=1IJVsd"R$n_JpT_]h.Dcpc1W@CpX7KR2^[MHd)-GeNO7)ofBf3-+AEV9aiX
fDOhut>[H\p@%q:\&M`;7DQGq!m[f2;9biidPt''blflj4"Hoe2m(`YeA^qXrbch!.YANWK@\O"i]%9e
D%<I8j`mfMOVSS#a?NLUiG<^bGn=,#mm-JACO"h#GoJ&a@7OpPt(OOu;Ea46f7V[-8B9-U.&Vt)''P>;
3VK7[YLp\OZUD2t+&b/No:Z2$"CEcTD!7TMG]&?<5d;3ITRXe-1pkJu0@ueFhf3]\?4eW>]s4=;%i4]%
PK/dr7Gi]5''qAn+;tWpUnU*=EN9VgbUWej<q%QgF--[o;qAS/Ti.OCQkaG7i34gLW6e%WrO5Yh5d3[F
co]5Zu7P6>:Ua)^`U3VabMPeGkSuPka0p*K1=+.G&3_t]m)SVmUtYr>R^3M<7Y2RG\&9Se^;f@gpHaF_
Y-W<;nKGbB!.!\c8Yg^&p\A09[$([GZP1o^D&,`hs2?0l555fjLN7*2bOMcMY%C!Z@"$8Z8hr^INacR:
(?TeZ-eu91"ggU+FQsaB<&1T_i4-)*=M36Z`[$44\[?kbOK$KfG''#4KXicKEMlU[OgC8N>3rKoRLW`G
(u?*!$)fZ$S9u:YHB..jOT''7@PK4N3f8MZdF"WH9/*)dH;U=1-7e9$YHW$WQSk"$B6H=#(<368XX<Y@
DdlWf&\adJlNE+g^NuWk;`ONSBA2gZ/FQ&V*<UK!oLC?0W8hLS$8hV$S?.W(>g=\HD(/"X9S3%/+''m.
o;/<*-Y^JWd6oI;nOq8$JXAZS''7VCZ#n-H45Al?;;`:CFLm2IIH=`:d+i3@cNcrM8on#Q`fhTpgV7j,
`(,XI\MN892g]l:tTOZqOhAj<jDp<%Kd#Ug]4Xo9i,FJ`>t0?N.3Q\''m/#DfObgHq`Ng=[9I6W]D)t>
-AuSXUf''hWNW;QFO:iu:#`.4Ck\ocSq<5NJ*bk%f7EGtq"$''`ZlL(/FfP9qquPqT2G_rd62q''Y''I
Y%cA2$e]8P0)VqEol-:B^"`Ao(?]2k)WA9^Y75dth4MPn#+WDb1Y-c&t8nR8<t0(FE.V&H"25dZAk94<
&%p@8rPcd/H`=3Oi[9rRqht]j@52dm($0G<<NPAQVha2F=ut?h<B_UpH9Xo0s:8FPjr6\J9g0?:#.U8H
>D_%+IfYo(ap"9"nNbEf=fm65B?7lV:W''8-ZA1h^L#nXm"a&BUfB,.<kB=&6KV?mYGn*iU[nFJ/p*uD
s5+rZF0na+Q`nPI[;W*!h#46A(\Ld5Z.LDRWG[''"?+oUB&BAoi`q>[g-fOr&$&;:4G*B%d.j0NPu4:K
H<Oh\_UhLfs(dQ.5)X^,B$A#Hs0L*]=Y:KT*h>-Mg=@n\np:8`PiL"9q.6?A2<F+mrO@n5]9s80\b\jd
0d;\R^fM7!kLj<2Q5i;/N?nG%j!V0P0j[gM`JL4uOp8QB"9K]+->ZfDK2Th?"Lgs%s.SD?1kB(SDnb''
]=4<4"=Wq4L-&Gao)rm!M''0+E;X(99XQPTE:Qf=69-Hp>O"uHfM6*FiLs(`$E=C<4R@3''am\-2Hp&6
$TodX?7@Y-kNK/@==.E&X_8#)XC?[a/kN.bcuP;AsZo.*&R;"?!AReu<_%3iM%F''!,!Abgi0!oTNPPn
''Sdt/+^PcT/IL(\(7rq++dReUW(_Ek-@);2@c''Y>N[SFJFNg%fkh"[@&02og_&=p@i9W;A;U]Xo+eK
$J0.&1L6J9HP-2CG/FAS:%aYYZ,ME84/h"]9hVN''^@>j_[q?@EK/jE>"?hZ6:`Pa>s=]P.9\s[Y=PNl
DS>HSf7j]=JF;/0u)Rt?[3;AU](5Ojrf;%Bt"7s#qY#AIDD8!G8Z*=-7<7tGUE%C5B''BZ8To&+Q*J6"
@T:q9F"JV#&>$$^N5g''\kqL@V*''%Uj-s2,i`8E/]Y99j9F;6mKAZs_9aBF72/26c.fg]]@24DoSknW
YoBVhBnP.<mc@P:M=rRXS0Ur#2"FlC<(/G`2gu<^K-m6dU,HC=q\=hfhlk_#LHq]4iBmiNDMH[hNlHB;
ph\uI6PD[=c9=6t9q7(5-LH3IP9!_JS;Rf(8+/W.rGZel<6lJOg:?]8GQ-(3[U#t)f.-M()6L''%q"I8
g?(&aIQn`sk_r(#-fPui19hR&"<(VVrJ0WXXCtDerlSP*L-J/rl0etEoh*[cd18RXh''q5</(6PlX]Hr
3YVkt9No8S)W@iAC1TNNK)+mAX7I#dM01Tn:C.tCG[ZO$Y=T[m/#[)l:>9gAV_%X%"2D[f_;%q#9''$X
it@qQp.''bhj2Q:dNL;DZ^ojd9?nS,''-g''=QFrUEM0$\8;_)C#Ik$]W).HF`R,Of$bp''NO.-CY/j5
2Z_KF\nJ+R;!a-!qV3(-Z*Vb''WNBL8LGbKu\ro6e:>3sWlj?qLY(75P\%Q`NOOfF_iqd=q.1H;2\kX,
eQd_O-LZK"6>M@:gn`)RlF28sA!hf.6I`\ZB`^K@6''u_JPQ#ai1L''-kVU\[a*&5P@=BDMN?Y"<^''0
AfRd]:Oj#oq[bc#9(Hs^e,!%Jag%IbW\.(N2^3%J!7-?$F#VSsWYWKX*!4<bfB<kJET`^OV)4Uufdm$g
>B[UQg*V;4"2bU5"#)l(''L0UVX?\!''b;m9Z0cVk3/rqlr>ITF[H?ZnO.;@Wr\kHFG&.;I.fQMYR=aW
6eHiuAoEq6!ChT`)Nf8JXXs+_$`UJ2bLK[n@uobO?FOWb0`GT*b,_Ci1]W:mqqfBKq>KC()#54Z^;0WT
puJfK[X<;''Rhl;8ii@iH!"Kacp+oF.d@:DrWh"]*k*M/j@N0e"@7&.^QDo_]1<@UT)1l(a!p&LYdbA2
o:Z7dfUYbb/!2gKqWC:j'',#9B!_mWQ@L4G?#V4U+!_(&Dtb],JLB6_GMUug/7-2c%dqL?UGo`Ddj96Q
_S:0Ei&T&%4OI/rF67tFGSk@G=eW5^L#ne(:,T1tX<K[^#`\U^aQ+TsX''TZrn&UVM0<ndWU)829LU<n
b8kR1Y_;8uZ*<23EGX9t5;fpPW@''u!g]k<Y4$u<U#VZm`:a''GbCn`sfHW4W#TJoaS:/mSB6(^AD\a&
u^m-(]tu^u"Jd#/`Te$lik".1mD)j#A/jnn+9Si;BV`/UB<==B8+qJCN(G1A3k^nXN#=7r)^T.)VIj&''
.<rJ(V-8BV`d9H1DD!_%@FCj3[K&d03B*QVlWKgLg6_kPU>U@_''V#I+Lh2pLXdb61''mAFWC''''^.A
-3''I1Pq0A6F'';uE9g.9G#;0I`5@"jTpBftX_QN44sZGZFg\K_L,.b*RjnBAqs&A6V?/)gjD>gs?:l>
U,Y2+kbZJ#1>_)%*J)u$Q9D48:B(4_5$CR*>U#I8;7gL07`!jp]07ajb1V4\(.TMnboDQ?`&?8lXt*[.
H9C#dZ_T#G_`cJ0^oEEB8^;1\0P!>I%/aTS2G3oSTFD?i`6MC.dI"q6NDc&$]c''i@dt3oNKbEtJJuRY
cD,IZRaVfiIAj!A4^iJ3T_/U\W3ZA/Ee;ru[p[&liad/I0IZ\X,b=&+b)=qp1MKT;I#Z;o#.B4::P)^&
/cPA*fRfUgf1Mr5-58gm*GG8R1D#8h"`sRfdC!>e=:JoqXik<iWj"[)QO;8.p-4bX1"87?Z<bm8M!2I[
.W@SdhD"''sX-L.%]42PWIO^%VhqMoSC\U7=n>hYF><@>OKA`qU&md0_>0.c@7?pRcNtZQA-ZP8gc9_n
374+O&VL(sGLiVi!n)!&5_T:Vmh#eSrn!#F[/gOm4WfV`dEB?gR2Z6N;Yk?cS3K%V(H8^lJpYA@<Mfc;
rHY%_&JTq$[Hje;O=2W=8>6@EPl!5MQ:%&A`Vgm)X-D716]1njKd3q!Q(JXF@!IAIp,enej(L!qHs18u
?2`Z7nb>cLGJ\)h]Wd/q63W"ZW:GcXe3!fm"ql)s1>/Yb9Gj:GL?A(Q7Y"<b3lVpCPr/4[^lr+:&JeEB
GCtY''37`&>tS.91X9`DmN)reGY)2sqEh6!8VB_nB5a@.OF51=K*5au;`G`:)<.E\UOA/>jWktB^;\nr
pWF0Q-jk:2LQ48u:57/gdBqV>EX7=HuTqTX-*<.c"7?Mj(fc)Yk:Zj^$NUK@GpOEKkshk4"Y@uJJZ$B)
9YJ,pbo!!!?[0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG0f0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG17$8=.f0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG170FBKf0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG170JEhf0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG170JG0f0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG170JG17$8=.f0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG170JG170FBKf0JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG170JG
170JG170JG170JG170JEiDCh7$qFDl#)Ebc#/Eb0<6DfTE;BkDkt~>'
]

{ #category : #'*PDFtalk-test resources-fonts' }
PtFCustomFont class >> nimbusSansLReguPfm [
	"included for completeness - not used by the system"

	^ByteArray fromASCII85String:
'!!,S&!!#B)E-ZJ<B4uB00f_6S+B;<@+B*2jFE_/6AM,*(ARuurBl%?''6VgN]8PVbuAoD]4Ch[BjDKB
AADfC7-$ihgZ/-4E*z!!!"\!<D<ckQ:i.!qud>s)e;A!65''>!7CiIzz!$2-(!!!#dz!!!#$!WW3#!!!
#Tzz!:Tsg!%\-Q!9aOK"5*_a!ndY/!!!#W!L<_C!f@&.!&=P''!9*u6!&=Nr!AXZ;!rr<tDf^#!@rc:&
F9#''MD.7X/;djQ;!)@6F@Wc`j@;\aj;IsK`!#>SN!Fl-]!\=Cu".KA,!)3Jg!JLPF!Ytf2!>Y\O!A":
''!\=C(!\=C(!\=C(!\=C(!YteP!D!8_!_<AD!qued!h08>!n%.>!b29="4@5d!V?D^!\=C="4@5X".K
?!"4@7?!b2;[!h07q".K@]!b29I!>Y\O!S%3%!_i\H!\=EF!A":''!Ytef!\=E0!8[_J!T!fB""XL)!\
=C(!_i^f!>Y\e!qZNA!qZNc!V?Cf!<`Eu!D!8u!F>e5!T!f-!_i^Z""XL)!_i^Z".K?d!U''Vl!F>e5!
F>f`!8RWL!DNT$!A"<9"&/g["7uUg!O)Z4!F>er!aYn%!A":''!\=C(!X&NT!_i^S!ce;m!_<B!!T=)d
!F>gu!abt8!DNSG!Z;&G!DNT%!Gqig!bDIF"(_RE!h07\!h07\!h07\!pBa7!h07\!h07\!YteP!>Y\O
!R_%t!X]#:!t#,;!t#-$!X]%X!n%.u!n%.=!h''1#!\=C(!\=C(!\=C(!dOn?!A":''!\=C(!YteP!>Y
\O!A":''!\=C(!\=C(!\=CD!b29_!\=C(!\=EF!@n6D!TjJ=/@PR;/;aBm/-Q#C/<p00/G]<B/:%7p/=
c`?/EQn4/>rML/BIio/<TsJ/-#Zj/A(q*/A(q+/C+9@/@tkE/B%S(/-Q$i/-Q$j/-Q$k/-Q$l/-Q$m/-
Q%-/EQoe/EQmt/cG]=/b8p7/^aSl/VF("/_L)$/cPcL/[PIX/_^5+/bB!E/^=;u/Zetf/_C#C/^aTA/b
K''e/cYir/b8qX/cG^f/cG^g/cG](0"1d=/rBTo/d25E/sQB20)>ND/p[Ir/tDrA0''E78/uS_N0$+&q
/s60L/cYll0"_.,0"_.-0$aKB0"V(G0#[e*/d26k/d26l/d26m/d26n/d26o/d27/0''E8i0''E6h0Z*
i@0qA7r0q81s1"-(V0oGud1#2db1!fkV0s(C40sps=1"H:_1!BSV1!oq\1"H:Y1;!QF1?AHi1VNfI1[4
on2#dM01p?p71u&$d2#dM31^*k:1][S71][S81o((11][S:2#[G/280#K2<+Wj2T#JQ2VA$`2qe3c2l?
U12s:2s2rFWl2ou"V2s1,u2rair2uN\82rFWq2r"?e35>JP39:)o3PYSQ3j\ic3d^m-3kkVq3m@V,3iW
."3pQ`e3op<a3pHZg3pHZi3p$B@4+I92421_r43RY,4/i1"46lif466Eb46cch46ccj46?Jo62COI60n
P<6/_c26.Z''*6+d.e62LUR6/_c:5nO)l621CT6/DQ;6*gMh60eJL6)"<Y6/;K@6+R"s6-fL56(n725o
p#g6,!;]6+HrY6-T@n6-K:t6.GqH6-fMN6/hjm6/DRl6/DRn6/V^q6/;Lo6/;Lp6/;Lq6/;K+6eq]76d
>X)6eD?56iI$_6h(+T6e)-:6e23<6g=VQ6dYj96cT/A6eq^X6eq^Y6eq^Z6eq^[6eq^\6eq]-8)=2<8''
V''-8(R]88,iNd8+HUY8(7K=8(R]A8*^+W8&kSE8)=3]8)=3^8)=3_8)=3`8)=3a8)=248G)pM9)JWX9
$RB49!\Ir8t>oK9D8BO:Z)1=:\k#X:\arZ:[7sQ:XK,8:Y5VA:B1Am:\4Tc:Y,PH:Y>\K:[J*`:Xf>H:
WWRO:Z)2g:Z)2h:Z)2i:Z)2j:Z)2k:Z)1<;;hIV;:PW];;hJj;;hJk;;hJl;;hJm;;hJn;;hII;qh7F;
sjTa;s=6^;r.IT;s=6a;qM%k;u$AE<3ZBg<29I]<7Ck;<7Lq@<"o=+<1!V\<7_(I<9aE]<94''[<"At1
<"f77<#5OK<;HQ3<1s80<1X&B<42ag<;Z]Z<!`Ph<!r\q</:Lc<.b.c<29K0<29K1<29K2<29K3<29K4
<29KA<7_)u<7_*!<7_*"<7_*#<7_(8<SROI<Sd[Q<U]t''<SRPi<SRPj<SRPk<SRPl<SRPm<SRO*<mq"
6<jhro<nI@><mCY7<mL_=<gWh^<n%(H<n[LO<n@:M<X\t]<kJBo<WE,`<Y#1p<Y#2"<iH&1<ho]1<jht
D<jhtE<jhtF<jhtG<jhtH<jhtU<n%)t<n%)u<n%*!<n%*"<n%(#=7-#R=3^b3=6KTO=6''<N=60BT=1n
Q/=6]`_=69H\=60B\<tG@b=5Nt><t#(m<uV.(<uM(.=2b-N=2+^M=3^c]=3^c^=3^c_=3^c`=3^ca=3^
co=6]b9=6]`Q=Ng_?=OR6#=OR4$=eu''`=e5RZ=k*I>=i(,.=i124=bm#Q=iLD==k3ON=j[1J=VLjh=f
).\=nhr[=Tnei=U+qr=b-Oa=aU1a=e5T/=e5T0=e5T1=e5T2=e5T3=e5T@=iLEi=iLEj=iLEk=iLEl=i
LD,@Jp-p@Gh)X@J0Xq@Jg($@H@Gd@Ia@s@@[?u@E&7J@G:``@IaA#@As3<@JBe7@Jg(?@K-:I@Jg(H@K
6@N@IF/>@IaAB@IO5A@I!m/@Jp/D@Jp/E@Jp-k@KZ\I@KZ\L@KZ\M@KZ\d@KQTrA+fk$A#B9G@gE''TA
,?4KA+9MBA,6.LA*O#=A*s<4A+fl?A+fl@A+fjfAGH1FAH2[mAF0?4AGH2CAGH2DAGH0jAao^hAa''.e
A`3S`AH2^,A`<YeAb?"%AYK-)A]OgPA`3SjA_d;gAZ,Q?Ab#e5AH2^GAaBA:AbH(FAb,kEAaBA?Ab?"I
A`Wl:Aa''01Aao`=Aao_3AekAeAf:Y8BD2@)B;bc1B?pNYBBT:tB<D2LBCPqABDhdQBCc(HBDVXRBCGl
:BD2ADBD2AEBD2@8BE8*RBE/$SB`7s#C%hR+C&S''4C&@p3C&e39B`e?IC&\-QB`S3''C@qO*CA\$>CA
e*DCAe*GCAn0QC&e6DCBji[CBacND#OBHC]FHUC]ONZC]FHZC]FH\D#F<5D>aESD#aRiD>aFhD>aE6DZ
''NTD?''[jDZ''OiDZ''N#DtEuuDsRErDr^jmDZTo8Drq!sDtj92Dl!D6Dp&)]Dr^k"Dr:RtDlWhLDta
3HDsdRFDu0KUDtO''QDt!^MDtj9VDs..GDs[LeDs%)9DtF"IDtF"JDtF!/E!$)CE6A2tE!65ZE!65^E!
QHtE!$*qE!$)+EVTQSEW,o^EU<_AEVTRPEVTRQEVTQ''Eo$apEhr_8Er>r<En:7lEod75EW?)[EW?*&E
pit]Er>smEr>r:F/8hJErZ2UF8c,ZEs)JdF8,]YF8Pu_F7fKqF70&oFR]</FT)5NFS>`HF;P!rFS>`RF
Su/ZF;t:%FT)6&FSYsQFR]=KFR]=LFR]>&FS>b.FS>`#FnG]''Fl33lFm]3&Fnu&4FT;D>Fnbo8Ff#+=
Fk?XpFl`R)Fm/j.Fi")nFnPcSFT_\bFTMQZFnG^PFnG^QFnG]"G2`I#G+nq=G23+$G2N=.G3f0;G4klH
G4GTKFoVMZG4Y`OG4Y`PG4,BNFr^RGG5hNXG2`J>G2`J?G2`JZG3f1eG3f1hG3f1iG3f1jG4>OrG4GUt
G4GV''G4,D%G4,D(G4,ArGO,9.GGG1HGOtiDGQ%PQGPD,SGPV8VGPV8WGP;&WG96gJG6.c\GO,:IGO,:
JGO,:eGOtjnGOtjqGOtjrGOtjsGP;($GPD.&GPD..GP;(.GP;(1GP;&JGiesDGiesGGSC/OGierkH/AQ
oH,BSTH-$"`H2.D=H(=n8H0kQ4H2@PCH,KYcH.r:,H05-9H1CoGH0tWFH1(]KH2IVYH1(]MH1(]NH0YE
KH1:iSGo-OEH2@QWH/AS>H/AS?H/ASZH05.cH05.fH05.gH05.hH0kRqH0tXsH0tY&H0YG$H0YG''H0Y
EMH3jR;MqJ&/Mi7U9Mm34_Mou''&Mi%JMMqJ''JMqJ''KMqJ%rN;NWJN77f)N:m3MN8=LbP0X([P0O"m
P/%#jP&()+P3N!XP4&?^OoPJqP4AQiP4JWkP3`-gOoYQ(P3W''hP5kQ)P5,''nP/%%8P/%%9P/%#JPh5
pfPh5q$PfWkuP]QlCPfWmDPfWkoSE^&MSE0]JSFunoSFli%SG<+MX47/KX,$^UX0)D''X2b0BX+gSiX4
70fX470gX47/;^t/NT^q9V:_#"(1^nLd/^q''JH^s;s_^nC]Z_>4*t_<_+g_;P>]_:JWU_7T_;_>=1*_
 %?ZB_>!t*_;5,f_6X)>_<V&"_4gm/_;,&k_7BSI_9W''`_4^gj_7fl3_79N/_9DqD_9;kJ_:8Ls_9W''
I_X%4i_Ue`V_Roh<_YX:3_P.!0_VG/l_R]\J_Tr0a_P$oq_s@=j_q+iW_n5q=_tsC4_kI*1_qb8m_n#e
K_p89b_k@#]`;0F"`9[Fj`8LY``7FrX`4Q%>`;9L+`8LYh`";uE`:s:-`81Gi`3TDA`9RA%`1d32`8(A
n`4>nL`6SBc`1[-m`4c26`45i2`6A7G`681M`74h!`6SB7`VKO#`U!Ok`Sgba`Rb&Y`Ol.?`VTU,`Sgb
i`=W)F`V9C.`SLPj`NoMB`TmJ&`M*<3`SCJo`OZ"M`QnKd`M!6n`P);7`OPr3`Q\@H`QS:N`ROq"`QnK
8`qB?u`p<Xl`o$ed`r5p0`o6qk`Y8DJ`qo^2`nCAg`iB&;`p3S''`h392`nCAm`j5VG`lS0_`gQj[`Z>
,B`j,Q,`iK-''`k_V=`kMJB`mFat`le<Ia5$\ga4pVha8Q$9a70*qdeWo:db"LudanG!db+S$dd7!:d`
DGTe+s#2e+ir9e''S+ge(=Updf9AGe+<T=e(4P"e(F\%e*R*;e&_PUeG9,<eCX_"eCOY#eCae&eEm3<e
B%Y`e^sh#e^jb$e_''n''ea3<=e]@bVf&-Kof(o>5f(f87f''<9.f$OFjf%9psec5\Jf(8o@f%0k%f%C
"(f''NE=f$jY%f#[kXf`1tNf[p.(f\c^1f^o,GfZO4[g"ZNmg=uWngY;`ogtVj&gti!.h!b8`i;<Oti9
pVhi:6hmi9L>3iSXZ1iVWXOiT1#:iUQq[iV3@fiVrjtiVWXsiW&q$iU6_iiUQqniTgG`iqrb!ipQhjip
m%oip-Pej6lqkj73.pj6HY6jPTu1jRrOJjSSsRjQ->=jRN7^jS/[ejSSsmjSo1"jSSt!jT#7''jR3%lj
RN7qjQcb7jkp)2jn8XKjno''SjlHG>jmi@_jnJdfjno''njo5:#jno("jo>@(jmN.mjmi@rjm)k8k2ZJ
7k5#$Pk5PBWk32hCk4J[Qk+DZSk/mX)k2-,@k,eSpk550kk5YHsjoPO''k5YI''joPO+k48Ork4Sb"k3
i78kP"prkP,!skk4t!kj/7mkk+n#kii%9l0/.Bkl:][l/DY?l1G!fl1+ddkl:^!l0J@il1P''ul14jtl
0J@nl1G"#l/_kil0/.flLk1#lKeIolLb+%lKJ7go(rB0o''cU&o(W00o''HBGoBZELoAfjGo)\ngoB$!
MoCr8soCi2so)eu.oBlQuoD8K/oCW''+oC)^''oCr91oBcKto_SSWp?V`Op>c0Jp&Y4jp>u<Pp@nT!p@
eN!p&b;1p?hm#pA4f2p@SB.p@&$*p@nT4p?_fKq!7rTp]LRnpuVNTpo49ops/n@puhZ[poaX/q"Of/q"
k#6q!\6,q"k#9q!J)ZqY1"_r9aMXr;$@fqu?^pr:g5,r;-E~>'
]

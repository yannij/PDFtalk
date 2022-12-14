Extension { #name : #PtFAdobeFontMetric }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFAdobeFontMetric class >> abrevitatedTimesRoman [
	^self fromAfm: self abrevitatedTimesRomanString readStream
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFAdobeFontMetric class >> abrevitatedTimesRomanString [
	^'StartFontMetrics 3.0
Comment Copyright 1985, 1987, 1989, 1990 Adobe Systems ...[truncated]
FontName Times-Roman
FullName Times Roman
FamilyName Times
Weight Roman
ItalicAngle 0
IsFixedPitch false
FontBBox -170 -223 1024 896
UnderlinePosition -109
UnderlineThickness 49
Version 001.004
Notice Copyright 1985, 1987, 1989, 1990 Adobe Systems ...[truncated]
EncodingScheme AdobeStandardEncoding
CapHeight 662
XHeight 448
Ascender 682
Descender -217
StartCharMetrics 228
C 32 ; WX 250 ; N space ; B 0 0 0 0 ;
C 33 ; WX 333 ; N exclam ; B 109 -14 224 676 ;
C 34 ; WX 408 ; N quotedbl ; B 70 445 337 685 ;
C 35 ; WX 500 ; N numbersign ; B 4 0 495 662 ;
C 36 ; WX 500 ; N dollar ; B 44 -87 456 727 ;
C 37 ; WX 833 ; N percent ; B 61 -14 772 676 ;
C 101 ; WX 444 ; N e ; B 22 -10 421 458 ;
C 102 ; WX 333 ; N f ; B 20 0 383 682 ; L i fi ; L l fl ;
C 103 ; WX 500 ; N g ; B 27 -217 470 458 ;
C 104 ; WX 500 ; N h ; B 9 0 490 682 ;
C 105 ; WX 278 ; N i ; B 22 0 259 682 ;
C 249 ; WX 500 ; N oslash ; B 30 -108 470 549 ;
C 250 ; WX 722 ; N oe ; B 30 -10 690 458 ;
C 251 ; WX 500 ; N germandbls ; B 12 -10 468 682 ;
C -1 ; WX 611 ; N Zcaron ; B 7 0 597 888 ;
C -1 ; WX 444 ; N ccedilla ; B 25 -215 412 458 ;
C -1 ; WX 500 ; N ydieresis ; B 15 -217 476 623 ;
C -1 ; WX 750 ; N onehalf ; B 30 -14 720 676 ;
EndCharMetrics
StartKernData
StartTrackKern 3
Comment Light kerning
TrackKern -1 14 0 72 -1.89
Comment Medium kerning
TrackKern -2 8 0 72 -3.2
Comment Tight kerning
TrackKern -3 6 -.1 72 -3.78
EndTrackKern
StartKernPairs 113
KPX A y -92
KPX A w -92
KPX y period -65
KPX y comma -65
EndKernPairs
EndKernData
StartComposites 58
CC Aacute 2 ; PCC A 0 0 ; PCC acute 195 214 ;
CC Acircumflex 2 ; PCC A 0 0 ; PCC circumflex 195 214 ;
CC zcaron 2 ; PCC z 0 0 ; PCC caron 56 0 ;
EndComposites
EndFontMetrics
'
]

{ #category : #'*PDFtalk-test resources-attributes' }
PtFAdobeFontMetric >> fileFormatVersion [
	"<String>"

	^fileFormatVersion
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFAdobeFontMetric class >> helvetica [
	^(PtFFont fontAt: #Helvetica) metrics
]

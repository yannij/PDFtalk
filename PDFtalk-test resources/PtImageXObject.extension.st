Extension { #name : #PtImageXObject }

{ #category : #'*PDFtalk-test resources-converting' }
PtImageXObject >> asSmalltalkValuePixelByPixel [
	"<Image>
	create an Smalltalk image with RGB or coverage colors"

	| palette image |
	palette := self palette.
	image := Image extent: self width @ self height depth: palette depth palette: palette.
	image readPixelsByPixelFrom: self.
	^image
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth10Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 32;
			add: #Height -> 32;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 2078;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhRS3CMZr4)96#@D;''b>PI=I3KJElcFGiW!''pPjQh,LYe''/5DDC&P81qp;Jq''k=<[KE+T?-#maV
Ua-@P)PCbT#mhq%#u4/,?]mC/Dt2rA:1D9<q^mg]kOtKkcZ.+)PrR>>la>''dn,1N3rBJUg70XPMQ.1D
M%VF@JL''^Iab0,aS+^Jtn3o*#klI.#TPHeG*\47.@1[=:hHYsA+^DL/<*XbdYLG?[$s#B,_*op,W&7-
t5.$?.BMn*(FS''>P#R8c;2JI7`-4s+,thdX>ah9p.&pX*RJW$W-KdO_^/?ggA^>pG"O(/kVocs30Z3K
dSri_4nrk>="\-#tEJKOPfoC5d@?n`b5QV(5hTSL''`K0GIfYn"EmM/!1E8j!)GW8.9IIQY_4)_=7jm]
#6l<dqk(+G#?;nH^?m@flZ=Zmu6*1pK6i9FRC?GW(0''tj[Bsa!Tbi;PKPqJj^QCq5E\=K1j<^pF]-5m
E<@;oK)XC^F1"q]R''ieIfi@jso6HXq(ku*u1''H\G.%A,R!X<m3[mF\"A2]N9JL&i"p&EucqPZAuUi,
_LC$Vb<_121fHTXTW>3-O,:(#M5.0R''Z5=KVN$1E%/F"E58Fu[J2j:^77i4O%dfN%.I8`%%K].P6GKg
a\7>@rdVQS/COEqOp0@Yo<hOl7EEPNA''Z7CGG&q@^jgB,;5_/&j-Yn9gV.8$ULX2E'':S)`qYRZcfnr
j*\7_M(DIgL4)bYR7,/\pbE4;!I,_SKi6-"PTrNUW$OB3ad`7M).hqSN$CaDK32^GR[\,+0=4JL)m[Z+
a8MF5`X2k^4@tfYP0>+H%V2LMq;d[5a!rSi"^h0''G@#c.b6JtmCj8U#2h(ROe/:Nu37\)-cnf.9V<3B
*`6UZn=.0f56CuLp(<&)RMC3:Ko\#j94o''a!IJ:j@GFSFjmY1M]Wf$Q&rU>JJl\A[`mWaH!0oI-ArNo
I`KgO/D;N<tRN9-@l5Vq%*8`OcYrh@#C_oBqtcQ@D<WQWmWPjkP0D[QNH[q>RDJr2V*X%dLk9;=E\9-t
aUemX]^>]]mR3W?N3]U[53qh-^Q]Yo5=mIOtkG3mqjB@H"C`iajeDUb#mSi#V*EJ&pe_hWi''%>#[mq0
mB\UA]Pri1\/M[&D[SaT#98Ea8rSK?m,D;bcM#ms=Du"#''\!gQoU3LP>K>NX-Xri5Gh>`GoaeYi;bBk
pHBF5X/@]E&/.`W4CT$VQR$#Eijh:.2th:5`45rrSjM<LOd-Vqjs[sOk]0f@M4o8<t`j"n;06i.R"J]O
pEtr#loFZ0;3N0.QqMZ=k<(L2XS\`PJIBKoB,FI^%UdL]_;2^TC$m,E<)MKL9W[o?#eF5a$^V+=''tWB
K4+9s_3T/gLjP:dL6<GkWAL8[a]eQl;nISK:8"A#rZ:@__1Stuc-kZQ=k])#jq;o&Nbi\ll_c\5H=E(7
nB>IrhfjbJia&"cAq<sL<qMa''s,^tMR>=.1mbPMDf[43DpuSQA5M[p()gPgD/0mJ@E^l-JJrb,HXgfM
+eABgocN]i7@>+eZcBHU^68@Q!XT*p1Kg[-INcC/KUVGjb#7eL#PXZ*gAj4?uU=^AR#!Z8\G6)VWX''g
;A::PWE%&KE1.OR+QAcBm8Vglo&O$sg./B%,KDia8B?[]S$&.#Tc7)Z>^KInAFhX0$V[ADrS?3ea*g7J
NCW"Z5ubd[Z[`RZg]7-42l%iqoWA1g:=gKT+$aQkLoo^c.E]Hc[#&g;(LE7P$?qK!B!f57T&5lLN-cf!
6h"B%5+L]`W@Bp`h#s#''YRJ&E+^L5?2jnS&g#ZhfAjf\_GOYhYPN#4[Y5XK(*frepjBXXbJ\/3?An@n
usKM2*,HTp8ImOf6B&;dVFIdKaB/G2)p/b`b3%?\!)r<c6[harC"tVZ(]/,g<WnhA9umZh)\+&Q*K5\t
T2Z.^roU*=icr`(#=Wju)rt%uen4d,mhf5;VV:YP"o>m]ZW@\%hag?Nf\UJ"s%+q3*bu0JfD2V1uiS#7
&BP5&B86Cj<n:6@XRdCWt,]!IZ*O[sAVh`o*O"DGn6b%@QI1:#o^mGKR8Je"k4-Nk6u`$\;ka<^u"r)t
(%OK<r4>aFDH[d=b!(._iUQ)"NGJ\^&A9gdpmCVqhb<cI;olSthNkoXKNYWDOTDL<H\&R>$gM;T#j5J;
I7Ar*4<WFnb2bJY6nCd4\D/H),R[;_D,2A1!g;4bj_p>%)''a$"hE(N`mmBKp8!n6(UaZQl,V\r=KX&k
1_BagXSCEot,aXFYUZ:ZA,%&F0qBD<!90GGlFXqO^$HM1\8CU%[lM]EtQLfF]?,I!PV)qeCO0c>[CE[N
ugE:`t4aI@8lAmKor!bco=k+*n.GL`*a(j\$GY(;TC2.r8a9qiQ`lA/@*e`[);Ju=*hT1V)gYsT6+8jY
KfZk9sh@.>MCtdD/)Y3Whi/3,$%$%7/T@q).-ORLt/U?=A4TU`l/RE=KE-BZsW+nggY9ao;hZHnO3Y:''
Q?D;5<ag=Jtt[g_S"tH/*jdp\k`1bi]Ou17;Z=7m5[ad_`oes>TXe[^oK,rgA;VP#)A-Q@Rb.\BP02$V
Fdn`<$ng`8u"71p84]]P>aq13]1WAQnJ?u&''`D`9Laq''i/+OOm`HLGIfRlSNAL~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth15Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 14;
			add: #Height -> 14;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 291;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhPS]TsDTZ&Gr>;:HjW:`)]o>efp5I/@#nFXK=UA>e:Wj9=B''9Ahocj2H`"3&#Y*P*=B<3C(.!H\Iu
s78PN[u,WAFtd\Y&R^6E<n!*)DRO^/Ep1`hKJT7"1=]''NDFUZujAcA/(_$6Ap3r3YB,$*iX,B(;_p$n
^eE>OEHB\eX1p8qGAYq+^E!`MNPKZ4QC!X:PbB?U2u1.''Fc?(06dP-$<cMK`Xi7BtTV=3#IPUUFUCWa
@r5HP/hlDY[_6RjYD(*Qp;guF`*J''Uc1P''!WN<)>FW7pd6;knQ>BTObf^(>gi)b''cZ#A^''t<peN4
pILM9on>ij7>\[L:$C*4l5''X759C1&DL%p,Rq-LrJP62ZEc@As_r~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth1Mask [
	^PtImageXObject
		on: ((Valuemap new: 9)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 32;
			add: #Height -> 32;
			add: #BitsPerComponent -> 1;
			add: #ImageMask -> true;
			add: #Decode -> #(1 0);
			add: #Length -> 88;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 77 205 193 13 192 32 8 5 208 223 120 240 232 8 142 226 104 140 208 17 58 74 59 138 35 112 228 96 248 98 140 73 33 239 242 9 144 0 212 15 104 61 40 32 139 253 232 206 107 204 139 39 131 220 3 242 56 132 60 178 188 108 209 162 141 212 186 56 173 132 60 104 87 103 236 243 220 238 251 223 169 9 106 19 56 46]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth1Mono [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 20;
			add: #Height -> 20;
			add: #BitsPerComponent -> 1;
			add: #ColorSpace -> #DeviceGray;
			add: #Length -> 54;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 69 201 161 13 0 32 20 196 80 20 115 49 42 146 113 16 12 82 197 33 8 7 95 145 60 209 164 54 54 36 102 14 47 116 208 70 11 13 212 80 71 21 21 102 138 107 127 23 223 69 50 73]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth24Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 137;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 205 206 49 14 64 64 20 132 225 233 92 67 169 85 42 93 65 169 116 5 165 242 149 218 189 138 82 185 87 81 186 194 51 60 68 98 197 234 200 95 200 230 219 205 40 84 255 93 89 58 43 18 171 170 247 42 50 197 92 161 33 254 228 41 89 85 13 89 214 199 239 127 197 77 3 230 28 206 19 151 36 86 16 235 250 193 123 116 29 12 175 7 34 115 158 223 175 108 30 230 235 250 240 34 79 158 51 40 25 127 138 98 247 148 108 76 211 22 184 79 226 12 190 108 248 186 63 136 255 211 2 149 94 209 35]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth24Masked [
	^PtImageXObject
		on: ((Valuemap new: 9)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 137;
			add: #Filter -> #FlateDecode;
			add: #Mask -> (PtImageXObject
				on: ((Valuemap new: 9)
					add: #Subtype -> #Image;
					add: #Type -> #XObject;
					add: #Width -> 16;
					add: #Height -> 16;
					add: #BitsPerComponent -> 1;
					add: #ImageMask -> true;
					add: #Decode -> #(1 0);
					add: #Length -> 29;
					add: #Filter -> #FlateDecode;
					yourself)
				externalBytes: #[120 218 99 96 0 1 230 6 246 3 32 200 220 32 83 96 247 3 4 101 10 192 18 12 0 123 162 8 22]) newReference;
			yourself)
		externalBytes: #[120 218 205 206 49 14 64 64 20 132 225 233 92 67 169 85 42 93 65 169 116 5 165 242 149 218 189 138 82 185 87 81 186 194 51 60 68 98 197 234 200 95 200 230 219 205 40 84 255 93 89 58 43 18 171 170 247 42 50 197 92 161 33 254 228 41 89 85 13 89 214 199 239 127 197 77 3 230 28 206 19 151 36 86 16 235 250 193 123 116 29 12 175 7 34 115 158 223 175 108 30 230 235 250 240 34 79 158 51 40 25 127 138 98 247 148 108 76 211 22 184 79 226 12 190 108 248 186 63 136 255 211 2 149 94 209 35]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth2Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 2;
			add: #Height -> 2;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 17;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 251 255 255 255 127 6 6 6 48 1 0 50 217 5 251]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth2Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 24;
			add: #Height -> 24;
			add: #BitsPerComponent -> 2;
			add: #ColorSpace -> (PtIndexed base: #DeviceRGB number: 3 bytes: #[0 0 0 255 255 0 170 170 170 0 128 0]);
			add: #Length -> 47;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 91 181 10 25 172 255 255 255 21 140 68 23 95 0 37 65 96 65 23 152 92 4 38 25 150 134 134 102 65 200 85 96 145 85 93 196 154 137 41 14 0 23 168 99 91]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth2Mapped2 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 2;
			add: #ColorSpace -> (PtIndexed base: #DeviceRGB number: 3 bytes: #[128 0 0 255 255 255 0 0 191 0 128 0]);
			add: #Length -> 19;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 11 13 197 13 178 2 196 191 194 48 46 53 0 217 161 22 151]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth32FixedAlpha [
	^PtImageXObject
		on: ((Valuemap new: 9)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 64;
			add: #Height -> 32;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 1148;
			add: #SMask -> (PtImageXObject
				on: ((Valuemap new: 7)
					add: #Subtype -> #Image;
					add: #Type -> #XObject;
					add: #Width -> 64;
					add: #Height -> 32;
					add: #BitsPerComponent -> 8;
					add: #ColorSpace -> #DeviceGray;
					add: #Length -> 2048;
					yourself)
				externalBytes: (ByteArray fromASCII85String: 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz!!"sKfDYaLs8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W&LSMpNKzz"-!3Ys8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W
-!s8W-!s8W-!s8W-!s8W-!s8W-!s8@lYzzN;rqXs8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s
8W-!s8W-!s8W-!s8W-!s8W+Xz!!!!XrVuots8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W,t2ZNgX!!!"is8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!SH&Wi!!!#Ns8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!f)PdN!!!#ts8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!r;Zft!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!$!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!rr<$!!!!#ts8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!r;Zft!!!#Ns8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!f)PdN!!!"is8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W-!SH&Wi!!!!XrVuots8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!
s8W-!s8W-!s8W-!s8W,t2ZNgXzN;rqXs8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-
!s8W-!s8W-!s8W+Xzz"-!3Ys8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8
W-!s8@lYzz!!"sKfDYaLs8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W&LSMpNK
zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz~>')) newReference;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhVQ;lVeI0''F+&VXFl*Q8.fP=9@4qs''cfS1W("''-/]A*L"cHD6K??GjU=Q[Q%Ord6c";%3LLcTC+
=''51P9]064aRf/68m">6QJ@0jr#KJI/)gIoBs95g=ku]c?>6"CSe^&Li:<ZjoO+HG,^P2qRlNuBOk]9
6R3Z@mA+sBL:46VV4$uFf-''*[?!W$5d=or-P''btrRtWW]<$X2dWAa6aX8dWZnVc@sdN"=uC"Jg_KN9
n*PY\rAqg*Y^V+gS6h%''[I0$_9@.$)Dcd?5E%>VYo44?`6a"[jM86Bhfl7&>R8eLCiu<YL-i6P(.F6#
&5%WR6m)<_H=o/OaAr''W''8UHC[g7LZf0O2FaGB@PSfEB!VeQZ''Z\8Ws)sbT*?>/DIW6VRIl2TBR"4
KnN[V_J*#^Gje[6If74ZF<hl(5Y[B>==YknH/Xe+Fldj;b1`Hl02B''tZ6F.QS(,T642MfUqLY*UWLr2
dslG4j]ID+GI]''jcbgu^"Lm/L#I@IpI+1b1T2,au,SVU2D;R.Y,f?S\''%BXV)R9BIuk+\n@3ic;s*]
/oE;^!k]hdbNX-aQZJG_ifkpP''MtJ]OW8-P!9\6"^;RTF.h3s_<codVl(]e*m_4V`q=-!)D>I#^NcIG
*5=_UP.?LEk:VKl?np*FD?Q`&*A7m3F6R/Yq/^2_4&oGRD)o?qjn+BYL08mY2Ct7"UR=TXO7pEbI=@R+
''?A;23EgI!\EH`i^L''5\`10"QJfV#=bVYc:B_J3h@3>sl?ii%$LC4J"k2l$ScJG&0n''A@O,PUH/MI
1Br0kagt&!uWQ0SA:K+;fb7B4`8B1Vcb=h_4&q*''8T.Ma=6WK@sWBU7%QTS5=$Tqh78#PJCjTDl";\j
BufGZY0iBGqLq/''?5k7pM]Nbj"A?k--*J7(S`u''Nkik/k$]%f(PMZS4dIlWfq5uhY$rY0)9!1%K,J;
6-Q7sOpPX>KEtooBU_r($FRhmWbS&4lo!35LW5l3R@UrY_$@1Ht4Mq&$5(/iW&`G0.-Ld?"U)qLGMNN;
_;TU-,M$\lJfDU''%3:G0"^Rt3,Ik5M9N&7bXF7P9NNUcJ0?N6g5ES([@O"8""S>U;[Mm;O/!ABQLoC!
bb5<9ehZVa)PEg>YOjL`eu@t2X-NCZPDLBdV\qL="eY`$2G\&E:D<uUAi0%JOCY<I$=Wj:VdH!0AD8b&
LkK"M2rac"mPm)dDqrds_d0VNeW2*!kj7eZ\^k:`D;s"XHHaZrYjUYiZOGBC4L\omTKHNV#$^O`#Z5''
=02iqTdaUEu)@7>2!<&+%Kmqu=en3F([&IsWB)^3Vdpo''GW!e%Ygq#7nFrmC[Y@m<2.GcV7+u2Dk>.Q
[Algqmo2d<Dh_Aq>55S4p*mTH,,c4QL]M1eC2ll^T5&]XnCg0f:.9$g3D`VqRR''B2.rscT<(YrJ`l4X
IPs*6D0BQ9[QOQj=^HaJ~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth3Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 4;
			add: #Height -> 2;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 22;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 251 255 31 8 24 128 240 63 3 3 3 152 197 0 198 0 191 88 11 245]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth3Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 24;
			add: #Height -> 24;
			add: #BitsPerComponent -> 4;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 7
				bytes: #[0 0 0 136 136 136 204 204 204 119 119 119 255 255 255 0 255 255 255 255 0 0 0 255]);
			add: #Length -> 147;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 77 144 219 13 195 32 12 69 145 161 124 135 13 92 43 158 160 85 6 0 6 32 150 58 65 164 174 208 245 107 30 33 57 95 232 220 43 11 155 232 2 205 4 80 20 102 18 249 0 218 169 1 205 111 240 0 44 246 242 136 223 142 122 1 223 223 234 217 225 75 57 182 230 163 203 239 116 108 205 175 53 232 253 18 163 59 61 230 26 244 126 201 26 164 62 7 87 13 210 240 164 129 29 125 170 65 235 72 209 191 196 232 235 76 230 103 8 198 97 243 117 151 176 128 111 158 89 100 95 140 204 29 247 69 253 109 247 219 73 232 15 231 106 44 227]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth3Mapped2 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 4;
			add: #ColorSpace -> (PtIndexed base: #DeviceRGB number: 4 bytes: #[0 0 0 128 0 0 255 255 255 0 0 191 0 128 0]);
			add: #Length -> 36;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 83 82 130 2 5 6 16 2 210 112 108 108 132 157 134 97 65 33 236 52 12 187 56 97 167 161 24 98 31 0 61 54 17 3]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth3Mapped3 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 26;
			add: #Height -> 26;
			add: #BitsPerComponent -> 4;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 5
				bytes: #[0 0 0 204 204 204 119 119 119 255 255 255 0 0 255 255 102 51]);
			add: #Length -> 107;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 117 144 201 13 128 48 12 4 87 24 23 64 7 17 21 88 74 3 60 40 32 159 244 223 10 14 57 236 112 204 111 180 242 9 56 40 26 129 54 227 41 163 162 200 122 86 142 87 210 251 201 45 32 157 128 38 115 226 101 74 162 0 38 144 72 93 68 69 23 110 13 20 78 84 133 83 202 156 97 137 210 107 180 122 108 80 38 209 199 208 233 132 191 31 44 187 17 252 15 113 1 181 111 30 150]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth4Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 4;
			add: #Height -> 4;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 36;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 29 138 49 13 0 0 12 131 48 89 147 53 201 154 65 248 208 193 20 170 149 98 33 26 9 6 248 131 239 0 189 142 23 233]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth4Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 4;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 10
				bytes: #[0 0 0 132 132 132 255 255 189 255 255 132 107 107 82 255 255 255 181 181 132 156 156 107 173 173 123 66 66 66 206 206 148]);
			add: #Length -> 69;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 11 13 13 13 96 8 5 3 86 32 68 162 103 2 1 144 17 217 105 108 217 0 164 39 48 48 48 176 3 233 73 92 171 184 220 145 233 5 12 171 192 244 170 85 56 105 7 81 32 157 150 150 198 24 10 178 141 129 65 52 20 14 0 39 245 41 217]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth4Mapped2 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 4;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 13
				bytes: #[0 204 0 255 255 255 255 199 0 102 51 255 153 51 51 159 32 223 255 0 0 128 255 0 255 128 0 170 170 170 255 255 0 0 171 171 255 87 0 51 51 255]);
			add: #Length -> 99;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 19 20 132 1 201 153 51 39 130 232 233 229 171 86 130 184 12 229 171 148 128 2 19 64 180 166 160 228 110 6 246 69 74 29 19 37 119 111 96 95 164 1 162 119 111 208 232 0 210 119 239 94 206 57 115 6 72 95 54 117 203 1 210 151 141 77 221 210 114 38 10 78 54 14 117 73 203 4 154 3 164 221 64 6 79 13 117 241 68 182 7 2 0 67 234 40 127]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth5Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 17
				bytes: #[189 0 0 189 189 0 255 255 255 156 156 255 0 0 165 66 0 0 0 0 255 0 255 0 255 0 0 123 123 0 132 132 255 0 132 0 132 0 0 255 132 132 255 255 0 123 0 0 165 255 165 0 0 99]);
			add: #Length -> 92;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 141 207 193 18 128 32 8 4 80 164 68 36 212 248 255 159 141 73 205 142 238 129 153 183 167 5 113 39 217 179 68 116 167 116 169 78 30 226 5 0 232 32 121 160 148 81 56 10 179 248 133 216 237 196 42 66 203 88 107 16 210 215 104 220 125 118 78 211 52 54 118 6 178 111 144 114 8 205 126 123 99 206 182 245 24 62 61 108 4 121]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth6Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 8;
			add: #Height -> 8;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 86;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 29 142 219 21 0 0 8 65 239 146 150 180 164 200 143 78 30 149 20 78 148 48 182 99 197 108 33 71 138 168 18 28 20 152 101 166 106 204 59 200 102 161 178 100 209 116 23 70 134 213 172 177 69 172 111 238 154 88 241 166 130 94 104 168 44 224 255 224 175 242 55 248 70 62 207 187 121 141 159 14 152 118 95 161]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth6Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 34
				bytes: #[117 116 77 255 255 255 210 210 131 237 236 147 237 237 237 216 216 134 100 99 62 167 167 114 224 224 224 126 125 89 97 96 61 173 172 123 134 133 83 243 242 170 103 102 64 138 137 85 161 160 103 252 252 252 142 141 87 223 222 139 230 230 230 177 176 128 92 91 57 106 105 66 244 244 244 110 109 68 155 154 96 230 229 143 150 150 93 241 240 153 95 94 59 146 145 90 221 221 153 218 218 218 205 204 127]);
			add: #Length -> 87;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 133 207 73 10 128 48 16 68 81 203 1 149 24 53 206 243 116 255 67 218 65 176 178 203 131 94 252 134 38 4 240 234 45 39 101 180 254 23 234 250 40 75 58 117 79 115 160 198 78 1 176 152 136 102 96 155 86 26 129 51 110 169 4 154 46 33 233 42 11 73 186 184 31 58 228 205 193 225 255 220 11 139 222 9 244]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth6Mapped2 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 8;
			add: #Height -> 8;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 44
				bytes: #[208 153 40 255 255 255 248 190 32 173 138 41 243 168 0 249 237 144 169 133 33 187 154 90 112 97 67 241 171 24 175 126 12 153 106 0 213 158 43 140 131 116 217 179 55 254 251 224 177 138 23 175 131 0 246 201 46 230 204 150 185 147 38 196 158 53 255 200 43 208 147 30 220 213 198 246 182 21 215 171 68 218 188 53 248 210 65 249 203 49 250 207 54 112 95 63 243 175 7 122 120 119 181 181 181 247 230 172 120 109 88 172 126 19 244 232 173 223 190 54 120 104 71 174 141 39 252 229 82 226 160 0 154 119 32]);
			add: #Length -> 64;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 21 197 69 18 128 48 0 0 49 22 247 226 238 110 255 127 31 211 92 2 164 103 131 116 108 109 32 215 170 252 2 235 142 194 120 53 241 11 97 36 250 142 226 12 253 83 187 148 175 58 117 153 13 222 55 206 11 63 113 56 3 242]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth7Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 68
				bytes: (ByteArray fromASCII85String: '!!!#bmEj8/\\c;9nF?POosD<Df!i9Bb0.-Qkl8`GZF.3nj5p<H[as3is4H#?r;F4diM>GlV"ODg^r"[
9^t-`S[JBXQj6$Buho)b+f(8OckNAi!huDB__#=2Cq>%PVgn;s=\+f[OeC0iYp=\$Os8)Q$f@p8mn''f
\8s7,^\bgHIHh4X9-Z,Y&ga3=SHl2T8_RG[$(s8Te4s8VTYe_AlrfA$>Vf"TS`s2;q.a3FY:fUTh"s0T
;eb0%''Vm&dS$f&5QfhrF_~>'));
			add: #Length -> 140;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 133 206 199 22 193 80 20 133 225 141 40 33 72 4 247 42 81 18 209 78 116 209 187 188 255 51 137 147 137 129 197 63 251 214 218 131 237 251 255 194 103 111 11 33 28 215 4 17 105 145 215 237 65 114 11 82 229 49 178 222 169 161 5 146 65 130 237 132 36 64 9 10 101 182 107 134 99 82 86 86 191 194 110 76 139 80 229 211 26 142 83 236 205 125 15 13 216 29 188 52 123 212 52 38 232 97 225 157 174 236 88 169 123 94 102 32 103 151 60 219 136 219 213 91 22 243 220 163 142 47 127 127 247 2 129 32 32 253]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth7Mapped2 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 111
				bytes: (ByteArray fromASCII85String: 'iSibV&eas5p\g&0Erc=<,9up.cY`aao()?c!<K7%X22Wgqr[%R]Y)\@df07Fkih6W!s?$A\)ZN/rCp#
^q>''t:-i;??qeBmEYct_?!VH$V5<hB7Xf_Oc52$APn*f_r#RJr0e@rZ2rdB4P!<N1kT&o(qqtp9j:J]
.7!JlPfp@e4WM2AF>YM7gdg^4Co!<I-?!G_]:WiE(`Pa&u!_!LFSgC"C$!<N"sX5F!ZqS0eAV5<Ps);>
/mrVc]lS"$(DTXM;;q"XX$!<N,%YHb@;a2c6loCK9h!N`B(mdBMB!<N.''>Q&qs]tM*#*Zi]3"JVWbs8
W+W!<N&nqM#"Oa8l>>e''l28!WB4*p%A"8hr"?IC\b''5EWH3DY-.NEcLi;&nF5q2PER:=-"?rV^V@OV
!<N%BH251gk2tgY!<LXM!W;ln~>'));
			add: #Length -> 199;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 99 98 98 82 210 147 245 150 245 246 246 214 139 101 2 3 101 166 24 5 5 243 156 140 216 68 125 38 166 92 85 107 251 60 45 87 41 67 95 91 166 88 19 125 166 60 86 177 100 59 70 11 193 168 76 109 38 166 88 111 117 47 121 3 3 11 197 160 8 169 80 39 109 109 211 96 190 112 150 4 35 118 99 78 203 116 75 159 156 88 143 84 94 160 121 25 76 49 49 49 89 108 10 10 10 62 124 206 96 62 16 72 36 49 233 40 72 75 235 193 248 241 241 76 76 58 76 76 222 32 190 3 144 136 147 3 187 5 194 207 207 231 241 179 17 201 182 18 135 243 85 34 163 221 28 117 253 161 252 72 102 201 124 32 96 114 112 128 240 53 213 248 193 32 36 4 194 231 231 135 241 185 128 252 0 153 52 40 8 148 17 2 0 207 58 45 182]
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth8Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 369;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhO1$5nudb#XSi-)$:Gf1<(F:AIQJh5H\72J4oH.#nuB_;iWlVM%qg92HaUZ74&m`QpEcIV3se&.A`E
K;[O3m^aC"*Gem\RFN6J5F4Qalgu_YH]Z!T_FMf&&k??KM``90``@F&p#9A'')B/=Sl^_`VjoYHP>Rl7
qLb"FBMn]4''.gi:M32dC@E72K9>6O"!IdA%.0fZTl[\;,4X>''#\ZltVm!fZB.s\:a0bCRa)2b*KKGL
"G<N$SLr!),3*,>iml`3K,cFQt+?P<jS=89P--!),+[He""EWVDQ7@4>I!J35C:tlEGoToVmn"BW%sjg
ZVA8HJ+4JoVdO.kYAUufo<.VWJb&,Zl<baJId*,@0LeQ;]Y1#:0D.o;4Cb>Z5,<s;%7;;SSD02)HEb7''
s$g><)A,LHrGn6i]ec[E5Wh\/=?3"_?rs6$cNB=r55:`-N6J364n]E5QK^9"0lfoO8~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth8Mapped [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 235
				bytes: (ByteArray fromASCII85String: 's7?NmrW''i-!$Vs_s7cXR''GL#o!;b7HqXjjaoE+s^!<)Hgp$_t\rWiN*#o*FTs5F1]ird1V!;Kh"qV
_FtT*kPj#Q=T$f=V+`q>p1Y&F!X(p"TQEnHAm^!<2Nhj$*PBo)S\W!;Ok?cm\tpS-/.N!<,k#oA0ig$3
B$;!8LEOg<C&t=TJ<N!!EN8R;2g%o)Sa[!i:>G*#\hJQiQa.!9RGd!!NZ*rX-uT!oCHnJ7/u_joG8<!;
kaUs0Vjfi",f_!<(IKrq$2]BE8#(!;D]Xcr:#=h#RK;$M`!KrosLXnGrUR!2Oc<]3bPV6iafJ!7oU7$N
L:FY7^].!#c"N1(ObdDZJHR"M6Plk=>UKmf<#`!:\eLi]$r7?3&oC!;HBkq"k''gp]0\J!;TUpau]Xm<
<2sk!)FdBr9XLah@''>]$MD17qFC\M9aBi[!;>XWs4da;J-4(a!7F(3rODq.dKKRC!"''8;q>1/IJ,h,
/!J`67CaBVip]/!i(A7>#qsOO;6NL^p!7bZ]r8[hZ"9@u\!<)j"WG)A,=TGcd!73\*%fd"J$32Xb!;lT
mrV-B^<WK%h!UJSEmG@pBmK!,s"98?-jZ`k''9G?td"O^Zbp$;Y\!!N5]!;uj#rVm$#r<2n*!<;$Ys4.
8Mq#LHh!7\U\q3D$SR/m9\!WMEes6Tgcm/d.S!;c6dkfjV2l2peG!;t^ZcohW`5QK!E$N&udmm@-T9aB
of$:#m;s3q4U495BV!<;fos7ZQX5lg_I!;f:jPYD/Vd/Z9m!;u?es6]m4\,cI,&^W`RrpKi]2$!U;!<5
dus4@DNqZ6]m!<;ipqj%6S]E%BR#Og%Nr(I.foDnj[!80UBk;WM?nc6Zk!;l?fmV2q4!<E)s$2=H,Sp1
70/-*8I"TI*V~>'));
			add: #Length -> 267;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhN/u!WW.pURM_TDUfL&KH1>C]l>;XA''X6<W<qAf$alX.^6RVeI+B+1W\KnG?^I-hT)t%[(_u<l0L]
,?K$?B4SWC9C<S@k6ASa+rMEQ5()S)J>ISo;DgHJB\U9Hn''/`28/M(bQa&!F\^F])%ZjBQmp;_5MGIE
FAqjZ!`OOTPcjKQA#pM]T,OX,P,LJ888?hQe6/ZHK[O5;en$+Bi".7,]:4>oXFAW2s=G]O9_g_rF3Uj#
2!(^a3F<Ah),Qf>IfuZOnh>afVEf-H-UsJJZ0Fbg6U(91N\_B5#\WC3gsqL_N3nDoRb\E9X!p7[1("]1
Jnmg"6tnSA@/MKQ`s~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth8Mapped2 [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceRGB
				number: 248
				bytes: (ByteArray fromASCII85String: 'P`)];RAmEiZ`g@8]!oZ2eB(unNG`<jIsdKLQ*d0JYc"/!URns1]XutQ^uXMDL4GnVLS^8rXIto^W1UB
3^:DG-]A)#V>#B_?n,<1]ra8f^G&!P%H_lLKSrSZ''WM?W,ZFRKN]"u"lbfIBVilC?Jjn86@C0dNK?_2
FXRYZEdLOc%YN1lSuXI#''KT9ld]TX(l(ZamBQ_7dM"_6q4r\(9*?eBu&0rV_7nR"''1NLOGt[MPHi2Y
e%3O]!]#a]tD7r]>;,/hVGqM;1SWErGcP5E+G8PA=.LSTRV6WIW_?HLo$]4YGe,%`4rk"]Y;>"\:8[pI
W_B5F/=\ETUM%BT9ln$]>2:u][bHGA6a_"?]\o)Q2^a^H#B''nC8-6''Srnf,UReEt[^Z88s*/LOGA`s
pCS?Q9U54AqR$+P<OKPXZZEpU@ZDtIJ[COT+]@GBHkN9eQn&f-CLk9iCJ9mfJM5l\rVN?Y6R?O\>O0>m
j\@oA\AQbQ''s8Q_:QYBfiDe,AiGb9M1U5=>sO,''j#N2;l%ZCm\mURAB_SZJoiYft/*n*eJOG,''V6T
SS,rPDZ9*OKkRLZ)j_-Jp*o?H(g=YWLT9QXf/G1XLY^?\Al@te^2Cph8WPnG%4^6C1*6>?C#SDRX9"DG
]''4!D53;PWLT3RXeiA<\@H$JPAb!)I<1d''ELVW-T7V?_Mh.aaM4KfiVlcf&[]d-ecF_ZV`nAtYi8;L
pB:=EuU4e&cK7'';LJ>e?XVM^,''P)??3R&I0dZ*g^F`k]C:c+`f=p4%7NMh.gkMQ;qtXdkQYSsHCRTW
Q>T\]Mk$aMb]+@?l.YTR1aNKRKJPKVYK<Y-4b0^:Cnu`Oa+,^Y%5j>Z$DuAYPKMW2?,klKZK&>`ET2P&
k?-EbD"nF.@PrU5XZ''NJ"-hMk6N,XLGLE^q726g!f$C_<U:.DISiYEM.`&S;;ibN.S&~>'));
			add: #Length -> 267;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhN/u!WW/A:;7mZMiKSr,Mo%hnO>P53bipH%)sI3O.ZZf2;`u.L%kXM:RtA32tD''a3#*dEL[32=$ZA
=O7!4S;F'':E**R(POg&gah%cm5TaULN.R),$6dG&Y!\[rY^h;%H=OgIha!H''ZB;UQ?166_r54$;3UX
5fP<5@ps:\-!jEVfsY$/ddOlXFA3/[uFqj@-Ou`c@+#&QK&\>'':ZsH#A<bGCP]nA077T$MOH-YUuuDb
^6?DG4c+K3H,I%5?7E''lel/!h&69i''&-rE5)h9?q8uV#SL9m%P9C4)o)m6>qV1e&@WDtG"GRn/4D-R
nsUP%)gVWLBc).jd(m<e''~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth8MappedGray [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 140;
			add: #Height -> 133;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> (PtIndexed
				base: #DeviceGray
				number: 254
				bytes: (ByteArray fromASCII85String: '%M]s.0e,.I7SQik>A8&#IYEuER\?[`]sbl&db3RHkOn`Y!=oqd,V(l15Y"RL>\[bgG^kI4NLQZAYd_T
cbgY;)kk=KD!Y>YS*[N?n5rqP4<aB6VCO(GcNguB0Wj0(Kc,S8fip#t3pB(a>&K`>O1cn8q:fgt7F)6/
RLl[jtSZB'',^rP!NguI\iq#:I)&g/&>/i>a`6W$rmAo2m:Jr,SUSuecp]"uJ6h:CZQo(`Ft'',i8B0/
bs];G1/#B5VjEI#=&RT;Jut]>D\:hUglUoD/Xu''H8JF0K20a9NkA''BQ&''BMhI7]TVns*[DU/7f]M)
Yo_Sj~>'));
			add: #Length -> 5902;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhTQ14`Jm4rsr6@/:h;Mb7[Ao"W#Q>/hD`.HDEWh/qtur]/[%Yd9u0I3!P^%VC[cD",l+T!\A4+jMep
oriSTq$RU''i()Ib8lX8oh7JGU;qgB_;:?&`.ri=-u095sU^9=0tMbqs_Qau.''>?/3=T=\Fni/\i_5&
GH0jqi\#L8$A6&DD-7lAU$.f=Vq>q?"\leM/]n?I$)u!m\>Kr9ZPQ!!f?XDQp_fHgoq/$#FJ\f(''n98
'',8qs%Ok''+6U8])?''W/BX-o(`YcJk.$QKacqgEiigFQWLYid1Sh<q^-n*g`s-p&oTSsG7.NfSOZ=l
Lf\B0NIf7?/f>qGh''2Z0[OgOrA8>fUhif1)/h"%3VPWQc`=".<8MFt]C?3lCbI*PochJ3mK*hCm/Ke*
I%7<cUX6!`0;*''SD7#ZMF>Ne&?sYT"JQl]H@-]%L6Ee*p;>?;jsSS\lc,uh=(Vs5lSGF0hNjXiDZF*R
?d\3YKp5heTQ\;N5qM]+MhHaNa+/CN^_QT9]:$R<q;$\3\t?TT3/VJ5K!jHX%WPUh^kTbMqNRu1";7C6
q?+%N_^+:Z3Q#1e90<o:JXn*E[PpIbqCo''?]m\PAF[5U>^02g2L$P''dnRIuN$suYKBF$dgQf^8EaIc
nQ&Q?_9Lkf](qPqLnk+8:h:.,Z)X*rN,,5SMbB6V:AcT8!*`$l''6Xd8E=._<Yjg=0MW]ASo<"Y8n$F;
,uN^ZsGc_;-eBjH<$MP2QI=jUmQ*<tPs&e9-$A)R#]Mj`%A1R`X-@O$8r$h.dEKVDmW\?.gdcBZ-A[@!
K[?b?:#a*!;<$iWVE''6AK)E,e9%p>ZK+$6sI1?$#L@0E@J-,f>=nd[=?Rm;*UTbW4/@^P\<JksO]WHL
4C)SD%BCojP707ihkR?=+D]?gmo_[^V:!Nj'';$Ee+K8;!80*#nu^_Z+M@AQd"Y0R9hG)39&7KXFj?:T
5@$M!S''///gtu3`b3L/Q6C:f?n<o5''tflcOVba1q^<,:W26\E&+-*Kb1XBB<TsA$M]sKf5#s;\[rV[
G"WS&H%)F,5c+C,o]0BXKKZQ"%o"rYBDfr!aV1HIOs-uE*ip*C$RD\U%G,kuF+cfjs0hOsjY4$CEl[_@
([h#C,*eT!42G/NdfU^$krHQQe\tZ&@$VUSdMd0[nHbkkpD4lL=!.Og,*LR8i&ti4,JG*+<A(_eSRgC=
/IU"`][(q)td?`1X+hBHYRG[_-=Bo9rH]lj11\c.LRqV9D.O5CS"oH-Q:Di("O9C"]pY*L-%_<rHE?F)
V*U?baQ+%m,"9CCR,o>`!r#*L\7QU46GkKlgn.T;[\a87`@o-''YHfjSQ&ge@r-+tBO"ipbp!]mH]@UX
#)N2Yl)el8Q<HXSHCN<Or0rL=u#/[UoD@#6a`-B:Bm8''N_4g#*9&0GX0SOr7hK5)+[''/$:\]13B6HV
XFbJH1*\DEWI5.\&)oI"<PmR/<J#>URnB0?+r9*9FLV@L,TL(s1WkarV!WOrYB%nf$#f[-$#77m-5&)[
E#q<D''kiG_GGD\HbuMJ"h>aS;Wt[U0R;M^Q68K,9jVn3d5i&jgN?t`cO%EQFV$+:0aeJn@#"Tb%N=>A
3_PjC9?$fg2X?3\6P#L?0kL''O=Obta$P85j1gbs1^WO=lTA2p]*^`G*nBRHI//?\!J69ro^]I3I;Dp/
fpR1X2">ocY;S"kL`gJ!X%A60ecu]eQ-/DuH&/=WR,WG,f*@.<.9/X+8Nr&hFi0b8k$-7XsrubDdXNjY
))r\,epZf^,J@=r39phb5`XSdQT:epZ]7oi1iuhI^j99KJ"0i]R3e,Y4ql]jY`Y\q0d2QpSR0s5GIA*7
g.b^@sD"kcY-r$)Q((-HB20=7&1CXdBBM@3\S/9]+)K>)g?IX!#N)d^X7QRL`&5k":H=IhpbP@e1D-.I
iP5])0bnUr3,R-iG=W,7n_3@u#m:MQTSL>/f!X+<dnhHUg6`''mopI91@/4p3iUc"HkJcO)LjJ''*.#D
tjPT`MGGMq?H5#f!:g*<&/e/;"A2:C9bjM%#L^*"k+DIt5@Y[(Y,WlG(ZE?uQBa,$7,!l!(J<dGms)(*
 %ZPN\IllOP+\PkWrNdPJY1H^9!"+JK@IF7p#&!&sBdK)d&/p`Cp7>a4s]2Bg=LJ.j9*TQ4n-%&!VtX7J
+e4.r6S.^g>r9f924i+G^+8j=nKn2Sr_4#W9Aj@iCg^(86kL0<fuCP[4jG66T_3qnr\,!Sq5b%p39e]H
[sm8h-T]67oVO[>.EY9qEIC#PGn`GMnJc@U\/qNN?,aJ#r],LG2HqM.3_E+of2K/;/V[/m]Vc/buGS,n
''dH;dEuKeWF@qp$>t=)T%F/?ZC4ER^e[ICkV5;nVBol??i4OnQ&a"VX$H''pt7p)k*]"CP_''$HR2?]
Mr=2W!Yg%]@VdRj@6^[TDH*R_rU!Oqi`YCip9$rb;jVbdJ-mo0-=oh9*(aKsqrT6)7+WD;TH6''"/8ug
2l=C?TG^M`d''(eg<p&ug"iJ7DhMM&:t"HBhHbDoB]u^+h<*0G-<"-mJm5a."79Y5PoJBM^b`?N<MK;U
*l]5NB/*2SZu!M`4+H$+5ET_<dko#q$Jk_-%spl2f%>4=h[sfp/VR<rJG5a*_^ulX2F0qUP/(\C6dC!$
mY?G\.,C1IqO>D[''X2&3Pjcf$n,H(ON02@l+iSOfbX5V\n?A<]7_h/]s))V`K6hUMFUu*,5MM&iRRZ>
d09-kVA^J;I9*uM^N*T2fHt=)p^Af&d5LKN?OXm8Z6c4_!E\$!(-?#2MA<''Q*e88[e/Sm*#tHEE-.jj
]1UR5A^jLe$ha/$kpc%@mEehDr`/Ns"M\&g1epYbeT@:r)=K\@Z7Q"`;uct/C[H:ZPG]@D(_5"/6P1p`
V@;s0*RmCR.q^N#2;=V;Luh*:N*jabEm<mE1#ufIWj*m/@%iHb<EK3bBE2KHY5,K*mD?1*G_qNd.h*8G
IG5;@Ia@6"D!VkK2lb[k]BDE,k$#;L;]kBp*i-_-#i%,j_AW"2jXS0f#>"_p:Z-@_[Uiru&q3>/UDq8Z
a)":oWZSG)5frVfePhftT2%#''3l_nFpk_)O9lCI2>iTS5.)C7sNeWK=nV%,Y$I(N;lKfWtVe.4$T5JK
@Z5=$,\j=I92mG4@\9@=Q#>,\bd7''@AajsEnBT2@ZXK$0m#BP<[XPn!P;<o7M6j1i=QHef_Ps5b^e?R
bBF^pq<%KsJ)c],=$Jm,i"Qbj;$7*tTg2q#=''4b,%&.5<=<Me,"1fNS7jJuO8(F?QnRh<`T<5^l#?CU
^P+7@Mn2T''CQ\2gmKi@52''973E*#bP=f=Z$Q/5qViq`%aDu^i&J2A-_Jl''J<4N.8rlbhV[UcUjFuj
<?sR+D)6Qf%.VL"dUgpn&Lk%$#*@ar\V,Cf`m.8nSnFG8->h)L[g9a@ESG?7k,;XMhMSZuu,QgXndF)E
K(CPQ;`mZ^RAi)C&:-lr9Q4/k/X+rL1?S@F<Iqk%I#/p''KJZNN+G4J@6=9rQt/1>\lCt`[tiX2\4TH^
DW?-WVqCONGt?40T4-`^2Z.YOaZ4X$%"-3^0/n]]B_&h0&SV]8-PFQ3$T3"uH]*A"*IZ!@<%''WL&-._
qK(`"K:ufk\G*h,_o^E/''C=!]h+N_$3)fkYeiIAEAB#pXQG(L0(]3$/VL.NbUb&9#Hmh!7(dD1gP7hI
Jg5[%X"KRkN-*X$Bb>3H^MCpqN!g?Jt3kgH+Cbe$[HA!n''>X?.VEs<nobfW"G-Hrj:D\l[DEe.5I0W#
K2]5T#fr7G8=?)%]/JA8rEL#Be4qQ.lX5!2pP*rkbluBrnX2f<il,c:Samt]Y`oXXY),/]k08W''P/\8
k$s>32GIAL:p@J=\k[D)<HX''9rQ]`1-Q4gaQ$R[C!q,FGn<Wt&MF&I\QC''K=?>39tgTBJ_53b!arl,
QgmBp)oefHh=g[t,W6[,EM2])r7U/6''-j[0Hh:k)t6`"GYeeK2H?J3!#L(XDPAW(_+l;U8HWS-o&%r0
s''d11GD,>''r.K4Y&N=D?i9a?C$<dJ=P_X3UWol1=HJEjO?(Ebn121E_KRn+LdR<5rZeqpdAJQB]Es&
7d"_15h"j#Q!i2''7Ugn=E?5qWJ@/io8H`%s_E8O+&N/4ZjmfBtlq@K<E&.b[7J?BX7\_2Z?bB&d/UT)
''=''U-#p_J*ZC0sO^+MoBHVji):Ybg\+&72Lm_//,<sY[oK=qN''O50%,]X)bW6;=Kk9JmF.0`5_OX:
qHsVR,s:Y9!k(ltM,V8\Gjh4+e81E_^l>1$`SV6$(\/-J:c,?%V8;;>ZpBh<L=D2k9Pj>QcT0>YN>GJX
[973UHH3<!@_#W1b%hU#^>''ua6P24lK\R?W&D\P=J0Y/0U&4;"/:9rqRI48k6Sd5%T>CAu;=q;O16T,
hDfB''VYA]=TfLIbdoT(U)-L=j.`A@kM_^O+Vg6W/OAGDhUs54>#5]l*G6jHu/lD[c\?^5n%YefN^jT7
aB;+-pS\leIQ$B8_lVeXmf37]K/8%a;Z$aHK2)/#8`Vh]''d2S_R1BG@dU9l8&t`e>]VK!DD=Q`tZiC$
\R0Wt.._L)>d/^$51Vh^@F90P:b`D0=IEL6,%Crk(5n1nqZ,b/07RM7:B+"GQGY/*_3$SIid"-nOc#qd
]_ea1a7#rhT,pX\/qCfZX$(;/uoeXj+7"!MrH;N6k''<r&5]<MIp+uGu6P^_QoELmFnabg`mUXN[itjC
KpZh>;hLj<*:=V!&[K":.DPnp;T"q#aXSM+RaUnN3nYO6H65GLkNHDCtuk:GcPT<k+MA0[+F%gjZT`OL
6Sa?ic8Wl8N+M9)#sqSF_9lIqZ;qupH2n*jV"3qfYEnCGAi\MlA''''1JVU)M\$<n!d\%%I"Q&S?KGLN
V]*6EPa.:?r%qel>n;2DX[q^''b9(''IKDjjXA59]!GfA4OD)UASsJQS0#MQh1]7Eha^9RK3h!>;T>md
.)u(N@mgYE*GGQW)L2heU2?Yu^hBktHI,$WaVNBh!>''*+nW<1-QHpp76_:T2%N:r/ML6Paq:0c@AJ.=
''+_^=1;W>\uk4+EI9`9EOpgFjQ%hb<M4Di.VK?B2Qg<[>.Jd_;7uB.G;__Zns>3[HYn,a84r7IBU=lp
dcl-"YP\!5Ia*f#>ZkNF<JN''P\N+)#Y$1_B7pG2pTscL2MV!YqmR="8>jP^0&gOJ.R1]H1m<%(:.#!H
6\K<k*SRaIer2eB3r3a2)4k>(,j62UnU%2`"/8df"X;6nYUP?t^''l#/q\7Ha57kSFQ<Le@YO8p0>X;''
Ps0]!RJ`%''TB9C_2]loRPP,)o>''Ol#oYC8o^14"CX[?m@F+0Wp35G,D8A&tn;q@@8M!g.;Eg8u1SG\
5-T&W;FL"YC,=CZ_Xhs.(fbu''U90@S*3Ru''9]uLRMocSmBNi#!]U``:Ofj"KOEnl,g?\*$J1?*\_"H
c)j]<SX)''jfYBFF0T_#uoRMc$D9@HTgldhF>p6srJ833+DMU\8JG[4FRZb9j!$s-`:S6R.q7K/enV@M
PM.CplXi5%k_T4A+#P\dJ%gQn/7k#F9]W_oM1As6jMQAqUP7NYhdggPPo95#c96uLo''K-!"][i$aj3M
>$dF/$RaaUJG`OX_Ot+I;)C[21C.W(36g1cl/_ps#A3.aLs4Un*RHf^J*GVEn;m\QK`b#TNEZFAFqYp8
R<Rc1@KoKVnHQSDDHJoLr2?A24i,-*O_tf^-/uhQWsC==+\3CZ-JIa.mdiD>>(AF=R)+GN-[j`u^3$Rr
/PMlQp<4#toL8ePs-keX/EVD]sbrgOtCV1@;gE5V0`=1#]s`HXBe*hQVrD)0+/)s,o"\(jrfk&(N50&J
bmi?^&<X\Ij4fk,IH2T60\h-nNq9U.[.aqsB''@@!FJIpu#E''@UEP;/B6ktCo/5:-A+b:+uZI8rX1(2
ENu`DpUUa5l0QEcF;->MX08,i3,BMobIau0?PL,q!XiH5K^;.SQ.@^$?A6dHZ-^J7%I@"@-6sC3&?5<\
^REgAU1;B#T)EhRZSafnHP,R4R:RQMSi''!]$F/f-o7DU_''>S)NllBd^3b-*n*VXr5M55m^bN\";;[t
.@kb0MEncVo?U]"iG4dRm=9HhSQ(KV%*?s''-gV657FRP;0_/0/7d)YWO\IZWd0Y_XS*pi!0O&g*Io1R
@g0:bJfKQ<cL1((W`:XcO`9Y!19`G2+m/5$bdVK?@\eEA0Tih#TD37g^UOD!tK+3)8QOiBCl6mK%`>d/
JCppEt)E:0cIl:ENdW]Smgd;`^Qn@Ab=JI?f[YV")d=H-_aDLrJL_/B.<q02Z3hT6OXYqg6>eg!c(h4R
B_"0DuS(Y#aF#5LIbQF=&duC>/VkQ3eNeXh$r8L$]ZaURbC@.V*dd.+)5FY5?<L+0DD\e-P@2>a>\l?i
*A2h7$Vt2P90,$?/u9VGEuL0C.)6a"!R_h"^p]krZ,*4p%>Y5"U9;mh6''W.3kGO".%/<>`c(,3Hb)!\
Ln''e;DF;9p;sIMkHIVAjbmRaHJ^c8P''E,Di^"R)X8T773oTKd_]\1nbjV(ak\f-t''Li"A;.9[_9Dc
/''h,q0&2@!JcXk^aP*%VVDlNdqXF_8d%XYb%HW!A5/e+ih#JW(8drS%]bfP_5Rn*9R78ajFW%8J1tl7
I8BojtGPO''Kur7=7:Up<KK-N!93nF3Sj&NM=T[&OTEl?SBt0k-XEt[@?,]R?TG<Tr$nO%m!+`%X?qZS
,\;V@`5IMCIP=e.#tUM8"QpeKhiR_M_+f0l,(,]78-8b$`"4OCnfI0=FRk(S)"gs%!hXP!jU_(B''YY:
+%.ZE+s%ZDio(YU!bT*fA''6A:>Y:#u''Ko1f$6Of,-@ge*s.?YM$7t\&6B3OH*c:P''q%b>OXI618cW
Tm/e.">''"V)[K-P^r80FS]5Eg<kEiOZHu.8a5\@VC9;KSefBfkN8Qb,G@+bE7>_/D0[iZqGBn5X%.Cd
6o8M(e-SA2,..M3$AdDP9?-M=iT<H;8M)]r!CdMA\''Lu5\c''!U^J!iRB`Bs]Ltb>:;`//A!-J9+[T]
SQ7GH%BJS+I!NF1baX)V#,@)3s_1_Y=($K+8o&*VlI%F91c[Uq"!Y#Wbb-sPn-!cJBJj:gao[Pdcb3Fm
rM<Noc-%+Pj="r2T3>VTu!seQFnPg(fGc^r;pR2unH#''F.YAsJ7C$AC#RTaOBb''W&V[A0]9FR?;0*8
1dE[EI`U[^f0pTaSa+Q^)N[JqFG09:''"7aIGiWc`^g8bJ*_U,_oUGi<;-*!9!7A:1uW[RbS(E,q"b]1
i@2kEOkkB=r\O5jV''Z3''''gB=H(2h''r5WcX&iFPS-Pmcqh/;DNImV%q`5\jNe)(r?nn$0[5^VQ9Z^
CIbP''C6eR''^7gG]^iQ1NT1HBA0u8%XtP.BbCdi,$7Xp@uBn%dsBQ%[1]`9?S<(L<\&>Q(;#paZmi.m
iO,PViOjK/80hN\?M;%GFnel)rr?8Xo<S~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth8Masked [
	^PtImageXObject
		on: ((Valuemap new: 9)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 32;
			add: #Height -> 32;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 1191;
			add: #Filter -> #FlateDecode;
			add: #Mask -> (PtImageXObject
				on: ((Valuemap new: 9)
					add: #Subtype -> #Image;
					add: #Type -> #XObject;
					add: #Width -> 32;
					add: #Height -> 32;
					add: #BitsPerComponent -> 1;
					add: #ImageMask -> true;
					add: #Decode -> #(1 0);
					add: #Length -> 42;
					add: #Filter -> #FlateDecode;
					yourself)
				externalBytes: #[120 218 99 96 0 2 251 255 32 220 80 255 255 255 1 32 126 0 196 31 128 248 7 16 255 1 226 127 64 252 31 25 3 213 82 13 3 0 144 20 79 228]) newReference;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhU-&D+ml0(rq%3psQ*kQtSf[[7rJI'',hElW"G>M5_?=i>aC4R#"(s"ZC0YUSb!d5\hB(\)H_C1(79
Wn91Y_F''/E`=NED+V&l>M@f$XV:JbIsDrk0*b_)bo6AH+bPH$\nl^ZV-M4Qi5Pf^OCUdH[OVl.3mnDJ
j&''ApQ`aO2pL*_Aj''+CL.)F"+%Z;ghZ?Ak]e%W-o''+qm+=j,d\oJeHMfa=7%llld*\V@#mpQMEIET
QpDuG1g:uMnQ2VqhFN)7Cm+V-ucCGJT@Tp3WCClCS^Albt1`?dWTR<4q_5+!8-Vnc\:,*V(rj9%8V/eU
Wfq"?aR@*3&bO(&pN?1&5,*`Z*fe^-b[j<B`ccF1?@e#Y<LrU]:>sq(\<L$Uc`H6]d(lXNJ:.^jN.VDX
XB2_`W77H"]''T@>4d$pZR9hrR\=0L=g13R+.2IeSXLlUoZ](P<b9uaEA*tb6M:@m#4naZ.B+aRZSLKm
"a+7DloE#gsud:`NMb0(1"(GBeB''+U97=K=iAFt>:B(r''3)mb,+t-kcJDeCN2oV7[4PiUqN!<bl>\k
>FLlpdu_Jg:)!&.^dE0j+W3(32^ZLE"j#%Go7RE\m/b.cCnfSY0!Ofe)nnN_S`uS+p64O6ms4SaC;Euc
-;pd&7T?Bh$jmE[XGbJ19rhgl?RLDleG`1T''t;Dn8iX.^WObgCYH(JEB7H=AN^M2HUQ@Pe4K:_kR%pe
Vkp5dU8"Bh[''[-E&oc%uP7mYU7)''=VnF-B0&t.4trD%!l8>I&YH?nC\ZONEhO/MJodaES16ASg%RYg
GGBo%joPKAJe"rrK:>%"m<;,''bZi."I#6ZeZnQDgD=*`3#XpD9o^n&1t^rjAATWel0K\jLS''W/sR&%
fQA)?t)3*j=S$KmbhFrJpk`[##difbhEq%T+_qOI7A=0kYiO&5kHdnROF6\/C?sUfgJTu5<Eb-G^*U^!
[$*BRgC#]W6@lqe''"'']?eElF^:)e`La)VRNK#H[%uZ3qG<m9Vb_["iOV,okghujqP^n!KaT(POT;?"
\PF''7Bgq5lfSCR+3Q4:uLZEejhAT.8M'',9.spqH(G)3l]8,688ZT<F_K>@#Ln`D-B5<l;tD&,ND8X_
(>#p/P1Lc@9nlI=6Noce*''hhS!Sik:^SaGZ6/G#\6N1kG"\_>?h+X5/an=ZPlPG(1UkRRMnYt7]g,D#
jO&l$(+m:$D3O*\MIkX>RImHIZ%cd3@kpm59E>[0.us(]=(JKh9KcCCfT#kLs+6+H-u*-I^`?A>@*<jF
1;Sp-<^/)hI(kd"%mO*m+e-,d^;/Krj&_acf$(sl*url`o4_D#<p3gl8(3Q]liL]p=UG`6mnKWKDrdDS
=@!+iN"j*1G`HUG;oHrHhHiUn:''>M:B3lj0G+A*iMR4jF2>k$htl>YJq4,Y!ueD"#dVg<Si0k9a)UG*
A,J;00kM9D8/GG0KoFtoJV//I_oDd;(P5[M5OhMLP8.!#<l9\CrpRg;=r2d0FoDhhap.e~>')
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtImageXObject class >> depth9Fixed [
	^PtImageXObject
		on: ((Valuemap new: 8)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 32;
			add: #Height -> 32;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 1186;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: (ByteArray fromASCII85String: 'GhU-&D+ml0(ru5Q^m@Lo`''b8JWbnIbRa?R%6]J<,";76dj0DAV1)NX+ONe1mka^Old!]nMe%jsI[_N
#6?:"_LS<2,ZBuF0pQ@K$7=A''%/"kn=,qtFE)"RC<sP5Y"5jQX5Lrgn2&o:0muqXslfLT?VFY?rBd\[
e,>fpN"h4<CED$$/''GY65:C$lBBW9<Y1eUZ63QTu=m3UIRh<P/`a/Z"(g^UIlhYL5m5k9M"B.MsEHHW
;"(.o=fW"RHtH`Zn"&CA*;-EGO2g]''@X70CP,#QnbopDPK@Jp#3FU(8iAi''4)oj:H''6Fnn>E,-WDk
[qamPt#WPh3&6=E*''E,>RR;4266p[5k'']<!_AImumkPt2rd6p+qG\ql0BW[aQ7LZnpN0c1usPEI]%;
U))9cD@E7MMh2nBc-a*JN#fcT:1ABY?\?SjkSoBCt<-C*Za(KA]p9s)bjaL59`L$SbB+B'',)$F6hJI]
 %Y\@952M]hi&Z8<UX]E*SX1.+03mE_-QQqZYTm$pg@;g<EVpT/Uh@RL''>s`5eCN2o\\&>diUqLe7RfF
#4.#N#`g9Tfd,)IR1>.Ig5#GE1NcY''nF[n^uS/8H8SBEd=p+0CujdKq!12kn=3''=jC@>mV3&>=c=,-
06$)JT6qQ<)M+nF3@1[TOe!H_[=,77Y,8bm!1]p?_lF-O9XobY5D+c''qk6o0l^2UTgtX6sW3O7/)Nj''
;9kY>$<C*.S<?,.k<+Na'':;IO^C]P)c;C[rpL8*8Pf(BSQuY6@$k9:pXs?bkK`$8r1::&?]Yhn<ha3#
HUM$]UtoiFUR2''PU9GD8DH''S6;\Sq5''@dZM+fZig-b;t#+P=@2CCiPsW(qU)B;0.8T87@uh&n0m''
":5XIm9=Q%N''JL+KR["(PuO,$AQB]&/>TH"juL$77<a[SL=855SXiY9V`iS,<A3a&Q(HKe+q=M)]g%A
=HLTop>0E@`X+,Q9(h8n-.*Mf[CEF-FuuFSIUcmJMW_n:iS\"''7hC%F\9E&EZQQa3]bi%<_%H:RqX\@
!\E)^^E?Ve6O@<e>I#d6=o%C)q?Wl''OrSdt!2AEmog,2p5%f/_L_nkO%k0I%/F)c1Us/OW=d0BR#YL0
SP:ALoj6g)4p`4irL^h7LBIa9(BU%9''X?T`''\63OT)0^qq:F02SE''d)GhgGuAo0T5I@In^BQd@aMp
&HqcnPQX[T$&-\U''`@4E4>)?A>//TK^Dp9)S"Gb9obSGAY$PB]heqV!3j,Jt=i=lcnN?8ake:7OT.;S
8J9foR/=W_ea''^a@_#YiC:j-a%I-K?*Z[^Z[`92-&l1KEr$L;Zhg]JX/*;(2;n(t^*/,N!MI\IKNQdP
;2DU+5G2t>E:pmIO(Y.GX%rS@>E5''Xj3r$R">"IKGq\G0!]K"59!Y&A`.4i''C9_#Y!I6j-ZZ7o,VgS
`fhAnM,K_O;Kb^A>BSbJ7?N;Xh_b7X5U7,!/C8/rWuu<@OfrDpi+4P]spc%64g<F^B*\4A''+~>')
]

{ #category : #'*PDFtalk-test resources-initialize-release' }
PtImageXObject >> initializePixelByPixelFrom: anImage [
	self at: #Width put: anImage width.
	self at: #Height put: anImage height.
	anImage palette setImagePropertiesOf: self.
	anImage writePixelsByPixelTo: self.
	self filter: #FlateDecode
]

{ #category : #'*PDFtalk-test resources-instance creation' }
PtImageXObject class >> pixelByPixelFrom: anImage [
	| inst |
	inst := self empty.
	inst initializePixelByPixelFrom: anImage.
	^inst
]

"
Tests for the PDF ImageX object
"
Class {
	#name : #PtImageXTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtImageXTests >> testFixedImageAsSource [
	self assert: PtImageXObject depth8Fixed asSource = (PtImageXObject
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
s$g><)A,LHrGn6i]ec[E5Wh\/=?3"_?rs6$cNB=r55:`-N6J364n]E5QK^9"0lfoO8~>')) asSource
]

{ #category : #tests }
PtImageXTests >> testFixedMaskedImageAsSource [
	self assert: PtImageXObject depth8Masked asSource = (PtImageXObject
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
A,J;00kM9D8/GG0KoFtoJV//I_oDd;(P5[M5OhMLP8.!#<l9\CrpRg;=r2d0FoDhhap.e~>')) asSource
]

{ #category : #tests }
PtImageXTests >> testMappedImageAsSource [
	self assert: PtImageXObject depth6Mapped2 asSource = (PtImageXObject
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
		externalBytes: #[120 218 21 197 69 18 128 48 0 0 49 22 247 226 238 110 255 127 31 211 92 2 164 103 131 116 108 109 32 215 170 252 2 235 142 194 120 53 241 11 97 36 250 142 226 12 253 83 187 148 175 58 117 153 13 222 55 206 11 63 113 56 3 242]) asSource
]

{ #category : #tests }
PtImageXTests >> testMaskImageAsSource [
	self assert: PtImageXObject depth1Mask asSource = (PtImageXObject
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
		externalBytes: #[120 218 77 205 193 13 192 32 8 5 208 223 120 240 232 8 142 226 104 140 208 17 58 74 59 138 35 112 228 96 248 98 140 73 33 239 242 9 144 0 212 15 104 61 40 32 139 253 232 206 107 204 139 39 131 220 3 242 56 132 60 178 188 108 209 162 141 212 186 56 173 132 60 104 87 103 236 243 220 238 251 223 169 9 106 19 56 46]) asSource
]

{ #category : #tests }
PtImageXTests >> testMaskImagePrintAndRead [
	self assert: PtImageXObject depth1Mask = (self evaluate: PtImageXObject depth1Mask asSource).
	self assert: PtImageXObject depth1Mono = (self evaluate: PtImageXObject depth1Mono asSource).
	self assert: PtImageXObject depth2Fixed = (self evaluate: PtImageXObject depth2Fixed asSource).
	self assert: PtImageXObject depth2Mapped = (self evaluate: PtImageXObject depth2Mapped asSource).
	self assert: PtImageXObject depth2Mapped2 = (self evaluate: PtImageXObject depth2Mapped2 asSource).
	self assert: PtImageXObject depth3Fixed = (self evaluate: PtImageXObject depth3Fixed asSource).
	self assert: PtImageXObject depth3Mapped = (self evaluate: PtImageXObject depth3Mapped asSource).
	self assert: PtImageXObject depth3Mapped2 = (self evaluate: PtImageXObject depth3Mapped2 asSource).
	self assert: PtImageXObject depth3Mapped3 = (self evaluate: PtImageXObject depth3Mapped3 asSource).
	self assert: PtImageXObject depth4Fixed = (self evaluate: PtImageXObject depth4Fixed asSource).
	self assert: PtImageXObject depth4Mapped = (self evaluate: PtImageXObject depth4Mapped asSource).
	self assert: PtImageXObject depth4Mapped2 = (self evaluate: PtImageXObject depth4Mapped2 asSource).
	self assert: PtImageXObject depth5Mapped = (self evaluate: PtImageXObject depth5Mapped asSource).
	self assert: PtImageXObject depth6Fixed = (self evaluate: PtImageXObject depth6Fixed asSource).
	self assert: PtImageXObject depth6Mapped = (self evaluate: PtImageXObject depth6Mapped asSource).
	self assert: PtImageXObject depth6Mapped2 = (self evaluate: PtImageXObject depth6Mapped2 asSource).
	self assert: PtImageXObject depth7Mapped = (self evaluate: PtImageXObject depth7Mapped asSource).
	self assert: PtImageXObject depth7Mapped2 = (self evaluate: PtImageXObject depth7Mapped2 asSource).
	self assert: PtImageXObject depth8Fixed = (self evaluate: PtImageXObject depth8Fixed asSource).
	self assert: PtImageXObject depth8Mapped = (self evaluate: PtImageXObject depth8Mapped asSource).
	self assert: PtImageXObject depth8MappedGray = (self evaluate: PtImageXObject depth8MappedGray asSource).
	self assert: PtImageXObject depth8Mapped2 = (self evaluate: PtImageXObject depth8Mapped2 asSource).
	self assert: PtImageXObject depth9Fixed = (self evaluate: PtImageXObject depth9Fixed asSource).
	self assert: PtImageXObject depth10Fixed = (self evaluate: PtImageXObject depth10Fixed asSource).
	self assert: PtImageXObject depth15Fixed = (self evaluate: PtImageXObject depth15Fixed asSource).
	self assert: PtImageXObject depth24Fixed = (self evaluate: PtImageXObject depth24Fixed asSource).
	"need to use #asSource because the references are not equal"
	self assert: PtImageXObject depth32FixedAlpha asSource = (self evaluate: PtImageXObject depth32FixedAlpha asSource) asSource.
	self assert: PtImageXObject depth8Masked asSource = (self evaluate: PtImageXObject depth8Masked asSource) asSource.
	self assert: PtImageXObject depth24Masked asSource = (self evaluate: PtImageXObject depth24Masked asSource) asSource.
]

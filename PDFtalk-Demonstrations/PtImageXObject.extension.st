Extension { #name : #PtImageXObject }

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> balloonImage [
	"generated with:
	self balloonImageCreated asMethod: #balloonImage in: #'demo images' package: 'PDFtalk Demonstrations' "

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

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> balloonImageFromVW [
	"<ImageXObject>"

	^Image balloon16x16 asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> balloonInvertedImage [
	^PtImageXObject
		on: ((Valuemap new: 10)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 8;
			add: #ColorSpace -> #DeviceRGB;
			add: #Length -> 135;
			add: #Filter -> #FlateDecode;
			add: #Decode -> #(1 0 1 0 1 0);
			add: #Mask -> (PtImageXObject
				on: ((Valuemap new: 9)
					add: #Subtype -> #Image;
					add: #Type -> #XObject;
					add: #Width -> 16;
					add: #Height -> 16;
					add: #BitsPerComponent -> 1;
					add: #ImageMask -> true;
					add: #Decode -> #(1 0);
					add: #Length -> 35;
					add: #Filter -> #FlateDecode;
					yourself)
				externalBytes: #[120 218 99 96 96 96 96 62 192 255 65 254 135 253 31 8 148 255 33 255 131 255 3 251 3 230 3 64 41 6 0 206 4 12 157]) newReference;
			yourself)
		externalBytes: #[120 218 189 210 205 13 128 32 12 6 208 206 198 42 140 193 181 99 112 101 12 102 171 253 19 72 168 196 131 177 246 96 154 247 209 68 36 250 187 74 129 209 103 9 32 221 168 129 189 34 63 210 79 184 86 66 156 145 14 222 123 196 48 192 108 102 18 70 12 35 131 249 2 6 56 39 236 83 228 105 34 153 233 241 190 235 228 117 192 221 187 111 193 205 107 36 175 135 47 190 165 232 19 133 94 7 177 151 155 114 239 248 246 249 112 101 168 194 48 199 207 216 138 183 219 207 240 6 127 94 23 53 21 60 206]
]

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> balloonInvertedImageFromVW [
	"<ImageXObject>"

	| image figure |
	figure := Image balloon16x16 image.
	image := (PtPDF classAt: #ImageXObject) empty.
	image at: #Width put: figure width.
	image at: #Height put: figure height.
	image bitsPerComponent: 8.
	image at: #ColorSpace put: #DeviceRGB.
	figure writePixelsTo: image.
	image filter: #FlateDecode.
	image at: #Decode put: #(1 0 1 0 1 0).
	image at: #Mask put: self balloonMaskImageFromVW newReference.
	^image
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> balloonMaskImage [
	^PtImageXObject
		on: ((Valuemap new: 9)
			add: #Subtype -> #Image;
			add: #Type -> #XObject;
			add: #Width -> 16;
			add: #Height -> 16;
			add: #BitsPerComponent -> 1;
			add: #ImageMask -> true;
			add: #Decode -> #(1 0);
			add: #Length -> 35;
			add: #Filter -> #FlateDecode;
			yourself)
		externalBytes: #[120 218 99 96 96 96 96 62 192 255 65 254 135 253 31 8 148 255 33 255 131 255 3 251 3 230 3 64 41 6 0 206 4 12 157]
]

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> balloonMaskImageFromVW [
	"<ImageXObject>"

	^Image balloon16x16mask asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> balloonMaskedImage [
	^PtImageXObject
		on: ((Valuemap new: 9)
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
			add: #Mask -> (PtImageXObject
				on: ((Valuemap new: 9)
					add: #Subtype -> #Image;
					add: #Type -> #XObject;
					add: #Width -> 16;
					add: #Height -> 16;
					add: #BitsPerComponent -> 1;
					add: #ImageMask -> true;
					add: #Decode -> #(1 0);
					add: #Length -> 35;
					add: #Filter -> #FlateDecode;
					yourself)
				externalBytes: #[120 218 99 96 96 96 96 62 192 255 65 254 135 253 31 8 148 255 33 255 131 255 3 251 3 230 3 64 41 6 0 206 4 12 157]) newReference;
			yourself)
		externalBytes: #[120 218 141 207 193 18 128 32 8 4 80 164 68 36 212 248 255 159 141 73 205 142 238 129 153 183 167 5 113 39 217 179 68 116 167 116 169 78 30 226 5 0 232 32 121 160 148 81 56 10 179 248 133 216 237 196 42 66 203 88 107 16 210 215 104 220 125 118 78 211 52 54 118 6 178 111 144 114 8 205 126 123 99 206 182 245 24 62 61 108 4 121]
]

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> balloonMaskedImageFromVW [
	"<ImageXObject>"

	^(OpaqueImage
		figure: Image balloon16x16
		shape: Image balloon16x16mask) asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> buttonAlphaImage [
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

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> buttonAlphaImageFromVW [
	"<ImageXObject>"

	^Depth32Image exampleFixedDepth32 asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> fixedDepth6Image [
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

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> fixedDepth6ImageFromVW [
	"<ImageXObject>"

	^Depth8Image exampleFixedDepth06 asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> pdfIconFigureImage [
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

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> pdfIconFigureImageFromVW [
	"<ImageXObject>"

	^Image pdfIconFigure asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> pdfIconImage [
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

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> pdfIconImageFromVW [
	"<ImageXObject>"

	^(Icon figure: Image pdfIconFigure shape: Image pdfIconMask) asPDF
]

{ #category : #'*PDFtalk-Demonstrations-demo images' }
PtImageXObject class >> pdfIconMaskImage [
	^PtImageXObject
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
		externalBytes: #[120 218 99 96 0 2 251 255 32 220 80 255 255 255 1 32 126 0 196 31 128 248 7 16 255 1 226 127 64 252 31 25 3 213 82 13 3 0 144 20 79 228]
]

{ #category : #'*PDFtalk-Demonstrations-demo images from VW' }
PtImageXObject class >> pdfIconMaskImageFromVW [
	"<ImageXObject>"

	^Image pdfIconMask asPDF
]

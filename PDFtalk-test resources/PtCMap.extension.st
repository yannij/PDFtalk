Extension { #name : #PtCMap }

{ #category : #'*PDFtalk-test resources-test instances' }
PtCMap class >> example [
	^self
		on: ((Valuemap new)
			at: #Type put: #CMap;
			at: #CMapName put: #'90ms-RKSJ-H';
			at: #CIDSystemInfo
				put: (Valuemap
					with: #Registry -> 'Adobe'
					with: #Ordering -> 'Japan1'
					with: #Supplement -> 2);
			at: #WMode put: 0;
			at: #Length put: 972;
			yourself)
		external: (String fromASCII85: ',p?)`/O<oc@V%,I/heDGATMd4EarZ46VV!.%4*;gDe!p,ASuTbAS#C`A5Zu[Dfp)1ATKmT:i^Ja;e:%n-ppQo8T&6a.1IRL8T&$SF_#&]ATMd4EarZA+Ad)s@oHr\+=KTK6qM91F=@YF,sl0UBl6g[F)Q2A@q@\D6VV!.+=K6(D0%:,92eG781=uo,ueT#Ch5XM-oituF"L9_;bAW4+@0OV@V$ZS@;oXm0d&5#%4*<$ATDj+Df.TY0eb460JO"_,suTiH#dV3BQQ9X6Z6phEbT0"F<E:u3A<$?0JG4(6"FnCAKXosF*(u1F!+%l@kJ3:,suTiH#dV3BQQ9X6#:?[;JBcWFE8R&ATMF''G%G2:%4*;hDIc+QD/Ej%FE7m#01/<!8T&6a+>6Q3Ddu^WF<G10DIdd!F)Q2A@q?clAS5^p%5BU\A8,Oq+C\npBl4AhAS5^p@r5Xn%51(?6rSAPFCf;\DJ!er1E^4B@rri(F`8I4AS5^p%51UjB5)F/Ed8cU6"FnCALSa4AS)B):NBuWEbTE(+=KijE+*W=.3N/4AdpClF`;;9ASl!rF<E=]A7]?^ASu$$A7]?^%51(C@;ntMD.OhC3A>;k/Q,5?8hERVA7]?^01/HBE)pOjF(oQ1+>GQ&0JG4(A7]?^01/HBE)_+%AKW]MA7]?^03(S3:M+3[ATT%T2)$.`AS)B)=B.p\+BpQC0ea_*2)@''F>p*ZhAdpCp9lFQR+>=pKAS)A\1a$7=B5)6nDe*F#E+*6fEa`iuAIUaU0KqTY0Koq.3&*6D5!1hp7RK?K4@(Yb4@DY&%6R''51b_*U7RKX44q2(@A7KOgATMg!@qB[hDJ*Mi%5Au7AS5^pDJsW-AS,skDJ*Mi4>8HQ4>B;h1,CWoASu$rDffN$Ao_<tB4VM]3?VdBB5)6nBk26mDJ*Mi4>JTS4?#Yl1,CWo4?#\m4?#\m2D[&s4?,&P0KqTY0fMNb2D[,u4?,&T0KqTY0gS/j2E<Z)4?,&^3''KGa0g\>n2`*5u4?,&_3''KGa0geAn2`*N(4@VXo0KqTg68q=s3&NEM%6R*H3&!NY7RBR34ubDZ0b$676SpJ\4@V[p69[@f0K''AODId6kA9)*rB4VN`DId6o@;lZC9jr!9@;TQu@s)g4ASuU#Bk)6-01/HBE$/\&Anc-oEb0<1F`Lu''+E27<%:sEf%:sEf%4*;hDIcXVF)Q2A@q?)q,t1U!~>')
]

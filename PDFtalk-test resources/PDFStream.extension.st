Extension { #name : #PDFStream }

{ #category : #'*PDFtalk-test resources-test instances' }
PDFStream class >> example [
	^(PtFile readTesterOn: '<< /Length 68 >>		% was: (An indirect reference to object 8)
stream' , self stringLf , 'BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET' , self stringLf , 'endstream') readObject
]

{ #category : #'*PDFtalk-test resources-test instances' }
PDFStream class >> example1_2 [
	^(PtFile readTesterOn: '<< /Length 68 /F (.) >>
stream' , self stringLf , 'BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET' , self stringLf , 'endstream') readObject
]

{ #category : #'*PDFtalk-test resources-test instances' }
PDFStream class >> example1_5 [
	^(PtFile readTesterOn: '<< /Length 68 /DL 68 >>
stream' , self stringLf , 'BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET' , self stringLf , 'endstream') readObject
]

{ #category : #'*PDFtalk-test resources-test instances' }
PDFStream class >> exampleFiltered [
	^(PtFile readTesterOn: '1 0 obj
<<	/Length 533
	/Filter [ /ASCII85Decode /LZWDecode ]
>>
stream' , self stringLf , 'J..)6T`?p&<!J9%_[umg"B7/Z7KNXbN''S+,*Q/&"OLT''F
LIDK#!n`$"<Atdi`\Vn%b%)&''cA*VnK\CJY(sF>c!Jnl@
RM]WM;jjH6Gnc75idkL5]+cPZKEBPWdR>FF(kj1_R%W_d
&/jS!;iuad7h?[L-F$+]]0A3Ck*$I0KZ?;<)CJtqi65Xb
Vc3\n5ua:Q/=0$W<#N3U;H,MQKqfg1?:lUpR;6oN[C2E4
ZNr8Udn.''p+?#X+1>0Kuk$bCDF/(3fL5]Oq)^kJZ!C2H1
''TO]Rl?Q:&''<5&iP!$Rq;BXRecDN[IJB`,)o8XJOSJ9sD
S]hQ;Rj@!ND)bD_q&C\g:inYC%)&u#:u,M6Bm%IY!Kb1+
":aAa''S`ViJglLb8<W9k6Yl\\0McJQkDeLWdPN?9A''jX*
al>iG1p&i;eVoK&juJHs9%;Xomop"5KatWRT"JQ#qYuL,
JD?M$0QP)lKn06l1apKDC@\qJ4B!!(5m+j.7F790m(Vj8
8l8Q:_CZ(Gm1%X\N1&u!FKHMB~>' , self stringLf , 'endstream
endobj') readObject
]

{ #category : #'*PDFtalk-test resources-test instances' }
PDFStream class >> exampleUnfiltered [
	^(PtFile readTesterOn: '<< /Length 564 >>
stream' , self stringLf , '2 J
BT
/F1 12 Tf
0 Tc
0 Tw
72.5 712 TD
[(Unfiltered streams can be read easily) 65 (,)] TJ
0 -14 TD
[(b) 20 (ut generally tak) 10 (e more space than \311)] TJ
T* (compressed streams.) Tj
0 -28 TD
[(Se) 25 (v) 15 (eral encoding methods are a) 20 (v) 25 (ailable in PDF) 80 (.)] TJ
0 -14 TD
(Some are used for compression and others simply) Tj
T* [(to represent binary data in an) 55 (ASCII format.) ] TJ
T* (Some of the compression filters are \
suitable) Tj
T* (for both data and images , while others are \
suitable only) Tj
T* (for continuous-tone images.) Tj
ET' , self stringLf , 'endstream') readObject
]

Extension { #name : #PtContents }

{ #category : #'*PDFtalk-test resources-test instances' }
PtContents class >> example [
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
ET' , self stringLf , 'endstream') readObject typed: (Array with: (PtObjectType onSymbol: #Contents))
]

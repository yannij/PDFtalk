Extension { #name : #PtSampledFunction }

{ #category : #'*PDFtalk-test resources-test instances' }
PtSampledFunction class >> example [
	^(PtFile readTesterOn: '<< /FunctionType 0
	/Domain [-1.0 1.0 -1.0 1.0]
	/Size [21 31]
	/Encode [0 20 0 30]
	/BitsPerSample 4
	/Range [-1.0 1.0]
	/Decode [-1.0 1.0]
	/Length 132
>>
stream' , self stringLf , '0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
	(...651 sample values...)' , self stringLf , 'endstream') readObject
]

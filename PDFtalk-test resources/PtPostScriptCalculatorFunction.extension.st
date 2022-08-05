Extension { #name : #PtPostScriptCalculatorFunction }

{ #category : #'*PDFtalk-test resources-test instances' }
PtPostScriptCalculatorFunction class >> example [
	"The following example shows a type 4 function equivalent to the predefined spot function DoubleDot"

	^(PtFile readTesterOn: '<< /FunctionType 4
	/Domain [-1.0 1.0 -1.0 1.0]
	/Range [-1.0 1.0]
	/Length 48
>>
stream' , self stringLf , '{ 360 mul sin
2 div
exch 360 mul sin
2 div
add
}' , self stringLf , 'endstream') readObject
]

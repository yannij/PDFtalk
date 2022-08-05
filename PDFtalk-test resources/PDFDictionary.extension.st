Extension { #name : #PDFDictionary }

{ #category : #'*PDFtalk-test resources-test instances' }
PDFDictionary class >> example [
	| file |
	file := PtFile readTesterOn: '
 /Type /Example
	/Subtype /DictionaryExample
	/Version 0.01
	/IntegerItem 12
	/StringItem (a string)
	/Subdictionary << /Item1 0.4
		/Item2 true
		/LastItem (not !)
		/VeryLastItem (OK)
	>>
>>'.
	^self readWith: file from: file parser
]

Extension { #name : #PtFilter }

{ #category : #'*PDFtalk-test resources-test instances' }
PtFilter class >> example [
	^self new
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtFilter class >> exampleString [
	"from http://en.wikipedia.org/wiki/Ascii85
	Should encode into #exampleEncodedString"

	^'Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure.'
]

{ #category : #'*PDFtalk-test resources-instance creation' }
PtFilter class >> testerWith: aPDFDictionaryOrNil [
	^self new
]

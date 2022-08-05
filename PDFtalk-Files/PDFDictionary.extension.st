Extension { #name : #PDFDictionary }

{ #category : #'*PDFtalk-Files-reading' }
PDFDictionary class >> readWith: aFile from: aParser [
	"<PDF.Dictionary>"

	^self on: (aParser readOrderedDictionaryWith: aFile)
]

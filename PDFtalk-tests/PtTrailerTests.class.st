Class {
	#name : #PtTrailerTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtTrailerTests >> testCreationDate [
	| trailer |
	trailer := (PtPDF classAt: #Trailer)
		with: #Size -> 4
		with: #Root -> (PtPDF Dictionary with: #Type -> #Catalog) newReference
		with: #Info -> (PtPDF classAt: #DocumentInformation) empty newReference.
	self assert: (trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: trailer Size = 4 asPDF.
	self assert: trailer Info class = (PtPDF classAt: #DocumentInformation).
	self assert: trailer Info CreationDate class = (PtPDF classAt: #Date).
	trailer Info
		at: #CreationDate
		put: (TimeZone default universalToLocal: (Timestamp d: 6 m: 2 y: 2012)).
	self assert: trailer Info CreationDate class = (PtPDF classAt: #Date).
	self assert: trailer Info CreationDate class = (PtPDF classAt: #Date).
	trailer Info
		at: #ModDate
		put: (TimeZone default universalToLocal: (Timestamp d: 6 m: 2 y: 2012)).
	self assert: trailer Info CreationDate class = (PtPDF classAt: #Date).
	"the FileIdentifier cannot be tested with timestamps, since they are written timezone specific"
	self assert: (trailer hashForFilename: 'test.pdf' andSize: 100) class = PtPDF String
]

{ #category : #tests }
PtTrailerTests >> testMD5Hash [
	self assert: (PtPDF String content: (PtTrailer new md5HashOf: 'Hello World - this is a MD5 teststring')) pdfHexSource = '<2816027FC2340BBEA7DED7ED134D47E4>'
]

{ #category : #tests }
PtTrailerTests >> testNoCreationDate [
	| trailer |
	trailer := (PtPDF classAt: #Trailer)
		with: #Size -> 4
		with: #Root -> (PtPDF Dictionary with: #Type -> #Catalog) newReference
		with: #Info -> (PtPDF classAt: #DocumentInformation) empty newReference.
	self assert: (trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: trailer Size = 4 asPDF.
	self assert: trailer Info class = (PtPDF classAt: #DocumentInformation).
	self assert: trailer Info CreationDate class = (PtPDF classAt: #Date).
	trailer Info at: #CreationDate put: nil.
	self assert: trailer Info CreationDate isNil.
	self assert: trailer Info ModDate class = (PtPDF classAt: #Date).
	trailer Info at: #ModDate put: nil.
	self assert: trailer Info ModDate isNil.
	self assert: (trailer hashForFilename: 'test.pdf' andSize: 100) isNil
]

{ #category : #tests }
PtTrailerTests >> testPDFVersion [
	self assert: (PtPDF classAt: #Trailer) example pdfVersion = PtVersion pdf1_1.
	self assert: (PtPDF classAt: #Trailer) exampleMinimal pdfVersion = PtVersion pdf1_0.
]

{ #category : #tests }
PtTrailerTests >> testProperties [
	self assert: (PtPDF classAt: #Trailer) example Size = 22 asPDF.
	self assert: (((PtPDF classAt: #Trailer) example at: #Root) referent isKindOf: (PtPDF classAt: #Catalog)).
	self assert: ((PtPDF classAt: #Trailer) example at: #Info) referent = (PtPDF classAt: #DocumentInformation) new.
	self assert: (PtPDF classAt: #Trailer) example ID = ((PtPDF classAt: #FileIdentifier)
		with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject
		with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject).
	self assert: (PtPDF classAt: #Trailer) example Prev isNil.
	self assert: (PtPDF classAt: #Trailer) example Encrypt isEmpty
]

{ #category : #tests }
PtTrailerTests >> testRead [
	| file |
	file := PtFile readTesterOn: (PtPDF classAt: #Trailer) exampleString.
	self assert: ((PtPDF classAt: #Trailer) readWith: file from: file parser) = ((PtPDF classAt: #Trailer)
		with: #Size -> 22
		with: #Root -> (file referenceAt: (PtObjectId number: 2))
		with: #Info -> (file referenceAt: (PtObjectId number: 1))
		with: #ID -> (Array
			with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject
			with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject) asPDF)
]

{ #category : #tests }
PtTrailerTests >> testWrite [
	| file trailerExample |
	file := PtFile readTesterOn: (PtPDF classAt: #Trailer) exampleString.
	trailerExample := (PtPDF classAt: #Trailer)
		with: #Size -> 22
		with: #Root -> (file referenceAt: (PtObjectId number: 2))
		with: #Info -> (file referenceAt: (PtObjectId number: 1))
		with: #ID -> (Array
			with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject
			with: (PtFile readTesterOn: '< 81b14aafa313db63dbd6f981e49f94f4 >') readObject) asPDF.
	self assert: ((PtPDF classAt: #Trailer) readWith: file from: file parser) = trailerExample.
	self assert: trailerExample pdfSource = '<<	/Size 22
	/Root 2 0 R
	/Info 1 0 R
	/ID [	<81B14AAFA313DB63DBD6F981E49F94F4>
		<81B14AAFA313DB63DBD6F981E49F94F4>]	>>' withLf.
	self assert: (PtPDF classAt: #Trailer) exampleMinimal pdfSource = '<<	/Size 22
	/Root 0 0 R	>>' withLf
]

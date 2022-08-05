"
PDF File Specification Annotations as defined in PDF 32000_2008.pdf, section 7.11.3, pp. 102.

The dictionary form of file specification provides more flexibility than the string form, allowing different files to be specified for different file systems or platforms, or for file systems other than the standard ones (DOS/Windows, Mac OS, and UNIX).
Regardless of the platform, conforming readers should use the F and UF (beginning with PDF 1.7) entries to specify files.
The UF entry is optional, but should be included because it enables cross-platform and cross-language compatibility.
"
Class {
	#name : #PtFileSpecification,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtFileSpecification class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #FileSpecification
		supertype: #Dictionary
		section: '7.11.3'
		documentation: 'The dictionary form of file specification provides more flexibility than the string form, allowing different files to be specified for different file systems or platforms, or for file systems other than the standard ones (DOS/Windows, Mac OS, and UNIX).
Regardless of the platform, conforming readers should use the F and UF (beginning with PDF 1.7) entries to specify files.
The UF entry is optional, but should be included because it enables cross-platform and cross-language compatibility.'
]

{ #category : #accessing }
PtFileSpecification class >> type [
	^#Filespec
]

{ #category : #'accessing entries' }
PtFileSpecification >> AFRelationship [
	<type: #Name>
	<version: 2 dot: 0>
	<attribute: 14 documentation: 'Specifies the nature of the relationship between the PDF (or a PDF object), and the related content. This entry is required to contain one of the values defined in PDF 2.0: Source, Data, Alternative, Supplement, EncryptedPayload, FormData, Schema or Unspecified. Custom values may be used where none of these entries is appropriate.'>
	^self objectAt: #AFRelationship ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtFileSpecification >> CI [
	<typeIndirect: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 13 documentation: 'A collection item dictionary, which shall be used to create the user interface for portable collections.'>
	^self objectAt: #CI ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> DOS [
	<type: #String>
	<attribute: 5 documentation: 'A file specification string representing a DOS file name.
This entry is obsolescent and should not be used by conforming writers.'>
	^self objectAt: #DOS ifAbsent: [PtPDF String empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> Desc [
	<type: #String>
	<version: 1 dot: 6>
	<attribute: 12 documentation: 'Descriptive text associated with the file specification.
It shall be used for files in the EmbeddedFiles name tree.'>
	^self objectAt: #Desc ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtFileSpecification >> EF [
	<typeDictionaryOf: #EmbeddedFile>
	<version: 1 dot: 3>
	<attribute: 10 documentation: '(Required if RF is present; amended to include the UF key in PDF 1.7)
A dictionary containing a subset of the keys F, UF, DOS, Mac, and Unix, corresponding to the entries by those names in the file specification dictionary.
The value of each such key shall be an embedded file stream containing the corresponding file.
If this entry is present, the Type entry is required and the file specification dictionary shall be indirectly referenced.
The F and UF entries should be used in place of the DOS, Mac, or Unix entries.'>
	^self objectAt: #EF ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> F [
	<type: #String>
	<attribute: 3 documentation: '(Required if the DOS, Mac, and Unix entries are all absent; amended with the UF entry for PDF 1.7)
A file specification string, or (if the file system is URL) a uniform resource locator.

The UF entry should be used in addition to the F entry.
The UF entry provides cross-platform and cross-language compatibility and the F entry provides backwards compatibility.'>
	^self objectAt: #F ifAbsent: [PtPDF String empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> FS [
	<type: #Name>
	<attribute: 2 documentation: 'The name of the file system that shall be used to interpret this file specification.
If this entry is present, all other entries in the dictionary shall be interpreted by the designated file system.
PDF shall define only one standard file system name, URL; an application can register other names.
This entry shall be independent of the F, UF, DOS, Mac, and Unix entries.'>
	^self objectAt: #FS ifAbsent: [#URL asPDF]
]

{ #category : #'accessing entries' }
PtFileSpecification >> ID [
	<type: #FileIdentifier>
	<attribute: 8 documentation: 'An array of two byte strings constituting a file identifier that should be included in the referenced file.
NOTE	The use of this entry improves an application’s chances of finding the intended file and allows it to warn the user if the file has changed since the link was made.'>
	^self objectAt: #ID ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtFileSpecification >> Mac [
	<type: #String>
	<attribute: 6 documentation: 'A file specification string representing a Mac OS file name.
This entry is obsolescent and should not be used by conforming writers.'>
	^self objectAt: #Mac ifAbsent: [PtPDF String empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> RF [
	<type: #Dictionary>
	<version: 1 dot: 3>
	<attribute: 11 documentation: 'A dictionary with the same structure as the EF dictionary, which shall be present.
Each key in the RF dictionary shall also be present in the EF dictionary.
Each value shall be a related files array identifying files that are related to the corresponding file in the EF dictionary.
If this entry is present, the Type entry is required and the file specification dictionary shall be indirectly referenced.'>
	^self objectAt: #RF ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> Type [
	<type: #Name>
	<attribute: 1 documentation: '(Required if an EF or RF entry is present; recommended always)
The type of PDF object that this dictionary describes; shall be Filespec for a file specification dictionary.'>
	^self objectAt: #Type ifAbsent: [#Filespec asPDF]
]

{ #category : #'accessing entries' }
PtFileSpecification >> UF [
	<type: #Textstring>
	<version: 1 dot: 7>
	<attribute: 4 documentation: '(Optional, but recommended if the F entry exists in the dictionary)
A Unicode text string that provides file specification.
This is a text string encoded using PDFDocEncoding or UTF-16BE with a leading byte-order marker.
The F entry should be included along with this entry for backwards compatibility reasons.'>
	^self objectAt: #UF ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtFileSpecification >> Unix [
	<type: #String>
	<attribute: 7 documentation: 'A file specification string representing a Unix file name.
This entry is obsolescent and should not be used by conforming writers.'>
	^self objectAt: #Unix ifAbsent: [PtPDF String empty]
]

{ #category : #'accessing entries' }
PtFileSpecification >> V [
	<type: #Boolean>
	<version: 1 dot: 2>
	<attribute: 9 documentation: 'A flag indicating whether the file referenced by the file specification is volatile (changes frequently with time).
If the value is true, applications shall not cache a copy of the file.
For example, a movie annotation referencing a URL to a live video camera could set this flag to true to notify the conforming reader that it should re-acquire the movie each time it is played.'>
	^self objectAt: #V ifAbsent: [false]
]

{ #category : #testing }
PtFileSpecification >> canSaveFileAt: aSymbol [
	"<Boolean>
	checks if the key aSymbol is available"

	^(self hasKey: aSymbol) and: [
	(self hasKey: #EF) and: [
	self EF hasKey: aSymbol]]
]

{ #category : #accessing }
PtFileSpecification >> filename [
	"<String>"

	#(#UF #F #Unix #DOS #Mac) do: [:symbol |
		(self hasKey: symbol) ifTrue: [
			^self objectAt: symbol]].
	PtError raiseSignal: 'no filename provided'
]

{ #category : #actions }
PtFileSpecification >> saveFile [
	"save the embedded file with the specified name in the current directory"

	#(#UF #F #Unix #DOS #Mac) do: [:symbol |
		(self canSaveFileAt: symbol) ifTrue: [
			self saveFileAt: symbol.
			^self]].
	PtError raiseSignal: 'no embedded file found'
]

{ #category : #actions }
PtFileSpecification >> saveFileAt: aSymbol [
	"<Boolean>
	save the embedded file with the specified name in the current directory"

	| wst |
	wst := ((self objectAt: aSymbol) asSmalltalkValue asFilename withEncoding: #binary) writeStream.
	wst nextPutAll: (self EF objectAt: aSymbol) internal asByteArray.
	wst close
]

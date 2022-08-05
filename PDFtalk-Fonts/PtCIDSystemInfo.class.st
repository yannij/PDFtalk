"
PDF CIDSystemInfo Dictionaries as defined in PDF 32000_2008.pdf, clause 9.7.3, pp. 268.

CIDFont and CMap dictionaries shall contain a CIDSystemInfo entry specifying the character collection assumed by the CIDFont associated with the CMap—that is, the interpretation of the CID numbers used by the CIDFont.
A character collection shall be uniquely identified by the Registry, Ordering, and Supplemententries in the CIDSystemInfo dictionary.
In order to be compatible, the Registry and Ordering values must be the same.

The CIDSystemInfo entry in a CIDFont is a dictionary that shall specify the CIDFont’s character collection.
The CIDFont need not contain glyph descriptions for all the CIDs in a collection; it may contain a subset.
The CIDSystemInfo entry in a CMap file shall be either a single dictionary or an array of dictionaries, depending on whether it associates codes with a single character collection or with multiple character collections.

For proper behaviour, the CIDSystemInfo entry of a CMap shall be compatible with that of the CIDFont or CIDFonts with which it is used.
"
Class {
	#name : #PtCIDSystemInfo,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Fonts'
}

{ #category : #accessing }
PtCIDSystemInfo class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #CIDSystemInfo
		supertype: #Dictionary
		section: '9.7.3'
		documentation: 'CIDFont and CMap dictionaries shall contain a CIDSystemInfo entry specifying the character collection assumed by the CIDFont associated with the CMap—that is, the interpretation of the CID numbers used by the CIDFont.
A character collection shall be uniquely identified by the Registry, Ordering, and Supplemententries in the CIDSystemInfo dictionary.
In order to be compatible, the Registry and Ordering values must be the same.

The CIDSystemInfo entry in a CIDFont is a dictionary that shall specify the CIDFont’s character collection.
The CIDFont need not contain glyph descriptions for all the CIDs in a collection; it may contain a subset.
The CIDSystemInfo entry in a CMap file shall be either a single dictionary or an array of dictionaries, depending on whether it associates codes with a single character collection or with multiple character collections.

For proper behaviour, the CIDSystemInfo entry of a CMap shall be compatible with that of the CIDFont or CIDFonts with which it is used.'
]

{ #category : #'accessing entries' }
PtCIDSystemInfo >> Ordering [
	<type: #AsciiString>
	<required>
	<attribute: 2 documentation: 'A string that uniquely names the character collection within the specified registry'>
	^self objectAt: #Ordering
]

{ #category : #'accessing entries' }
PtCIDSystemInfo >> Registry [
	<type: #AsciiString>
	<required>
	<attribute: 1 documentation: 'A string identifying the issuer of the character collection.
For information about assigning a registry identifier, contact the Adobe Solutions Network or consult the ASN Web site.'>
	^self objectAt: #Registry
]

{ #category : #'accessing entries' }
PtCIDSystemInfo >> Supplement [
	<type: #Integer>
	<required>
	<attribute: 3 documentation: 'The supplement number of the character collection. An original character collection has a supplement number of 0. Whenever additional CIDs are assigned in a character collection, the supplement number shall be increased. Supplements shall not alter the ordering of existing CIDs in the character collection. This value shall not be used in determining compatibility between character collections'>
	^self objectAt: #Supplement
]

{ #category : #converting }
PtCIDSystemInfo >> asCharacterCollection [
	^PSRegisteredCharacterCollection newWith: self asSmalltalkValue
]

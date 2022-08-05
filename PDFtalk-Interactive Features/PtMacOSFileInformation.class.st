"
PDF embedded file parameter object as defined in PDF 32000_2008.pdf, section 7.11.4.1, p. 105.

For Mac OS files, the Mac entry in the embedded file parameter dictionary should hold a further subdictionary containing Mac OS–specific file information
"
Class {
	#name : #PtMacOSFileInformation,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtMacOSFileInformation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #MacOSFileInformation
		supertype: #Dictionary
		section: '7.11.4.1'
		documentation: 'For Mac OS files, the Mac entry in the embedded file parameter dictionary should hold a further subdictionary containing Mac OS–specific file information'
]

{ #category : #'accessing entries' }
PtMacOSFileInformation >> Creator [
	<type: #Integer>
	<attribute: 2 documentation: 'The embedded file’s creator signature shall be encoded in the same way as Subtype'>
	^self objectAt: #Creator ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtMacOSFileInformation >> ResFork [
	<type: #Stream>
	<attribute: 3 documentation: 'The binary contents of the embedded file’s resource fork'>
	^self objectAt: #ResFork ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtMacOSFileInformation >> Subtype [
	<type: #Integer>
	<attribute: 1 documentation: 'The embedded file’s file type. It shall be encoded as an integer according to Mac OS conventions: a 4-character ASCII text literal, that shall be a 32-bit integer, with the high-order byte first.
EXAMPLE
The file type “CARO” is represented as the hexadecimal integer 4341524F, which is expressed in decimal as 1128354383.'>
	^self objectAt: #Subtype ifAbsent: [nil]
]

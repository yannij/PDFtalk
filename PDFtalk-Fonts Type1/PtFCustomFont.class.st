"
Non-standard Type 1 font

The metrics and font program are read from the windows .pfm and .pfb files.
The file name stem is remembered as #filename

"
Class {
	#name : #PtFCustomFont,
	#superclass : #PtFType1Font,
	#instVars : [
		'filename',
		'program'
	],
	#category : #'PDFtalk-Fonts Type1'
}

{ #category : #'instance creation' }
PtFCustomFont class >> file: fileString pfb: pfbByteArray afm: afmString [
	"add the source methods with
	<Filename> contentsOfEntireBinaryFile asSource"

	| inst |
	inst := self new.
	inst
		initializeFilename: fileString
		metrics: (PtFAdobeFontMetric fromAfm: afmString readStream)
		program: (PtFFontProgram fromPfb: pfbByteArray).
	^inst
]

{ #category : #'instance creation' }
PtFCustomFont class >> file: fileString pfb: pfbByteArray pfm: pfmByteArray [
	"add the source methods with
	<Filename> contentsOfEntireBinaryFile asSource"

	| inst |
	inst := self new.
	inst
		initializeFilename: fileString
		metrics: (PtFPostScriptFontMetrics fromBytes: pfmByteArray)
		program: (PtFFontProgram fromPfb: pfbByteArray).
	^inst
]

{ #category : #converting }
PtFCustomFont >> asPfa [
	"<String>
	the contents of a PFA file"

	^self program asPfa
]

{ #category : #accessing }
PtFCustomFont >> faceName [
	^self metrics familyName
]

{ #category : #accessing }
PtFCustomFont >> familyName [
	^self program familyName
]

{ #category : #accessing }
PtFCustomFont >> filename [
	"<String>
	the file name of the Windows font files (without extension)"

	^filename
]

{ #category : #'initialize-release' }
PtFCustomFont >> initializeFilename: fileString metrics: aPostScriptFontMetrics program: aFontProgram [
	filename := fileString.
	program := aFontProgram.
	self initializeMetrics: aPostScriptFontMetrics
]

{ #category : #accessing }
PtFCustomFont >> program [
	"<FontProgram>
	the font program (from pfb or pfa)"

	^program
]

{ #category : #accessing }
PtFCustomFont >> screenFontDescription [
	"We should not use this for selecting the screen font on windows"

	| fd |
	fd := FontDescription new.
	fd family: self screenFamilyName.
	"fd setWidth: self setWidth."		"dont use this"
	fd boldness: self weight / 1000.0.
	fd italic: self isItalic.
	fd fixedWidth: self isFixedPitch.
	^fd
]

{ #category : #accessing }
PtFCustomFont >> setWidth [
	"this is tricky, since the value must be derived from FullName of the header of the font program.
	Apparently there are many non standard conventions used by the font vendors.
	For now we just answer the default and dont use it for the FontDescription.
	We dont need to use this for selecting the screen font on windows"

	^0.5
]

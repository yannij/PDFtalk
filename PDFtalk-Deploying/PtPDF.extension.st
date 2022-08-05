Extension { #name : #PtPDF }

{ #category : #'*PDFtalk-Deploying-documentation' }
PtPDF class >> howToUpdateTheGemstoneLibrary [
	"the steps to do when updating the Gemstone version after the {PDFtalk Project} has changed"
	"load the package [Gemstone Fileout PDFtalk] (if not already in the image). This will load the package {Gemstone Fileout}"
	"Doit
		GemstoneFileout.Writer fileOutPDFtalk.
		GemstoneFileout.Writer fileOutPDFtalkTesting.
	This will create the files 'PDFtalk.gs' and 'PDFtalkTesting.gs' in 'C:\Users\ChristianHaider.SMALLTALKED\Documents\GemStone\code' (change the path in the above methods)"
	"execute windows batch files to import the sources into Gemstone:
	in Directory 'C:\Users\ChristianHaider.SMALLTALKED\Documents\GemStone' run
		reloadPDFtalkWithTests335.bat 
		reloadPDFtalkWithTests341.bat
	Check the logs in 'C:\Users\ChristianHaider.SMALLTALKED\Documents\GemStone\logs'
		cleanUp335.log
		PDFtalk335.log
		PDFtalkTesting335.log
		(and the 341 variants)
	all 3 should end in 'Successful commit' "
	"open Jade and login to 'gemstone335'
	InspectIt
		PDF runAllTests
	should return: '248 run, 248 passes, 0 expected defects, 0 failures, 0 errors, 0 unexpected passes' "
	"upload the .gs files to Github https://github.com/ChristianHaider/PDFtalk-for-Gemstone
	and edit the release infos"
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtPDF class >> primeEncoders [
	"reset and load all encoders to fill the caches to avoid lazy initialization at runtime"
	"self primeEncoders"

	self resetEncoders.
	self standardEncoder.
	self macRomanEncoder.
	self winAnsiEncoder.
	self pdfDocEncoder
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtPDF class >> primeRuntime [
	"reset and load all class variables to fill the caches to avoid lazy initialization at runtime.
	This should be executed when deploying after all application fonts and extensions are loaded"
	"self primeRuntime"

	Value primeRuntime.
	self primeEncoders.
	PSCharacterNames primeRuntime.
	self primeTypes.
	PtAttributeType primeRuntime.
	PtOperation primeRuntime.
	PtFFont primeRuntime
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtPDF class >> primeTypes [
	"reset and load all PDF types to fill the cache to avoid lazy initialization at runtime"
	"self primeTypes"

	self resetTypes.
	self types
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtPDF class >> resetEncoders [
	"self resetEncoders"
	
	StandardEncoder := nil.
	MacRomanEncoder := nil.
	WinAnsiEncoder := nil.
	PDFDocEncoder := nil.
]

{ #category : #'*PDFtalk-Deploying-initialize-release' }
PtPDF class >> resetTypes [
	"self resetTypes"

	types := nil
]

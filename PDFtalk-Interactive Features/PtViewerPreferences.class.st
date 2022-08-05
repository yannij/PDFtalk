"
PDF ViewerPreferences as defined in PDF 32000_2008.pdf, section 12.2,  pp. 362.

The ViewerPreferences entry in a document’s catalogue designates a viewer preferences dictionary (PDF 1.2) controlling the way the document shall be presented on the screen or in print.
If no such dictionary is specified, conforming readers should behave in accordance with their own current user preference settings.
"
Class {
	#name : #PtViewerPreferences,
	#superclass : #PDFDictionary,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtViewerPreferences class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ViewerPreferences
		supertype: #Dictionary
		version: #(1 2)
		section: '12.2'
		documentation: 'The ViewerPreferences entry in a document’s catalogue designates a viewer preferences dictionary (PDF 1.2) controlling the way the document shall be presented on the screen or in print.
If no such dictionary is specified, conforming readers should behave in accordance with their own current user preference settings.'
]

{ #category : #'accessing entries' }
PtViewerPreferences >> CenterWindow [
	<type: #Boolean>
	<attribute: 5 documentation: 'A flag specifying whether to position the document’s window in the center of the screen.
Default value: false.'>
	^self objectAt: #CenterWindow ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> Direction [
	<type: #Name>
	<version: 1 dot: 3>
	<attribute: 8 documentation: 'The predominant reading order for text:
	L2R	Left to right
	R2L	Right to left (including vertical writing systems, such as Chinese, Japanese, and Korean)
This entry has no direct effect on the document’s contents or page numbering but may be used to determine the relative positioning of pages when displayed side by side or printed n-up.
Default value: L2R.'>
	^self objectAt: #Direction ifAbsent: [#L2R asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> DisplayDocTitle [
	<type: #Boolean>
	<version: 1 dot: 4>
	<attribute: 6 documentation: 'A flag specifying whether the window’s title bar should display the document title taken from the Title entry of the document information dictionary.
If false, the title bar should instead display the name of the PDF file containing the document.
Default value: false.'>
	^self objectAt: #DisplayDocTitle ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> Duplex [
	<type: #Name>
	<version: 1 dot: 7>
	<attribute: 14 documentation: 'The paper handling option that shall be used when printing the file from the print dialog.
The following values are valid:
	Simplex 				Print single-sided
	DuplexFlipShortEdge 	Duplex and flip on the short edge of the sheet
	DuplexFlipLongEdge 	Duplex and flip on the long edge of the sheet
Default value: none'>
	^self objectAt: #Duplex ifAbsent: [#none asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> FitWindow [
	<type: #Boolean>
	<attribute: 4 documentation: 'A flag specifying whether to resize the document’s window to fit the size of the first displayed page.
Default value: false.'>
	^self objectAt: #FitWindow ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> HideMenubar [
	<type: #Boolean>
	<attribute: 2 documentation: 'A flag specifying whether to hide the conforming reader’s menu bar when the document is active.
Default value: false.'>
	^self objectAt: #HideMenubar ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> HideToolbar [
	<type: #Boolean>
	<attribute: 1 documentation: 'A flag specifying whether to hide the conforming reader’s tool bars when the document is active.
Default value: false.'>
	^self objectAt: #HideToolbar ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> HideWindowUI [
	<type: #Boolean>
	<attribute: 3 documentation: 'A flag specifying whether to hide user interface elements in the document’s window (such as scroll bars and navigation controls), leaving only the document’s contents displayed.
Default value: false.'>
	^self objectAt: #HideWindowUI ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> NonFullScreenPageMode [
	<type: #Name>
	<attribute: 7 documentation: 'The document’s page mode, specifying how to display the document on exiting full-screen mode:
	UseNone	Neither document outline nor thumbnail images visible
	UseOutlines	Document outline visible
	UseThumbs	Thumbnail images visible
	UseOC	Optional content group panel visible
This entry is meaningful only if the value of the PageMode entry in the Catalog dictionary is FullScreen; it shall be ignored otherwise.
Default value: UseNone.'>
	^self objectAt: #NonFullScreenPageMode ifAbsent: [#UseNone asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> NumCopies [
	<type: #Integer>
	<version: 1 dot: 7>
	<attribute: 17 documentation: 'The number of copies that shall be printed when the print dialog is opened for this file.
Values outside this range shall be ignored.
Default value: as defined by the conforming reader, but typically 1'>
	^self objectAt: #NumCopies ifAbsent: [1 asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> PickTrayByPDFSize [
	<type: #Boolean>
	<version: 1 dot: 7>
	<attribute: 15 documentation: 'A flag specifying whether the PDF page size shall be used to select the input paper tray.
This setting influences only the preset values used to populate the print dialog presented by a conforming reader.
If PickTrayByPDFSize is true, the check box in the print dialog associated with input paper tray shall be checked.
This setting has no effect on operating systems that do not provide the ability to pick the input tray by size.
Default value: as defined by the conforming reader'>
	^self objectAt: #PickTrayByPDFSize ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> PrintArea [
	<type: #Name>
	<version: 1 dot: 4>
	<attribute: 11 documentation: 'The name of the page boundary representing the area of a page that shall be rendered when printing the document.
If the specified page boundary is not defined in the page object, its default value shall be used.
Default value: CropBox.
This entry is intended primarily for use by prepress applications that interpret or manipulate the page boundaries.
NOTE	Most conforming readers disregard it.'>
	^self objectAt: #PrintArea ifAbsent: [#CropBox asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> PrintClip [
	<type: #Name>
	<version: 1 dot: 4>
	<attribute: 12 documentation: 'The name of the page boundary to which the contents of a page shall be clipped when printing the document.
If the specified page boundary is not defined in the page object, its default value shall be used.
Default value: CropBox.
This entry is intended primarily for use by prepress applications that interpret or manipulate the page boundaries.
NOTE	Most conforming readers disregard it.'>
	^self objectAt: #PrintClip ifAbsent: [#CropBox asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> PrintPageRange [
	<typeArrayOf: #Integer>
	<version: 1 dot: 7>
	<attribute: 16 documentation: 'The page numbers used to initialize the print dialog box when the file is printed.
The array shall contain an even number of integers to be interpreted in pairs, with each pair specifying the first and last pages in a sub-range of pages to be printed.
The first page of the PDF file shall be denoted by 1.
Default value: as defined by the conforming reader'>
	^self objectAt: #PrintPageRange ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> PrintScaling [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 13 documentation: 'The page scaling option that shall be selected when a print dialog is displayed for this document.
Valid values are None, which indicates no page scaling, and AppDefault, which indicates the conforming reader’s default print scaling.
If this entry has an unrecognized value, AppDefault shall be used.
Default value: AppDefault.
If the print dialog is suppressed and its parameters are provided from some other source, this entry nevertheless shall be honored.'>
	^self objectAt: #PrintScaling ifAbsent: [#AppDefault asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> ViewArea [
	<type: #Name>
	<version: 1 dot: 4>
	<attribute: 9 documentation: 'The name of the page boundary representing the area of a page that shall be displayed when viewing the document on the screen.
The value is the key designating the relevant page boundary in the page object.
If the specified page boundary is not defined in the page object, its default value shall be used.
Default value: CropBox.
This entry is intended primarily for use by prepress applications that interpret or manipulate the page boundaries.
NOTE	Most conforming readers disregard it.'>
	^self objectAt: #ViewArea ifAbsent: [#CropBox asPDF]
]

{ #category : #'accessing entries' }
PtViewerPreferences >> ViewClip [
	<type: #Name>
	<version: 1 dot: 4>
	<attribute: 10 documentation: 'The name of the page boundary to which the contents of a page shall be clipped when viewing the document on the screen. The value is the key designating the relevant page boundary in the page object.
If the specified page boundary is not defined in the page object, its default value shall be used.
Default value: CropBox.
This entry is intended primarily for use by prepress applications that interpret or manipulate the page boundaries.
NOTE	Most conforming readers disregard it.'>
	^self objectAt: #ViewClip ifAbsent: [#CropBox asPDF]
]

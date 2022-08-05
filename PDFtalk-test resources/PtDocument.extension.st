Extension { #name : #PtDocument }

{ #category : #'*PDFtalk-test resources-test instances' }
PtDocument class >> exampleHelloWorld [
	"self exampleHelloWorld>"

	| document page |
	document := self new.
	page := PtPDF Page newInBounds: (0 @ 0 corner: 70 @ 20) colorspace: (PtPDF classAt: #DeviceCMYK) new render: [:renderer |
		renderer fillColor: CmykColor black.
		renderer textObjectDo: [
			renderer setFont: #Helvetica size: 10.
			renderer add: (PtNextLineRelative operands: #(10 5)).
			renderer showString: 'Hello World']].
	document root addPage: page.
	^document
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtDocument class >> exampleNestedPages [
	"self exampleNestedPages"

	| pdf catalog pages |
	pdf := self new.
	catalog := pdf root.
	catalog addPageTree: (PtPDF Page newNumbered: 1).
	pages := (PtPDF classAt: #Pages) empty.
	pages addPageTree: (PtPDF Page newNumbered: 2).
	pages addPageTree: (PtPDF Page newNumbered: 3).
	catalog Pages addPageTree: pages.
	pages addPageTree: (PtPDF Page newNumbered: 4).
	catalog Pages addPageTree: (PtPDF Page newNumbered: 5).
	^pdf
]

{ #category : #'*PDFtalk-test resources-test instances' }
PtDocument class >> exampleWithTypeMismatch [
	"This example is from a bug report from Bob Nemec from the 1. August 2018.
	An TypeMismatched object with references is not traced when writing to a new document"
	"self exampleWithTypeMismatch"

	| document page font |
	document := self new.
	page := PtPDF Page newInBounds: (0 @ 0 corner: 612 @ 792) colorspace: (PtPDF classAt: #DeviceRGB) new render: [:renderer |
		renderer fillColor: CmykColor black.
		renderer textObjectDo: [
			renderer setFont: #FreeSansBold size: 10.
			renderer add: (PtNextLineRelative operands: #(10 5)).
			renderer showString: 'Hello World']].
	"create the bug: inline the font descriptor directly instead of having a reference as specified"
	font := (page Resources at: #Font) objectAt: #F1. 
	[font at: #FontDescriptor put: (font objectAt: #FontDescriptor)] on: PtTypeError do: [:ex | ex resume].
	document root addPage: page.
	^document
]

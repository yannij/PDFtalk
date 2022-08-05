Class {
	#name : #PtNameTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtNameTests >> testSubclasses [
	self assert: (PtPDF classAt: #Name) empty pdfSource = '/'.
	self assert: ((PtPDF classAt: #Name) on: '') pdfSource = '/'.
	self assert: (PtPDF classAt: #DeviceCMYK) empty pdfSource = '/DeviceCMYK'.
	self assert: (PtPDF classAt: #DeviceGray) empty pdfSource = '/DeviceGray'.
	self assert: (PtPDF classAt: #DeviceRGB) empty pdfSource = '/DeviceRGB'.
	self assert: (PtPDF classAt: #Identity) empty pdfSource = '/Identity'.
	self assert: PtClip empty pdfSource = 'W'.
	self assert: PtClipEvenOdd empty pdfSource = 'W*'.
]

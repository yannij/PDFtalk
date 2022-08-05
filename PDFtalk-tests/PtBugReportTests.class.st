Class {
	#name : #PtBugReportTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtBugReportTests >> testFileHasTypeMismatch [
	"make sure that
	- the example has a TypeMismatch at /FontDescriptor in Font /F1
	- the mismatched object has a reference in /FontFile3 with number 6
	- the mismatched object has a Stream in the reference /FontFile3"
	
	| pdf fontDescriptor |
	pdf := PtFile exampleWithTypeMismatch.
	fontDescriptor := [((pdf firstPage Resources at: #Font) objectAt: #F1) at: #FontDescriptor] on: PtTypeError do: [:ex | ex resume].
	self assert: fontDescriptor class == PtTypeMismatch.
	self assert: (fontDescriptor myObject at: #FontFile3) class == PtReference.
	self assert: (fontDescriptor myObject objectAt: #FontFile3) class == PtPDF Stream.
	self assert: (fontDescriptor myObject objectAt: #FontFile3) keys asArray sorted = #(#Filter #Length #Subtype).
]

{ #category : #tests }
PtBugReportTests >> testMergedFilesWithTypeMismatch [
	| cover toMerge pagesReference pages addPagesReference merged fontDescriptor |
	cover := PtFile exampleHelloWorld.
	toMerge := PtFile exampleWithTypeMismatch.
	pagesReference := cover root at: #Pages.
	pages := pagesReference referent.
	addPagesReference := toMerge root at: #Pages.
	addPagesReference referent at: #Parent put: pagesReference.
	pages at: #Kids put: (pages Kids with: addPagesReference).
	pages at: #Count put: pages count.
	merged := [cover asDocument] on: PtTypeError do: [:ex | ex resume].
	"write out to assign new reference numbers"
	merged bytesForFile: 'merged.pdf'.
	fontDescriptor := (((merged root pageAt: 2) Resources at: #Font) objectAt: #F1) at: #FontDescriptor.
	self assert: fontDescriptor class == PtTypeMismatch.
	self assert: (fontDescriptor myObject at: #FontFile3) class == PtReference.
	self assert: (fontDescriptor myObject objectAt: #FontFile3) class == PtPDF Stream.
	self assert: (fontDescriptor myObject objectAt: #FontFile3) keys asArray sorted = #(#Filter #Length #Subtype)
]

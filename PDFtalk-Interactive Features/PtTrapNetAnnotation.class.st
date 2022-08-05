"
PDF Trap Network Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.21, pp. 410.
and 
PDF Trapping Support as defined in PDF 32000_2008.pdf, section 14.11.6.2, pp. 636.

A trap network annotation may be used to define the trapping characteristics for a page of a PDF document.
	NOTE	Trapping is the process of adding marks to a page along colour boundaries to avoid unwanted visual artifacts resulting from misregistration of colorants when the page is printed.
A page shall have no more than one trap network annotation, whose Subtype entry has the value TrapNet and which shall always be the last element in the page object’s Annots array.
"
Class {
	#name : #PtTrapNetAnnotation,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtTrapNetAnnotation class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #TrapNetAnnotation
		supertype: #Annot
		version: #(1 3)
		section: '12.5.6.21'
		documentation: 'A trap network annotation may be used to define the trapping characteristics for a page of a PDF document.
	NOTE	Trapping is the process of adding marks to a page along colour boundaries to avoid unwanted visual artifacts resulting from misregistration of colorants when the page is printed.
A page shall have no more than one trap network annotation, whose Subtype entry has the value TrapNet and which shall always be the last element in the page object’s Annots array.'
]

{ #category : #accessing }
PtTrapNetAnnotation class >> subtype [
	^#TrapNet
]

{ #category : #'accessing entries' }
PtTrapNetAnnotation >> AnnotStates [
	<typeArrayOf: #Name>
	<attribute: 3 documentation: '(Required if Version is present; shall be absent if LastModified is present)
An array of name objects representing the appearance states (value of the AS entry) for annotations associated with the page.
The appearance states shall be listed in the same order as the annotations in the page’s Annots array.
For an annotation with no AS entry, the corresponding array element should be null.
No appearance state shall be included for the trap network annotation itself.'>
	^self objectAt: #AnnotStates ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtTrapNetAnnotation >> FontFauxing [
	<typeArrayOf: #Font>
	<attribute: 4 documentation: 'An array of font dictionaries representing fonts that were fauxed (replaced by substitute fonts) during the generation of trap networks for the page.'>
	^self objectAt: #FontFauxing ifAbsent: [#() asPDF]
]

{ #category : #'accessing entries' }
PtTrapNetAnnotation >> LastModified [
	<type: #Date>
	<version: 1 dot: 4>
	<attribute: 1 documentation: '(Required if Version and AnnotStates are absent; shall be absent if Version and AnnotStates are present)
The date and time when the trap network was most recently modified.'>
	^self objectAt: #LastModified ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtTrapNetAnnotation >> Version [
	<type: #Array>
	<attribute: 2 documentation: '(Required if AnnotStates is present; shall be absent if LastModifiedis present)
An unordered array of all objects present in the page description at the time the trap networks were generated and that, if changed, could affect the appearance of the page. If present, the array shall include the following objects:
	•	All content streams identified in the page object’s Contents entry
	•	All resource objects (other than procedure sets) in the page’s resource dictionary
	•	All resource objects (other than procedure sets) in the resource dictionaries of any form XObjects on the page
	•	All OPI dictionaries associated with XObjects on the page'>
	^self objectAt: #Version ifAbsent: [#() asPDF]
]

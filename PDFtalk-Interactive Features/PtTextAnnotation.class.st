"
PDF Text Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.4, pp. 394.

A text annotation represents a “sticky note” attached to a point in the PDF document.
When closed, the annotation shall appear as an icon; when open, it shall display a pop-up window containing the text of the note in a font and size chosen by the conforming reader.
Text annotations shall not scale and rotate with the page; they shall behave as if the NoZoom and NoRotate annotation flags were always set.
"
Class {
	#name : #PtTextAnnotation,
	#superclass : #PtMarkup,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtTextAnnotation class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #TextAnnotation
		supertype: #Annot
		section: '12.5.6.4'
		documentation: 'A text annotation represents a “sticky note” attached to a point in the PDF document.
When closed, the annotation shall appear as an icon; when open, it shall display a pop-up window containing the text of the note in a font and size chosen by the conforming reader.
Text annotations shall not scale and rotate with the page; they shall behave as if the NoZoom and NoRotate annotation flags were always set.'
]

{ #category : #accessing }
PtTextAnnotation class >> subtype [
	^#Text
]

{ #category : #'accessing entries' }
PtTextAnnotation >> Name [
	<type: #Name>
	<attribute: 2 documentation: 'The name of an icon that shall be used in displaying the annotation.
Conforming readers shall provide predefined icon appearances for at least the following standard names:
	Comment, Key, Note, Help, NewParagraph, Paragraph, Insert
Additional names may be supported as well.
The annotation dictionary’s AP entry, if present, shall take precedence over the Name entry.'>
	^self objectAt: #Name ifAbsent: [#Note asPDF]
]

{ #category : #'accessing entries' }
PtTextAnnotation >> Open [
	<type: #Boolean>
	<attribute: 1 documentation: 'A flag specifying whether the annotation shall initially be displayed open.'>
	^self objectAt: #Open ifAbsent: [false]
]

{ #category : #'accessing entries' }
PtTextAnnotation >> State [
	<type: #String>
	<version: 1 dot: 5>
	<attribute: 3 documentation: 'The state to which the original annotation shall be set.
Default: (Unmarked) if StateModel is (Marked); (None) if StateModel is (Review).
With StateModel (Marked) can be (Marked) or (Unmarked);
with StateModel (Review) can be (Accepted), (Rejected), (Cancelled), (Completed) or (None).'>
	^self objectAt: #State ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtTextAnnotation >> StateModel [
	<type: #String>
	<version: 1 dot: 5>
	<attribute: 4 documentation: '(Required if State is present, otherwise optional)
The state model corresponding to State.
Can be (Marked) or (Review)'>
	^self objectAt: #StateModel ifAbsent: ['' asPDF]
]

"
PDF Markup Annotations as defined in PDF 32000_2008.pdf, section 12.5.6.2, pp. 391.

Many annotation types are defined as markup annotations because they are used primarily to mark up PDF documents.
These annotations have text that appears as part of the annotation and may be displayed in other ways by a conforming reader, such as in a Comments pane.

"
Class {
	#name : #PtMarkup,
	#superclass : #PtAnnot,
	#category : #'PDFtalk-Interactive Features'
}

{ #category : #accessing }
PtMarkup class >> pdfTypeDefinition [

	^PDFTypeDefinition
		name: #Markup
		supertype: #Annot
		section: '12.5.6.2'
		documentation: 'Many annotation types are defined as markup annotations because they are used primarily to mark up PDF documents.
These annotations have text that appears as part of the annotation and may be displayed in other ways by a conforming reader, such as in a Comments pane.'
]

{ #category : #'accessing entries' }
PtMarkup >> CA [
	<type: #Number>
	<version: 1 dot: 4>
	<attribute: 3 documentation: 'The constant opacity value that shall be used in painting the annotation.
This value shall apply to all visible elements of the annotation in its closed state (including its background and border) but not to the pop-up window that appears when the annotation is opened.

The specified value shall not used if the annotation has an appearance stream; in that case, the appearance stream shall specify any transparency.
(However, if the compliant viewer regenerates the annotation’s appearance stream, it may incorporate the CA value into the stream’s content.)

The implicit blend mode is Normal.

If no explicit appearance stream is defined for the annotation, it may bepainted by implementation-dependent means that do not necessarily conform to the PDF imaging model; in this case, the effect of this entry is implementation-dependent as well.'>
	^self objectAt: #CA ifAbsent: [1.0 asPDF]
]

{ #category : #'accessing entries' }
PtMarkup >> CreationDate [
	<type: #Date>
	<version: 1 dot: 5>
	<attribute: 5 documentation: 'The date and time when the annotation was created.'>
	^self objectAt: #CreationDate ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtMarkup >> ExData [
	<type: #Dictionary>
	<version: 1 dot: 7>
	<attribute: 10 documentation: 'An external data dictionary specifying data that shall be associated with the annotation.
This dictionary contains the following entries:
	Type 		(optional) If present, shall be ExData.
	Subtype 	(required) a name specifying the type of data that the markup annotation shall be associated with.
				The only defined value is Markup3D.'>
	^self objectAt: #ExData ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtMarkup >> IRT [
	<type: #Dictionary>
	<version: 1 dot: 5>
	<attribute: 6 documentation: '(Required if an RT entry is present, otherwise optional)
A reference to the annotation that this annotation is “in reply to.”
Both annotations shall be on the same page of the document.
The relationship between the two annotations shall be specified by the RT entry.

If this entry is present in an FDF file, its type shall not be a dictionary but a text string containing the contents of the NM entry of the annotation being replied to, to allow for a situation where the annotation being replied to is not in the same FDF file.'>
	^self objectAt: #IRT ifAbsent: [PtPDF Dictionary empty]
]

{ #category : #'accessing entries' }
PtMarkup >> IT [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 9 documentation: 'A name describing the intent of the markup annotation.
Intents allow conforming readers to distinguish between different uses and behaviors of a single markup annotation type.
If this entry is not present or its value is the same as the annotation type, the annotation shall have no explicit intent and should behave in a generic manner in a conforming reader.

Free text annotations, line annotations, polygon annotations, and polyline annotations have defined intents, whose values are enumerated in the corresponding tables.'>
	^self objectAt: #IT ifAbsent: [nil]
]

{ #category : #'accessing entries' }
PtMarkup >> Popup [
	<typeIndirect: #PopupAnnotation>
	<version: 1 dot: 3>
	<attribute: 2 documentation: 'An indirect reference to a pop-up annotation for entering or editing the text associated with this annotation.'>
	^self objectAt: #Popup ifAbsent: [(PtPDF classAt: #PopupAnnotation) empty]
]

{ #category : #'accessing entries' }
PtMarkup >> RC [
	<type: #String>
	<type: #Textstream>
	<version: 1 dot: 5>
	<attribute: 4 documentation: 'A rich text string that shall be displayed in the pop-up window when the annotation is opened.'>
	^self objectAt: #RC ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtMarkup >> RT [
	<type: #Name>
	<version: 1 dot: 6>
	<attribute: 8 documentation: '(meaningful only if IRT is present)
A name specifying the relationship (the “reply type”) between this annotation and one specified by IRT.
Valid values are:
	R		The annotation shall be considered a reply to the annotation specified by IRT.
			Conforming readers shall not display replies to an annotation individually but together in the form of threaded comments.
	Group	The annotation shall be grouped with the annotation specified by IRT.'>
	^self objectAt: #RT ifAbsent: [#R asPDF]
]

{ #category : #'accessing entries' }
PtMarkup >> Subj [
	<type: #String>
	<version: 1 dot: 5>
	<attribute: 7 documentation: 'Text representing a short description of the subject being addressed by the annotation.'>
	^self objectAt: #Subj ifAbsent: ['' asPDF]
]

{ #category : #'accessing entries' }
PtMarkup >> T [
	<type: #String>
	<version: 1 dot: 1>
	<attribute: 1 documentation: 'The text label that shall be displayed in the title bar of the annotation’s pop-up window when open and active.
This entry shall identify the user who added the annotation.'>
	^self objectAt: #T ifAbsent: ['' asPDF]
]

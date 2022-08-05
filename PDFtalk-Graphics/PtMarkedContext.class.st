"
Marked-content operators may identify a portion of a PDF content stream as a marked-content element of interest to a particular conforming product. Marked-content elements and the operators that mark them shall fall into two categories:
• The MP and DP operators shall designate a single marked-content point in the content stream.
• The BMC, BDC, and EMC operators shall bracket a marked-content sequence of objects within the content stream.

NOTE 1
This is a sequence not simply of bytes in the content stream but of complete graphics objects. Each object is fully qualified by the parameters of the graphics state in which it is rendered.
NOTE 2
A graphics application, for example, might use marked content to identify a set of related objects as a group to be processed as a single unit. A text-processing application might use it to maintain a connection between a footnote marker in the body of a document and the corresponding footnote text at the bottom of the page. The PDF logical structure facilities use marked-content sequences to associate graphical content with structure elements.

All marked-content operators except EMC shall take a tag operand indicating the role or significance of the marked-content element to the conforming reader. All such tags shall be registered with Adobe Systems to avoid conflicts between different applications marking the same content stream. In addition to the tag operand, the DP and BDC operators shall specify a property list containing further information associated with the marked content.
Marked-content operators may appear only between graphics objects in the content stream. They may not occur within a graphics object or between a graphics state operator and its operands. Marked-content sequences may be nested one within another, but each sequence shall be entirely contained within a single content stream.

NOTE 3
A marked-content sequence may not cross page boundaries.
NOTE 4
The Contents entry of a page object, which may be either a single stream or an array of streams, is considered a single stream with respect to marked-content sequences.
"
Class {
	#name : #PtMarkedContext,
	#superclass : #PtContext,
	#instVars : [
		'tag',
		'properties'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #'instance creation' }
PtMarkedContext class >> tag: aName [

	| inst |
	inst := self new.
	inst initializeTag: aName properties: nil.
	^inst
]

{ #category : #'instance creation' }
PtMarkedContext class >> tag: aName properties: aDictionary [

	| inst |
	inst := self new.
	inst initializeTag: aName properties: aDictionary.
	^inst
]

{ #category : #'initialize-release' }
PtMarkedContext >> initializeTag: aName properties: aDictionary [

	tag := aName.
	properties := aDictionary
]

{ #category : #writing }
PtMarkedContext >> postfix [

	^'EMC'
]

{ #category : #writing }
PtMarkedContext >> prefix [
	self properties ifNil: [
		^self tag pdfSource , ' BMC'].
	^self tag pdfSource , ' ' , self properties pdfSource , ' BDC'
]

{ #category : #accessing }
PtMarkedContext >> properties [

	^properties
]

{ #category : #accessing }
PtMarkedContext >> tag [

	^tag
]

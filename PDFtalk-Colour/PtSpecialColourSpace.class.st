"
PDF Special Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6.6, pp. 155.

Special colour spaces add features or properties to an underlying colour space. 
There are four special colour space families: Pattern, Indexed, Separation, and DeviceN.
"
Class {
	#name : #PtSpecialColourSpace,
	#superclass : #PDFArray,
	#category : #'PDFtalk-Colour'
}

{ #category : #'instance creation' }
PtSpecialColourSpace class >> empty [
	| empty |
	empty := super empty.
	empty at: 1 put: self type.
	^empty
]

{ #category : #testing }
PtSpecialColourSpace class >> isClassForArray: anArray [

	^(super isClassForArray: anArray) and: [
	anArray first asPDF = self type asPDF]
]

{ #category : #accessing }
PtSpecialColourSpace class >> resourcePrefix [
	^'CS'
]

{ #category : #accessing }
PtSpecialColourSpace class >> resourceType [
	"<Symbol>
	the name of a /Resources key"

	^#ColorSpace
]

{ #category : #accessing }
PtSpecialColourSpace class >> type [
	^self name
]

{ #category : #accessing }
PtSpecialColourSpace >> alternativeDeviceColorspace [
	"<ColourSpace>"
	
	^self subclassResponsibility
]

{ #category : #accessing }
PtSpecialColourSpace >> defaultBlack [
	"<Color>"

	^self initialColourValues asPDF
]

{ #category : #accessing }
PtSpecialColourSpace >> defaultDecodeArray [
	"<PDFArray of: Number>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtSpecialColourSpace >> initialColourValues [
	"<Array of Number>
	the initial colour when the current colour space is set"

	^#()
]

{ #category : #'accessing entries' }
PtSpecialColourSpace >> name [
	<type: #Name>
	<required>
	<attribute: 1 documentation: 'The name of the colour space type.'>
	^self objectAt: 1
]

{ #category : #accessing }
PtSpecialColourSpace >> numberOfComponents [
	"<Integer>"

	^self subclassResponsibility
]

{ #category : #accessing }
PtSpecialColourSpace >> procSet [
	^#ImageC
]

"
Sequence of GraphicsObjects and maybe nested GraphicsCollectors
"
Class {
	#name : #PtContext,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : #'PDFtalk-Graphics'
}

{ #category : #actions }
PtContext >> addObject: aGraphicelementOrContext [
	self objects add: aGraphicelementOrContext
]

{ #category : #accessing }
PtContext >> allOperations [
	^self operations
]

{ #category : #accessing }
PtContext >> objects [
	"<SequenceableCollection of: (Graphicelement | Context)>"

	^objects ifNil: [objects := OrderedCollection new]
]

{ #category : #accessing }
PtContext >> operations [
	"<SequenceableCollection of: Operation>"

	| operations |
	operations := OrderedCollection new.
	self objects do: [:object | operations addAll: object allOperations].
	^operations
]

{ #category : #accessing }
PtContext >> pdfVersion [
	^self operations inject: PtVersion pdf1_0 into: [:max :op | max max: op pdfVersion]
]

{ #category : #writing }
PtContext >> postfix [
	"<String>"

	^''
]

{ #category : #writing }
PtContext >> prefix [
	"<String>"

	^''
]

{ #category : #accessing }
PtContext >> resource [
	^nil
]

{ #category : #writing }
PtContext >> writePDFOn: aWriter indent: anInteger [
	aWriter
		nextPutAll: self prefix asByteArray;
		cr.
	self objects do: [:object |
		object writePDFOn: aWriter indent: anInteger.
		aWriter cr].
	aWriter nextPutAll: self postfix asByteArray
]

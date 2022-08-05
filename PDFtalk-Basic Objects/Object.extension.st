Extension { #name : #Object }

{ #category : #'*PDFtalk-Basic Objects-converting' }
Object >> asPDF [
	"<Object>
	returns the receiver converted to a valid PDF object"

	^self
]

{ #category : #'*PDFtalk-Basic Objects-converting' }
Object >> asSmalltalkValue [
	^self
]

{ #category : #'*PDFtalk-Basic Objects-converting' }
Object >> asType: aType [
	"<Object | nil>
	an instance of aType if the receiver can be specialized"
	
	^aType specializedObject: self
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> canBeExemplarOf: aType [
	"<Boolean>
	true, iff the receiver can be represented as an exemplar of aType"
	
	^self isKindOf: aType implementingClass
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> compliesTo: anAttributeType [
	^anAttributeType specifiesObject: self
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> content [
	"<Object>
	the Smalltalk object for the value I represent"

	^self
]

{ #category : #'*PDFtalk-Basic Objects-tracing' }
Object >> copyWithNewReferencesIn: visited [
	"<Object copy>"
	"collect new references with copied referent"
	"direct object. No references here"

	^self
]

{ #category : #'*PDFtalk-Basic Objects-typing' }
Object >> errorWrongTypes: someTypes [
	"<TypeMismatch>"

	^PtTypeMismatch for: self expected: someTypes
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object class >> isClassForArray: anArray [
	"<Boolean>
	true, iff a proper instance can be created from anObject"

	^false
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object class >> isClassForDictionary: aDictionary [
	"<Boolean>
	true, iff the receiver can represent aDictionary as instance"

	^false
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object class >> isClassForName: aName [
	"<Boolean>
	true, iff a proper instance can be created from anObject"

	^false
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object class >> isClassForStream: aStream [
	"<Boolean>
	true, iff the receiver can represent aStream as instance"

	^false
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> isDirect [
	^true
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> isReferencedBy: aCrossReference [
	^false
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> isResolvedPDFObject [
	^true
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> isSameReference: anObject [
	^false
]

{ #category : #'*PDFtalk-Basic Objects-converting' }
Object >> newReference [
	"<Reference on: Object>"
	^(PDF classAt: #Reference) referent: self
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> pdfObject [
	"<Object>
	the direct object"

	^self
]

{ #category : #'*PDFtalk-Basic Objects-writing' }
Object >> pdfSource [
	"<String>
	the object as PDF source"

	| wst |
	wst := PtWriter new.
	self writePDFOn: wst indent: 0.
	^wst contents asString
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> pdfVersion [
	"<Version | nil>
	the minimal version for this object with its features"
	
	^self class pdfVersion
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object class >> pdfVersion [
	"<Version>
	the minimal version for this class with its features"

	^self pdfTypeDefinition pdfVersion
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> readAllRawObjects [
	"read all raw objects (without typing) from the PDF by following all references"

	self unresolvedReferences do: [:ref |
		ref isResolved ifFalse: [
			ref baseObject readAllRawObjects]]
]

{ #category : #'*PDFtalk-Basic Objects-testing' }
Object >> refersTo: aPDFReference [
	^false
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> resolveAllReferences [
	"read all objects from the PDF by following all references"

	self unresolvedReferences do: [:ref |
		ref isResolved ifFalse: [
			ref pdfObject resolveAllReferences]]
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> resolveAllReferencesBreathFirst [
	"read all objects from the PDF by following all references breadth first"

	| referencesToDo |
	referencesToDo := self unresolvedReferences.
	[referencesToDo isEmpty] whileFalse: [
		referencesToDo := referencesToDo inject: Set new into: [:new :ref |
			ref isResolved ifFalse: [
				new addAll: ref pdfObject unresolvedReferences].
			new]]
]

{ #category : #'*PDFtalk-Basic Objects-tracing' }
Object >> tracedReferences: visitedReferences do: oneArgumentBlock [
	"executes oneArgumentBlock with a new unique reference"
	"direct object. No references here"
]

{ #category : #'*PDFtalk-Basic Objects-typing' }
Object >> typed: listOfAttributeTypes [
	"<PDFObject>
	if the receiver can be of any of the listOfAttributeTypes, a specialized copy is returned,
	otherwise the receiver is returned unchanged.
	Non-PDF objects return themselfs"

	(listOfAttributeTypes anySatisfy: #isIndirect) ifTrue: [
		^self errorWrongTypes: listOfAttributeTypes].
	listOfAttributeTypes isEmpty ifTrue: [
		^self].
	listOfAttributeTypes do: [:type |
		(self compliesTo: type) ifTrue: [
			^self]].
	listOfAttributeTypes do: [:type |
		(self asType: type) ifNotNil: [:specialized |
			^specialized]].
	^self errorWrongTypes: listOfAttributeTypes
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> unresolvedReferences [
	"<Array of: Reference>"

	^#()
]

{ #category : #'*PDFtalk-Basic Objects-accessing' }
Object >> unspecifiedAttributes [
	"<Array of: Association>"

	^#()
]

{ #category : #'*PDFtalk-Basic Objects-writing' }
Object >> writePDFOn: aWriter indent: anInteger [
	"write the receiver to the PDF byte stream"

	"do nothing by default"
]

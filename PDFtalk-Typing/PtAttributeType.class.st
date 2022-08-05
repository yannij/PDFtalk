"
A type specified by a pragma in an attribute method.

Used for type checking attribute values and their specialization.
"
Class {
	#name : #PtAttributeType,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#classVars : [
		'TypeClasses'
	],
	#category : #'PDFtalk-Typing'
}

{ #category : #'instance creation' }
PtAttributeType class >> allInMethod: aCompiledMethod [
	"<Array of: AttributeType>
	the declared types in aCompiledMethod"

	| pragmas keywords typePragmas |
	pragmas := Pragma allInMethod: aCompiledMethod.
	keywords := self pragmaKeywords.
	typePragmas := pragmas select: [:pragma | 
		keywords includes: pragma keyword].
	^typePragmas collect: [:pragma |
		(self typeClassAt: pragma keyword) onSymbol: pragma arguments first]
]

{ #category : #'instance creation' }
PtAttributeType class >> onSymbol: aSymbol [
	"<AttributeType>"
	"cheating if there is no type named aSymbol: 
	remembering the missing type name as type.
	Beware when using instances of UndefinedType"

	(PtPDF typeAt: aSymbol) ifNotNil: [:type | ^self onType: type].
	^PtUndefinedType onType: aSymbol
]

{ #category : #'instance creation' }
PtAttributeType class >> onType: aPDFType [

	| inst |
	inst := self new.
	inst initializeType: aPDFType.
	^inst
]

{ #category : #accessing }
PtAttributeType class >> pragmaKeywords [
	"<Set of: Symbol>"

	^self typeClassesAtKey keys
]

{ #category : #accessing }
PtAttributeType class >> typeClassAt: aPragmaKeywod [
	"the Type class corresponding to the pragma keyword"

	^self typeClassesAtKey at: aPragmaKeywod ifAbsent: [PtUndefinedType]
]

{ #category : #accessing }
PtAttributeType class >> typeClassesAtKey [
	"the key is the pragma keyword used in attributes. The value is the specific Type class"

	^TypeClasses ifNil: [
		| dict |
		dict := IdentityDictionary new.
		dict at: #type: put: PtObjectType.
		dict at: #typeArrayOf: put: PtArrayType.
		dict at: #typeDictionaryOf: put: PtDictionaryType.
		dict at: #typeName: put: PtNameType.
		dict at: #typeNameTreeOf: put: PtNameTreeType.
		dict at: #typeIndirect: put: PtIndirectType.
		dict at: #typeDirect: put: PtDirectType.
		TypeClasses := dict]
]

{ #category : #comparing }
PtAttributeType >> = otherAttributeType [
	^self class = otherAttributeType class and: [
	self type = otherAttributeType type]
]

{ #category : #testing }
PtAttributeType >> appliesToReference [
	"is the type applicable to references?"

	^true
]

{ #category : #converting }
PtAttributeType >> asDirectType [
	"<Type>
	derived type suitable for the value of a reference"

	^self
]

{ #category : #converting }
PtAttributeType >> asIndirectType [
	"<Type>
	derived type suitable for the value of a reference"

	^PtIndirectType onType: self type
]

{ #category : #converting }
PtAttributeType >> asObjectType [
	"<Type>
	derived type suitable for direct and indirect values"

	^PtObjectType onType: self type
]

{ #category : #comparing }
PtAttributeType >> hash [
	^self type hash
]

{ #category : #'initialize-release' }
PtAttributeType >> initializeType: aPDFType [
	type := aPDFType
]

{ #category : #testing }
PtAttributeType >> isDirectType [
	^false
]

{ #category : #testing }
PtAttributeType >> isForArray [
	^false
]

{ #category : #testing }
PtAttributeType >> isForDictionary [
	^false
]

{ #category : #testing }
PtAttributeType >> isIndirect [
	^false
]

{ #category : #comparing }
PtAttributeType >> isMoreSpecificThan: anAttributeType [
	self class = anAttributeType class ifFalse: [
		^false].
	^self type isSubtypeOf: anAttributeType type
]

{ #category : #accessing }
PtAttributeType >> name [
	"<String>"

	^self subclassResponsibility
]

{ #category : #printing }
PtAttributeType >> printOn: stream [
	stream nextPutAll: self class name asString, ' onSymbol: ', self type name printString
]

{ #category : #typing }
PtAttributeType >> specializedArray: aPDFArray [
	"<PDFObject | nil>
	exemplar of #type with the content of aPDFArray
	or nil, if #type is no subtype of aPDFArray type"

	^self specializedObject: aPDFArray
]

{ #category : #typing }
PtAttributeType >> specializedDictionary: aPDFDictionary [
	"<PDFObject | nil>
	exemplar of #type with the content of aPDFDictionary
	or nil, if #type is no subtype of aPDFDictionary type"

	^self specializedObject: aPDFDictionary
]

{ #category : #typing }
PtAttributeType >> specializedObject: aPDFObject [
	"<PDFObject | nil>
	instance of #type with the content of aPDFObject
	or nil, if #type is no subclass of aPDFObject class"

	^nil
]

{ #category : #typing }
PtAttributeType >> specializedReference: aReference [
	"<Reference | nil>"

	^nil
]

{ #category : #testing }
PtAttributeType >> specifiesArray: aPDFArray [
	"<Boolean>
	true, if the argument is compatible with the receiver"

	^false
]

{ #category : #testing }
PtAttributeType >> specifiesDictionary: aPDFDictionary [
	"<Boolean>
	true, if the argument is compatible with the receiver"

	^false
]

{ #category : #testing }
PtAttributeType >> specifiesObject: aPDFObject [
	"<Boolean>
	true, if the argument is compatible with the receiver"

	^false
]

{ #category : #testing }
PtAttributeType >> specifiesReference [
	^false
]

{ #category : #testing }
PtAttributeType >> specifiesReference: aPDFReference [
	"<Boolean>
	true, if the argument is compatible with the receiver"

	^false
]

{ #category : #accessing }
PtAttributeType >> type [
	"<Type>
	the object type"

	^type
]

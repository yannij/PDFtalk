"
A resource category defining a resource type and holding instances of it

The implementation dictionary contains the 5 procedures dealing with resources among other things and
a list of all instances of the resource.


From PLRM3-0.pdf 3.9.2 ""Resource Categories"" pp.104:

Resource categories are identified by name. Tables 3.7, 3.8, and 3.9 list the standard
resource categories. Within a given category, every resource instance that resides
in VM is of a particular type and has a particular intended interpretation or
use.

Regular resources are those whose instances are ordinary useful objects, such as
font or halftone dictionaries. For example, a program typically uses the result returned
by findresource as an operand of some other operator, such as scalefont
or sethalftone.

Implicit resources represent some built-in capability of the PostScript interpreter.
For example, the instances of the Filter category are filter names, such as
ASCII85Decode and CCITTFaxDecode, that are passed directly to the filter operator.
For such resources, the findresource operator returns only its name operand.
However, resourceforall and resourcestatus are useful for inquiring about the
availability of capabilities such as specific filter algorithms.
"
Class {
	#name : #PSCategory,
	#superclass : #Object,
	#instVars : [
		'implementation',
		'instances'
	],
	#category : #PostScript
}

{ #category : #instances }
PSCategory class >> Category [
	| dict |
	dict := self genericResource.
	dict at: #DefineResource put: self categoryDefineResource.
	dict at: #FindResource put: self categoryFindResource.
	^self implementing: dict
]

{ #category : #instances }
PSCategory class >> Generic [
	| inst |
	inst := self new.
	inst instances addAll: self genericResource associations.
	^inst
]

{ #category : #instances }
PSCategory class >> ProcSet [
	| dict |
	dict := self genericResource.
	dict at: #FindResource put: self procSetFindResource.
	dict at: #Category put: #ProcSet.
	dict at: #InstanceType put: #dicttype.
	^self implementing: dict
]

{ #category : #operators }
PSCategory class >> categoryDefineResource [
	"key instance category defineresource instance
	Register named resource instance in category"

	^PSBuildIn action: [:ps |
		| category instance key |
		category := ps pop object.
		instance := ps pop.
		key := ps pop object.
		ps push: (ps inCategory: category at: key put: (self implementing: instance))]
]

{ #category : #operators }
PSCategory class >> categoryFindResource [
	"key category findresource instance
	Return resource instance identified by key in category"

	^PSBuildIn action: [:ps | ps push: (ps category: ps pop object at: ps pop object) instances]
]

{ #category : #operators }
PSCategory class >> genericDefineResource [
	"key instance category defineresource instance
	Register named resource instance in category"

	^PSBuildIn action: [:ps |
		| category instance key |
		category := ps pop object.
		instance := ps pop.
		key := ps pop object.
		ps push: (ps inCategory: category at: key put: instance)]
]

{ #category : #operators }
PSCategory class >> genericFindResource [
	"key category findresource instance
	Return resource instance identified by key in category"

	^PSBuildIn action: [:ps | ps push: (ps category: ps pop object at: ps pop object)]
]

{ #category : #accessing }
PSCategory class >> genericResource [
	"<Dictionary>"

	| dict |
	dict := PSDictionary new.
	dict at: #DefineResource put: self genericDefineResource.
	dict at: #UndefineResource put: self genericUndefineResource.
	dict at: #FindResource put: self genericFindResource.
	dict at: #ResourceStatus put: self genericResourceStatus.
	dict at: #ResourceForAll put: self genericResourceForAll.
	^dict
]

{ #category : #operators }
PSCategory class >> genericResourceFileName [
	"scratch key ResourceFileName string
	translates from a resource name to a file name"

	^PSBuildIn action: [:ps |
		| key |
		key := ps pop object.
		ps pop.
		ps push: key asString]
]

{ #category : #operators }
PSCategory class >> genericResourceForAll [
	"template proc scratch category resourceforall –
	Enumerate resource instances in category"

	^PSBuildIn action: [:ps |
		| categoryName scratch proc template category keys |
		categoryName := ps pop object.
		scratch := ps pop.
		proc := ps pop.
		template := ps pop.
		category := ps categoryAt: categoryName.
		keys := category instances keys select: [:key |
			(template copyReplaceAll: '?' with: '#')
				match: (key asString first: scratch size)
				ignoreCase: false].
		[
		keys do: [:key |
			ps push: key.
			proc doIn: ps]] on: PSExitNotification do: [:ex |
				ps executionStack popTill: proc]]
]

{ #category : #operators }
PSCategory class >> genericResourceStatus [
	"key category resourcestatus status size true
							  or false
	Return status of resource instance"

	^PSBuildIn action: [:ps |
		| category resource key |
		category := ps pop object.
		key := ps pop object.
		resource := ps categoryAt: category.
		(resource instances includesKey: key)
			ifTrue: [
			ps push: 0.
			ps push: (resource at: key) size.
			ps push: true]
			ifFalse: [
			ps push: false]]
]

{ #category : #operators }
PSCategory class >> genericUndefineResource [
	"key category undefineresource –
	Remove resource registration"

	^PSBuildIn action: [:ps | ps inCategory: ps pop object removeKey: ps pop object]
]

{ #category : #'instance creation' }
PSCategory class >> implementing: aPSDictionary [
	| inst |
	inst := self new.
	inst initializeImplementation: aPSDictionary.
	^inst
]

{ #category : #accessing }
PSCategory class >> implicitResourceCategories [
	^#(#Filter #ColorSpaceFamily #Emulator #IODevice #ColorRenderingType #FMapType #FontType #FormType #HalftoneType #ImageType #PatternType #FunctionType #ShadingType #TrappingType)
]

{ #category : #'instance creation' }
PSCategory class >> predefined: aCategorySymbol [
	"<Category | nil>"

	(self predefinedResourceCategories includes: aCategorySymbol) ifTrue: [
		^(self respondsTo: aCategorySymbol)
			ifTrue: [self perform: aCategorySymbol]
			ifFalse: [
			| dict |
			dict := self genericResource.
			dict at: #Category put: aCategorySymbol.
			self implementing: dict]].
	^nil
]

{ #category : #accessing }
PSCategory class >> predefinedResourceCategories [
	^self regularResourceCategories , self implicitResourceCategories , self specialResourceCategories
]

{ #category : #operators }
PSCategory class >> procSetFindResource [
	"key category findresource instance
	Return resource instance identified by key in category"

	^PSBuildIn action: [:ps |
		| category key |
		category := ps categoryAt: ps pop object.
		key := ps pop object.
		category at: key ifAbsentPut: [
			| procset |
			procset := (PSProcSet subclasses copyWithout: PSBuildIn)
				detect: [:class |
				class name = key]
				ifNone: [
				ps error: 'ProcSet ' , key printString , ' not found'].
			procset operators].
		ps push: (category at: key)]
]

{ #category : #accessing }
PSCategory class >> regularResourceCategories [
	^#(#Font #CIDFont #CMap #FontSet #Encoding #Form #Pattern #ProcSet #ColorSpace #Halftone #ColorRendering #IdiomSet #InkParams #TrapParams #OutputDevice #ControlLanguage #Localization #PDL #HWOptions)
]

{ #category : #accessing }
PSCategory class >> specialResourceCategories [
	^#(#Category #Generic)
]

{ #category : #accessing }
PSCategory >> at: aSymbol [
	"<Object>"
	
	^self instances at: aSymbol
]

{ #category : #accessing }
PSCategory >> at: aSymbol ifAbsent: aBlock [
	^self instances at: aSymbol ifAbsent: aBlock
]

{ #category : #accessing }
PSCategory >> at: aSymbol ifAbsentPut: aBlock [
	^self instances at: aSymbol ifAbsentPut: aBlock
]

{ #category : #accessing }
PSCategory >> at: aSymbol put: anObject [
	"<Object>"
	
	^self instances at: aSymbol put: anObject
]

{ #category : #accessing }
PSCategory >> implementation [
	"<Dictionary key: Symbol value: (Procedure | Object)>"

	^implementation ifNil: [implementation := PSDictionary new]
]

{ #category : #actions }
PSCategory >> in: anInterpreter withImplementationDo: aZeroArgumentBlock [
	anInterpreter dictionaryStack push: self implementation.
	[aZeroArgumentBlock value] ensure: [anInterpreter dictionaryStack pop]
]

{ #category : #'initialize-release' }
PSCategory >> initializeImplementation: aPSDictionary [
	implementation := nil.
	self implementation addAll: aPSDictionary associations
]

{ #category : #accessing }
PSCategory >> instances [
	"<Dictionary key: Symbol value: Object>
	named instances"

	^instances ifNil: [instances := PSDictionary new]
]

{ #category : #accessing }
PSCategory >> name [
	"<String>"

	^self implementation at: #Category ifAbsent: [
		self instances keyAtValue: self ifAbsent: ['-']]
]

{ #category : #printing }
PSCategory >> printOn: aStream [
	aStream
		nextPutAll: self class name asString;
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $)
]

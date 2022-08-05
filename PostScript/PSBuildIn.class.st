"
build-in operations
"
Class {
	#name : #PSBuildIn,
	#superclass : #PSProcSet,
	#category : #PostScript
}

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> abs [
	"num1 abs num2
	Return absolute value of num1"

	<operator>
	^self action: [:ps | ps push: ps pop abs]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> add [
	"num1 num2 add sum
	Return num1 plus num2"

	<operator>
	^self action: [:ps | ps push: ps pop + ps pop]
]

{ #category : #Array }
PSBuildIn class >> aload [
	"array aload any0 … anyn-1 array
	Push all elements of array on stack"

	<operator>
	^self action: [:ps |
		| array |
		array := ps pop.
		array do: [:value | ps push: value].
		ps push: array]
]

{ #category : #String }
PSBuildIn class >> anchorsearch [
	"string seek anchorsearch post match true
				         	 or string false
	Search for seek at start of string"

	<operator>
	^self action: [:ps |
		| seek string |
		seek := ps pop.
		string := ps pop.
		(string copyFrom: 1 to: seek size) = seek
			ifTrue: [
			ps push: (string allButFirst: seek size).
			ps push: seek.
			ps push: true]
			ifFalse: [
			ps push: string.
			ps push: false]]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> and [
	"bool1|int1 bool2|int2 and bool3|int3
	Perform logical|bitwise and"

	<operator>
	^self action: [:ps | ps push: (ps pop postScriptAnd: ps pop)]
]

{ #category : #Array }
PSBuildIn class >> array [
	"int array array
	Create array of length int"

	<operator>
	^self action: [:ps | ps push: (Array new: ps pop)]
]

{ #category : #Array }
PSBuildIn class >> astore [
	"any0 … anyn-1 array astore array
	Pop elements from stack into array"

	<operator>
	^self action: [:ps |
		| array values |
		array := ps pop.
		values := (1 to: array size) collect: [:i | ps pop].
		(1 to: array size) with: values reverse do: [:i :value | array at: i put: value].
		ps push: array]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> atan [
	"num den atan angle
	Return arctangent of num/den in degrees"

	<operator>
	^self action: [:ps |
		| den num |
		den := ps pop.
		num := ps pop.
		ps push: (den isZero
			ifTrue: [
			num positive
				ifTrue: [90]
				ifFalse: [270]]
			ifFalse: [
			(num / den) arcTan radiansToDegrees])]
]

{ #category : #Dictionary }
PSBuildIn class >> begin [
	"dict begin – 
	Push dict on dictionary stack"

	<operator>
	^self action: [:ps | ps dictionaryStack push: ps pop]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> bitshift [
	"int1 shift bitshift int2
	Perform bitwise shift of int1 (positive is left)"

	<operator>
	^self action: [:ps |
		| shift |
		shift := ps pop.
		ps push: (ps pop bitShift: shift)]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> ceiling [
	"num1 ceiling num2
	Return ceiling of num1"

	<operator>
	^self action: [:ps | ps push: ps pop ceiling]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> clear [
	"|| any1 … anyn < clear || <
	Discard all elements"

	<operator>
	^self action: [:ps | ps clear]
]

{ #category : #Dictionary }
PSBuildIn class >> cleardictstack [
	"– cleardictstack –
	Pop all nonpermanent dictionaries off dictionary stack"

	<operator>
	^self action: [:ps | [ps dictionaryStack size <= 3] whileFalse: [ps dictionaryStack pop]]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> cleartomark [
	"mark obj1 … objn cleartomark – 
	Discard elements down through mark"

	<operator>
	^self action: [:ps |
		[
		[ps stack top = PSMark new] whileFalse: [ps pop].
		ps pop.
		ps unmark] on: PSStackunderflow do: [:ex |
				ex resignalAs: PSUnmatchedmark new]]
]

{ #category : #Collections }
PSBuildIn class >> copyAction [
	<operator: #copy>
	^self action: [:ps | ps pop copyFor: ps]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> cos [
	"angle cos real
	Return cosine of angle degrees"

	<operator>
	^self action: [:ps | ps push: ps pop asDouble degreesToRadians cos]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> count [
	"any1 … anyn count any1 … anyn n
	Count elements on stack"

	<operator>
	^self action: [:ps | ps push: ps stack size]
]

{ #category : #Dictionary }
PSBuildIn class >> countdictstack [
	"– countdictstack int
	Count elements on dictionary stack"

	<operator>
	^self action: [:ps | ps push: ps dictionaryStack size]
]

{ #category : #Control }
PSBuildIn class >> countexecstack [
	"– countexecstack int
	Count elements on execution stack"

	<operator>
	^self action: [:ps | ps push: ps executionStack size]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> counttomark [
	"mark obj1 … objn counttomark mark obj1 … objn n
	Count elements down to mark"

	<operator>
	^self action: [:ps |
		| index |
		index := ps stack indexOf: PSMark new.
		index isZero ifTrue: [
			^PSUnmatchedmark raiseSignal].
		ps push: index - 1]
]

{ #category : #Dictionary }
PSBuildIn class >> currentdict [
	"– currentdict dict
	Return current dictionary"

	<operator>
	^self action: [:ps | ps push: ps dictionaryStack top]
]

{ #category : #Miscellaneous }
PSBuildIn class >> currentglobal [
	"– currentglobal bool
	Return current VM allocation mode"

	<operator>
	^self action: [:ps | ps push: ps global]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvi [
	"num|string cvi int
	Convert to integer"

	<operator>
	^self action: [:ps | ps push: ps pop asPostScriptInteger]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvlit [
	"any cvlit any
	Make object literal"

	<operator>
	^self action: [:ps | ps push: ps pop asPostScriptLiteral]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvn [
	"string cvn name
	Convert to name"

	<operator>
	^self action: [:ps | ps push: ps pop asPostScripName]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvr [
	"num|string cvr real
	Convert to real"

	<operator>
	^self action: [:ps | ps push: ps pop asPostScriptReal]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvrs [
	"num radix string cvrs substring
	Convert with radix to string
	
	If string is too small to hold the result, a rangcheck error should be thrown.
	I dont do that..."

	<operator>
	^self action: [:ps |
		| radix num |
		ps pop.
		radix := ps pop.
		num := ps pop.
		ps push: (radix = 10
			ifTrue: [num asPostScriptString]
			ifFalse: [
			num truncated printPostScriptRadix: radix])]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvs [
	"any string cvs substring
	Convert to string
	
	If string is too small to hold the result, a rangcheck error should be thrown.
	I dont do that..."

	<operator>
	^self action: [:ps |
		ps pop.
		ps push: ps pop asPostScriptString]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> cvx [
	"any cvx any
	Make object executable"

	<operator>
	^self action: [:ps | ps push: ps pop asPostScriptExecutable]
]

{ #category : #Dictionary }
PSBuildIn class >> def [
	"key value def – 
	Associate key and value in current dictionary"

	<operator>
	^self action: [:ps |
		| value literalName |
		value := ps pop.
		literalName := ps pop.
		ps dictionaryStack top at: literalName object put: value]
]

{ #category : #Resource }
PSBuildIn class >> definefont [
	"key font definefont font
	Register named resource instance in category"

	<operator>
	^'/Font defineresource' asProcedure
]

{ #category : #Resource }
PSBuildIn class >> defineresource [
	"key instance category defineresource instance
	Register named resource instance in category"

	<operator>
	^self action: [:ps |
		(ps categoryAt: ps stack top object) in: ps withImplementationDo: [
			#DefineResource processIn: ps]]
]

{ #category : #Dictionary }
PSBuildIn class >> dict [
	"int dict dict
	creates an empty dictionary with an initial capacity of int elements and pushes the
	created dictionary object on the operand stack.
	int is expected to be a nonnegative integer."

	<operator>
	^self action: [:ps | ps push: (PSDictionary new: ps pop)]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> div [
	"num1 num2 div quotient
	Return num1 divided by num2"

	<operator>
	^self action: [:ps |
		| div |
		div := ps pop.
		ps push: ps pop / div]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> dup [
	"any dup any any
	Duplicate top element"

	<operator>
	^self action: [:ps | ps push: ps stack top]
]

{ #category : #Dictionary }
PSBuildIn class >> end [
	"– end –
	Pop current dictionary off dictionary stack"

	<operator>
	^self action: [:ps | ps dictionaryStack pop]
]

{ #category : #Array }
PSBuildIn class >> endArray [
	"mark obj0 … objn-1 ] array
	End array construction"

	<operator: #']'>
	^self action: [:ps |
		ps push: ps popTillMark reverse asArray.
		ps trace: ps stack top]
]

{ #category : #Dictionary }
PSBuildIn class >> endDictionary [
	"mark key1 value1 … keyn valuen >> dict
	End dictionary construction"

	<operator: #>> >
	^self action: [:ps |
		| dict rst |
		dict := PSDictionary new.
		rst := ps popTillMark reverse readStream.
		[rst atEnd] whileFalse: [dict at: rst next object put: rst next].
		ps push: dict.
		ps trace: ps stack top]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> eq [
	"any1 any2 eq bool
	Test equal"

	<operator>
	^self action: [:ps | ps push: (ps pop postScriptEqual: ps pop)]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> exch [
	"any1 any2 exch any2 any1
	Exchange top two elements"

	<operator>
	^self action: [:ps |
		| v1 v2 |
		v1 := ps pop.
		v2 := ps pop.
		ps push: v1.
		ps push: v2]
]

{ #category : #Control }
PSBuildIn class >> exec [
	"any exec –
	Execute arbitrary object"

	<operator>
	^self action: [:ps | ps pop doIn: ps]
]

{ #category : #Control }
PSBuildIn class >> execstack [
	"array execstack subarray
	Copy execution stack into array"

	<operator>
	^self action: [:ps |
		| array |
		array := ps pop.
		1 to: (array size min: ps executionStack size) do: [:i |
			array at: i put: (ps executionStack at: i)].
		ps push: array reverse]
]

{ #category : #'Type, Attribute, and Conversion todo' }
PSBuildIn class >> executeonly [
	"array|packedarray|file|string executeonly array|packedarray|file|string
	Reduce access to execute-only"

	<operator>
	^self notImplemented
]

{ #category : #Control }
PSBuildIn class >> exit [
	"– exit –
	Exit innermost active loop"

	<operator>
	^self action: [:ps | PSExitNotification raiseSignal]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> exp [
	"base exponent exp real
	Raise base to exponent power"

	<operator>
	^self action: [:ps |
		| base exponent |
		exponent := ps pop.
		base := ps pop.
		ps push: (base raisedTo: exponent)]
]

{ #category : #Resource }
PSBuildIn class >> findfont [
	"key findfont (font | cidfont)
	Return resource instance identified by key in category"

	<operator>
	^'/Font findresource' asProcedure
]

{ #category : #Resource }
PSBuildIn class >> findresource [
	"key category findresource instance
	Return resource instance identified by key in category"

	<operator>
	^self action: [:ps |
		(ps categoryAt: ps stack top object) in: ps withImplementationDo: [
			#FindResource processIn: ps]]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> floor [
	"num1 floor num2
	Return floor of num1"

	<operator>
	^self action: [:ps | ps push: ps pop floor]
]

{ #category : #Control }
PSBuildIn class >> for [
	"initial increment limit proc for –
	Execute proc with values from initial by steps of increment to limit"

	<operator>
	^self action: [:ps |
		| proc limit increment |
		proc := ps pop.
		limit := ps pop.
		increment := ps pop.
		[
		(ps pop to: limit by: increment) do: [:i |
			ps push: i.
			proc doIn: ps]] on: PSExitNotification do: [:ex |
				ps executionStack popTill: proc]]
]

{ #category : #Collections }
PSBuildIn class >> forall [
	"array proc forall –
	Execute proc for each element of array"

	<operator>
	^self action: [:ps |
		| proc |
		proc := ps pop.
		[ps pop forAllDo: proc for: ps] on: PSExitNotification do: [:ex | ps executionStack popTill: proc]]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> ge [
	"num1|str1 num2|str2 ge bool
	Test greater than or equal"

	<operator>
	^self action: [:ps |
		| value2 |
		value2 := ps pop.
		ps push: (ps pop postScriptGreaterEqual: value2)]
]

{ #category : #Collections }
PSBuildIn class >> get [
	"array index get any
	Return array element indexed by index"

	<operator>
	^self action: [:ps |
		| index |
		index := ps pop.
		ps push: (ps pop get: index for: ps)]
]

{ #category : #Collections }
PSBuildIn class >> getinterval [
	"array index count getinterval subarray
	Return subarray of array starting at index for count elements"

	<operator>
	^self action: [:ps |
		| count index |
		count := ps pop.
		index := ps pop.
		ps push: (ps pop copyFrom: index + 1 to: index + count)]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> gt [
	"num1|str1 num2|str2 gt bool
	Test greater than"

	<operator>
	^self action: [:ps |
		| value2 |
		value2 := ps pop.
		ps push: (ps pop postScriptGreaterThan: value2)]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> idiv [
	"int1 int2 idiv quotient
	Return int1 divided by int2"

	<operator>
	^self action: [:ps |
		| div |
		div := ps pop.
		ps push: (ps pop / div) truncated]
]

{ #category : #Control }
PSBuildIn class >> if [
	"bool proc if –
	Execute proc if bool is true"

	<operator>
	^self action: [:ps |
		| proc |
		proc := ps pop.
		ps pop ifTrue: [
			proc doIn: ps]]
]

{ #category : #Control }
PSBuildIn class >> ifelse [
	"bool proc1 proc2 ifelse –
	Execute proc1 if bool is true, proc2 if false"

	<operator>
	^self action: [:ps |
		| proc1 proc2 |
		proc2 := ps pop.
		proc1 := ps pop.
		ps pop
			ifTrue: [proc1 doIn: ps]
			ifFalse: [proc2 doIn: ps]]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> index [
	"anyn … any0 n index anyn … any0 anyn
	Duplicate arbitrary element"

	<operator>
	^self action: [:ps | ps push: (ps stack at: ps pop)]
]

{ #category : #Dictionary }
PSBuildIn class >> known [
	"dict key known bool
	Test whether key is in dict"

	<operator>
	^self action: [:ps |
		| key |
		key := ps pop.
		ps push: (ps pop includesKey: key)]
]

{ #category : #Miscellaneous }
PSBuildIn class >> languagelevel [
	"– languagelevel int
	Return LanguageLevel"

	<operator>
	^'3' asProcedure
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> le [
	"num1|str1 num2|str2 le bool
	Test less than or equal"

	<operator>
	^self action: [:ps |
		| value2 |
		value2 := ps pop.
		ps push: (ps pop postScriptLessEqual: value2)]
]

{ #category : #Collections }
PSBuildIn class >> length [
	"array length int
	Return number of elements in array"

	<operator>
	^self action: [:ps | ps push: ps pop size]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> ln [
	"num ln real
	Return natural logarithm (base e)"

	<operator>
	^self action: [:ps | ps push: ps pop asDouble ln]
]

{ #category : #Dictionary }
PSBuildIn class >> load [
	"key load value
	Search dictionary stack for key and return associated value"

	<operator>
	^self action: [:ps | ps push: (ps valueAt: ps pop object)]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> log [
	"num log real
	Return common logarithm (base 10)"

	<operator>
	^self action: [:ps | ps push: ps pop asDouble log]
]

{ #category : #Control }
PSBuildIn class >> loop [
	"proc loop –
	Execute proc an indefinite number of times"

	<operator>
	^self action: [:ps |
		| proc |
		proc := ps pop.
		[[proc doIn: ps] repeat] on: PSExitNotification do: [:ex | ps executionStack popTill: proc]]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> lt [
	"num1|str1 num2|str2 lt bool
	Test less than"

	<operator>
	^self action: [:ps |
		| value2 |
		value2 := ps pop.
		ps push: (ps pop postScriptLessThan: value2)]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> mark [
	"– mark mark
	Push mark on stack"

	<operator>
	^self action: [:ps | ps mark]
]

{ #category : #Dictionary }
PSBuildIn class >> maxlength [
	"dict maxlength int
	Return current capacity of dict"

	<operator>
	^self action: [:ps | ps push: ps pop basicSize]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> mod [
	"int1 int2 mod remainder
	Return remainder after dividing int1 by int2"

	<operator>
	^self action: [:ps |
		| div |
		div := ps pop.
		ps push: (ps pop rem: div)]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> mul [
	"num1 num2 mul product
	Return num1 times num2"

	<operator>
	^self action: [:ps | ps push: ps pop * ps pop]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> ne [
	"any1 any2 ne bool
	Test not equal"

	<operator>
	^self action: [:ps | ps push: (ps pop postScriptEqual: ps pop) not]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> neg [
	"num1 neg num2
	Return negative of num1"

	<operator>
	^self action: [:ps | ps push: ps pop negated]
]

{ #category : #'Type, Attribute, and Conversion todo' }
PSBuildIn class >> noaccess [
	"array|packedarray|dict|file|string noaccess array|packedarray|dict|file|string
	Disallow any access"

	<operator>
	^self notImplemented
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> not [
	"bool1|int1 not bool2|int2
	Perform logical|bitwise not"

	<operator>
	^self action: [:ps | ps push: ps pop postScriptNot]
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> or [
	"bool1|int1 bool2|int2 or bool3|int3
	Perform logical|bitwise inclusive or"

	<operator>
	^self action: [:ps | ps push: (ps pop postScriptOr: ps pop)]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> pop [
	"any pop –
	Discard top element"

	<operator>
	^self action: [:ps | ps pop]
]

{ #category : #Miscellaneous }
PSBuildIn class >> product [
	"– product string
	Return product name"

	<operator>
	^'(PDFtalk PostScript)' asProcedure
]

{ #category : #Collections }
PSBuildIn class >> put [
	"array index any put –
	Put any into array at index"

	<operator>
	^self action: [:ps |
		| any index |
		any := ps pop.
		index := ps pop.
		ps pop put: any at: index]
]

{ #category : #Collections }
PSBuildIn class >> putinterval [
	"array1 index array2|packedarray2 putinterval –
	Replace subarray of array1 starting at index by array2|packedarray2"

	<operator>
	^self action: [:ps |
		| array2 index array1 |
		array2 := ps pop.
		index := ps pop.
		array1 := ps pop.
		array2 inject: index + 1 into: [:i :value |
			array1 at: i put: value.
			i + 1]]
]

{ #category : #Control }
PSBuildIn class >> quit [
	"– quit –
	Terminate interpreter"

	<operator>
	^self notImplemented
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> rand [
	"– rand int
	Generate pseudo-random integer.
	Returns a random integer in the range 0 to 2^31 - 1, produced by a pseudo-random number generator.
	The random number generator’s state can be reset by srand and interrogated by rrand."

	<operator>
	^self action: [:ps | ps push: (ps random next * ((2 raisedTo: 31) - 1)) rounded]
]

{ #category : #'Type, Attribute, and Conversion todo' }
PSBuildIn class >> rcheck [
	"array|packedarray|dict|file|string rcheck bool
	Test read access"

	<operator>
	^self notImplemented
]

{ #category : #'Type, Attribute, and Conversion todo' }
PSBuildIn class >> readonly [
	"array|packedarray|dict|file|string readonly array|packedarray|dict|file|string
	Reduce access to read-only"

	<operator>
	^self notImplemented
]

{ #category : #Miscellaneous }
PSBuildIn class >> realtime [
	"– realtime int
	Return real time in milliseconds"

	<operator>
	^self action: [:ps | ps push: Time now asMilliseconds]
]

{ #category : #Control }
PSBuildIn class >> repeatAction [
	"int proc repeat –
	Execute proc int times"
	"could not use #repeat as method, since Gemstone does not allow to define #repeat (!)"

	<operator: #repeat>
	^self action: [:ps |
		| proc |
		proc := ps pop.
		[ps pop timesRepeat: [proc doIn: ps]] on: PSExitNotification do: [:ex |
			ps executionStack popTill: proc]]
]

{ #category : #Resource }
PSBuildIn class >> resourceforall [
	"template proc scratch category resourceforall –
	Enumerate resource instances in category"

	<operator>
	^self action: [:ps |
		(ps categoryAt: ps stack top object) in: ps withImplementationDo: [
			#ResourceForAll processIn: ps]]
]

{ #category : #Resource }
PSBuildIn class >> resourcestatus [
	"key category resourcestatus status size true
							  or false
	Return status of resource instance"

	<operator>
	^self action: [:ps |
		(ps categoryAt: ps stack top object) in: ps withImplementationDo: [
			#ResourceStatus processIn: ps]]
]

{ #category : #Miscellaneous }
PSBuildIn class >> revision [
	"– revision int
	Return product revision level"

	<operator>
	^self action: [:ps | ps push: (ps version tokensBasedOn: $.) last asNumber]
]

{ #category : #'Operand Stack Manipulation' }
PSBuildIn class >> roll [
	"anyn-1 … any0 n j roll any(j-1) mod n … any0 anyn-1 … anyj mod n
	Roll n elements up j times"

	<operator>
	^self action: [:ps |
		| shifts elements |
		shifts := ps pop.
		elements := OrderedCollection new.
		ps pop timesRepeat: [elements add: ps pop].
		shifts positive
			ifTrue: [
			shifts timesRepeat: [elements addLast: elements removeFirst]]
			ifFalse: [
			shifts negated timesRepeat: [elements addFirst: elements removeLast]].
		elements reverseDo: [:element | ps push: element]]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> round [
	"num1 round num2
	Round num1 to nearest integer"

	<operator>
	^self action: [:ps | ps push: ps pop rounded]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> rrand [
	"– rrand int
	Return random number seed"

	<operator>
	^self action: [:ps | ps push: ps random seed]
]

{ #category : #String }
PSBuildIn class >> search [
	"string seek search post match pre true
				       or string false
	Search for seek in string"

	<operator>
	^self action: [:ps |
		| seek string rst pre post |
		seek := ps pop.
		string := ps pop.
		rst := string readStream.
		pre := rst upToAll: seek.
		rst atEnd
			ifTrue: [
			ps push: string.
			ps push: false]
			ifFalse: [
			rst next: seek size.
			post := rst upToEnd.
			ps push: post.
			ps push: seek.
			ps push: pre.
			ps push: true]]
]

{ #category : #Miscellaneous }
PSBuildIn class >> serialnumber [
	"– serialnumber int
	Return machine serial number"

	<operator>
	^'1' asProcedure
]

{ #category : #Miscellaneous }
PSBuildIn class >> setglobal [
	"bool setglobal –
	Set VM allocation mode (false = local, true = global)"

	<operator>
	^self action: [:ps | ps global: ps pop]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> sin [
	"angle sin real
	Return sin of angle degrees"

	<operator>
	^self action: [:ps | ps push: ps pop asDouble degreesToRadians sin]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> sqrt [
	"num sqrt real
	Return square root of num"

	<operator>
	^self action: [:ps | ps push: ps pop asDouble sqrt]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> srand [
	"int srand –
	Set random number seed"

	<operator>
	^self action: [:ps | ps random seed: ps pop]
]

{ #category : #Array }
PSBuildIn class >> startArray [
	"– [ mark
	Start array construction"

	<operator: #'['>
	^'mark' asProcedure
]

{ #category : #Dictionary }
PSBuildIn class >> startDictionary [
	"– << mark
	Start dictionary construction"

	<operator: #<< >
	^self action: [:ps | ps mark]
]

{ #category : #Control }
PSBuildIn class >> stop [
	"– stop –
	Terminate stopped context"

	<operator>
	^self action: [:ps | PSStopNotification raiseSignal]
]

{ #category : #Control }
PSBuildIn class >> stopped [
	"any stopped bool
	Establish context for catching stop"

	<operator>
	^self action: [:ps |
		| proc stopped |
		proc := ps pop.
		stopped := [
		proc doIn: ps.
		false] on: PSStopNotification do: [:ex |
				ps executionStack popTill: proc.
				ex return: true].
		ps push: stopped]
]

{ #category : #Dictionary }
PSBuildIn class >> store [
	"key value store –
	Replace topmost definition of key"

	<operator>
	^self action: [:ps |
		| value key dict |
		value := ps pop.
		key := ps pop object.
		dict := ps dictionaryStack objects detect: [:dict1 | dict1 includesKey: key] ifNone: [
			ps dictionaryStack top].
		dict at: key put: value]
]

{ #category : #String }
PSBuildIn class >> string [
	"int string string
	Create string of length int"

	<operator>
	^self action: [:ps | ps push: (String new: ps pop withAll: 0 asCharacter)]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> sub [
	"num1 num2 sub difference
	Return num1 minus num2"

	<operator>
	^self action: [:ps |
		| sub |
		sub := ps pop.
		ps push: ps pop - sub]
]

{ #category : #String }
PSBuildIn class >> token [
	"string token post any true
			     or false
	Read token from start of string"

	<operator>
	^self action: [:ps |
		| scanner |
		scanner := PSScanner on: ps pop.
		([scanner nextPostScriptObject] on: PSEndOfTokenStreamNotification do: [:ex | ex return: nil])
			ifNotNil: [:object |
			scanner readWhitespace.
			ps push: scanner upToEnd.
			ps push: object.
			ps push: true]
			ifNil: [
			ps push: false]]
]

{ #category : #'Arithmetic and Math' }
PSBuildIn class >> truncate [
	"num1 truncate num2
	Remove fractional part of num1"

	<operator>
	^self action: [:ps | ps push: ps pop truncated]
]

{ #category : #'Type, Attribute, and Conversion' }
PSBuildIn class >> type [
	"any type name
	Return type of any"

	<operator>
	^self action: [:ps | ps push: ps pop postScriptType]
]

{ #category : #Dictionary }
PSBuildIn class >> undef [
	"dict key undef –
	Remove key and its value from dict"

	<operator>
	^self action: [:ps |
		| key |
		key := ps pop object.
		ps pop removeKey: key]
]

{ #category : #Resource }
PSBuildIn class >> undefinefont [
	"key undefinefont –
	Remove resource registration"

	<operator>
	^'/Font undefineresource' asProcedure
]

{ #category : #Resource }
PSBuildIn class >> undefineresource [
	"key category undefineresource –
	Remove resource registration"

	<operator>
	^self action: [:ps |
		(ps categoryAt: ps stack top object) in: ps withImplementationDo: [
			#UndefineResource processIn: ps]]
]

{ #category : #Miscellaneous }
PSBuildIn class >> usertime [
	"– usertime int
	Return execution time in milliseconds"

	<operator>
	^self action: [:ps | ps push: Time now asMilliseconds]
]

{ #category : #Miscellaneous }
PSBuildIn class >> version [
	"– version string
	Return interpreter version"

	<operator>
	^self action: [:ps | ps push: ps version]
]

{ #category : #'Type, Attribute, and Conversion todo' }
PSBuildIn class >> wcheck [
	"array|packedarray|dict|file|string wcheck bool
	Test write access"

	<operator>
	^self notImplemented
]

{ #category : #Dictionary }
PSBuildIn class >> where [
	"key where dict true
			or false
	Find dictionary in which key is defined"

	<operator>
	^self action: [:ps |
		| key |
		key := ps pop object.
		(ps dictionaryWith: key)
			ifNotNil: [:dict |
			ps push: dict.
			ps push: true]
			ifNil: [
			ps push: false]]
]

{ #category : #'Type, Attribute, and Conversion todo' }
PSBuildIn class >> xcheck [
	"any xcheck bool
	Test executable attribute"

	<operator>
	^self notImplemented
]

{ #category : #'Relational, Boolean, and Bitwise' }
PSBuildIn class >> xor [
	"bool1|int1 bool2|int2 xor bool3|int3
	Perform logical|bitwise exclusive or"

	<operator>
	^self action: [:ps | ps push: (ps pop postScriptXor: ps pop)]
]

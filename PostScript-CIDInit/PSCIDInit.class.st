"
Building a Type 0 CIDFont or a CMap dictionary

References
5014.CIDFont_Spec.pdf	Adobe Technical Note #5014: ""Adobe CMap and CIDFont Files Specification"" 11 June 1993
5411.ToUnicode.pdf		Adobe Technical Note #5411: ""ToUnicode Mapping File Tutorial"" May 29, 2003
"
Class {
	#name : #PSCIDInit,
	#superclass : #PSProcSet,
	#category : #'PostScript-CIDInit'
}

{ #category : #'Characters as selectors' }
PSCIDInit class >> beginbfchar [
	"int beginbfchar -
	begin specifies one base font glyph"

	<operator>
	^self action: [:ps |
		ps propertyAt: #bfcharCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #'Characters as selectors' }
PSCIDInit class >> beginbfrange [
	"int beginbfrange -
	begin specifies range of base font glyphs"

	<operator>
	^self action: [:ps |
		ps propertyAt: #bfrangeCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #'Character IDs as selectors' }
PSCIDInit class >> begincidchar [
	"int begincidchar -
	begin specifies one CIDFont character"

	<operator>
	^self action: [:ps |
		ps propertyAt: #cidcharCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #'Character IDs as selectors' }
PSCIDInit class >> begincidrange [
	"int begincidrange -
	begin specifies range of CIDFont characters"

	<operator>
	^self action: [:ps |
		ps propertyAt: #cidrangeCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #General }
PSCIDInit class >> begincmap [
	"- begincmap -
	begin a CMap definition"

	<operator>
	^self action: [:ps |
		ps propertyAt: #cmap ifPresent: [
			self error: '/begincmap must not occur after another /begincmap'].
		ps propertyAt: #cmap put: true]
]

{ #category : #General }
PSCIDInit class >> begincodespacerange [
	"int begincodespacerange -
	begin set valid input codes"

	<operator>
	^self action: [:ps |
		ps propertyAt: #codespacerangeCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #notdef }
PSCIDInit class >> beginnotdefchar [
	"int beginnotdefchar -
	begin specifies one notdef character"

	<operator>
	^self action: [:ps |
		ps propertyAt: #notdefcharCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #notdef }
PSCIDInit class >> beginnotdefrange [
	"int beginnotdefrange -
	begin specifies range of notdef characters"

	<operator>
	^self action: [:ps |
		ps propertyAt: #notdefrangeCount put: ps pop.
		ps mark.
		ps scanner takeHexAsCode]
]

{ #category : #'Rearranged font' }
PSCIDInit class >> beginrearrangedfont [
	"/newFontName [component fonts array] beginrearrangedfont -
	identifies fonts used in rearrangement"

	<operator>
	^self action: [:ps |
		| fonts |
		ps propertyAt: #rearrangedfont ifPresent: [
			self error: '/beginrearrangedfont must not occur after another /beginrearrangedfont'].
		ps propertyAt: #rearrangedfont put: true.
		ps dictionaryStack push: PSDictionary new.
		fonts := ps pop.
		ps dictionaryStack top at: #name put: ps pop object.
		ps dictionaryStack top at: #fonts put: fonts]
]

{ #category : #'Rearranged font' }
PSCIDInit class >> beginusematrix [
	"fontID beginusematrix -
	begin transformation matrix to use with font"

	<operator>
	^self action: [:ps |
		| fonts fontname fontDict |
		fonts := ps dictionaryStack top at: #fonts ifAbsent: [
			"clean old font dict off the dict stack"
			ps dictionaryStack pop.
			ps dictionaryStack top at: #fonts].
		fontname := (fonts at: ps pop) object.
		fontDict := ps dictionaryStack top at: fontname ifAbsentPut: [
			PSDictionary with: #name -> fontname].
		ps dictionaryStack push: fontDict]
]

{ #category : #'Characters as selectors' }
PSCIDInit class >> endbfchar [
	"srcCode dstCode endbfchar -
	or
	srcCode dstCharname endbfchar -
	end specifies one base font glyph"

	<operator>
	^self action: [:ps | ps addPairsAt: #bfchar]
]

{ #category : #'Characters as selectors' }
PSCIDInit class >> endbfrange [
	"srcCodeLo srcCodeHi dstCodeLo endbfrange -
	or
	srcCodeLo srcCodeHi [dstCharname1 ... dstCharnameN] endbfrange -
	end specifies range of base font glyphs"

	<operator>
	^self action: [:ps | ps addTriplesAt: #bfrange]
]

{ #category : #'Character IDs as selectors' }
PSCIDInit class >> endcidchar [
	"srcCode dstCID endcidchar -
	end specifies one CIDFont character"

	<operator>
	^self action: [:ps | ps addPairsAt: #cidchar]
]

{ #category : #'Character IDs as selectors' }
PSCIDInit class >> endcidrange [
	"srcCodeLo srcCodeHi dstCIDLo endcidrange -
	end specifies range of CIDFont characters"

	<operator>
	^self action: [:ps | ps addTriplesAt: #cidrange]
]

{ #category : #General }
PSCIDInit class >> endcmap [
	"- endcmap -
	end a CMap definition"

	<operator>
	^self action: [:ps |
		ps propertyRemove: #cmap ifAbsent: [
			self error: '/endcmap must occur after /begincmap']]
]

{ #category : #General }
PSCIDInit class >> endcodespacerange [
	"srcCode1 srcCode2 endcodespacerange -
	end set valid input codes"
	"The codespace ranges in the CMap specify how many bytes are extracted from the string for each successive character code. A codespace range shall be specified by a pair of codes of some particular length giving the lower and upper bounds of that range. A code shall be considered to match the range if it is the same length as the bounding codes and the value of each of its bytes lies between the corresponding bytes of the lower and upper bounds. The code length shall not be greater than 4"

	<operator>
	^self action: [:ps |
		| ranges dict |
		ranges := (ps tuples: #codespacerange size: 2) collect: [:tuple | tuple first to: tuple last].
		dict := ps dictionaryStack top.
		dict at: #codespacerange put: (dict at: #codespacerange ifAbsent: [#()]) , ranges asArray.
		ps scanner takeHexAsString]
]

{ #category : #notdef }
PSCIDInit class >> endnotdefchar [
	"srcCode dstCID endnotdefchar -
	end specifies one notdef character"

	<operator>
	^self action: [:ps | ps addPairsAt: #notdefchar]
]

{ #category : #notdef }
PSCIDInit class >> endnotdefrange [
	"srcCodeLo srcCodeHi dstCIDLo endnotdefrange -
	end specifies range of notdef characters"

	<operator>
	^self action: [:ps | ps addTriplesAt: #notdefrange]
]

{ #category : #'Rearranged font' }
PSCIDInit class >> endrearrangedfont [
	"- endrearrangedfont -
	font built on an existing template"

	<operator>
	^self action: [:ps |
		| fontDict |
		ps propertyRemove: #rearrangedfont ifAbsent: [
			self error: '/endrearrangedfont must occur after /beginrearrangedfont'].
		ps dictionaryStack top at: #fonts ifAbsent: [ps dictionaryStack pop].
		fontDict := ps dictionaryStack pop.
		ps inCategory: #Font at: (fontDict at: #name) put: fontDict]
]

{ #category : #'Rearranged font' }
PSCIDInit class >> endusematrix [
	"[a b c d tx ty] endusematrix -
	end transformation matrix to use with font"

	<operator>
	^self action: [:ps |
		ps dictionaryStack top at: #usematrix put: ps pop.
		ps dictionaryStack pop]
]

{ #category : #General }
PSCIDInit class >> usecmap [
	"/CMapName usecmap -
	use another CMap's VM resource"

	<operator>
	^self action: [:ps |
		| cmap |
		ps run: '/CMap findresource'.
		cmap := ps pop.
		#(#codespacerange #bfchar #bfrange #cidchar #cidrange #notdefchar #notdefrange) do: [:key |
			cmap at: key ifPresent: [:value | ps dictionaryStack top at: key put: value copy]]]
]

{ #category : #'Rearranged font' }
PSCIDInit class >> usefont [
	"fontID usecmap -
	specifies font used subsequently"

	<operator>
	^self action: [:ps |
		| fonts fontname fontDict |
		fonts := ps dictionaryStack top at: #fonts ifAbsent: [
			"clean old font dict off the dict stack"
			ps dictionaryStack pop.
			ps dictionaryStack top at: #fonts].
		fontname := (fonts at: ps pop) object.
		fontDict := ps dictionaryStack top at: fontname ifAbsentPut: [
			PSDictionary with: #name -> fontname].
		ps dictionaryStack push: fontDict]
]

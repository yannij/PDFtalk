Class {
	#name : #PtTypecheckingTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtTypecheckingTests >> testArrayAttributes [
	| pdf |
	pdf := (PtPDF classAt: #Separation) empty.
	self assert: pdf name = #Separation asPDF.
	self assert: pdf tintName = nil.
	self assert: pdf alternateSpace = nil.
	self assert: pdf tintTransform = nil.
	self assert: (pdf sortedAttributePragmas collect: #selector) asArray = #(#name #tintName #alternateSpace #tintTransform).
	self shouldnt: [pdf at: 2 put: #Red] raise: PtTypeError.
	self shouldnt: [pdf at: 3 put: #DeviceRGB] raise: PtTypeError.
	self shouldnt: [pdf at: 4 put: (PtPDF classAt: #ExponentialInterpolationFunction) empty] raise: PtTypeError.
	self assert: pdf hasRequiredAttributes
]

{ #category : #tests }
PtTypecheckingTests >> testArraySubsumption [
	self assert: ((Array with: PtPDF Dictionary new) asPDF compliesTo: (PtArrayType onSymbol: #Dictionary)).
	self deny: ((Array with: PtPDF Stream new) asPDF compliesTo: (PtArrayType onSymbol: #Dictionary)).
	self assert: ((Array with: (PtPDF classAt: #Names) new) asPDF compliesTo: (PtArrayType onSymbol: #Dictionary)).
	self assert: ((Array
		with: PtPDF Dictionary new
		with: PtPDF Dictionary new
		with: PtPDF Dictionary new
		with: PtPDF Dictionary new) asPDF compliesTo: (PtArrayType onSymbol: #Dictionary)).
	self deny: ((Array
		with: PtPDF Dictionary new
		with: PtPDF Dictionary new
		with: (PtPDF classAt: #Name) new
		with: PtPDF Dictionary new) asPDF compliesTo: (PtArrayType onSymbol: #Dictionary)).
	self deny: ((Array with: PtPDF Stream new) asPDF compliesTo: (PtArrayType onSymbol: #Dictionary)).
	self assert: ((Array with: PtPDF Dictionary new) asPDF asType: (PtArrayType onSymbol: #Dictionary)) = (Array with: PtPDF Dictionary new) asPDF.
	self assert: ((Array with: PtPDF Dictionary new) asPDF asType: (PtArrayType onSymbol: #Names)) = (Array with: (PtPDF classAt: #Names) new) asPDF
]

{ #category : #tests }
PtTypecheckingTests >> testArrayTypeRectangle [
	| pdf |
	pdf := (PtPDF classAt: #Rectangle) example.
	self assert: pdf hasRequiredAttributes.
	self assert: pdf llx = 549 asPDF.
	self assert: (pdf attributeTypesAt: 1) = (Array with: (PtObjectType onSymbol: #Number)).
	self should: [pdf at: 1 put: 'abc'] raise: PtTypeError.
	self assert: ([pdf at: 1 put: 'abc'] on: PtTypeError do: [:ex | ex resume]) printString = 'TypeMismatch(AsciiString/Number)'.
	self shouldnt: [pdf at: 1 put: 42] raise: PtTypeError.
	self assert: pdf llx = 42 asPDF.
	self should: [(PtPDF classAt: #Rectangle) on: #(1 2 3 #a)] raise: PtTypeError.
	self assert: ([(PtPDF classAt: #Rectangle) on: #(1 2 3 #a)] on: PtTypeError do: [:ex | ex resume]) last printString = 'TypeMismatch(Name/Number)'.
	self should: [(PtPDF classAt: #Rectangle) on: #(1 2 3)] raise: PtTypeError.
	[(PtPDF classAt: #Rectangle) on: #(1 2 3)] on: PtTypeError do: [:ex |
		self assert: ex description = 'the size of the argument (3) does not match the required number of attributes (4)'].
	self should: [(PtPDF classAt: #Rectangle) on: #(1 2 3 4 5)] raise: PtTypeError.
	[(PtPDF classAt: #Rectangle) on: #(1 2 3 4 5)] on: PtTypeError do: [:ex |
		self assert: ex description = 'the size of the argument (5) does not match the required number of attributes (4)']
]

{ #category : #tests }
PtTypecheckingTests >> testAttributes [
	| pdf |
	pdf := (PtPDF classAt: #Catalog) new.
	self deny: pdf hasRequiredAttributes.
	self should: [pdf at: #Type put: 'abc'] raise: PtTypeError.
	self assert: ([pdf at: #Type put: 'abc'] on: PtTypeError do: [:ex | ex resume]) printString = 'TypeMismatch(AsciiString/Name)'.
	self shouldnt: [pdf at: #Type put: #Catalog] raise: PtTypeError.
	self assert: pdf Type = #Catalog asPDF.
	self assert: pdf Type asSmalltalkValue = #Catalog.
	self deny: pdf hasRequiredAttributes.
	self shouldnt: [pdf at: #Pages put: (PtPDF classAt: #Pages) new newReference] raise: PtError.
	self assert: pdf Pages = (PtPDF classAt: #Pages) new.
	self shouldnt: [pdf at: #Pages put: nil] raise: PtError.
	self should: [pdf Pages] raise: KeyNotFound.
	self shouldnt: [pdf at: #Pages put: (PtPDF Dictionary with: #Type -> #Pages) newReference] raise: PtError.
	self assert: (pdf Pages isKindOf: (PtPDF classAt: #Pages)).
	self assert: pdf Pages asSmalltalkValue = (Valuemap with: #Type -> #Pages).
	self assert: pdf hasRequiredAttributes.
	self assert: pdf Names isEmpty
]

{ #category : #tests }
PtTypecheckingTests >> testClassSubsumption [
	self assert: (PtPDF String new compliesTo: (PtObjectType onSymbol: #String)).
	self assert: (PtPDF String new compliesTo: (PtObjectType onSymbol: #Object)).
	self deny: (PtPDF String new compliesTo: (PtObjectType onSymbol: #Name)).
	self assert: (PtPDF Dictionary new compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self assert: (PtTypedDictionary new compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self deny: (PtPDF Stream new compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self assert: ((PtPDF classAt: #Names) new compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self assert: ((PtPDF classAt: #NameTree) new compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self assert: ((PtPDF classAt: #NameTree) new compliesTo: (PtObjectType onSymbol: #NameTree)).
	self assert: (PtPDF Dictionary new asType: (PtObjectType onSymbol: #Names)) class = (PtPDF classAt: #Names).
	self deny: ((PtPDF classAt: #Names) new asType: (PtObjectType onSymbol: #Dictionary)) isNil.
	self deny: (#() asPDF compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self deny: (1 asPDF compliesTo: (PtObjectType onSymbol: #Dictionary)).
	self assert: (1 asPDF compliesTo: (PtObjectType onSymbol: #Number)).
	self assert: (1.7 asPDF compliesTo: (PtObjectType onSymbol: #Number)).
	self deny: (PtPDF String new compliesTo: (PtObjectType onSymbol: #Number))
]

{ #category : #tests }
PtTypecheckingTests >> testColourSpaceSpecialization [
	self assert: #DeviceGray asPDF class = (PtPDF classAt: #Name).
	self assert: (#DeviceGray asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #DeviceGray).
	self assert: (#DeviceRGB asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #DeviceRGB).
	self assert: (#DeviceCMYK asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #DeviceCMYK).
	self assert: (#(#Pattern) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #Pattern).
	self assert: (#PatternX asPDF asType: (PtDirectType onSymbol: #ColourSpace)) isNil.
	self assert: ((Array with: #CalGray with: PtPDF Dictionary new) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #CalGray).
	self assert: ((Array with: #CalRGB with: PtPDF Dictionary new) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #CalRGB).
	self assert: ((Array with: #Lab with: PtPDF Dictionary new) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #Lab).
	self assert: ((Array with: #ICCBased with: (PtPDF Stream on: Dictionary new external: '  ')) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #ICCBased).
	self should: [(Array with: #DeviceN with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] raise: PtTypeError.
	self assert: (([(Array with: #DeviceN with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 2) printString = 'TypeMismatch(Null/[Name])'.
	self assert: (([(Array with: #DeviceN with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 3) printString = 'TypeMismatch(Null/DeviceColourSpace|CIEColourSpace)'.
	self assert: (([(Array with: #DeviceN with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 4) printString = 'TypeMismatch(Null/Function)'.
	self assert: ((Array with: #DeviceN with: #(#name) with: #DeviceCMYK with: (PtPDF classAt: #StichingFunction) empty) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #DeviceN).
	self should: [(Array with: #Indexed with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] raise: PtTypeError.
	self assert: (([(Array with: #Indexed with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 2) printString = 'TypeMismatch(Null/ColourSpace)'.
	self assert: (([(Array with: #Indexed with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 3) printString = 'TypeMismatch(Null/Integer)'.
	self assert: (([(Array with: #Indexed with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 4) printString = 'TypeMismatch(Null/Stream|String)'.
	self assert: ((Array with: #Indexed with: #DeviceCMYK with: 255 with: PtPDF Stream empty) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #Indexed).
	self should: [(Array with: #Separation with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] raise: PtTypeError.
	self assert: (([(Array with: #Separation with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 2) printString = 'TypeMismatch(Null/Name)'.
	self assert: (([(Array with: #Separation with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 3) printString = 'TypeMismatch(Null/DeviceColourSpace|CIEColourSpace)'.
	self assert: (([(Array with: #Separation with: nil with: nil with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] on: PtTypeError do: [:ex | ex resume]) at: 4) printString = 'TypeMismatch(Null/Function)'.
	self assert: ((Array with: #Separation with: #cyan with: #DeviceCMYK with: (PtPDF classAt: #StichingFunction) empty) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #Separation).
	self should: [(Array with: #Pattern with: nil) asPDF asType: (PtDirectType onSymbol: #ColourSpace)] raise: PtTypeError.
	self assert: ((Array with: #Pattern with: #DeviceCMYK) asPDF asType: (PtDirectType onSymbol: #ColourSpace)) class = (PtPDF classAt: #UncolouredPattern).
	self assert: (5 asPDF asType: (PtDirectType onSymbol: #ColourSpace)) isNil
]

{ #category : #tests }
PtTypecheckingTests >> testColourSpaceSubsumption [
	self assert: ((PtPDF classAt: #DeviceGray) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceRGB) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceCMYK) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #CalGray) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #CalRGB) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Lab) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #ICCBased) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceN) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Indexed) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Separation) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #UncolouredPattern) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Pattern) empty compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self deny: (5 asPDF compliesTo: (PtDirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceGray) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceRGB) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceCMYK) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #CalGray) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #CalRGB) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Lab) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #ICCBased) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #DeviceN) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Indexed) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Separation) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #UncolouredPattern) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self assert: ((PtPDF classAt: #Pattern) empty newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self deny: ((PtPDF classAt: #DeviceCMYK) empty compliesTo: (PtIndirectType onSymbol: #ColourSpace)).
	self deny: (5 asPDF newReference compliesTo: (PtIndirectType onSymbol: #ColourSpace))
]

{ #category : #tests }
PtTypecheckingTests >> testDirectSubsumption [
	self assert: (5 asPDF compliesTo: (PtDirectType onSymbol: #Integer)).
	self deny: (5 asPDF newReference compliesTo: (PtDirectType onSymbol: #Integer)).
	self assert: (5 asPDF compliesTo: (PtDirectType onSymbol: #Number)).
	self deny: (PtPDF Stream new compliesTo: (PtDirectType onSymbol: #Number)).
	self assert: ((Array with: PtPDF Dictionary new) asPDF asType: (PtDirectType onSymbol: #Dictionary)) isNil.
	self assert: (PtPDF Dictionary new asType: (PtDirectType onSymbol: #Names)) class = (PtPDF classAt: #Names)
]

{ #category : #tests }
PtTypecheckingTests >> testFunctionSpecialization [
	| dict str |
	dict := PtPDF Dictionary new.
	str := PtPDF Stream new.
	str contents: 'abc'.
	str at: #FunctionType put: 0.
	self assert: (str asType: (PtDirectType onSymbol: #Function)) class = (PtPDF classAt: #SampledFunction).
	dict at: #FunctionType put: 2.
	self assert: (dict asType: (PtDirectType onSymbol: #Function)) class = (PtPDF classAt: #ExponentialInterpolationFunction).
	dict at: #FunctionType put: 3.
	self assert: (dict asType: (PtDirectType onSymbol: #Function)) class = (PtPDF classAt: #StichingFunction).
	str at: #FunctionType put: 4.
	self assert: (str asType: (PtDirectType onSymbol: #Function)) class = (PtPDF classAt: #PostScriptCalculatorFunction).
	str at: #FunctionType put: 1.
	self assert: (str asType: (PtDirectType onSymbol: #Function)) isNil.
	self assert: (5 asPDF asType: (PtDirectType onSymbol: #Function)) isNil.
	self assert: (dict newReference asType: (PtDirectType onSymbol: #Function)) isNil
]

{ #category : #tests }
PtTypecheckingTests >> testFunctionSubsumption [
	self assert: ((PtPDF classAt: #ExponentialInterpolationFunction) empty compliesTo: (PtDirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #StichingFunction) empty compliesTo: (PtDirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #PostScriptCalculatorFunction) empty compliesTo: (PtDirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #SampledFunction) empty compliesTo: (PtDirectType onSymbol: #Function)).
	self deny: (5 asPDF compliesTo: (PtDirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #ExponentialInterpolationFunction) empty newReference compliesTo: (PtIndirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #StichingFunction) empty newReference compliesTo: (PtIndirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #PostScriptCalculatorFunction) empty newReference compliesTo: (PtIndirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #SampledFunction) empty newReference compliesTo: (PtIndirectType onSymbol: #Function)).
	self deny: ((PtPDF classAt: #SampledFunction) empty compliesTo: (PtIndirectType onSymbol: #Function)).
	self deny: (5 asPDF newReference compliesTo: (PtIndirectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #ExponentialInterpolationFunction) empty newReference compliesTo: (PtObjectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #StichingFunction) empty compliesTo: (PtObjectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #PostScriptCalculatorFunction) empty newReference compliesTo: (PtObjectType onSymbol: #Function)).
	self assert: ((PtPDF classAt: #SampledFunction) empty compliesTo: (PtObjectType onSymbol: #Function)).
	self deny: (5 asPDF newReference compliesTo: (PtObjectType onSymbol: #Function)).
	self assert: ((Array with: (PtPDF classAt: #ExponentialInterpolationFunction) empty) asPDF compliesTo: (PtArrayType onSymbol: #Function)).
	self assert: ((Array with: (PtPDF classAt: #StichingFunction) empty newReference) asPDF compliesTo: (PtArrayType onSymbol: #Function)).
	self assert: ((Array with: (PtPDF classAt: #PostScriptCalculatorFunction) empty) asPDF compliesTo: (PtArrayType onSymbol: #Function)).
	self assert: ((Array with: (PtPDF classAt: #SampledFunction) empty newReference) asPDF compliesTo: (PtArrayType onSymbol: #Function)).
	self assert: (#() asPDF compliesTo: (PtArrayType onSymbol: #Function)).
	self deny: (5 asPDF newReference compliesTo: (PtArrayType onSymbol: #Function)).
	self assert: ((PtPDF Dictionary with: #key -> (PtPDF classAt: #ExponentialInterpolationFunction) empty) asPDF compliesTo: (PtDictionaryType onSymbol: #Function)).
	self assert: ((PtPDF Dictionary with: #key -> (PtPDF classAt: #StichingFunction) empty newReference) asPDF compliesTo: (PtDictionaryType onSymbol: #Function)).
	self assert: ((PtPDF Dictionary with: #key -> (PtPDF classAt: #PostScriptCalculatorFunction) empty) asPDF compliesTo: (PtDictionaryType onSymbol: #Function)).
	self assert: ((PtPDF Dictionary with: #key -> (PtPDF classAt: #SampledFunction) empty newReference) asPDF compliesTo: (PtDictionaryType onSymbol: #Function)).
	self assert: (PtPDF Dictionary new compliesTo: (PtDictionaryType onSymbol: #Function)).
	self deny: (5 asPDF newReference compliesTo: (PtDictionaryType onSymbol: #Function))
]

{ #category : #tests }
PtTypecheckingTests >> testIndirectSubsumption [
	self assert: (5 asPDF newReference compliesTo: (PtIndirectType onSymbol: #Integer)).
	self deny: (5 asPDF compliesTo: (PtIndirectType onSymbol: #Integer)).
	self deny: (((PtPDF classAt: #Reference) referent: 5 asPDF newReference) compliesTo: (PtIndirectType onSymbol: #Integer)).
	self deny: (5 asPDF compliesTo: (PtIndirectType onSymbol: #Number)).
	self assert: (PtPDF Dictionary new newReference asType: (PtIndirectType onSymbol: #Dictionary)) referent class = PtPDF Dictionary.
	self assert: (PtPDF Dictionary new newReference asType: (PtIndirectType onSymbol: #Names)) referent class = (PtPDF classAt: #Names)
]

{ #category : #tests }
PtTypecheckingTests >> testNameTreeSubsumption [
	self assert: (((PtPDF classAt: #NameTree) with: #Names -> #('a' #a)) compliesTo: (PtNameTreeType onSymbol: #Name)).
	self assert: (((PtPDF classAt: #NameTree) with: #Names -> #('a' 'a')) compliesTo: (PtNameTreeType onSymbol: #String)).
	self assert: (((PtPDF classAt: #NameTree) with: #Names -> #()) compliesTo: (PtNameTreeType onSymbol: #Name)).
	self deny: (((PtPDF classAt: #NameTree) with: #Names -> #('a' #a 'b' 2)) compliesTo: (PtNameTreeType onSymbol: #Name)).
	self assert: (((PtPDF classAt: #NameTree) nodeClass with: #Kids -> (Array with: ((PtPDF classAt: #NameTree) leafClass with: #Names -> #('a' #a)))) compliesTo: (PtNameTreeType onSymbol: #Name)).
	self deny: (((PtPDF classAt: #NameTree) nodeClass with: #Kids -> (Array with: ((PtPDF classAt: #NameTree) leafClass with: #Names -> #('a' #a 'b' 2)))) compliesTo: (PtNameTreeType onSymbol: #Name)).
	self assert: (((PtPDF classAt: #NameTree) with: #Names -> #('a' #a asPDF newReference)) compliesTo: (PtNameTreeType onSymbol: #Name)).
]

{ #category : #tests }
PtTypecheckingTests >> testShadingSpecialization [
	| dict str |
	dict := PtPDF Dictionary new.
	dict at: #ShadingType put: 1.
	self assert: (dict asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #FunctionBasedShading).
	dict at: #ShadingType put: 2.
	self assert: (dict asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #AxialShading).
	dict at: #ShadingType put: 3.
	self assert: (dict asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #RadialShading).
	str := PtPDF Stream new.
	str contents: 'abc'.
	str at: #ShadingType put: 4.
	self assert: (str asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #FreeFormGouraudShadedMesh).
	str at: #ShadingType put: 5.
	self assert: (str asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #LatticeFormGouraudShadedMesh).
	str at: #ShadingType put: 6.
	self assert: (str asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #CoonsPatchMesh).
	str at: #ShadingType put: 7.
	self assert: (str asType: (PtDirectType onSymbol: #Shading)) class = (PtPDF classAt: #TensorProductPatchMesh).
	str at: #ShadingType put: 8.
	self assert: (str asType: (PtDirectType onSymbol: #Shading)) isNil.
	self assert: (5 asPDF asType: (PtDirectType onSymbol: #Shading)) isNil.
	self assert: (dict newReference asType: (PtDirectType onSymbol: #Shading)) isNil
]

{ #category : #tests }
PtTypecheckingTests >> testShadingSubsumption [
	self assert: ((PtPDF classAt: #FunctionBasedShading) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #AxialShading) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #RadialShading) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #FreeFormGouraudShadedMesh) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #LatticeFormGouraudShadedMesh) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #CoonsPatchMesh) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #TensorProductPatchMesh) empty compliesTo: (PtDirectType onSymbol: #Shading)).
	self deny: (5 asPDF compliesTo: (PtDirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #FunctionBasedShading) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #AxialShading) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #RadialShading) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #FreeFormGouraudShadedMesh) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #LatticeFormGouraudShadedMesh) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #CoonsPatchMesh) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #TensorProductPatchMesh) empty newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self deny: ((PtPDF classAt: #TensorProductPatchMesh) empty compliesTo: (PtIndirectType onSymbol: #Shading)).
	self deny: (5 asPDF newReference compliesTo: (PtIndirectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #FunctionBasedShading) empty newReference compliesTo: (PtObjectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #AxialShading) empty compliesTo: (PtObjectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #RadialShading) empty newReference compliesTo: (PtObjectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #FreeFormGouraudShadedMesh) empty compliesTo: (PtObjectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #LatticeFormGouraudShadedMesh) empty newReference compliesTo: (PtObjectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #CoonsPatchMesh) empty compliesTo: (PtObjectType onSymbol: #Shading)).
	self assert: ((PtPDF classAt: #TensorProductPatchMesh) empty newReference compliesTo: (PtObjectType onSymbol: #Shading)).
	self deny: (5 asPDF newReference compliesTo: (PtObjectType onSymbol: #Shading))
]

{ #category : #tests }
PtTypecheckingTests >> testSuperTypeFunction [
	| exponentialFunction stichingFunction shading |
	exponentialFunction := (PtPDF classAt: #ExponentialInterpolationFunction) empty.
	exponentialFunction at: #Domain put: #(0 1.0).
	exponentialFunction at: #N put: 2.5.
	exponentialFunction at: #C0 put: #(0 0 0 1).
	exponentialFunction at: #C1 put: #(0 0 0 0).
	stichingFunction := (PtPDF classAt: #StichingFunction) empty.
	stichingFunction at: #Domain put: #(0 1.0).
	stichingFunction at: #Bounds put: #().
	stichingFunction at: #Encode put: #(0 1.0).
	self shouldnt: [stichingFunction at: #Functions put: (Array with: exponentialFunction newReference)] raise: PtTypeError.
	shading := (PtPDF classAt: #AxialShading) empty.
	shading at: #Coords put: #(0 0 10 10).
	self shouldnt: [shading at: #Function put: stichingFunction newReference] raise: PtTypeError.
	self shouldnt: [shading at: #ColorSpace put: #DeviceCMYK] raise: PtTypeError.
]

{ #category : #tests }
PtTypecheckingTests >> testTypeNames [
	| pdf |
	pdf := (PtPDF classAt: #Catalog) new.
	pdf at: #Type put: #Catalog.
	pdf at: #Pages put: (PtPDF classAt: #Pages) new newReference.
	self assert: pdf hasRequiredAttributes.
	self assert: pdf Names isEmpty.
	self assert: (pdf attributeTypesAt: #Names) = (Array with: (PtObjectType onSymbol: #Names)).
	self should: [pdf at: #Names put: 'abc'] raise: PtTypeError.
	self assert: ([(pdf at: #Names put: 'abc')] on: PtTypeError do: [:ex | ex resume]) printString = 'TypeMismatch(AsciiString/Names)'.
	self should: [pdf at: #Names put: #()] raise: PtTypeError.
	self assert: ([(pdf at: #Names put: #())] on: PtTypeError do: [:ex | ex resume]) printString = 'TypeMismatch(Array/Names)'.
	self shouldnt: [pdf at: #Names put: PtPDF Dictionary new] raise: PtTypeError.
	self assert: pdf Names = (PtPDF classAt: #Names) new.
	self should: [pdf at: #Names put: PtPDF Stream new] raise: PtTypeError.
	self assert: ([(pdf at: #Names put: PtPDF Stream new)] on: PtTypeError do: [:ex | ex resume]) printString = 'TypeMismatch(Stream/Names)'.
]

{ #category : #tests }
PtTypecheckingTests >> testTypeReference [
	| pdf |
	pdf := (PtPDF classAt: #ObjectStream) new.
	pdf at: #Type put: #ObjStm.
	pdf at: #Length put: 0.
	pdf at: #First put: 13.
	pdf at: #N put: 2.
	self assert: pdf hasRequiredAttributes.
	self
		shouldnt: [
		pdf at: #Extends put: (PtFile new referenceAt: (PtObjectId number: 1))]
		raise: PtTypeError.
	self should: [pdf at: #Extends put: 'abc'] raise: PtTypeError.
	self assert: ([pdf at: #Extends put: 'abc'] on: PtTypeError do: [:ex | ex resume]) printString = 'TypeMismatch(AsciiString/»ObjectStream)'
]

{ #category : #tests }
PtTypecheckingTests >> testTypeTrailer [
	| pdf |
	pdf := (PtPDF classAt: #Trailer) new.
	pdf at: #Size put: 7.
	self
		shouldnt: [
		pdf at: #Root put: (PtPDF Dictionary with: #Type -> #Catalog) newReference]
		raise: PtTypeError.
	self assert: pdf Root class = (PtPDF classAt: #Catalog).
	pdf at: #Root put: (PtFile new referenceAt: (PtObjectId number: 1)).
	self assert: pdf hasRequiredAttributes
]

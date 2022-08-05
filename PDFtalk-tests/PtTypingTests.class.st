Class {
	#name : #PtTypingTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtTypingTests >> testAllTerminalSubtypes [
	self assert: ((PtPDF typeAt: #DeviceCMYK) allTerminalSubtypes collect: #name) asArray = #(#DeviceCMYK).
	self assert: ((PtPDF typeAt: #CIEColourSpace) allTerminalSubtypes collect: #name) sorted asArray = #(#CalGray #CalRGB #ICCBased #Lab).
	self assert: ((PtPDF typeAt: #DeviceColourSpace) allTerminalSubtypes collect: #name) sorted asArray = #(#DeviceCMYK #DeviceGray #DeviceRGB).
	self assert: ((PtPDF typeAt: #ColourSpace) allTerminalSubtypes collect: #name) sorted asArray = #(#CalGray #CalRGB #DeviceCMYK #DeviceGray #DeviceN #DeviceRGB #ICCBased #Indexed #Lab #Pattern #Separation #SimplePattern #UncolouredPattern)
]

{ #category : #tests }
PtTypingTests >> testIsClassForArray [
	self assert: ((PtPDF classAt: #CalGray) isClassForArray: (Array with: #CalGray with: 1) asPDF).
	self assert: ((PtPDF classAt: #CalRGB) isClassForArray: (Array with: #CalRGB with: 1) asPDF).
	self assert: ((PtPDF classAt: #ICCBased) isClassForArray: (Array with: #ICCBased with: 1) asPDF).
	self assert: ((PtPDF classAt: #Lab) isClassForArray: (Array with: #Lab with: 1) asPDF).
	"number of attributes must be right"
	self deny: ((PtPDF classAt: #Lab) isClassForArray: (Array with: #Lab) asPDF).
	self deny: ((PtPDF classAt: #Lab) isClassForArray: (Array with: #Lab with: 1 with: 1) asPDF).
	self deny: ((PtPDF classAt: #CalRGB) isClassForArray: (Array with: #Lab with: 1) asPDF).
	self assert: ((PtPDF classAt: #FileIdentifier) isClassForArray: (Array with: 1 with: 1) asPDF).
	self assert: ((PtPDF classAt: #DeviceN) isClassForArray: (Array with: #DeviceN with: 1 with: 1 with: 1) asPDF).
	self assert: ((PtPDF classAt: #Indexed) isClassForArray: (Array with: #Indexed with: 1 with: 1 with: 1) asPDF).
	self assert: ((PtPDF classAt: #Separation) isClassForArray: (Array with: #Separation with: 1 with: 1 with: 1) asPDF).
	self assert: ((PtPDF classAt: #UncolouredPattern) isClassForArray: (Array with: #Pattern with: 1) asPDF).
	self deny: ((PtPDF classAt: #DeviceN) isClassForArray: (Array new) asPDF).
]

{ #category : #tests }
PtTypingTests >> testIsClassForDictionary [
	self assert: ((PtPDF classAt: #ExponentialInterpolationFunction) isClassForDictionary: (Valuemap with: #FunctionType -> 2) asPDF).
	self assert: ((PtPDF classAt: #StichingFunction) isClassForDictionary: (Valuemap with: #FunctionType -> 3) asPDF).
	self deny: ((PtPDF classAt: #ExponentialInterpolationFunction) isClassForDictionary: (Valuemap with: #FunctionType -> -1) asPDF).
	self deny: ((PtPDF classAt: #ExponentialInterpolationFunction) isClassForDictionary: Valuemap new asPDF).
]

{ #category : #tests }
PtTypingTests >> testIsClassForName [
	self assert: ((PtPDF classAt: #DeviceCMYK) isClassForName: #DeviceCMYK asPDF).
	self assert: ((PtPDF classAt: #DeviceRGB) isClassForName: #DeviceRGB asPDF).
	self assert: ((PtPDF classAt: #Identity) isClassForName: #Identity asPDF).
	self deny: ((PtPDF classAt: #Name) isClassForName: #ABC asPDF).
	self deny: ((PtPDF classAt: #DeviceColourSpace) isClassForName: #DeviceRGB asPDF).
]

{ #category : #tests }
PtTypingTests >> testIsClassForStream [
	self assert: ((PtPDF classAt: #PostScriptCalculatorFunction) isClassForStream: (PtPDF Stream on: (Valuemap with: #FunctionType -> 4) external: '')).
	self assert: ((PtPDF classAt: #SampledFunction) isClassForStream: (PtPDF Stream on: (Valuemap with: #FunctionType -> 0) external: '')).
	self deny: ((PtPDF classAt: #SampledFunction) isClassForStream: (PtPDF Stream on: (Valuemap with: #FunctionType -> -1) external: '')).
	self deny: ((PtPDF classAt: #SampledFunction) isClassForStream: (PtPDF Stream on: Valuemap new external: '')).
]

{ #category : #tests }
PtTypingTests >> testIsExemplarArrayOf [
	self assert: (#(#CalGray 1) asPDF canBeExemplarOf: (PtPDF typeAt: #CalGray)).
	self assert: (#(#CalRGB 1) asPDF canBeExemplarOf: (PtPDF typeAt: #CalRGB)).
	self assert: (#(#ICCBased 1) asPDF canBeExemplarOf: (PtPDF typeAt: #ICCBased)).
	self assert: (#(#Lab 1) asPDF canBeExemplarOf: (PtPDF typeAt: #Lab)).
	"number of attributes must be right"
	self deny: (#(#Lab) asPDF canBeExemplarOf: (PtPDF typeAt: #Lab)).
	self deny: (#(#Lab 1 1) asPDF canBeExemplarOf: (PtPDF typeAt: #Lab)).
	self deny: (#(#Lab 1) asPDF canBeExemplarOf: (PtPDF typeAt: #ICCBased)).
	
	self assert: (#(1 1) asPDF canBeExemplarOf: (PtPDF typeAt: #FileIdentifier)).
	self assert: (#(#DeviceN 1 1 1) asPDF canBeExemplarOf: (PtPDF typeAt: #DeviceN)).
	self assert: (#(#Indexed 1 1 1) asPDF canBeExemplarOf: (PtPDF typeAt: #Indexed)).
	self assert: (#(#Separation 1 1 1) asPDF canBeExemplarOf: (PtPDF typeAt: #Separation)).
	self assert: (#(#Pattern 1) asPDF canBeExemplarOf: (PtPDF typeAt: #UncolouredPattern)).
	self deny: (#() asPDF canBeExemplarOf: (PtPDF typeAt: #DeviceN)).
]

{ #category : #tests }
PtTypingTests >> testIsExemplarDictionaryOf [
	self assert: ((Dictionary with: #FunctionType -> 2) asPDF canBeExemplarOf: (PtPDF typeAt: #ExponentialInterpolationFunction)).
	self assert: ((Dictionary with: #FunctionType -> 3) asPDF canBeExemplarOf: (PtPDF typeAt: #StichingFunction)).
	self deny: ((Dictionary with: #FunctionType -> 1) asPDF canBeExemplarOf: (PtPDF typeAt: #StichingFunction)).
	self deny: (Dictionary new asPDF canBeExemplarOf: (PtPDF typeAt: #SampledFunction)).
	self assert: ((Dictionary with: #ShadingType -> 1) asPDF canBeExemplarOf: (PtPDF typeAt: #FunctionBasedShading)).
	self assert: ((Dictionary with: #ShadingType -> 2) asPDF canBeExemplarOf: (PtPDF typeAt: #AxialShading)).
	self assert: ((Dictionary with: #ShadingType -> 3) asPDF canBeExemplarOf: (PtPDF typeAt: #RadialShading)).
	self deny: ((Dictionary with: #ShadingType -> 6) asPDF canBeExemplarOf: (PtPDF typeAt: #AxialShading)).
	self assert: ((Dictionary with: #S -> #URI) asPDF canBeExemplarOf: (PtPDF typeAt: #URI)).
	self assert: ((Dictionary with: #Subtype -> #Link) asPDF canBeExemplarOf: (PtPDF typeAt: #LinkAnnotation)).
	self assert: ((Dictionary with: #Subtype -> #Caret) asPDF canBeExemplarOf: (PtPDF typeAt: #CaretAnnotation)).
	self assert: ((Dictionary with: #Subtype -> #'3D') asPDF canBeExemplarOf: (PtPDF typeAt: #ThreeDAnnotation)).
	self deny: ((Dictionary with: #Type -> #Annot) asPDF canBeExemplarOf: (PtPDF typeAt: #Annot)).
	self assert: ((Dictionary with: #Type -> #Annot with: #Subtype -> #Link) asPDF canBeExemplarOf: (PtPDF typeAt: #Annot)).
	self assert: ((Dictionary with: #Subtype -> #Type1 with: #BaseFont -> #MyFont) asPDF canBeExemplarOf: (PtPDF typeAt: #Type1)).
	self assert: ((Dictionary with: #Subtype -> #Type0) asPDF canBeExemplarOf: (PtPDF typeAt: #Type0)).
	self assert: ((Dictionary with: #Subtype -> #Type3) asPDF canBeExemplarOf: (PtPDF typeAt: #Type3)).
	self deny: ((Dictionary with: #Subtype -> #Type3) asPDF canBeExemplarOf: (PtPDF typeAt: #Type1)).
	self assert: ((Dictionary with: #S -> #Transparency) asPDF canBeExemplarOf: (PtPDF typeAt: #TransparencyGroupAttributes)).
]

{ #category : #tests }
PtTypingTests >> testIsExemplarNameOf [
	self assert: (#DeviceCMYK asPDF canBeExemplarOf: (PtPDF typeAt: #DeviceCMYK)).
	self assert: (#DeviceRGB asPDF canBeExemplarOf: (PtPDF typeAt: #DeviceRGB)).
	self assert: (#DeviceGray asPDF canBeExemplarOf: (PtPDF typeAt: #DeviceGray)).
	self assert: (#Identity asPDF canBeExemplarOf: (PtPDF typeAt: #Identity)).
	
	self deny: (#Identity asPDF canBeExemplarOf: (PtPDF typeAt: #DeviceGray)).
	self deny: (#ABC asPDF canBeExemplarOf: (PtPDF typeAt: #Name)).
	self deny: (#DeviceRGB asPDF canBeExemplarOf: (PtPDF typeAt: #ColourSpace)).
]

{ #category : #tests }
PtTypingTests >> testIsExemplarStreamOf [
	self assert: ((PtPDF Stream on: (Dictionary with: #FunctionType -> 0) external: '') canBeExemplarOf: (PtPDF typeAt: #SampledFunction)).
	self assert: ((PtPDF Stream on: (Dictionary with: #FunctionType -> 4) external: '') canBeExemplarOf: (PtPDF typeAt: #PostScriptCalculatorFunction)).
	self deny: ((PtPDF Stream on: (Dictionary with: #FunctionType -> 1) external: '') canBeExemplarOf: (PtPDF typeAt: #SampledFunction)).
	self deny: ((PtPDF Stream on: Dictionary new external: '') canBeExemplarOf: (PtPDF typeAt: #SampledFunction)).
	self assert: ((PtPDF Stream on: (Dictionary with: #ShadingType -> 4) external: '') canBeExemplarOf: (PtPDF typeAt: #FreeFormGouraudShadedMesh)).
	self assert: ((PtPDF Stream on: (Dictionary with: #ShadingType -> 5) external: '') canBeExemplarOf: (PtPDF typeAt: #LatticeFormGouraudShadedMesh)).
	self assert: ((PtPDF Stream on: (Dictionary with: #ShadingType -> 6) external: '') canBeExemplarOf: (PtPDF typeAt: #CoonsPatchMesh)).
	self assert: ((PtPDF Stream on: (Dictionary with: #ShadingType -> 7) external: '') canBeExemplarOf: (PtPDF typeAt: #TensorProductPatchMesh)).
	self deny: ((PtPDF Stream on: (Dictionary with: #ShadingType -> 6) external: '') canBeExemplarOf: (PtPDF typeAt: #TensorProductPatchMesh)).
	self assert: ((PtPDF Stream on: (Dictionary with: #Subtype -> #Form) external: '') canBeExemplarOf: (PtPDF typeAt: #FormXObject)).
	self assert: ((PtPDF Stream on: (Dictionary with: #Subtype -> #Image) external: '') canBeExemplarOf: (PtPDF typeAt: #ImageXObject)).
	self assert: ((PtPDF Stream on: (Dictionary with: #Subtype -> #PS) external: '') canBeExemplarOf: (PtPDF typeAt: #PostScriptXObject)).
	self assert: ((PtPDF Stream on: (Dictionary with: #Subtype -> #Form with: #Group -> 1) external: '') canBeExemplarOf: (PtPDF typeAt: #Group)).
	self assert: ((PtPDF Stream on: (Dictionary with: #Subtype -> #Form with: #Group -> (Dictionary with: #S -> #Transparency)) external: '') canBeExemplarOf: (PtPDF typeAt: #TransparencyGroup)).
]

{ #category : #tests }
PtTypingTests >> testPdfType [
	self assert: PtPDF basicNew pdfType printString = 'Object(PDF)'.
	self assert: PtPDF Dictionary new pdfType printString = 'Dictionary(PDFDictionary)'.
	self assert: PtPDF Stream new pdfType printString = 'Stream(PDFStream)'.
	self assert: PtPDF Array new pdfType printString = 'Array(PDFArray)'.
	self assert: (PtPDF classAt: #Reference) new pdfType printString = 'Reference(Reference)'.
	self assert: nil pdfType printString = 'Null(UndefinedObject)'.
	self assert: false asPDF pdfType printString = 'Boolean(Boolean)'.
	self assert: 1 asPDF pdfType printString = 'Integer(Integer)'.
	self assert: 'string' asPDF pdfType printString = 'AsciiString(AsciiString)'.
	self assert: (PtPDF classAt: #Textstring) empty asPDF pdfType printString = 'Textstring(Textstring)'.
	self assert: Timestamp now asPDF pdfType printString = 'Date(PDFDate)'.
	self assert: (PtPDF classAt: #Name) new pdfType printString = 'Name(Name)'.
	self assert: (PtPDF classAt: #Matrix) new pdfType printString = 'Matrix(Matrix)'.
	self assert: (PtPDF classAt: #Identity) new pdfType printString = 'Identity(Identity)'.
	self assert: (PtPDF classAt: #FlateDecode) new pdfType printString = 'FlateDecode(FlateDecode)'.
	self assert: (PtPDF classAt: #Rectangle) new pdfType printString = 'Rectangle(Rectangle)'.
	self assert: #DeviceCMYK asPDF pdfType printString = 'Name(Name)'.
	self assert: (PtPDF classAt: #DeviceCMYK) new pdfType printString = 'DeviceCMYK(DeviceCMYK)'.
]

{ #category : #tests }
PtTypingTests >> testSpecialized [
	self assert: (((PtPDF typeAt: #DeviceCMYK) specialized: #DeviceCMYK asPDF) isKindOf: (PtPDF classAt: #DeviceCMYK)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #DeviceCMYK asPDF) isKindOf: (PtPDF classAt: #DeviceCMYK)).
]

{ #category : #tests }
PtTypingTests >> testSpecializedActions [
	self assert: (((PtPDF typeAt: #Action) specialized: (PtPDF classAt: #URI) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #URI)).
	self assert: (((PtPDF typeAt: #Action) specialized: (Dictionary with: #S -> #URI) asPDF) isKindOf: (PtPDF classAt: #URI)).
	self assert: (((PtPDF typeAt: #Action) specialized: (Dictionary with: #S -> #GoTo) asPDF) isKindOf: (PtPDF classAt: #Action)).
]

{ #category : #tests }
PtTypingTests >> testSpecializedAnnotations [
	self assert: (((PtPDF typeAt: #Annot) specialized: (PtPDF classAt: #LinkAnnotation) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #LinkAnnotation)).
	self assert: (((PtPDF typeAt: #Annot) specialized: (Dictionary with: #Subtype -> #Link) asPDF) isKindOf: (PtPDF classAt: #LinkAnnotation)).
	self assert: (((PtPDF typeAt: #Annot) specialized: (Dictionary with: #Subtype -> #Unknown) asPDF) isKindOf: (PtPDF classAt: #Annot)).
]

{ #category : #tests }
PtTypingTests >> testSpecializedColors [
	self assert: (((PtPDF typeAt: #DeviceCMYK) specialized: #DeviceCMYK asPDF) isKindOf: (PtPDF classAt: #DeviceCMYK)).
	self assert: (((PtPDF typeAt: #DeviceColourSpace) specialized: #DeviceCMYK asPDF) isKindOf: (PtPDF classAt: #DeviceCMYK)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #DeviceCMYK asPDF) isKindOf: (PtPDF classAt: #DeviceCMYK)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #DeviceRGB asPDF) isKindOf: (PtPDF classAt: #DeviceRGB)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #DeviceGray asPDF) isKindOf: (PtPDF classAt: #DeviceGray)).
	self assert: (((PtPDF typeAt: #CIEColourSpace) specialized: (Array with: #CalGray with: Dictionary new) asPDF) isKindOf: (PtPDF classAt: #CalGray)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: (Array with: #CalGray with: Dictionary new) asPDF) isKindOf: (PtPDF classAt: #CalGray)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: (Array with: #CalRGB with: Dictionary new) asPDF) isKindOf: (PtPDF classAt: #CalRGB)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: (Array with: #ICCBased with: (PtPDF classAt: #ICCProfileStream) new) asPDF) isKindOf: (PtPDF classAt: #ICCBased)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: (Array with: #Lab with: Dictionary new) asPDF) isKindOf: (PtPDF classAt: #Lab)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #(#DeviceN #(#Red) #DeviceCMYK #Identity) asPDF) isKindOf: (PtPDF classAt: #DeviceN)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #(#Indexed #DeviceCMYK 1 '') asPDF) isKindOf: (PtPDF classAt: #Indexed)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #(#Separation #All #DeviceCMYK #Identity) asPDF) isKindOf: (PtPDF classAt: #Separation)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #(#Pattern) asPDF) isKindOf: (PtPDF classAt: #Pattern)).
	self assert: (((PtPDF typeAt: #ColourSpace) specialized: #(#Pattern #DeviceCMYK) asPDF) isKindOf: (PtPDF classAt: #UncolouredPattern)).
]

{ #category : #tests }
PtTypingTests >> testSpecializedFonts [
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #CIDFontType0) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #CIDFontType0)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #CIDFontType2) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #CIDFontType2)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #CIDFont) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #CIDFont)).
	self assert: (((PtPDF typeAt: #CIDFont) specialized: (PtPDF classAt: #CIDFontType0) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #CIDFontType0)).
	self assert: (((PtPDF typeAt: #CIDFont) specialized: (PtPDF classAt: #CIDFontType2) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #CIDFontType2)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #Type0) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #Type0)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #Type1) example asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #Type1)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #MMType1) example asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #MMType1)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #StandardFont) example asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #StandardFont)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #TrueType) example asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #TrueType)).
	self assert: (((PtPDF typeAt: #Font) specialized: (PtPDF classAt: #Type3) empty asSmalltalkValue asPDF) isKindOf: (PtPDF classAt: #Type3)).
]

{ #category : #tests }
PtTypingTests >> testSpecializedFunctions [
	self assert: (((PtPDF typeAt: #Function) specialized: #Identity asPDF) isKindOf: (PtPDF classAt: #Identity)).
	self assert: (((PtPDF typeAt: #Function) specialized: (PtPDF classAt: #SampledFunction) example) isKindOf: (PtPDF classAt: #SampledFunction)).
	self assert: (((PtPDF typeAt: #Function) specialized: (PtPDF classAt: #ExponentialInterpolationFunction) example content asPDF) isKindOf: (PtPDF classAt: #ExponentialInterpolationFunction)).
	self assert: (((PtPDF typeAt: #Function) specialized: (PtPDF classAt: #StichingFunction) example content asPDF) isKindOf: (PtPDF classAt: #StichingFunction)).
	self assert: (((PtPDF typeAt: #Function) specialized: (PtPDF classAt: #PostScriptCalculatorFunction) example) isKindOf: (PtPDF classAt: #PostScriptCalculatorFunction)).
]

{ #category : #tests }
PtTypingTests >> testSpecializedShadings [
	self assert: (((PtPDF typeAt: #Shading) specialized: (Valuemap with: #ShadingType -> 1) asPDF) isKindOf: (PtPDF classAt: #FunctionBasedShading)).
	self assert: (((PtPDF typeAt: #Shading) specialized: (Valuemap with: #ShadingType -> 2) asPDF) isKindOf: (PtPDF classAt: #AxialShading)).
	self assert: (((PtPDF typeAt: #Shading) specialized: (Valuemap with: #ShadingType -> 3) asPDF) isKindOf: (PtPDF classAt: #RadialShading)).
	self assert: (((PtPDF typeAt: #Shading) specialized: (PtPDF Stream on: (Valuemap with: #ShadingType -> 4) external: '')) isKindOf: (PtPDF classAt: #FreeFormGouraudShadedMesh)).
	self assert: (((PtPDF typeAt: #Shading) specialized: (PtPDF Stream on: (Valuemap with: #ShadingType -> 5) external: '')) isKindOf: (PtPDF classAt: #LatticeFormGouraudShadedMesh)).
	self assert: (((PtPDF typeAt: #Shading) specialized: (PtPDF Stream on: (Valuemap with: #ShadingType -> 6) external: '')) isKindOf: (PtPDF classAt: #CoonsPatchMesh)).
	self assert: (((PtPDF typeAt: #Shading) specialized: (PtPDF Stream on: (Valuemap with: #ShadingType -> 7) external: '')) isKindOf: (PtPDF classAt: #TensorProductPatchMesh)).
]

{ #category : #tests }
PtTypingTests >> testSubtype [
	self assert: ((PtPDF typeAt: #Dictionary) isSubtypeOf: (PtPDF typeAt: #Object)).
	self deny: ((PtPDF typeAt: #Object) isSubtypeOf: (PtPDF typeAt: #Dictionary)).
	"a type is not subtype of itself"
	self deny: ((PtPDF typeAt: #Object) isSubtypeOf: (PtPDF typeAt: #Object)).
	self deny: ((PtPDF typeAt: #Dictionary) isSubtypeOf: (PtPDF typeAt: #Dictionary)).
	
	self assert: ((PtPDF typeAt: #Array) isSubtypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #Rectangle) isSubtypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #ColourSpace) isSubtypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #DeviceCMYK) isSubtypeOf: (PtPDF typeAt: #ColourSpace)).
	self assert: ((PtPDF typeAt: #Pattern) isSubtypeOf: (PtPDF typeAt: #ColourSpace)).				"a Name"
	self assert: ((PtPDF typeAt: #UncolouredPattern) isSubtypeOf: (PtPDF typeAt: #ColourSpace)).		"an Array"
	self assert: ((PtPDF typeAt: #UncolouredPattern) isSubtypeOf: (PtPDF typeAt: #ColourSpace)).
	self assert: ((PtPDF typeAt: #UncolouredPattern) isSubtypeOf: (PtPDF typeAt: #Object)).
]

{ #category : #tests }
PtTypingTests >> testTypeOf [
	self assert: ((PtPDF typeAt: #Dictionary) isTypeOf: (PtPDF typeAt: #Object)).
	self deny: ((PtPDF typeAt: #Object) isTypeOf: (PtPDF typeAt: #Dictionary)).
	"a type is type of itself"
	self assert: ((PtPDF typeAt: #Object) isTypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #Dictionary) isTypeOf: (PtPDF typeAt: #Dictionary)).
	
	self assert: ((PtPDF typeAt: #Array) isTypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #Rectangle) isTypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #ColourSpace) isTypeOf: (PtPDF typeAt: #Object)).
	self assert: ((PtPDF typeAt: #DeviceCMYK) isTypeOf: (PtPDF typeAt: #ColourSpace)).
	self assert: ((PtPDF typeAt: #Pattern) isTypeOf: (PtPDF typeAt: #ColourSpace)).				"a Name"
	self assert: ((PtPDF typeAt: #UncolouredPattern) isTypeOf: (PtPDF typeAt: #ColourSpace)).		"an Array"
	self assert: ((PtPDF typeAt: #UncolouredPattern) isTypeOf: (PtPDF typeAt: #ColourSpace)).
	self assert: ((PtPDF typeAt: #UncolouredPattern) isTypeOf: (PtPDF typeAt: #Object)).
]

{ #category : #tests }
PtTypingTests >> testTyped [
	| functionType |
	functionType := PtObjectType onSymbol: #Function.
	self assert: ((Dictionary with: #FunctionType -> 2) asPDF typed: (Array with: functionType)) pdfType name = #ExponentialInterpolationFunction.
	self assert: (#Identity asPDF typed: (Array with: functionType)) pdfType name = #Identity.
	self assert: ((PtPDF Stream on: (Dictionary with: #FunctionType -> 0) external: '') asPDF typed: (Array with: functionType)) pdfType name = #SampledFunction.
	self deny: ((Dictionary with: #FunctionType -> 2) asPDF compliesTo: functionType).
	self assert: (((Dictionary with: #FunctionType -> 2) asPDF typed: (Array with: functionType)) compliesTo: functionType)
]

{ #category : #tests }
PtTypingTests >> testTypingFlowArray [
	| attributeType pdfObject typed |
	attributeType := PtObjectType onSymbol: #ColourSpace.
	pdfObject := #(#DeviceN #(#Red) #DeviceCMYK #Identity) asPDF.
	typed := pdfObject typed: (Array with: attributeType).
	self assert: typed pdfType name = #DeviceN.
	self deny: (pdfObject compliesTo: attributeType).
	self assert: (typed compliesTo: attributeType).
	self deny: (attributeType specifiesArray: pdfObject).
	self assert: pdfObject pdfType name = #Array.
	self assert: attributeType type name = #ColourSpace.
	self deny: ((pdfObject pdfType) isTypeOf: attributeType type).
	
	self assert: (pdfObject asType: attributeType) pdfType name = #DeviceN.
	self assert: (attributeType specializedArray: pdfObject) pdfType name = #DeviceN.
	self assert: (attributeType specializedObject: pdfObject) pdfType name = #DeviceN.
	self assert: (attributeType type specialized: pdfObject) pdfType name = #DeviceN.
	self assert: ((attributeType type allTerminalSubtypes) collect: #name) sorted asArray = #(#CalGray #CalRGB #DeviceCMYK #DeviceGray #DeviceN #DeviceRGB #ICCBased #Indexed #Lab #Pattern #Separation #SimplePattern #UncolouredPattern).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceGray)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceRGB)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceCMYK)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Pattern)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Separation)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Indexed)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #UncolouredPattern)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Lab)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #ICCBased)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #CalGray)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #CalRGB)).
	self assert: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceN)).
	self assert: ((PtPDF classAt: #DeviceN) isClassForArray: pdfObject).
]

{ #category : #tests }
PtTypingTests >> testTypingFlowDictionary [
	| attributeType pdfObject typed |
	attributeType := PtObjectType onSymbol: #Function.
	pdfObject := (Dictionary with: #FunctionType -> 2) asPDF.
	typed := pdfObject typed: (Array with: attributeType).
	self assert: typed pdfType name = #ExponentialInterpolationFunction.
	self deny: (pdfObject compliesTo: attributeType).
	self assert: (typed compliesTo: attributeType).
	self deny: (attributeType specifiesDictionary: pdfObject).
	self assert: pdfObject pdfType name = #Dictionary.
	self assert: attributeType type name = #Function.
	self deny: ((pdfObject pdfType) isTypeOf: attributeType type).
	
	self assert: (pdfObject asType: attributeType) pdfType name = #ExponentialInterpolationFunction.
	self assert: (attributeType specializedDictionary: pdfObject) pdfType name = #ExponentialInterpolationFunction.
	self assert: (attributeType specializedObject: pdfObject) pdfType name = #ExponentialInterpolationFunction.
	self assert: (attributeType type specialized: pdfObject) pdfType name = #ExponentialInterpolationFunction.
	self assert: ((attributeType type allTerminalSubtypes) collect: #name) sorted asArray = #(#ExponentialInterpolationFunction #Identity #PostScriptCalculatorFunction #SampledFunction #StichingFunction).
	self assert: (pdfObject canBeExemplarOf: (PtPDF typeAt: #ExponentialInterpolationFunction)).
	self assert: ((PtPDF classAt: #ExponentialInterpolationFunction) isClassForDictionary: pdfObject).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Identity)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #StichingFunction)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #PostScriptCalculatorFunction)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #SampledFunction)).
]

{ #category : #tests }
PtTypingTests >> testTypingFlowName [
	| attributeType pdfObject typed |
	attributeType := PtObjectType onSymbol: #ColourSpace.
	pdfObject := #DeviceCMYK asPDF.
	typed := pdfObject typed: (Array with: attributeType).
	self assert: typed pdfType name = #DeviceCMYK.
	self deny: (pdfObject compliesTo: attributeType).
	self assert: (typed compliesTo: attributeType).
	self deny: (attributeType specifiesObject: pdfObject).
	self assert: pdfObject pdfType name = #Name.
	self assert: attributeType type name = #ColourSpace.
	self deny: ((pdfObject pdfType) isTypeOf: attributeType type).
	
	self assert: (pdfObject asType: attributeType) pdfType name = #DeviceCMYK.
	self assert: (attributeType specializedObject: pdfObject) pdfType name = #DeviceCMYK.
	self assert: (attributeType type specialized: pdfObject) pdfType name = #DeviceCMYK.
	self assert: ((attributeType type allTerminalSubtypes) collect: #name) sorted asArray = #(#CalGray #CalRGB #DeviceCMYK #DeviceGray #DeviceN #DeviceRGB #ICCBased #Indexed #Lab #Pattern #Separation #SimplePattern #UncolouredPattern).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceGray)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceRGB)).
	self assert: (pdfObject canBeExemplarOf: (PtPDF typeAt: #DeviceCMYK)).
	self assert: ((PtPDF classAt: #DeviceCMYK) isClassForName: pdfObject).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Pattern)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Separation)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Indexed)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #UncolouredPattern)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #Lab)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #ICCBased)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #CalGray)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #CalRGB)).
]

{ #category : #tests }
PtTypingTests >> testTypingFlowNone [
	"when there are no attribute types, the object is returned unchanged"
	| pdfObject |
	pdfObject := PtPDF Dictionary empty.
	self assert: (pdfObject typed: #()) pdfType name = #Dictionary.
	self assert: (pdfObject typed: #()) == pdfObject.
]

{ #category : #tests }
PtTypingTests >> testTypingFlowStream [
	| attributeType pdfObject typed |
	attributeType := PtObjectType onSymbol: #Shading.
	pdfObject := (PtPDF Stream on: (Dictionary with: #ShadingType -> 6) external: '').
	typed := pdfObject typed: (Array with: attributeType).
	self assert: typed pdfType name = #CoonsPatchMesh.
	self deny: (pdfObject compliesTo: attributeType).
	self assert: (typed compliesTo: attributeType).
	self deny: (attributeType specifiesDictionary: pdfObject).
	self assert: pdfObject pdfType name = #Stream.
	self assert: attributeType type name = #Shading.
	self deny: ((pdfObject pdfType) isTypeOf: attributeType type).
	
	self assert: (pdfObject asType: attributeType) pdfType name = #CoonsPatchMesh.
	self assert: (attributeType specializedDictionary: pdfObject) pdfType name = #CoonsPatchMesh.
	self assert: (attributeType specializedObject: pdfObject) pdfType name = #CoonsPatchMesh.
	self assert: (attributeType type specialized: pdfObject) pdfType name = #CoonsPatchMesh.
	self assert: ((attributeType type allTerminalSubtypes) collect: #name) sorted asArray = #(#AxialShading #CoonsPatchMesh #FreeFormGouraudShadedMesh #FunctionBasedShading #LatticeFormGouraudShadedMesh #RadialShading #TensorProductPatchMesh).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #FreeFormGouraudShadedMesh)).
	self assert: (pdfObject canBeExemplarOf: (PtPDF typeAt: #CoonsPatchMesh)).
	self assert: ((PtPDF classAt: #CoonsPatchMesh) isClassForStream: pdfObject).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #AxialShading)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #RadialShading)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #TensorProductPatchMesh)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #LatticeFormGouraudShadedMesh)).
	self deny: (pdfObject canBeExemplarOf: (PtPDF typeAt: #FunctionBasedShading)).
]

{ #category : #tests }
PtTypingTests >> testTypingImage [

	| image stream attributeType |
	image := PtImageXObject depth4Mapped.
	stream := PtPDF Stream on: image content internal: image internal.
	attributeType := PtObjectType onSymbol: #XObject.
	self assert: ((stream typed: (Array with: attributeType)) isKindOf: PtXObject).
	self assert: ((stream asType: attributeType) isKindOf: PtXObject).
]

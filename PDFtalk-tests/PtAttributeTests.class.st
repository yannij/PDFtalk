Class {
	#name : #PtAttributeTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtAttributeTests >> testCatalog [
	| dict |
	dict := (PtPDF classAt: #Catalog) example.
	self assert: dict attributeNames asArray = #(#Type #Version #Extensions #Pages #PageLabels #Names #Dests #ViewerPreferences #PageLayout #PageMode #Outlines #Threads #OpenAction #AA #URI #AcroForm #Metadata #StructTreeRoot #MarkInfo #Lang #SpiderInfo #OutputIntents #PieceInfo #OCProperties #Perms #Legal #Requirements #Collection #NeedsRendering #AF).
	self assert: (dict attributesPresent collect: #selector) asArray = #(#Type #Pages #PageLabels).
	self assert: (dict attributesRequired collect: #selector) asArray = #(#Type #Pages).
	self assert: dict hasRequiredAttributes.
	self assert: dict pdfVersion = PtVersion pdf1_3.
	self assert: dict PageLabels = (PtPDF classAt: #NumberTree) nodeClass new.
	self assert: dict Pages = (PtPDF classAt: #Pages) new.
	self assert: dict Type asSmalltalkValue = #Catalog.
	self assert: dict Names isEmpty
]

{ #category : #tests }
PtAttributeTests >> testCrossReferenceStream [
	| dict |
	dict := (PtPDF classAt: #XRefStream) example.
	self assert: dict attributeNames asArray = #(#Length #Filter #DecodeParms #F #FFilter #FDecodeParms #DL #Type #Size #Index #Prev #W #Root #Info #ID).
	self assert: (dict attributesPresent collect: #selector) asArray = #(#Length #Filter #Type #Size #Index #W #Root).
	self assert: (dict attributesRequired collect: #selector) asArray = #(#Length #Type #Size #W #Root).
	self assert: dict hasRequiredAttributes.
	self assert: dict pdfVersion = PtVersion pdf1_5.
	self assert: dict Filter = #ASCIIHexDecode asPDF.
	self assert: dict Index = #(0 11) asPDF.
	self assert: dict Length = 153 asPDF.
	self assert: dict Size = 11 asPDF.
	self assert: dict Type asSmalltalkValue = #XRef.
	self assert: dict W = #(1 2 2) asPDF
]

{ #category : #tests }
PtAttributeTests >> testObjectStream [
	| dict |
	dict := (PtPDF classAt: #ObjectStream) example.
	self assert: dict attributeNames asArray = #(#Length #Filter #DecodeParms #F #FFilter #FDecodeParms #DL #Type #N #First #Extends).
	self assert: (dict attributesPresent collect: #selector) asArray = #(#Length #Type #N #First).
	self assert: (dict attributesRequired collect: #selector) asArray = #(#Length #Type #N #First).
	self assert: dict hasRequiredAttributes.
	self assert: dict pdfVersion = PtVersion pdf1_5.
	self assert: dict First = 15 asPDF.
	self assert: dict Length = 191 asPDF.
	self assert: dict N = 3 asPDF.
	self assert: dict Type asSmalltalkValue = #ObjStm.
	self should: [dict Size] raise: MessageNotUnderstood.
	self assert: dict Filter isEmpty
]

{ #category : #tests }
PtAttributeTests >> testTrailer [
	| dict |
	dict := (PtPDF classAt: #Trailer) example.
	self assert: dict attributeNames asArray = #(#Size #Prev #Root #Encrypt #Info #ID #XRefStm).
	self assert: (dict attributesPresent collect: #selector) asArray = #(#Size #Root #Info #ID).
	self assert: (dict attributesRequired collect: #selector) asArray = #(#Size #Root).
	self assert: dict hasRequiredAttributes.
	self assert: dict pdfVersion = PtVersion pdf1_1.
	self assert: dict ID size = 2.
	self assert: (dict at: #Info) isDirect not.
	self assert: (dict at: #Root) isDirect not.
	self assert: dict Size = 22 asPDF.
	self should: [dict Length] raise: MessageNotUnderstood
]

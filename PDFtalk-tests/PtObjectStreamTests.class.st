Class {
	#name : #PtObjectStreamTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtObjectStreamTests >> testReadCrossReferences [
	| stream file xrefStream |
	file := PtFile readTesterOn: '<<	/Type /XRef
	/W [1 2 2]
	/Filter /ASCIIHexDecode
	/Size 11
	/Root 1 0 R
	/Length 154	>>
stream' , self stringLf , '
	00 0000 FFFF
	01 0032 0000
	01 007A 0000
	01 00AC 0000
	01 00EE 0000
	01 0172 0000
	01 01BE 0000
	02 000A 0000
	02 000A 0001
	02 000A 0002
	01 01D8 0000
' , self stringLf , 'endstream'.
	stream := file readObject.
	self assert: (stream isKindOf: PtPDF Stream).
	self assert: stream content = ((PtPDF Dictionary new)
		at: #Type put: #XRef;
		at: #W put: #(1 2 2);
		at: #Filter put: #ASCIIHexDecode;
		at: #Size put: 11;
		at: #Root put: (file referenceAt: (PtObjectId number: 1));
		at: #Length put: 154;
		yourself) content.
	xrefStream := (PtPDF classAt: #XRefStream) newFrom: stream.
	self assert: (xrefStream isKindOf: (PtPDF classAt: #XRefStream)).
	self assert: xrefStream subsections size = 1.
	self assert: xrefStream subsections first = (PtCrossReferenceSubsection
		firstNumber: 0
		entries: ((OrderedCollection new)
			add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
			add: (PtUsedReference id: (PtObjectId number: 1) value: 50);
			add: (PtUsedReference id: (PtObjectId number: 2) value: 122);
			add: (PtUsedReference id: (PtObjectId number: 3) value: 172);
			add: (PtUsedReference id: (PtObjectId number: 4) value: 238);
			add: (PtUsedReference id: (PtObjectId number: 5) value: 370);
			add: (PtUsedReference id: (PtObjectId number: 6) value: 446);
			add: (PtStreamReference id: (PtObjectId number: 7) value: 10);
			add: (PtStreamReference id: (PtObjectId number: 8 generation: 1) value: 10);
			add: (PtStreamReference id: (PtObjectId number: 9 generation: 2) value: 10);
			add: (PtUsedReference id: (PtObjectId number: 10) value: 472);
			asArray))
]

{ #category : #tests }
PtObjectStreamTests >> testReadObjectStream [
	| stream file objStm |
	file := PtFile readTesterOn: '<<	/Type /ObjStm
	/Length 191
	/N 3
	/First 15	>>
stream' , self stringLf , '7 0 8 63 9 123
<<	/Type /Font
	/Subtype /TrueType
	/FontDescriptor 12 0 R
>>

<<	/Type /FontDescriptor
	/Ascent 891
	/FontFile2 22 0 R
>>
<<	/Type /Font
	/Subtype /Type0
	/ToUnicode 10 0 R
>>' , self stringLf , 'endstream'.
	stream := file readObject.
	self assert: (stream isKindOf: PtPDF Stream).
	self assert: stream content = (PtPDF Dictionary
		with: #Type -> #ObjStm
		with: #Length -> 191
		with: #N -> 3
		with: #First -> 15) content.
	objStm := (PtPDF typeAt: #ObjectStream) specialized: stream.
	self assert: objStm offsets size = 3.
	self assert: (objStm readAt: 0 with: file) = (PtPDF Dictionary
		with: #Type -> #Font
		with: #Subtype -> #TrueType
		with: #FontDescriptor -> (file referenceAt: (PtObjectId number: 12))).
	self assert: (objStm readAt: 1 with: file) = (PtPDF Dictionary
		with: #Type -> #FontDescriptor
		with: #Ascent -> 891
		with: #FontFile2 -> (file referenceAt: (PtObjectId number: 22))).
	self assert: (objStm readAt: 2 with: file) = (PtPDF Dictionary
		with: #Type -> #Font
		with: #Subtype -> #Type0
		with: #ToUnicode -> (file referenceAt: (PtObjectId number: 10))).
	self should: [objStm readAt: -1 with: file] raise: Error.
	self should: [objStm readAt: 3 with: file] raise: Error
]

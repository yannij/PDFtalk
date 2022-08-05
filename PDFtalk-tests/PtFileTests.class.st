Class {
	#name : #PtFileTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtFileTests >> testRead [
	| file |
	file := PtFile readFrom: PtFile exampleByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_2).
	self assert: file trailer Size = 7 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
			firstNumber: 0
			entries: ((OrderedCollection new)
				add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
				add: (PtUsedReference id: (PtObjectId number: 1) value: 15);
				add: (PtUsedReference id: (PtObjectId number: 2) value: 64);
				add: (PtUsedReference id: (PtObjectId number: 3) value: 147);
				add: (PtUsedReference id: (PtObjectId number: 4) value: 372);
				add: (PtUsedReference id: (PtObjectId number: 5) value: 230);
				add: (PtUsedReference id: (PtObjectId number: 6) value: 462);
				asArray))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 7
			with: #Root -> (file referenceAt: (PtObjectId number: 1)))).
	self assert: (file crossReferenceAtId: (file referenceAt: (PtObjectId number: 1))) = (PtUsedReference id: (PtObjectId number: 1) value: 15).
	self assert: (file referenceAt: (PtObjectId number: 1)) baseObject content = (PtPDF Dictionary
		with: #Type -> #Catalog
		with: #Pages -> (file referenceAt: (PtObjectId number: 2))) content.
	self assert: (file referenceAt: (PtObjectId number: 2)) baseObject = (PtPDF Dictionary
		with: #Type -> #Pages
		with: #MediaBox -> #(0 0 792 612)
		with: #Kids -> (Array with: (file referenceAt: (PtObjectId number: 3))) asPDF
		with: #Count -> 1).
	self assert: (file referenceAt: (PtObjectId number: 3)) baseObject = (PtPDF Dictionary
		with: #Type -> #Page
		with: #Parent -> (file referenceAt: (PtObjectId number: 2))
		with: #Resources -> (file referenceAt: (PtObjectId number: 4))
		with: #Contents -> (Array with: (file referenceAt: (PtObjectId number: 5))) asPDF).
	self assert: (file referenceAt: (PtObjectId number: 4)) baseObject = (PtPDF Dictionary
		with: #ProcSet -> #(#PDF #Text)
		with: #Font -> (PtPDF Dictionary with: #F1 -> (file referenceAt: (PtObjectId number: 6)))
		with: #XObject -> PtPDF Dictionary new).
	self assert: (file referenceAt: (PtObjectId number: 5)) baseObject = (PtPDF Stream
		on: (Dictionary with: #Length -> 82)
		internal: 'BT
1 0 0 1 30 550 Tm
/F1 8 Tf
10 TL
0.0 g
(Hello, World! \(From PDFTester\))Tj
ET
' withLf).
	self assert: (file referenceAt: (PtObjectId number: 6)) baseObject = (PtPDF Dictionary
		with: #Type -> #Font
		with: #Subtype -> #Type1
		with: #BaseFont -> #Courier)
]

{ #category : #tests }
PtFileTests >> testReadAllPages [
	| file |
	file := PtFile readFrom: PtFile exampleByteArray readStream.
	(file root at: #Pages) resolveAllReferences.
	self assert: file crossReferences usedReferences size = 6.
	self assert: file objects size = 6.
	self assert: (((file objects values collect: #pdfObject) collect: #class) collect: #name) sorted asArray = #(#Catalog #Contents #Page #Pages #Resources #StandardFont).
]

{ #category : #tests }
PtFileTests >> testReadAllPagesBreathFirst [
	| file |
	file := PtFile readFrom: PtFile exampleByteArray readStream.
	(file root at: #Pages) resolveAllReferencesBreathFirst.
	self assert: file crossReferences usedReferences size = 6.
	self assert: file objects size = 6.
	self assert: (((file objects values collect: #pdfObject) collect: #class) collect: #name) sorted asArray = #(#Catalog #Contents #Page #Pages #Resources #StandardFont).
]

{ #category : #tests }
PtFileTests >> testReadAllPagesRaw [
	"the objects are read without typing"

	| file |
	file := PtFile readFrom: PtFile exampleByteArray readStream.
	(file root at: #Pages) readAllRawObjects.
	self assert: file crossReferences usedReferences size = 6.
	self assert: file objects size = 6.
	self assert: (((file objects values collect: #pdfObject) collect: #class) collect: #name) sorted asArray = #(#Catalog #PDFDictionary #PDFDictionary #PDFDictionary #PDFDictionary #PDFStream)
]

{ #category : #tests }
PtFileTests >> testReadAllRaw [
	| file |
	file := PtFile readFrom: PtFile exampleByteArray readStream.
	(file root at: #Pages) readAllRawObjects.
	self assert: file crossReferences usedReferences size = 6.
	self assert: file objects size = 6.
	self assert: (((file objects values collect: #pdfObject) collect: #class) collect: #name) sorted asArray = #(#Catalog #PDFDictionary #PDFDictionary #PDFDictionary #PDFDictionary #PDFStream)
]

{ #category : #tests }
PtFileTests >> testReadMinimalFile [
	| file |
	file := PtFile readFrom: PtFile exampleMinimalByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_4).
	self assert: file trailer Size = 7 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
			firstNumber: 0
			entries: ((OrderedCollection new)
				add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
				add: (PtUsedReference id: (PtObjectId number: 1) value: 9);
				add: (PtUsedReference id: (PtObjectId number: 2) value: 81);
				add: (PtUsedReference id: (PtObjectId number: 3) value: 131);
				add: (PtUsedReference id: (PtObjectId number: 4) value: 197);
				add: (PtUsedReference id: (PtObjectId number: 5) value: 329);
				add: (PtUsedReference id: (PtObjectId number: 6) value: 405);
				asArray))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 7
			with: #Root -> (file referenceAt: (PtObjectId number: 1)))).
	self assert: (file crossReferenceAtId: (file referenceAt: (PtObjectId number: 1))) = (PtUsedReference id: (PtObjectId number: 1) value: 9).
	self assert: (file referenceAt: (PtObjectId number: 1)) baseObject = ((PtPDF classAt: #Catalog)
		with: #Type -> #Catalog
		with: #Outlines -> (file referenceAt: (PtObjectId number: 2))
		with: #Pages -> (file referenceAt: (PtObjectId number: 3))).
	self assert: (file referenceAt: (PtObjectId number: 2)) baseObject = (PtPDF Dictionary
		with: #Type -> #Outlines
		with: #Count -> 0).
	self assert: (file referenceAt: (PtObjectId number: 3)) baseObject = (PtPDF Dictionary
		with: #Type -> #Pages
		with: #Kids -> (Array with: (file referenceAt: (PtObjectId number: 4))) asPDF
		with: #Count -> 1).
	self assert: (file referenceAt: (PtObjectId number: 4)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Page;
		at: #Parent put: (file referenceAt: (PtObjectId number: 3));
		at: #MediaBox put: #(0 0 612 792);
		at: #Contents put: (file referenceAt: (PtObjectId number: 5));
		at: #Resources
			put: (PtPDF Dictionary with: #ProcSet -> (file referenceAt: (PtObjectId number: 6)));
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 5)) baseObject = (PtPDF Stream
		on: (Dictionary with: #Length -> 25)
		external: '(Page-marking operators)' , self stringLf).
	self assert: (file referenceAt: (PtObjectId number: 6)) baseObject = (Array with: #PDF) asPDF
]

{ #category : #tests }
PtFileTests >> testReadObjectStream [
	| file |
	file := PtFile readFrom: PtFile exampleObjectStreamByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_5).
	self assert: file trailer size = 2.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file trailer Prev isNil.
	self assert: file crossReferences size = 7.
	self assert: file crossReferences Size = 11 asPDF.
	self assert: file crossReferences Type = #XRef asPDF.
	self assert: file crossReferences Index = #(0 11) asPDF.
	self assert: file crossReferences W = #(1 2 2) asPDF.
	self assert: file crossReferences subsections size = 1.
	self assert: file crossReferences subsections first = (PtCrossReferenceSubsection
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
			asArray)).
	self assert: (file referenceAt: (PtObjectId number: 6)) baseObject = #(#PDF) asPDF.
	self assert: (file referenceAt: (PtObjectId number: 7)) baseObject = (PtPDF Dictionary
		with: #Type -> #Font
		with: #Subtype -> #TrueType
		with: #FontDescriptor -> (file referenceAt: (PtObjectId number: 12))).
	self assert: ((file referenceAt: (PtObjectId number: 10)) baseObject isKindOf: PtPDF Stream).
	self assert: (file referenceAt: (PtObjectId number: 10)) baseObject content = (PtPDF Dictionary
		with: #Type -> #ObjStm
		with: #Length -> 191
		with: #N -> 3
		with: #First -> 15) content.
	self assert: file crossReferences freeReferences asArray = (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0))
]

{ #category : #tests }
PtFileTests >> testReadUpdate1 [
	| file |
	file := PtFile readFrom: PtFile exampleUpdate1ByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_4).
	self assert: file trailer Size = 12 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file trailer Prev = 431 asPDF.
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array
			with: (PtCrossReferenceSubsection
				firstNumber: 0
				entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
			with: (PtCrossReferenceSubsection
				firstNumber: 4
				entries: (Array with: (PtUsedReference id: (PtObjectId number: 4) value: 640)))
			with: (PtCrossReferenceSubsection
				firstNumber: 7
				entries: ((OrderedCollection new)
					add: (PtUsedReference id: (PtObjectId number: 7) value: 788);
					add: (PtUsedReference id: (PtObjectId number: 8) value: 842);
					add: (PtUsedReference id: (PtObjectId number: 9) value: 960);
					add: (PtUsedReference id: (PtObjectId number: 10) value: 1080);
					add: (PtUsedReference id: (PtObjectId number: 11) value: 1200);
					asArray))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 12
			with: #Root -> (file referenceAt: (PtObjectId number: 1))
			with: #Prev -> 431)
		previous: (PtCrossReferences
			crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
				firstNumber: 0
				entries: ((OrderedCollection new)
					add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
					add: (PtUsedReference id: (PtObjectId number: 1) value: 9);
					add: (PtUsedReference id: (PtObjectId number: 2) value: 81);
					add: (PtUsedReference id: (PtObjectId number: 3) value: 131);
					add: (PtUsedReference id: (PtObjectId number: 4) value: 197);
					add: (PtUsedReference id: (PtObjectId number: 5) value: 329);
					add: (PtUsedReference id: (PtObjectId number: 6) value: 405);
					asArray))))
			trailer: ((PtPDF classAt: #Trailer)
				with: #Size -> 7
				with: #Root -> (file referenceAt: (PtObjectId number: 1))))).
	self assert: (file referenceAt: (PtObjectId number: 4)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Page;
		at: #Parent put: (file referenceAt: (PtObjectId number: 3));
		at: #MediaBox put: #(0 0 612 792);
		at: #Contents put: (file referenceAt: (PtObjectId number: 5));
		at: #Resources
			put: (PtPDF Dictionary with: #ProcSet -> (file referenceAt: (PtObjectId number: 6)));
		at: #Annots put: (file referenceAt: (PtObjectId number: 7));
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 7)) baseObject = (Array
		with: (file referenceAt: (PtObjectId number: 8))
		with: (file referenceAt: (PtObjectId number: 9))
		with: (file referenceAt: (PtObjectId number: 10))
		with: (file referenceAt: (PtObjectId number: 11))) asPDF.
	self assert: (file referenceAt: (PtObjectId number: 8)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(44 616 162 735);
		at: #Contents put: ' Text #1 ';
		at: #Open put: true;
		yourself) content asPDF.
	self assert: (file referenceAt: (PtObjectId number: 9)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(224 668 457 735);
		at: #Contents put: ' Text #2 ';
		at: #Open put: false;
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 10)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(239 393 328 622);
		at: #Contents put: ' Text #3 ';
		at: #Open put: true;
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 11)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(34 398 225 575);
		at: #Contents put: ' Text #4 ';
		at: #Open put: false;
		yourself)
]

{ #category : #tests }
PtFileTests >> testReadUpdate2 [
	| file |
	file := PtFile readFrom: PtFile exampleUpdate2ByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_4).
	self assert: file trailer Size = 12 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file trailer Prev = 1320 asPDF.
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array
			with: (PtCrossReferenceSubsection
				firstNumber: 0
				entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
			with: (PtCrossReferenceSubsection
				firstNumber: 10
				entries: (Array with: (PtUsedReference id: (PtObjectId number: 10) value: 1551)))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 12
			with: #Root -> (file referenceAt: (PtObjectId number: 1))
			with: #Prev -> 1320)
		previous: (PtCrossReferences
			crossReferenceSection: (PtCrossReferenceSection subsections: (Array
				with: (PtCrossReferenceSubsection
					firstNumber: 0
					entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
				with: (PtCrossReferenceSubsection
					firstNumber: 4
					entries: (Array with: (PtUsedReference id: (PtObjectId number: 4) value: 640)))
				with: (PtCrossReferenceSubsection
					firstNumber: 7
					entries: ((OrderedCollection new)
						add: (PtUsedReference id: (PtObjectId number: 7) value: 788);
						add: (PtUsedReference id: (PtObjectId number: 8) value: 842);
						add: (PtUsedReference id: (PtObjectId number: 9) value: 960);
						add: (PtUsedReference id: (PtObjectId number: 10) value: 1080);
						add: (PtUsedReference id: (PtObjectId number: 11) value: 1200);
						asArray))))
			trailer: ((PtPDF classAt: #Trailer)
				with: #Size -> 12
				with: #Root -> (file referenceAt: (PtObjectId number: 1))
				with: #Prev -> 431)
			previous: (PtCrossReferences
				crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
					firstNumber: 0
					entries: ((OrderedCollection new)
						add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
						add: (PtUsedReference id: (PtObjectId number: 1) value: 9);
						add: (PtUsedReference id: (PtObjectId number: 2) value: 81);
						add: (PtUsedReference id: (PtObjectId number: 3) value: 131);
						add: (PtUsedReference id: (PtObjectId number: 4) value: 197);
						add: (PtUsedReference id: (PtObjectId number: 5) value: 329);
						add: (PtUsedReference id: (PtObjectId number: 6) value: 405);
						asArray))))
				trailer: ((PtPDF classAt: #Trailer)
					with: #Size -> 7
					with: #Root -> (file referenceAt: (PtObjectId number: 1)))))).
	self assert: (file referenceAt: (PtObjectId number: 4)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Page;
		at: #Parent put: (file referenceAt: (PtObjectId number: 3));
		at: #MediaBox put: #(0 0 612 792);
		at: #Contents put: (file referenceAt: (PtObjectId number: 5));
		at: #Resources
			put: (PtPDF Dictionary with: #ProcSet -> (file referenceAt: (PtObjectId number: 6)));
		at: #Annots put: (file referenceAt: (PtObjectId number: 7));
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 7)) baseObject = (Array
		with: (file referenceAt: (PtObjectId number: 8))
		with: (file referenceAt: (PtObjectId number: 9))
		with: (file referenceAt: (PtObjectId number: 10))
		with: (file referenceAt: (PtObjectId number: 11))) asPDF.
	self assert: (file referenceAt: (PtObjectId number: 10)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(239 393 328 622);
		at: #Contents put: ' Modified Text #3 ';
		at: #Open put: true;
		yourself).
	self assert: file crossReferences freeReferences asArray = (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0))
]

{ #category : #tests }
PtFileTests >> testReadUpdate3 [
	| file |
	file := PtFile readFrom: PtFile exampleUpdate3ByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_4).
	self assert: file trailer Size = 12 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file trailer Prev = 1680 asPDF.
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array
			with: (PtCrossReferenceSubsection
				firstNumber: 0
				entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 8)))
			with: (PtCrossReferenceSubsection
				firstNumber: 7
				entries: (Array
					with: (PtUsedReference id: (PtObjectId number: 7) value: 1809)
					with: (PtFreeReference id: (PtObjectId number: 8 generation: 1) value: 9)
					with: (PtFreeReference id: (PtObjectId number: 9 generation: 1) value: 0)))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 12
			with: #Root -> (file referenceAt: (PtObjectId number: 1))
			with: #Prev -> 1680)
		previous: (PtCrossReferences
			crossReferenceSection: (PtCrossReferenceSection subsections: (Array
				with: (PtCrossReferenceSubsection
					firstNumber: 0
					entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
				with: (PtCrossReferenceSubsection
					firstNumber: 10
					entries: (Array with: (PtUsedReference id: (PtObjectId number: 10) value: 1551)))))
			trailer: ((PtPDF classAt: #Trailer)
				with: #Size -> 12
				with: #Root -> (file referenceAt: (PtObjectId number: 1))
				with: #Prev -> 1320)
			previous: (PtCrossReferences
				crossReferenceSection: (PtCrossReferenceSection subsections: (Array
					with: (PtCrossReferenceSubsection
						firstNumber: 0
						entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
					with: (PtCrossReferenceSubsection
						firstNumber: 4
						entries: (Array with: (PtUsedReference id: (PtObjectId number: 4) value: 640)))
					with: (PtCrossReferenceSubsection
						firstNumber: 7
						entries: ((OrderedCollection new)
							add: (PtUsedReference id: (PtObjectId number: 7) value: 788);
							add: (PtUsedReference id: (PtObjectId number: 8) value: 842);
							add: (PtUsedReference id: (PtObjectId number: 9) value: 960);
							add: (PtUsedReference id: (PtObjectId number: 10) value: 1080);
							add: (PtUsedReference id: (PtObjectId number: 11) value: 1200);
							asArray))))
				trailer: ((PtPDF classAt: #Trailer)
					with: #Size -> 12
					with: #Root -> (file referenceAt: (PtObjectId number: 1))
					with: #Prev -> 431)
				previous: (PtCrossReferences
					crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
						firstNumber: 0
						entries: ((OrderedCollection new)
							add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
							add: (PtUsedReference id: (PtObjectId number: 1) value: 9);
							add: (PtUsedReference id: (PtObjectId number: 2) value: 81);
							add: (PtUsedReference id: (PtObjectId number: 3) value: 131);
							add: (PtUsedReference id: (PtObjectId number: 4) value: 197);
							add: (PtUsedReference id: (PtObjectId number: 5) value: 329);
							add: (PtUsedReference id: (PtObjectId number: 6) value: 405);
							asArray))))
					trailer: ((PtPDF classAt: #Trailer)
						with: #Size -> 7
						with: #Root -> (file referenceAt: (PtObjectId number: 1))))))).
	self assert: (file referenceAt: (PtObjectId number: 7)) baseObject = (Array
		with: (file referenceAt: (PtObjectId number: 10))
		with: (file referenceAt: (PtObjectId number: 11))) asPDF.
	self assert: (file referenceAt: (PtObjectId number: 8)) baseObject = nil.
	self assert: (file referenceAt: (PtObjectId number: 9)) baseObject = nil.
	self assert: file crossReferences freeReferences asArray = (Array
		with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 8)
		with: (PtFreeReference id: (PtObjectId number: 8 generation: 1) value: 9)
		with: (PtFreeReference id: (PtObjectId number: 9 generation: 1) value: 0))
]

{ #category : #tests }
PtFileTests >> testReadUpdate4 [
	| file |
	file := PtFile readFrom: PtFile exampleUpdate4ByteArray readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_4).
	self assert: file trailer Size = 13 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file trailer Prev = 1847 asPDF.
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array
			with: (PtCrossReferenceSubsection
				firstNumber: 0
				entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
			with: (PtCrossReferenceSubsection
				firstNumber: 7
				entries: (Array
					with: (PtUsedReference id: (PtObjectId number: 7) value: 2015)
					with: (PtUsedReference id: (PtObjectId number: 8 generation: 1) value: 2078)
					with: (PtUsedReference id: (PtObjectId number: 9 generation: 1) value: 2200)))
			with: (PtCrossReferenceSubsection
				firstNumber: 12
				entries: (Array with: (PtUsedReference id: (PtObjectId number: 12) value: 2324)))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 13
			with: #Root -> (file referenceAt: (PtObjectId number: 1))
			with: #Prev -> 1847)
		previous: (PtCrossReferences
			crossReferenceSection: (PtCrossReferenceSection subsections: (Array
				with: (PtCrossReferenceSubsection
					firstNumber: 0
					entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 8)))
				with: (PtCrossReferenceSubsection
					firstNumber: 7
					entries: (Array
						with: (PtUsedReference id: (PtObjectId number: 7) value: 1809)
						with: (PtFreeReference id: (PtObjectId number: 8 generation: 1) value: 9)
						with: (PtFreeReference id: (PtObjectId number: 9 generation: 1) value: 0)))))
			trailer: ((PtPDF classAt: #Trailer)
				with: #Size -> 12
				with: #Root -> (file referenceAt: (PtObjectId number: 1))
				with: #Prev -> 1680)
			previous: (PtCrossReferences
				crossReferenceSection: (PtCrossReferenceSection subsections: (Array
					with: (PtCrossReferenceSubsection
						firstNumber: 0
						entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
					with: (PtCrossReferenceSubsection
						firstNumber: 10
						entries: (Array with: (PtUsedReference id: (PtObjectId number: 10) value: 1551)))))
				trailer: ((PtPDF classAt: #Trailer)
					with: #Size -> 12
					with: #Root -> (file referenceAt: (PtObjectId number: 1))
					with: #Prev -> 1320)
				previous: (PtCrossReferences
					crossReferenceSection: (PtCrossReferenceSection subsections: (Array
						with: (PtCrossReferenceSubsection
							firstNumber: 0
							entries: (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0)))
						with: (PtCrossReferenceSubsection
							firstNumber: 4
							entries: (Array with: (PtUsedReference id: (PtObjectId number: 4) value: 640)))
						with: (PtCrossReferenceSubsection
							firstNumber: 7
							entries: ((OrderedCollection new)
								add: (PtUsedReference id: (PtObjectId number: 7) value: 788);
								add: (PtUsedReference id: (PtObjectId number: 8) value: 842);
								add: (PtUsedReference id: (PtObjectId number: 9) value: 960);
								add: (PtUsedReference id: (PtObjectId number: 10) value: 1080);
								add: (PtUsedReference id: (PtObjectId number: 11) value: 1200);
								asArray))))
					trailer: ((PtPDF classAt: #Trailer)
						with: #Size -> 12
						with: #Root -> (file referenceAt: (PtObjectId number: 1))
						with: #Prev -> 431)
					previous: (PtCrossReferences
						crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
							firstNumber: 0
							entries: ((OrderedCollection new)
								add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
								add: (PtUsedReference id: (PtObjectId number: 1) value: 9);
								add: (PtUsedReference id: (PtObjectId number: 2) value: 81);
								add: (PtUsedReference id: (PtObjectId number: 3) value: 131);
								add: (PtUsedReference id: (PtObjectId number: 4) value: 197);
								add: (PtUsedReference id: (PtObjectId number: 5) value: 329);
								add: (PtUsedReference id: (PtObjectId number: 6) value: 405);
								asArray))))
						trailer: ((PtPDF classAt: #Trailer)
							with: #Size -> 7
							with: #Root -> (file referenceAt: (PtObjectId number: 1)))))))).
	self assert: (file referenceAt: (PtObjectId number: 7)) baseObject = ((OrderedCollection new)
		add: (file referenceAt: (PtObjectId number: 10));
		add: (file referenceAt: (PtObjectId number: 11));
		add: (file referenceAt: (PtObjectId number: 8 generation: 1));
		add: (file referenceAt: (PtObjectId number: 9 generation: 1));
		add: (file referenceAt: (PtObjectId number: 12));
		asPDF).
	self assert: (file referenceAt: (PtObjectId number: 8 generation: 1)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(58 657 172 742);
		at: #Contents put: ' New Text #1 ';
		at: #Open put: true;
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 9 generation: 1)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(389 459 570 537);
		at: #Contents put: ' New Text #2 ';
		at: #Open put: false;
		yourself).
	self assert: (file referenceAt: (PtObjectId number: 8)) baseObject = nil.
	self assert: (file referenceAt: (PtObjectId number: 9)) baseObject = nil.
	self assert: (file referenceAt: (PtObjectId number: 12)) baseObject = ((PtPDF Dictionary new)
		at: #Type put: #Annot;
		at: #Subtype put: #Text;
		at: #Rect put: #(44 253 473 337);
		at: #Contents
			put: (' New Text #3' , (String with: 131 asCharacter) , 'a longer text annotation which we will continue onto a second line ') asPDF;
		at: #Open put: true;
		yourself).
	self assert: file crossReferences freeReferences asArray = (Array with: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0))
]

{ #category : #tests }
PtFileTests >> testReadWithDeferredStreamLength [
	| file |
	file := PtFile readFrom: PtFile exampleByteArray2 readStream.
	self assert: file header = (PtHeader version: PtVersion pdf1_2).
	self assert: file trailer Size = 8 asPDF.
	self assert: (file trailer Root isKindOf: (PtPDF classAt: #Catalog)).
	self assert: file crossReferences = (PtCrossReferences
		crossReferenceSection: (PtCrossReferenceSection subsections: (Array with: (PtCrossReferenceSubsection
			firstNumber: 0
			entries: ((OrderedCollection new)
				add: (PtFreeReference id: (PtObjectId number: 0 generation: 65535) value: 0);
				add: (PtUsedReference id: (PtObjectId number: 1) value: 15);
				add: (PtUsedReference id: (PtObjectId number: 2) value: 64);
				add: (PtUsedReference id: (PtObjectId number: 3) value: 147);
				add: (PtUsedReference id: (PtObjectId number: 4) value: 320);
				add: (PtUsedReference id: (PtObjectId number: 5) value: 230);
				add: (PtUsedReference id: (PtObjectId number: 6) value: 411);
				add: (PtUsedReference id: (PtObjectId number: 7) value: 1224);
				asArray))))
		trailer: ((PtPDF classAt: #Trailer)
			with: #Size -> 8
			with: #Root -> (file referenceAt: (PtObjectId number: 1)))).
	self assert: (file crossReferenceAtId: (file referenceAt: (PtObjectId number: 1))) = (PtUsedReference id: (PtObjectId number: 1) value: 15).
	self assert: (file referenceAt: (PtObjectId number: 1)) baseObject = ((PtPDF classAt: #Catalog)
		with: #Type -> #Catalog
		with: #Pages -> (file referenceAt: (PtObjectId number: 2))).
	self assert: (file referenceAt: (PtObjectId number: 2)) baseObject = (PtPDF Dictionary
		with: #Type -> #Pages
		with: #MediaBox -> #(0 0 792 612)
		with: #Kids -> (Array with: (file referenceAt: (PtObjectId number: 3))) asPDF
		with: #Count -> 1).
	self assert: (file referenceAt: (PtObjectId number: 3)) baseObject = (PtPDF Dictionary
		with: #Type -> #Page
		with: #Parent -> (file referenceAt: (PtObjectId number: 2))
		with: #Resources -> (file referenceAt: (PtObjectId number: 4))
		with: #Contents -> (Array with: (file referenceAt: (PtObjectId number: 5))) asPDF).
	self assert: (file referenceAt: (PtObjectId number: 4)) baseObject = (PtPDF Dictionary
		with: #ProcSet -> #(#PDF #Text)
		with: #Font -> PtPDF Dictionary new
		with: #XObject -> (PtPDF Dictionary with: #IM1 -> (file referenceAt: (PtObjectId number: 6)))).
	self assert: (file referenceAt: (PtObjectId number: 5)) baseObject = (PtPDF Stream
		on: (Valuemap with: #Length -> 30)
		internal: 'q
101 0 0 51 0 0  cm/IM1 Do
Q
' withLf).
	self assert: ((file referenceAt: (PtObjectId number: 6)) baseObject isKindOf: PtPDF Stream).
	self assert: (file referenceAt: (PtObjectId number: 6)) baseObject size = 7.
	self assert: (file referenceAt: (PtObjectId number: 7)) baseObject = 663 asPDF
]

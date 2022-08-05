Class {
	#name : #PtStreamTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #tests }
PtStreamTests >> testASCII85 [
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: (PtPDF classAt: #Filter) exampleString) external = (PtPDF classAt: #ASCII85Decode) exampleEncodedString.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: (PtPDF classAt: #ASCII85Decode) exampleEncodedString) internal = (PtPDF classAt: #Filter) exampleString.
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: 'Hello World!') external = '87cURD]i,"Ebo80~>'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '87cURD]i,"Ebo80~>') internal = 'Hello World!'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '87zURD]i,"Ebo80~>') internal class == PtReadError.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '87zURD]i,"Ebo80~>') internal description = 'Illegal character in ASCII85 encoded string'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '87vURD]i,"Ebo80~>') internal class == PtReadError.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '87vURD]i,"Ebo80~>') internal description = 'Illegal character in ASCII85 encoded string'.
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: (String new: 4 withAll: 0 asCharacter)) external = 'z~>'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: 'z~>') internal = (String new: 4 withAll: 0 asCharacter).
	self assert: ((PtPDF classAt: #ASCII85Decode) external: 'z') internal = (String new: 4 withAll: 0 asCharacter).
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: (String new: 3 withAll: 0 asCharacter)) external = '!!!!~>'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '!!!!~>') internal = (String new: 3 withAll: 0 asCharacter).
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: (String new: 2 withAll: 0 asCharacter)) external = '!!!~>'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '!!!~>') internal = (String new: 2 withAll: 0 asCharacter).
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: (String with: 0 asCharacter)) external = '!!~>'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '!!~>') internal = (String with: 0 asCharacter).
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '!~>') internal class == PtReadError.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '!~>') internal description = 'Decoding error in ASCII85 encoded string'.
	self assert: ((PtPDF classAt: #ASCII85Decode) internal: (String new: 4 withAll: 255 asCharacter)) external = 's8W-!~>'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: 's8W-!~>') internal = (String new: 4 withAll: 255 asCharacter).
	self assert: ((PtPDF classAt: #ASCII85Decode) external: 's8W-"~>') internal class == PtReadError.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: 's8W-"~>') internal description = 'Decoding error in ASCII85 encoded string'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '87cURD
	]i,"Ebo80~>') internal = 'Hello World!'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '
	87cUR
	D]i,"
	Ebo80
	~>') internal = 'Hello World!'.
	self assert: ((PtPDF classAt: #ASCII85Decode) external: '
	87cUR
	D]i,"
	Ebo80
	~
      >') internal = 'Hello World!'.
]

{ #category : #tests }
PtStreamTests >> testASCIIHex [
	self assert: ((PtPDF classAt: #ASCIIHexDecode) internal: (PtPDF classAt: #Filter) exampleString) external = (PtPDF classAt: #ASCIIHexDecode) exampleEncodedString.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) external: (PtPDF classAt: #ASCIIHexDecode) exampleEncodedString) internal = (PtPDF classAt: #Filter) exampleString.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) internal: 'abcdef') external = '616263646566>'.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) internal: #[0 1 2 3 4 5] asString) external = '000102030405>'.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) external: '616263646566') internal = 'abcdef'.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) external: '616263646566>') internal = 'abcdef'.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) external: '000102030405>') internal = #[0 1 2 3 4 5] asString.
	self assert: ((PtPDF classAt: #ASCIIHexDecode) external: '6') internal = ((PtPDF classAt: #ASCIIHexDecode) external: '60') internal
]

{ #category : #tests }
PtStreamTests >> testAddFilters [
	| stream dict |
	dict := Valuemap new.
	stream := PtPDF Stream on: dict internal: 'abcdef'.
	self deny: (stream hasKey: #Filter).
	stream filter: #ASCIIHexDecode.
	self assert: stream Filter asSmalltalkValue = #ASCIIHexDecode.
	stream filter: nil.
	self deny: (stream hasKey: #Filter).
	stream addFilter: #FlateDecode.
	self assert: stream Filter asSmalltalkValue = #FlateDecode.
	stream addFilter: #ASCII85Decode.
	self assert: stream Filter asSmalltalkValue = #(#ASCII85Decode #FlateDecode).
	stream addFilter: #ASCIIHexDecode.
	self assert: stream Filter asSmalltalkValue = #(#ASCIIHexDecode #ASCII85Decode #FlateDecode).
	stream filter: #ASCIIHexDecode.
	self assert: stream Filter asSmalltalkValue = #ASCIIHexDecode
]

{ #category : #tests }
PtStreamTests >> testAveragePredictor [
	self assert: ((PtAveragePredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 2 2].
	self assert: ((PtAveragePredictor offsetLeft: 1) unpredict: #[1 2 2] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtAveragePredictor offsetLeft: 1) predict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtAveragePredictor offsetLeft: 1) unpredict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtAveragePredictor offsetLeft: 1) predict: #[10 11 12] withUpperRow: #[6 5 4]) = #[7 4 5].
	self assert: ((PtAveragePredictor offsetLeft: 1) unpredict: #[7 4 5] withUpperRow: #[6 5 4]) = #[10 11 12].
	self assert: ((PtAveragePredictor offsetLeft: 1) predict: #[255 0 1] withUpperRow: #[10 11 12]) = #[250 123 251].
	self assert: ((PtAveragePredictor offsetLeft: 1) unpredict: #[250 123 251] withUpperRow: #[10 11 12]) = #[255 0 1].
	self assert: ((PtAveragePredictor offsetLeft: 1) predict: #[100 150 200] withUpperRow: #[200 150 100]) = #[0 25 75].
	self assert: ((PtAveragePredictor offsetLeft: 1) unpredict: #[0 25 75] withUpperRow: #[200 150 100]) = #[100 150 200].
	self assert: ((PtAveragePredictor offsetLeft: 2) predict: #[1 2 3 4 5 6] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 3 4 4].
	self assert: ((PtAveragePredictor offsetLeft: 2) unpredict: #[1 2 3 3 4 4] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 5 6].
	self assert: ((PtAveragePredictor offsetLeft: 3) predict: #[1 2 3 4 5 6] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 4 5].
	self assert: ((PtAveragePredictor offsetLeft: 3) unpredict: #[1 2 3 4 4 5] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 5 6].
	self assert: ((PtAveragePredictor offsetLeft: 1) predict: #[] withUpperRow: #[]) = #[].
	self assert: ((PtAveragePredictor offsetLeft: 1) unpredict: #[] withUpperRow: #[]) = #[].
]

{ #category : #tests }
PtStreamTests >> testDecodingError [
	| stream dict |
	dict := Valuemap new.
	dict at: #Length put: 20.
	dict at: #Filter put: #DCTDecode.
	stream := PtPDF Stream on: dict external: 'abcdefghijklmnopqrst'.
	self assert: stream size = 2.
	self assert: stream Length = 20 asPDF.
	self assert: stream Filter = #DCTDecode asPDF.
	self shouldnt: [stream internal] raise: PtError.
	self assert: (stream internal isKindOf: PtUnsupported).
	self assert: stream internal description = 'DCTDecode is not supported (yet)'.
	self shouldnt: [stream internal] raise: PtError
]

{ #category : #tests }
PtStreamTests >> testEncodingError [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #DCTDecode.
	stream := PtPDF Stream on: dict internal: 'abcdef'.
	self assert: stream size = 2.
	self assert: stream Length = 0 asPDF.
	self assert: stream Filter = #DCTDecode asPDF.
	self shouldnt: [stream external] raise: PtError.
	self assert: (stream external isKindOf: PtUnsupported).
	self assert: stream external description = 'DCTDecode is not supported (yet)'.
	self shouldnt: [stream external] raise: PtError
]

{ #category : #tests }
PtStreamTests >> testFlate [
	self assert: ((PtPDF classAt: #FlateDecode) internal: (PtPDF classAt: #Filter) exampleString) external = (PtPDF classAt: #FlateDecode) exampleEncodedString.
	self assert: ((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedString) internal = (PtPDF classAt: #Filter) exampleString.
	self should: [((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringNoHeader) internal] raise: Exception.
	[((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringNoHeader) internal] on: Exception do: [:ex |
		self assert: ex description = 'data error'].
	self should: [((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringNoChecksum) internal] raise: Exception.
	[((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringNoChecksum) internal] on: Exception do: [:ex |
		self assert: ex description = 'buffer error'].
	self should: [((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringWrongChecksum) internal] raise: Exception.
	[((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringWrongChecksum) internal] on: Exception do: [:ex |
		self assert: ex description = 'data error'].
	self should: [((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringWrongHeader) internal] raise: Exception.
	[((PtPDF classAt: #FlateDecode) external: (PtPDF classAt: #FlateDecode) exampleEncodedStringWrongHeader) internal] on: Exception do: [:ex |
		self assert: ex description = 'data error'].
]

{ #category : #tests }
PtStreamTests >> testFlateDecodingEmpty [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #FlateDecode.
	stream := PtPDF Stream on: dict external: ''.
	self assert: stream size = 2.
	self assert: stream Length = 0 asPDF.
	self assert: stream Filter = #FlateDecode asPDF.
	self shouldnt: [stream internal] raise: PtError.
	self assert: stream internal isEmpty
]

{ #category : #tests }
PtStreamTests >> testFlateDecodingZippedEmptyGemstone [
	"Gemstone zips an empty string to 6 bytes"

	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #FlateDecode.
	stream := PtPDF Stream on: dict external: #[120 218 0 0 0 1] asString.
	self assert: stream size = 2.
	self assert: stream Length = 6 asPDF.
	self assert: stream Filter = #FlateDecode asPDF.
	self shouldnt: [stream internal] raise: PtError.
	self assert: stream internal isEmpty
]

{ #category : #tests }
PtStreamTests >> testFlateDecodingZippedEmptyVisualWorks [
	"VisualWorks zips an empty string to 8 bytes"

	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #FlateDecode.
	stream := PtPDF Stream on: dict external: #[120 218 3 0 0 0 0 1] asString.
	self assert: stream size = 2.
	self assert: stream Length = 8 asPDF.
	self assert: stream Filter = #FlateDecode asPDF.
	self shouldnt: [stream internal] raise: PtError.
	self assert: stream internal isEmpty
]

{ #category : #tests }
PtStreamTests >> testFlateEncodingEmpty [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #FlateDecode.
	stream := PtPDF Stream on: dict internal: ''.
	self assert: stream size = 2.
	self assert: (stream Length = 8 asPDF "in VisualWorks" or: [
	                 stream Length = 6 asPDF "in Gemstone"]).
	self assert: stream Filter = #FlateDecode asPDF.
	self shouldnt: [stream external] raise: PtError.
	self assert: (stream external asByteArray first: 2) = #[120 218].
	self assert: (stream external asByteArray last: 4) = #[0 0 0 1]
]

{ #category : #tests }
PtStreamTests >> testMultipleDecodingErrors [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#ASCII85Decode #CCITTFaxDecode).
	stream := PtPDF Stream on: dict external: '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream size = 2.
	self assert: stream Length = 31 asPDF.
	self assert: stream Filter = #(#ASCII85Decode #CCITTFaxDecode) asPDF.
	self assert: stream external = '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream internal class = PtUnsupported.
	self assert: stream filter size = 2.
	self assert: stream filter first class == (PtPDF classAt: #ASCII85Decode).
	self assert: stream filter first internal = 'Das ist ja mal ein Text'.
	self assert: stream filter first external = '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream filter last class == (PtPDF classAt: #CCITTFaxDecode).
	self assert: stream filter last internal class = PtUnsupported.
	self assert: stream filter last external = 'Das ist ja mal ein Text'
]

{ #category : #tests }
PtStreamTests >> testMultipleDecodingErrors2 [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#CCITTFaxDecode #ASCII85Decode).
	stream := PtPDF Stream on: dict external: '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream size = 2.
	self assert: stream Length = 31 asPDF.
	self assert: stream Filter = #(#CCITTFaxDecode #ASCII85Decode) asPDF.
	self assert: stream external = '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream internal class = PtUnsupported.
	self assert: stream internal description = 'CCITTFaxDecode is not supported (yet)'.
	self assert: stream filter size = 2.
	self assert: stream filter first class == (PtPDF classAt: #CCITTFaxDecode).
	self assert: stream filter first external = '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream filter first internal class = PtUnsupported.
	self assert: stream filter last class == (PtPDF classAt: #ASCII85Decode).
	self assert: stream filter last external class = PtUnsupported.
	self assert: stream filter last internal class = PtUnsupported.
	self assert: stream filter first internal = stream filter last external
]

{ #category : #tests }
PtStreamTests >> testMultipleEncodingErrors [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#ASCII85Decode #CCITTFaxDecode).
	stream := PtPDF Stream on: dict internal: 'Das ist ja mal ein Text'.
	self assert: stream size = 2.
	self assert: stream Length = 0 asPDF.
	self assert: stream Filter = #(#ASCII85Decode #CCITTFaxDecode) asPDF.
	self assert: stream internal = 'Das ist ja mal ein Text'.
	self assert: stream external class = PtUnsupported.
	self assert: stream filter size = 2.
	self assert: stream filter first class == (PtPDF classAt: #ASCII85Decode).
	self assert: stream filter first internal class = PtUnsupported.
	self assert: stream filter first external class = PtUnsupported.
	self assert: stream filter last class == (PtPDF classAt: #CCITTFaxDecode).
	self assert: stream filter last internal = 'Das ist ja mal ein Text'.
	self assert: stream filter last external class = PtUnsupported
]

{ #category : #tests }
PtStreamTests >> testMultipleEncodingErrors2 [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#CCITTFaxDecode #ASCII85Decode).
	stream := PtPDF Stream on: dict internal: 'Das ist ja mal ein Text'.
	self assert: stream size = 2.
	self assert: stream Length = 0 asPDF.
	self assert: stream Filter = #(#CCITTFaxDecode #ASCII85Decode) asPDF.
	self assert: stream internal = 'Das ist ja mal ein Text'.
	self assert: stream external class = PtUnsupported.
	self assert: stream filter size = 2.
	self assert: stream filter first class == (PtPDF classAt: #CCITTFaxDecode).
	self assert: stream filter last class == (PtPDF classAt: #ASCII85Decode).
	self assert: stream filter last internal = 'Das ist ja mal ein Text'.
	self assert: stream filter last external = '6t(-ZBleA=C1/6%@;I&tBl5%mAU&:~>'.
	self assert: stream filter first internal = stream filter last external.
	self assert: stream filter first external class = PtUnsupported.
	self assert: stream filter first external description = 'CCITTFaxDecode is not supported (yet)'
]

{ #category : #tests }
PtStreamTests >> testMultipleEncodings [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#ASCII85Decode #ASCIIHexDecode).
	stream := PtPDF Stream on: dict internal: 'Das ist ja mal ein Text'.
	self assert: stream size = 2.
	self assert: stream Length = 61 asPDF.
	self assert: stream Filter = #(#ASCII85Decode #ASCIIHexDecode) asPDF.
	self assert: stream internal = 'Das ist ja mal ein Text'.
	self assert: stream external = '1c.*F2`!3C2E<]P2`*9D2F05U1,(US2DI*W1,(UD2E<Za1,(RB2DmEQ2`*\~>'.
	self assert: (stream filter first isKindOf: (PtPDF classAt: #ASCII85Decode)).
	self assert: stream filter first external = stream external.
	self assert: stream filter first internal = '44617320697374206A61206D616C2065696E2054657874>'.
	self assert: (stream filter last isKindOf: (PtPDF classAt: #ASCIIHexDecode)).
	self assert: stream filter last external = stream filter first internal.
	self assert: stream filter last internal = stream internal
]

{ #category : #tests }
PtStreamTests >> testMultipleEncodingsWithEmptyParameters [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#ASCII85Decode #ASCIIHexDecode).
	dict
		at: #DecodeParams
		put: (Array
			with: PtPDF Dictionary empty
			with: PtPDF Dictionary empty).
	stream := PtPDF Stream on: dict internal: 'Das ist ja mal ein Text'.
	self assert: stream external = '1c.*F2`!3C2E<]P2`*9D2F05U1,(US2DI*W1,(UD2E<Za1,(RB2DmEQ2`*\~>'
]

{ #category : #tests }
PtStreamTests >> testMultipleEncodingsWithNullParameters [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#ASCII85Decode #ASCIIHexDecode).
	dict at: #DecodeParams put: #(nil nil).
	stream := PtPDF Stream on: dict internal: 'Das ist ja mal ein Text'.
	self assert: stream external = '1c.*F2`!3C2E<]P2`*9D2F05U1,(US2DI*W1,(UD2E<Za1,(RB2DmEQ2`*\~>'.
]

{ #category : #tests }
PtStreamTests >> testMultipleEncodingsWithParameters [
	| stream dict |
	dict := Valuemap new.
	dict at: #Filter put: #(#ASCII85Decode #ASCIIHexDecode).
	dict
		at: #DecodeParams
		put: (Array
			with: nil
			with: PtPDF Dictionary empty).
	stream := PtPDF Stream on: dict internal: 'Das ist ja mal ein Text'.
	self assert: stream external = '1c.*F2`!3C2E<]P2`*9D2F05U1,(US2DI*W1,(UD2E<Za1,(RB2DmEQ2`*\~>'
]

{ #category : #tests }
PtStreamTests >> testNoPredictor [
	self assert: ((PtNoPredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtNoPredictor offsetLeft: 1) unpredict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtNoPredictor offsetLeft: 1) predict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtNoPredictor offsetLeft: 1) unpredict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtNoPredictor offsetLeft: 1) predict: #[10 11 12] withUpperRow: #[6 5 4]) = #[10 11 12].
	self assert: ((PtNoPredictor offsetLeft: 1) unpredict: #[10 11 12] withUpperRow: #[6 5 4]) = #[10 11 12].
	self assert: ((PtNoPredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[10 11 12]) = #[1 2 3].
	self assert: ((PtNoPredictor offsetLeft: 1) unpredict: #[1 2 3] withUpperRow: #[10 11 12]) = #[1 2 3].
	self assert: ((PtNoPredictor offsetLeft: 1) predict: #[] withUpperRow: #[]) = #[].
	self assert: ((PtNoPredictor offsetLeft: 1) unpredict: #[] withUpperRow: #[]) = #[].
]

{ #category : #tests }
PtStreamTests >> testPDFVersion [
	self assert: PtPDF Stream example pdfVersion = PtVersion pdf1_0.
	self assert: PtPDF Stream example1_2 pdfVersion = PtVersion pdf1_2.
	self assert: PtPDF Stream example1_5 pdfVersion = PtVersion pdf1_5.
]

{ #category : #tests }
PtStreamTests >> testPaethPredictor [
	self assert: ((PtPaethPredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 1 1].
	self assert: ((PtPaethPredictor offsetLeft: 1) unpredict: #[1 1 1] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtPaethPredictor offsetLeft: 1) predict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtPaethPredictor offsetLeft: 1) unpredict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtPaethPredictor offsetLeft: 1) predict: #[10 11 12] withUpperRow: #[6 5 4]) = #[4 1 1].
	self assert: ((PtPaethPredictor offsetLeft: 1) unpredict: #[4 1 1] withUpperRow: #[6 5 4]) = #[10 11 12].
	self assert: ((PtPaethPredictor offsetLeft: 1) predict: #[255 0 1] withUpperRow: #[10 11 12]) = #[245 1 1].
	self assert: ((PtPaethPredictor offsetLeft: 1) unpredict: #[245 1 1] withUpperRow: #[10 11 12]) = #[255 0 1].
	self assert: ((PtPaethPredictor offsetLeft: 1) predict: #[100 150 200] withUpperRow: #[200 150 100]) = #[156 50 100].
	self assert: ((PtPaethPredictor offsetLeft: 1) unpredict: #[156 50 100] withUpperRow: #[200 150 100]) = #[100 150 200].
	self assert: ((PtPaethPredictor offsetLeft: 2) predict: #[1 2 3 4 5 6] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 2 2 2 2].
	self assert: ((PtPaethPredictor offsetLeft: 2) unpredict: #[1 2 2 2 2 2] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 5 6].
	self assert: ((PtPaethPredictor offsetLeft: 3) predict: #[1 2 3 4 5 6] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 3 3 3].
	self assert: ((PtPaethPredictor offsetLeft: 3) unpredict: #[1 2 3 3 3 3] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 5 6].
	self assert: ((PtPaethPredictor offsetLeft: 1) predict: #[] withUpperRow: #[]) = #[].
	self assert: ((PtPaethPredictor offsetLeft: 1) unpredict: #[] withUpperRow: #[]) = #[].
]

{ #category : #tests }
PtStreamTests >> testRead [
	self assert: (PtFile readTesterOn: '<</Length 0>>stream' , self stringLf , 'endstream') readObject = (PtPDF Stream on: (Valuemap with: #Length -> 0) internal: '').
	self assert: (PtFile readTesterOn: '<< /Length 68 >>		% was: (An indirect reference to object 8)
stream' , self stringLf , 'BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET' , self stringLf , 'endstream') readObject = (PtPDF Stream
			on: (Valuemap with: #Length -> 68)
			internal: 'BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET')
]

{ #category : #tests }
PtStreamTests >> testReadErrors [
	| file stream |
	self should: [(PtFile readTesterOn: '<</Lenth 0>>stream' , self stringLf , 'endstream') readObject] raise: PtReadError.
	[(PtFile readTesterOn: '<</Lenth 0>>stream' , self stringLf , 'endstream') readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'The stream dictonary has no Length entry'].
	file := PtFile readTesterOn: '<</Length 0>>stream' , (String with: Character cr) , 'endstream'.
	self should: [file readObject] raise: PtReadError.
	file := PtFile readTesterOn: '<</Length 0>>stream' , (String with: Character cr) , 'endstream'.
	[file readObject] on: PtReadError do: [:ex | ex resume].
	self assert: file parser errors first description = 'Read "$e". "<Character lf>" expected'.
	file := PtFile readTesterOn: '<</Length 0>>stream' , (String with: Character cr) , 'endstream'.
	stream := [file readObject] on: PtReadError do: [:ex |
		self assert: ex description = 'Read "$e". "<Character lf>" expected'.
		ex resume].
	self assert: stream asSmalltalkValue = (PtPDF Dictionary with: #Length -> 0) asSmalltalkValue
]

{ #category : #tests }
PtStreamTests >> testReadHexDecode [
	| input stream |
	input := '<<
	/Filter /ASCIIHexDecode		% For readability in this example
	/Length 153
>>
stream' , self stringLf , '	00 0000 FFFF
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
endstream'.
	stream := (PtFile readTesterOn: input) readObject.
	self assert: stream internal size = 55.
	self assert: (stream internal at: 1) asInteger = 0.
	self assert: (stream internal at: 2) asInteger = 0.
	self assert: (stream internal at: 3) asInteger = 0.
	self assert: (stream internal at: 4) asInteger = 255.
	self assert: (stream internal at: 5) asInteger = 255.
	self assert: (stream internal at: 51) asInteger = 1.
	self assert: (stream internal at: 52) asInteger = 1.
	self assert: (stream internal at: 53) asInteger = 216.
	self assert: (stream internal at: 54) asInteger = 0.
	self assert: (stream internal at: 55) asInteger = 0
]

{ #category : #tests }
PtStreamTests >> testReadStreamWithBlank [
	"found spaces after >stream< and LF in a Microsof bill - not sure if this is legal"
	self assert: (PtFile readTesterOn: '<</Length 0>>stream' , self stringLf , 'endstream') readObject = (PtPDF Stream on: (Valuemap with: #Length -> 0) internal: '').
	self assert: (PtFile readTesterOn: '<</Length 0>>stream' , (String with: Character cr), self stringLf , 'endstream') readObject = (PtPDF Stream on: (Valuemap with: #Length -> 0) internal: '').
	self assert: (PtFile readTesterOn: '<</Length 0>>stream ' , self stringLf , 'endstream') readObject = (PtPDF Stream on: (Valuemap with: #Length -> 0) internal: '').
	self assert: (PtFile readTesterOn: '<</Length 0>>stream ' , (String with: Character cr), self stringLf , 'endstream') readObject = (PtPDF Stream on: (Valuemap with: #Length -> 0) internal: '').
	self assert: (PtFile readTesterOn: '<</Length 0>>stream      ' , self stringLf , 'endstream') readObject = (PtPDF Stream on: (Valuemap with: #Length -> 0) internal: '').
]

{ #category : #tests }
PtStreamTests >> testStreamLengthTooSmall [
	| stream file |
	file := PtFile readTesterOn: '<</Length 9>>
stream
abcdefghij
endstream' withLf.
	self should: [stream := file readObject] raise: PtExtraCharacterInStreamError.
	self assert: stream isNil
]

{ #category : #tests }
PtStreamTests >> testStreamLengthTooSmallByTwo [
	| stream file |
	file := PtFile readTesterOn: '<</Length 9>>
stream
abcdefghijk
endstream' withLf.
	self
		should: [
		[stream := file readObject] on: PtFileError do: [:ex |
			self assert: ex class = PtExtraCharacterInStreamError.
			self assert: ex messageText = 'Extra character in stream'.
			ex resume]]
		raise: PtReadError.
	self assert: stream isNil.
	self assert: file parser errors isEmpty.
	self assert: file parser next = $k.
	file := PtFile readTesterOn: '<</Length 9>>
stream
abcdefghijk
endstream' withLf.
	[[stream := file readObject] on: PtFileError do: [:ex | ex resume]] on: PtReadError do: [:ex |
		self assert: ('Read #*k*. "endstream" expected' match: ex messageText)]
]

{ #category : #tests }
PtStreamTests >> testStreamLengthTooSmallHandled [
	| stream file |
	file := PtFile readTesterOn: '<</Length 9>>
stream
abcdefghij
endstream' withLf.
	[stream := file readObject] on: PtFileError do: [:ex | 
		self assert: ex class = PtExtraCharacterInStreamError.
		self assert: ex messageText = 'Extra character in stream'.
		ex resume].
	self assert: stream Length = 9 asPDF.
	self assert: stream internal = 'abcdefghi'.
	self assert: file parser errors isEmpty.
	self assert: file parser atEnd
]

{ #category : #tests }
PtStreamTests >> testStreamLengthTooSmallHandledWithWhitespace [
	| stream file |
	file := PtFile readTesterOn: '<</Length 9>>
stream
abcdefghij
 
	  
endstream' withLf.
	[stream := file readObject] on: PtFileError do: [:ex | 
		self assert: ex class = PtExtraCharacterInStreamError.
		self assert: ex messageText = 'Extra character in stream'.
		ex resume].
	self assert: stream Length = 9 asPDF.
	self assert: stream internal = 'abcdefghi'.
	self assert: file parser errors isEmpty.
	self assert: file parser atEnd
]

{ #category : #tests }
PtStreamTests >> testSubPredictor [
	self assert: ((PtSubPredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 1 1].
	self assert: ((PtSubPredictor offsetLeft: 1) unpredict: #[1 1 1] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtSubPredictor offsetLeft: 1) predict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtSubPredictor offsetLeft: 1) unpredict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtSubPredictor offsetLeft: 1) predict: #[10 11 12] withUpperRow: #[6 5 4]) = #[10 1 1].
	self assert: ((PtSubPredictor offsetLeft: 1) unpredict: #[10 1 1] withUpperRow: #[6 5 4]) = #[10 11 12].
	self assert: ((PtSubPredictor offsetLeft: 1) predict: #[255 0 1] withUpperRow: #[10 11 12]) = #[255 1 1].
	self assert: ((PtSubPredictor offsetLeft: 1) unpredict: #[255 1 1] withUpperRow: #[10 11 12]) = #[255 0 1].
	self assert: ((PtSubPredictor offsetLeft: 2) predict: #[1 2 3 4 5 6] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 2 2 2 2].
	self assert: ((PtSubPredictor offsetLeft: 2) unpredict: #[1 2 2 2 2 2] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 5 6].
	self assert: ((PtSubPredictor offsetLeft: 3) predict: #[1 2 3 4 5 6] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 3 3 3].
	self assert: ((PtSubPredictor offsetLeft: 3) unpredict: #[1 2 3 3 3 3] withUpperRow: #[0 0 0 0 0 0]) = #[1 2 3 4 5 6].
	self assert: ((PtSubPredictor offsetLeft: 1) predict: #[] withUpperRow: #[]) = #[].
	self assert: ((PtSubPredictor offsetLeft: 1) unpredict: #[] withUpperRow: #[]) = #[].
]

{ #category : #tests }
PtStreamTests >> testUpPredictor [
	self assert: ((PtUpPredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtUpPredictor offsetLeft: 1) unpredict: #[1 2 3] withUpperRow: #[0 0 0]) = #[1 2 3].
	self assert: ((PtUpPredictor offsetLeft: 1) predict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtUpPredictor offsetLeft: 1) unpredict: #[0 0 0] withUpperRow: #[0 0 0]) = #[0 0 0].
	self assert: ((PtUpPredictor offsetLeft: 1) predict: #[10 11 12] withUpperRow: #[6 5 4]) = #[4 6 8].
	self assert: ((PtUpPredictor offsetLeft: 1) unpredict: #[4 6 8] withUpperRow: #[6 5 4]) = #[10 11 12].
	self assert: ((PtUpPredictor offsetLeft: 1) predict: #[1 2 3] withUpperRow: #[10 11 12]) = #[247 247 247].
	self assert: ((PtUpPredictor offsetLeft: 1) unpredict: #[247 247 247] withUpperRow: #[10 11 12]) = #[1 2 3].
	self assert: ((PtUpPredictor offsetLeft: 1) predict: #[] withUpperRow: #[]) = #[].
	self assert: ((PtUpPredictor offsetLeft: 1) unpredict: #[] withUpperRow: #[]) = #[].
]

{ #category : #tests }
PtStreamTests >> testWrite [
	self assert: PtPDF Stream example pdfSource = ('<<	/Length 68	>>' , self stringLf , 'stream' , self stringLf , 'BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET' , self stringLf , 'endstream').
	self assert: PtPDF Stream example pdfSource withLf = '<<	/Length 68	>>
stream
BT
	/F1 12 Tf
	72 712 Td
	( A stream with an indirect length ) Tj
ET
endstream' withLf.
	self assert: (PtFile readTesterOn: PtPDF Stream example pdfSource) readObject = PtPDF Stream example
]

{ #category : #tests }
PtStreamTests >> testZipPredictor [
	self assert: ((PtZipFilter testerWith: nil) unpredicted: #[0 1 2 3]) asByteArray = #[0 1 2 3].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 10
		with: #Columns -> 3)) unpredicted: #[0 1 2 3]) asByteArray = #[1 2 3].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 10
		with: #Columns -> 3)) predicted: #[1 2 3]) asByteArray = #[0 1 2 3].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 11
		with: #Columns -> 3)) unpredicted: #[1 1 1 1 1 4 1 1]) asByteArray = #[1 2 3 4 5 6].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 11
		with: #Columns -> 3)) predicted: #[1 2 3 4 5 6]) asByteArray = #[1 1 1 1 1 4 1 1].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 12
		with: #Columns -> 3)) unpredicted: #[2 1 2 3 2 3 3 3]) asByteArray = #[1 2 3 4 5 6].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 12
		with: #Columns -> 3)) predicted: #[1 2 3 4 5 6]) asByteArray = #[2 1 2 3 2 3 3 3].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 13
		with: #Columns -> 3)) unpredicted: #[3 1 2 2 3 4 2 2]) asByteArray = #[1 2 3 4 5 6].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 13
		with: #Columns -> 3)) predicted: #[1 2 3 4 5 6]) asByteArray = #[3 1 2 2 3 4 2 2].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 14
		with: #Columns -> 3)) unpredicted: #[4 1 1 1 4 3 1 1]) asByteArray = #[1 2 3 4 5 6].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 14
		with: #Columns -> 3)) predicted: #[1 2 3 4 5 6]) asByteArray = #[4 1 1 1 4 3 1 1].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 15
		with: #Columns -> 3)) unpredicted: #[0 1 2 3]) asByteArray = #[1 2 3].
	self assert: ((PtZipFilter testerWith: (PtPDF Dictionary
		with: #Predictor -> 15
		with: #Columns -> 3)) predicted: #[1 2 3]) asByteArray = #[0 1 2 3]
]

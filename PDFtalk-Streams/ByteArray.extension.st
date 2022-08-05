Extension { #name : #ByteArray }

{ #category : #'*PDFtalk-Streams-printing' }
ByteArray >> asASCII85String [
	"<String>
	formatted to 80 columns;
	except when a $' is the last character of a line. In this case, all next $' chars are added.
	Added tab as first character to not disturb Gemstone by an $% as first Character"

	| wst rst |
	wst := String new writeStream.
	wst
		nextPut: $(;
		nextPutAll: self class name asString;
		space;
		nextPutAll: #fromASCII85String: asString.
	rst := self asString asASCII85 printString readStream.
	[rst atEnd] whileFalse: [
		| line |
		line := rst nextAvailable: 80.
		wst
			cr;
			tab;
			nextPutAll: line.
		line last = $' ifTrue: [
			[rst peek = $'] whileTrue: [wst nextPut: rst next]]].
	wst nextPut: $).
	^wst contents
]

{ #category : #'*PDFtalk-Streams-instance creation' }
ByteArray class >> fromASCII85String: aString [
	^(String fromASCII85: aString) asByteArray
]

{ #category : #'*PDFtalk-Streams-printing' }
ByteArray >> printvalueWith: printer [
	| wst |
	self size > 200 ifTrue: [
		^LiteralPrintvalue string: self asASCII85String].
	wst := WriteStream on: (String new: self size).
	wst nextPutAll: '#['.
	self do: [:element | wst nextPutAll: element asSource] separatedBy: [wst space].
	wst nextPut: $].
	^LiteralPrintvalue string: wst contents
]

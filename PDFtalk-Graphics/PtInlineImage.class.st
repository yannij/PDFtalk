"
PDF Inline Images as defined in PDF 32000_2008.pdf, section 8.9.7, pp. 214.

As an alternative to the image XObjects, a sampled image may be specified in the form of an inline image.
This type of image shall be defined directly within the content stream in which it will be painted rather than as a separate object.
Because the inline format gives the reader less flexibility in managing the image data, it shall be used only for small images (4 KB or less).

An inline image object shall be delimited in the content stream by the operators BI (begin image), ID (image data), and EI (end image).
BI and ID shall bracket a series of key-value pairs specifying the characteristics of the image, such as its dimensions and colour space;
the image data shall follow between the ID and EI operators.
The format is thus analogous to that of a stream object such as an image XObject:
"
Class {
	#name : #PtInlineImage,
	#superclass : #PtPicture,
	#category : #'PDFtalk-Graphics'
}

{ #category : #accessing }
PtInlineImage >> keyForAbbreviation: aName [
	"<Symbol>"

	^self keysByAbbreviation at: aName content ifAbsent: [aName content]
]

{ #category : #accessing }
PtInlineImage >> keysByAbbreviation [
	| dict |
	dict := Dictionary new.
	dict at: #BPC put: #BitsPerComponent.
	dict at: #CS put: #ColorSpace.
	dict at: #D put: #Decode.
	dict at: #DP put: #DecodeParms.
	dict at: #F put: #Filter.
	dict at: #H put: #Height.
	dict at: #IM put: #ImageMask.
	dict at: #I put: #Interpolate.
	dict at: #W put: #Width.
	^dict
]

{ #category : #accessing }
PtInlineImage >> valueForAbbreviation: anObject [
	"<Object>"

	^self valuesByAbbreviation at: anObject content ifAbsent: [anObject content]
]

{ #category : #accessing }
PtInlineImage >> valuesByAbbreviation [
	| dict |
	dict := Dictionary new.
	dict at: #G put: #DeviceGray.
	dict at: #RGB put: #DeviceRGB.
	dict at: #CMYK put: #DeviceCMYK.
	dict at: #I put: #Indexed.
	dict at: #AHx put: #ASCIIHexDecode.
	dict at: #A85 put: #ASCII85Decode.
	dict at: #LZW put: #LZWDecode.
	dict at: #Fl put: #FlateDecode.
	dict at: #RL put: #RunLengthDecode.
	dict at: #CCF put: #CCITTFaxDecode.
	dict at: #DCT put: #DCTDecode.
	^dict
]

"
The TIFF predictor is not implemented, since it applies mostly to images which is not my focus.
See the TIFF specification (http://partners.adobe.com/public/developer/en/tiff/TIFF6.pdf) section 14, Horizontal Differencing, for details.
"
Class {
	#name : #PtTIFFPredictor,
	#superclass : #PtPredictor,
	#category : #'PDFtalk-Streams'
}

{ #category : #'instance creation' }
PtTIFFPredictor class >> newFor: aZipFilter [
	| inst |
	inst := self new.
	inst initializeFrom: aZipFilter.
	^inst
]

{ #category : #'initialize-release' }
PtTIFFPredictor >> initializeFrom: aZipFilter [
	"do nothing for now"
]

{ #category : #filtering }
PtTIFFPredictor >> predicted: aByteString [
	^PtUnsupported newSignal: 'TIFF prediction is not supported'
]

{ #category : #filtering }
PtTIFFPredictor >> unpredicted: aByteString [
	^PtUnsupported newSignal: 'TIFF prediction is not supported'
]

"
PDF Colour Spaces as defined in PDF 32000_2008.pdf, section 8.6, pp. 138

PDF includes facilities for specifying the colours of graphics objects to be painted on the current page. The colour facilities are divided into two parts:
	• Colour specification. A conforming writer may specify abstract colours in a device-independent way. Colours may be described in any of a variety of colour systems, or colour spaces. Some colour spaces are related to device colour representation (grayscale, RGB, CMYK), others to human visual perception (CIE-based). Certain special features are also modelled as colour spaces: patterns, colour mapping, separations, and high-fidelity and multitone colour.
	• Colour rendering. A conforming reader shall reproduce colours on the raster output device by a multiple-step process that includes some combination of colour conversion, gamma correction, halftoning, and scan conversion. Some aspects of this process use information that is specified in PDF. However, unlike the facilities for colour specification, the colour-rendering facilities are device-dependent and should not be included in a page description.
"
Class {
	#name : #AboutPDFtalkColour,
	#superclass : #Object,
	#category : #'PDFtalk-Colour'
}

{ #category : #properties }
AboutPDFtalkColour class >> creationRules [
	^'Package [Pharo Fileout PDFtalk](1.3.1.1,chaider)'
]

{ #category : #properties }
AboutPDFtalkColour class >> creationTime [
	^'21.06.2022 08:32:09'
]

{ #category : #properties }
AboutPDFtalkColour class >> creator [
	^'Bundle {Smalltalk Transform Project}(2.0.2.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkColour class >> isFunctional [
	^false
]

{ #category : #properties }
AboutPDFtalkColour class >> source [
	^'Package [PDFtalk Colour](2.5.5.0,chaider)'
]

{ #category : #properties }
AboutPDFtalkColour class >> sourceSmalltalk [
	^'VisualWorks®, 9.2 of 7. Januar 2022'
]

{ #category : #properties }
AboutPDFtalkColour class >> sourceStore [
	^'psql_public_cst_2007'
]

{ #category : #properties }
AboutPDFtalkColour class >> sourceTime [
	^'21.06.2022 04:50:12'
]

{ #category : #properties }
AboutPDFtalkColour class >> targetSmalltalk [
	^'Pharo 10.0'
]

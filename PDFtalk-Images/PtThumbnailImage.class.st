"
PDF Thumbnail Image as defined in PDF 32000_2008.pdf, section 12.3.4, pp. 370.

A PDF document may contain thumbnail images representing the contents of its pages in miniature form. A conforming reader may display these images on the screen, allowing the user to navigate to a page by clicking its thumbnail image:

NOTE Thumbnail images are not required, and may be included for some pages and not for others.

The thumbnail image for a page shall be an image XObject specified by the Thumb entry in the page object. It has the usual structure for an image dictionary, but only the Width, Height, ColorSpace, BitsPerComponent, and Decode entries are significant; all of the other entries shall be ignored if present. (If a Subtype entry is specified, its value shall be Image.) The image’s colour space shall be either DeviceGray or DeviceRGB, or an Indexed space based on one of these.


"
Class {
	#name : #PtThumbnailImage,
	#superclass : #PtImageXObject,
	#category : #'PDFtalk-Images'
}

{ #category : #testing }
PtThumbnailImage class >> isClassForStream: aStream [
	^#(#Width #Height #BitsPerComponent #ColorSpace) allSatisfy: [:key |
		aStream hasKey: key]
]

{ #category : #accessing }
PtThumbnailImage class >> pdfTypeDefinition [
	^PDFTypeDefinition
		name: #ThumbnailImage
		supertype: #Stream
		section: '12.3.4'
		documentation: 'A PDF document may contain thumbnail images representing the contents of its pages in miniature form. A conforming reader may display these images on the screen, allowing the user to navigate to a page by clicking its thumbnail image:

NOTE Thumbnail images are not required, and may be included for some pages and not for others.

The thumbnail image for a page shall be an image XObject specified by the Thumb entry in the page object. It has the usual structure for an image dictionary, but only the Width, Height, ColorSpace, BitsPerComponent, and Decode entries are significant; all of the other entries shall be ignored if present. (If a Subtype entry is specified, its value shall be Image.) The image’s colour space shall be either DeviceGray or DeviceRGB, or an Indexed space based on one of these.'
]

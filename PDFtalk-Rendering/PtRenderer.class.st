"
Renders a graphical object on a PDF Page.

Initialized on a PDF Document with a Page
"
Class {
	#name : #PtRenderer,
	#superclass : #Object,
	#instVars : [
		'product',
		'bounds',
		'colorspace',
		'contentOperations',
		'idsAtfonts'
	],
	#category : #'PDFtalk-Rendering'
}

{ #category : #'instance creation' }
PtRenderer class >> newOn: aPage bounds: aRectangle colorspace: aColourSpace [
	| inst |
	inst := self new.
	inst initializeProduct: aPage bounds: aRectangle colorspace: aColourSpace.
	^inst
]

{ #category : #rendering }
PtRenderer >> add: anOperator [
	self contentOperations add: anOperator
]

{ #category : #rendering }
PtRenderer >> addArcCenter: centerPoint radius: radiusPoint from: angle for: deltaAngle do: aBlock [
	"copied from vw 7.3.1, since the implementation of dots changed in vw 7.4"

	| ang1rad sin0 cos0 p0 adiff tanrad ang2rad cx cy ang1 delta rx ry |
	ang1 := angle.
	adiff := deltaAngle.
	adiff < 0 ifTrue: [
		adiff := adiff negated.
		ang1 := ang1 - adiff].
	adiff := adiff min: 360.
	delta := adiff.
	ang1rad := ang1 degreesToRadians.
	sin0 := ang1rad sin.
	cos0 := ang1rad cos.
	cx := centerPoint x.
	cy := centerPoint y.
	rx := radiusPoint x.
	ry := radiusPoint y.
	p0 := (cos0 * rx + cx) @ (sin0 * ry + cy).
	self moveTo: p0.
	[adiff > 90] whileTrue: [
		| w p3 |
		w := cos0.
		cos0 := sin0 negated.
		sin0 := w.
		p3 := (cos0 * rx + cx) @ (sin0 * ry + cy).
		self addArcFrom: p0 via: (p0 x + (cos0 * rx)) @ (p0 y + (sin0 * ry)) to: p3 do: aBlock.
		p0 := p3.
		adiff := adiff - 90].
	adiff > 0 ifFalse: [
		^self].
	"Compute the intersection of
	the tangents, for addArcFrom:...."
	tanrad := (adiff degreesToRadians / 2) tan.
	ang2rad := (ang1 + delta) degreesToRadians.
	self
		addArcFrom: p0
		via: (p0 x - (tanrad * sin0 * rx)) @ (p0 y + (tanrad * cos0 * ry))
		to: (cx + (radiusPoint x * ang2rad cos)) @ (cy + (radiusPoint y * ang2rad sin))
		do: aBlock
]

{ #category : #rendering }
PtRenderer >> addArcFrom: p0 via: p1 to: p2 do: aBlock [
	"copied from vw 7.3.1, since the implementation of dots changed in vw 7.4"

	" p0 and p2 are tangent points.
	p1 is the intersection of the tangent lines."
	| magic |
	"The following is a magic value that causes
	Bezier curves to approximate arcs with better
	than 0.0003 accuracy."
	magic := 0.5522847.
	aBlock value: (p1 - p0) * magic + p0
		value: (p1 - p2) * magic + p2
		value: p2
]

{ #category : #actions }
PtRenderer >> addContents [
	"adds the contents to the container (Page or Form)"

	^self subclassResponsibility
]

{ #category : #actions }
PtRenderer >> addProcSet: aSymbol [
	"preserving the order"

	| procSets newProcSet |
	procSets := self resources ProcSet asSmalltalkValue asSet.
	(procSets includes: aSymbol) ifTrue: [
		^self].
	procSets add: aSymbol.
	newProcSet := #(#PDF #Text #ImageB #ImageC #ImageI) select: [:procset |
		procSets includes: procset].
	self resources at: #ProcSet put: newProcSet
]

{ #category : #rendering }
PtRenderer >> addRectangleLeft: leftNumber bottom: bottomNumber width: widthNumber height: heightNumber [
	self add: (PtAppendRectangle
		with: leftNumber
		with: bottomNumber
		with: widthNumber
		with: heightNumber)
]

{ #category : #rendering }
PtRenderer >> addRoundedRectanglePath: box radius: radius [
	"Add a rectangular path with rounded corners
	c1-p1---p2-c2
	p8            p3
	 |               |
	p7            p4
	c4-p6---p5-c3"

	| kappa l left right bottom top p1 p2 p3 p4 p5 p6 p7 p8 |
	kappa := 0.552285.
	l := radius * kappa.
	left := box left.
	right := box right.
	bottom := box top.
	top := box bottom.
	p1 := (left + radius) @ top.
	p2 := (right - radius) @ top.
	p3 := right @ (top - radius).
	p4 := right @ (bottom + radius).
	p5 := (right - radius) @ bottom.
	p6 := (left + radius) @ bottom.
	p7 := left @ (bottom + radius).
	p8 := left @ (top - radius).
	self moveTo: p1.
	self lineTo: p2.
	self curveTo: p3 controlPoint1: (p2 x + l) @ p2 y controlPoint2: p3 x @ (p3 y + l).
	self lineTo: p4.
	self curveTo: p5 controlPoint1: p4 x @ (p4 y - l) controlPoint2: (p5 x + l) @ p5 y.
	self lineTo: p6.
	self curveTo: p7 controlPoint1: (p6 x - l) @ p6 y controlPoint2: p7 x @ (p7 y - l).
	self lineTo: p8.
	self curveTo: p1 controlPoint1: p8 x @ (p8 y + l) controlPoint2: (p1 x - l) @ p1 y
]

{ #category : #rendering }
PtRenderer >> addTransparencyPageAttributesWithColorspace: aColorspace [
	"add the transparency related information to the page"

	self subclassResponsibility
]

{ #category : #accessing }
PtRenderer >> bounds [
	"<Rectangle>"

	^bounds
]

{ #category : #rendering }
PtRenderer >> capStyle: anInteger [
	self add: (PtSetCap with: anInteger - 1)
]

{ #category : #rendering }
PtRenderer >> characterSpacing: aNumber [
	self add: (PtCharacterSpacing with: aNumber)
]

{ #category : #rendering }
PtRenderer >> clip [
	self add: PtClip empty
]

{ #category : #rendering }
PtRenderer >> closeAndStroke [
	self add: PtStrokeClosed empty
]

{ #category : #rendering }
PtRenderer >> closepath [
	self add: PtClosePath empty
]

{ #category : #accessing }
PtRenderer >> colorspace [
	"<ColourSpace>
	we render in this colorspace"

	^colorspace
]

{ #category : #rendering }
PtRenderer >> concat: anArray6OfNumber [
	self add: (PtConcatenateMatrix operands: anArray6OfNumber)
]

{ #category : #accessing }
PtRenderer >> contentOperations [
	"<SequenceableCollection of: Operation>"

	^contentOperations ifNil: [contentOperations := OrderedCollection new]
]

{ #category : #accessing }
PtRenderer >> contentSource [
	"<ByteString>"

	| wst |
	wst := PtWriter new.
	self contentOperations do: [:operator |
		operator writePDFOn: wst indent: 0.
		wst cr].
	^wst contents asString
]

{ #category : #rendering }
PtRenderer >> curveTo: aPoint controlPoint1: controlPoint1 controlPoint2: controlPoint2 [
	self add: (PtAppendCurve operands: controlPoint1 asPDFArray , controlPoint2 asPDFArray , aPoint asPDFArray)
]

{ #category : #rendering }
PtRenderer >> dash: aDash [
	self add: (PtSetDash
		with: aDash array
		with: aDash offset)
]

{ #category : #rendering }
PtRenderer >> displayArcBBoxOrigin: originPoint extent: extentPoint startAngle: startAngle sweepAngle: sweepAngle [
	| center start sweep |
	start := startAngle.
	sweep := sweepAngle.
	sweep < 0 ifTrue: [
		sweep := sweep negated.
		start := start - sweep].
	sweep := 360 min: sweep.
	center := originPoint + (extentPoint / 2.0).
	self addArcCenter: center radius: extentPoint / 2.0 from: start for: sweep do: [:p2 :p3 :p4 |
		self curveTo: p4 controlPoint1: p2 controlPoint2: p3]
]

{ #category : #rendering }
PtRenderer >> displayWedgeBBoxOrigin: originPoint extent: extentPoint startAngle: startAngle sweepAngle: sweepAngle [
	| center start sweep |
	start := startAngle.
	sweep := sweepAngle.
	sweep < 0 ifTrue: [
		sweep := sweep negated.
		start := start - sweep].
	sweep := 360 min: sweep.
	center := originPoint + (extentPoint / 2.0).
	self addArcCenter: center radius: extentPoint / 2.0 from: start for: sweep do: [:p2 :p3 :p4 |
		self curveTo: p4 controlPoint1: p2 controlPoint2: p3].
	sweep = 360 ifFalse: [
		self lineTo: center]
]

{ #category : #rendering }
PtRenderer >> endpath [
	self add: PtEndPath empty
]

{ #category : #rendering }
PtRenderer >> fill [
	self add: PtFill empty
]

{ #category : #rendering }
PtRenderer >> fillColor: aColor [
	self add: aColor fillColourSetter
]

{ #category : #actions }
PtRenderer >> finishProduct [
	self idsAtFonts keysAndValuesDo: [:font :id |
		(self pdfFontAt: id) addWinAnsiEncodingWith: font]
]

{ #category : #rendering }
PtRenderer >> horizontalScaling: aNumber [
	self add: (PtHorizontalScaling with: aNumber)
]

{ #category : #accessing }
PtRenderer >> idForFont: loadedFont [
	"<Symbol>
	add loadedFont with new ID if not there"

	^self idsAtFonts at: loadedFont ifAbsentPut: [
		self resources idFor: loadedFont pdfFont]
]

{ #category : #accessing }
PtRenderer >> idForFontNamed: aFontnameSymbol [
	"<Symbol>
	the Resources font id"

	^self idForFont: (PtFFont fontAt: aFontnameSymbol)
]

{ #category : #accessing }
PtRenderer >> idsAtFonts [
	"<Dictionary key: Graphics.Fonts.Font value: Symbol>"

	^idsAtfonts ifNil: [idsAtfonts := Valuemap new]
]

{ #category : #rendering }
PtRenderer >> inCompatibilitySectionDo: zeroArgumentBlock [
	self add: PtBeginCompatibility empty.
	[zeroArgumentBlock value] ensure: [self add: PtEndCompatibility empty]
]

{ #category : #'initialize-release' }
PtRenderer >> initializeProduct: initialProduct bounds: aRectangle colorspace: aColourSpace [
	bounds := aRectangle.
	product := initialProduct.
	colorspace := aColourSpace
]

{ #category : #rendering }
PtRenderer >> isolatedDo: zeroArgumentBlock [
	"do zeroArgumentBlock with a copy of the graphics state.
	Any changes to the graphics state done in the block will be undone when the block finishes"

	self add: PtSaveState empty.
	[zeroArgumentBlock value] ensure: [self add: PtRestoreState empty]
]

{ #category : #rendering }
PtRenderer >> joinStyle: anInteger [
	self add: (PtSetJoin with: anInteger - 1)
]

{ #category : #rendering }
PtRenderer >> lineTo: aPoint [
	self add: (PtAppendLine operands: aPoint asPDFArray)
]

{ #category : #rendering }
PtRenderer >> linewidth: aNumber [
	self add: (PtSetLineWidth with: aNumber)
]

{ #category : #rendering }
PtRenderer >> miterLimit: aNumber [
	self add: (PtSetMiterLimit with: aNumber)
]

{ #category : #rendering }
PtRenderer >> moveTo: aPoint [
	self add: (PtMove operands: aPoint asPDFArray)
]

{ #category : #accessing }
PtRenderer >> newCodeForGlyph: aGlyph inFont: opentype [
	"<Integer>
	answer a newly assigned code for aGlyph which is not in the WinAnsi encoding.
	these codes are collected and added as encoding difference to the PDF"

	| font |
	font := self pdfFontAt: (self idsAtFonts at: opentype).
	^font usedExtraGlyphs at: aGlyph ifAbsentPut: [font newCodeForExtraGlyph]
]

{ #category : #accessing }
PtRenderer >> pageRenderer [
	"<PageRenderer>
	the top renderer for the page"

	^self subclassResponsibility
]

{ #category : #rendering }
PtRenderer >> paintShading: aShading [
	self add: (PtPaintShading with: (self resources idFor: aShading))
]

{ #category : #rendering }
PtRenderer >> paintXObject: anXObject [
	self add: (PtPaintXObject with: (self resources idFor: anXObject)).
	anXObject addProcSetTo: self
]

{ #category : #accessing }
PtRenderer >> pdfFontAt: fontId [
	"<Font>"

	^self resources fonts objectAt: fontId
]

{ #category : #accessing }
PtRenderer >> pdfStringWithTabularCharacters: aString inFont: opentype [
	"<String>
	string with WinAnsiEncoding where tabular glyphs are specially encoded.
	Dont use collect for TwoByteString"

	| newString |
	newString := String new.
	aString do: [:char |
		| maybeNewChar |
		maybeNewChar := self tabularCharacterFor: char in: opentype.
		newString := newString copyWith: maybeNewChar].
	^newString
]

{ #category : #accessing }
PtRenderer >> product [
	"<Page | Form>"

	^product
]

{ #category : #actions }
PtRenderer >> render: oneArgumentBlock [
	"adds everything to the page or form.
	The rendering process.
	oneArgumentBlock takes the renderer as parameter"

	self setupBounds.
	oneArgumentBlock value: self.
	self addContents.
	self finishProduct
]

{ #category : #accessing }
PtRenderer >> resources [
	"<Resources>
	the current resources.
	Always add #ProcSet for backward compatibility (i.e. Quark)"

	^self product at: #Resources ifAbsentPut: [
		| dict |
		dict := (PtPDF classAt: #Resources) empty.
		dict at: #ProcSet put: #(#PDF #Text).
		dict]
]

{ #category : #rendering }
PtRenderer >> setClippingPath [
	self closepath.
	self clip.
	self endpath
]

{ #category : #rendering }
PtRenderer >> setExtGState: anExtGState [
	self add: (PtSetGraphicsState with: (self resources idFor: anExtGState))
]

{ #category : #rendering }
PtRenderer >> setFont: aFontnameSymbol size: aSizeNumber [
	self add: (PtTextFont
		with: (self idForFontNamed: aFontnameSymbol)
		with: aSizeNumber)
]

{ #category : #actions }
PtRenderer >> setupBounds [
	"set the bounding box in the document"

	^self subclassResponsibility
]

{ #category : #rendering }
PtRenderer >> showString: aString [
	self add: (PtShowText with: aString)
]

{ #category : #rendering }
PtRenderer >> showTextPositioned: aString [
	self add: (PtShowTextPositioned with: aString)
]

{ #category : #rendering }
PtRenderer >> stroke [
	self add: PtStroke empty
]

{ #category : #rendering }
PtRenderer >> strokeColor: aColor [
	self add: aColor strokeColourSetter
]

{ #category : #accessing }
PtRenderer >> tabularCharacterFor: aCharacter in: aFont [
	"<Character>
	with new assigned code for the tabular glyph"

	(aFont tabularGlyphFor: aCharacter) ifNotNil: [:tabularGlyph |
		^(self newCodeForGlyph: tabularGlyph inFont: aFont) asCharacter].
	^aCharacter
]

{ #category : #rendering }
PtRenderer >> textMatrix: anArray6OfNumber [
	self add: (PtSetTextMatrix operands: anArray6OfNumber)
]

{ #category : #rendering }
PtRenderer >> textObjectDo: zeroArgumentBlock [
	self add: PtBeginText empty.
	[zeroArgumentBlock value] ensure: [self add: PtEndText empty]
]

{ #category : #rendering }
PtRenderer >> textRenderingMode: anInteger [
	self add: (PtTextRenderingMode with: anInteger)
]

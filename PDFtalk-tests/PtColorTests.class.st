Class {
	#name : #PtColorTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-tests'
}

{ #category : #Testing }
PtColorTests >> testBlending [
	self assert: CmykColor black asPsComment = '0 0 0 1 (Black)'.
	self assert: CmykColor hks42 asPsComment = '1 0.55 0 0 (HKS42)'.
	self assert: (CmykColor black blendWith: CmykColor hks42) asPsComment = '0.5 0.275 0 0.5 (50c28m0y50k)'.
	self assert: (CmykColor black blendWith: CmykColor hks42) = (CmykColor hks42 blendWith: CmykColor black).
	self assert: CmykColor white asPsComment = '0 0 0 0 (White)'.
	self assert: (CmykColor white blendWith: CmykColor hks42) asPsComment = '0.5 0.275 0 0 (50c28m0y0k)'.
	self assert: (CmykColor white blendWith: CmykColor hks42) = (CmykColor hks42 blendWith: CmykColor white).
	self assert: ((CmykColor gray: 0.6) blendWith: (CmykColor gray: 0.2)) = (CmykColor gray: 0.4).
]

{ #category : #Testing }
PtColorTests >> testMonochrome [
	self assert: CmykColor black isMonochrome.
	self assert: CmykColor white isMonochrome.
	self assert: (CmykColor gray: 0.1) isMonochrome.
	self assert: (CmykColor fromColorValue: (ColorValue fromBytesRed: 212 green: 255 blue: 212)) isMonochrome not.
	self assert: (CmykColor cyan: 0 magenta: 0 yellow: 0 black: 0)  isMonochrome.
	self assert: (CmykColor cyan: 0 magenta: 0 yellow: 1 black: 0)  isMonochrome not.
	self assert: (CmykColor cyan: 0 magenta: 1 yellow: 0 black: 0)  isMonochrome not.
	self assert: (CmykColor cyan: 0 magenta: 1 yellow: 1 black: 0)  isMonochrome not.
	self assert: (CmykColor cyan: 1 magenta: 0 yellow: 0 black: 0)  isMonochrome not.
	self assert: (CmykColor cyan: 1 magenta: 0 yellow: 1 black: 0)  isMonochrome not.
	self assert: (CmykColor cyan: 1 magenta: 1 yellow: 0 black: 0)  isMonochrome not.
	self assert: (CmykColor cyan: 1 magenta: 1 yellow: 1 black: 0)  isMonochrome not.
]

{ #category : #Testing }
PtColorTests >> testNames [
	self assert: CmykColor black name = 'Black'.
	self assert: CmykColor black syntheticName = '0c0m0y100k'.
	self assert: CmykColor hks42 name = 'HKS42'.
	self assert: CmykColor hks42 syntheticName = '100c55m0y0k'.
	self assert: CmykColor hks8 name = 'HKS8'.
	self assert: CmykColor hks8 syntheticName = '0c50m100y0k'.
	self assert: CmykColor gray55 name isEmpty.
	self assert: CmykColor gray55 syntheticName = '0c0m0y55k'.
	self assert: (CmykColor gray: 0.55) name isEmpty.
	self assert: (CmykColor gray: 0.55) syntheticName = '0c0m0y55k'.
	self assert: (CmykColor gray: 0.01) name isEmpty.
	self assert: (CmykColor gray: 0.01) syntheticName = '0c0m0y1k'.
	self assert: (CmykColor gray: 0) name = 'White'.
	self assert: (CmykColor gray: 0) syntheticName = '0c0m0y0k'.
	self assert: (CmykColor gray: 1) name = 'Black'.
	self assert: (CmykColor gray: 1) syntheticName = '0c0m0y100k'.
	self assert: (CmykColor fromColorValue: ColorValue red) name isEmpty.
	self assert: (CmykColor fromColorValue: ColorValue red) syntheticName = '0c100m100y0k'.
	self assert: (CmykColor fromColorValue: ColorValue cyan) name isEmpty.
	self assert: (CmykColor fromColorValue: ColorValue cyan) syntheticName = '100c0m0y0k'.
	self assert: (CmykColor fromColorValue: ColorValue green) name isEmpty.
	self assert: (CmykColor fromColorValue: ColorValue green) syntheticName = '100c0m100y0k'.
]

{ #category : #Testing }
PtColorTests >> testPsStrings [
	self assert: CmykColor example asPsComment = '0.09 0.05 0.05 0 (BN Gray01)'.
	self assert: CmykColor black asPsComment = '0 0 0 1 (Black)'.
	self assert: CmykColor white asPsComment = '0 0 0 0 (White)'.
	self assert: CmykColor hks42 asPsComment = '1 0.55 0 0 (HKS42)'.
	self assert: CmykColor hks8 asPsComment = '0 0.5 1 0 (HKS8)'.
	self assert: CmykColor gray55 asPsComment = '0 0 0 0.55 (0c0m0y55k)'.
]

{ #category : #Testing }
PtColorTests >> testSameColors [
	self assert: (CmykColor hks8 isSameColor: CmykColor hks8).
	self assert: CmykColor hks8 = CmykColor hks8.
	self deny: (CmykColor hks8 isSameColor: CmykColor hks42).
	self deny: CmykColor hks8 = CmykColor hks42.
	self assert: (CmykColor hks8 isSameColor: (CmykColor name: 'HKS8' cyan: 0 magenta: 0.5 yellow: 1 black: 0)).
	self assert: CmykColor hks8 = (CmykColor name: 'HKS8' cyan: 0 magenta: 0.5 yellow: 1 black: 0).
]

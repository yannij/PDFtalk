Class {
	#name : #PtFFontMetricsTests,
	#superclass : #PtTests,
	#category : #'PDFtalk-Fonts tests'
}

{ #category : #Testing }
PtFFontMetricsTests >> testCharMetricsHelvetica [
	| fontMetric charMetric |
	fontMetric := (PtFFont fontAt: #Helvetica) metrics.
	charMetric := fontMetric charMetricAt: 169.
	self assert: charMetric n = #copyright.
	self assert: charMetric c = 169.
	self assert: charMetric asCharacter = $©.
	self assert: charMetric asCharacter asInteger = 169.
	charMetric := fontMetric charMetricAt: 39.
	self assert: charMetric n = #quotesingle.
	self assert: charMetric c = 39.
	self assert: charMetric asCharacter = $'.
	self assert: charMetric asCharacter asInteger = 39.
	charMetric := fontMetric charMetricAt: 164.
	self assert: charMetric n = #currency.
	self assert: charMetric c = 164.
	self assert: charMetric asCharacter = $¤.
	self assert: charMetric asCharacter asInteger = 164.
]

{ #category : #Testing }
PtFFontMetricsTests >> testCharMetricsTimesRoman [
	| fontMetric charMetric |
	fontMetric := (PtFFont fontAt: #'Times-Roman') metrics.
	charMetric := fontMetric charMetricAt: 169.
	self assert: charMetric n = #quotesingle.
	self assert: charMetric c = 169.
	self assert: charMetric asCharacter = $'.
	self assert: charMetric asCharacter asInteger = 16r0027.
	charMetric := fontMetric charMetricAt: 39.
	self assert: charMetric n = #quoteright.
	self assert: charMetric c = 39.
	self assert: charMetric asCharacter = $’.
	self assert: charMetric asCharacter asInteger = 16r2019.
	charMetric := fontMetric charMetricAt: 164.
	self assert: charMetric n = #fraction.
	self assert: charMetric c = 164.
	self assert: charMetric asCharacter = $⁄.
	self assert: charMetric asCharacter asInteger = 16r2044.
]

{ #category : #Testing }
PtFFontMetricsTests >> testStringWidth [
	self assert: (((PtFFont fontAt: #Courier) widthOfString: 'abcdefghijqrstuvwxyz') * 10) asSource = '120'.
	self assert: (((PtFFont fontAt: #Helvetica) widthOfString: 'abcdefghijqrstuvwxyz') * 10) asFloat asSource = '95.03'.
	self assert: (((PtFFont fontAt: #'Times-Roman') widthOfString: 'abcdefghijqrstuvwxyz') * 10) asFloat asSource = '88.87'
]

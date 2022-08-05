"
A PDF document typically contains many graphical elements that are independent of each other and nested to multiple levels. The graphics state stack allows these elements to make local changes to the graphics state without disturbing the graphics state of the surrounding environment. The stack is a LIFO (last in, first out) data structure in which the contents of the graphics state may be saved and later restored using the following operators:
• The q operator shall push a copy of the entire graphics state onto the stack.
• The Q operator shall restore the entire graphics state to its former value by popping it from the stack.

NOTE
These operators can be used to encapsulate a graphical element so that it can modify parameters of the graphics state and later restore them to their previous values.

Occurrences of the q and Q operators shall be balanced within a given content stream (or within the sequence of streams specified in a page dictionary’s Contents array).
"
Class {
	#name : #PtIsolatedContext,
	#superclass : #PtContext,
	#category : #'PDFtalk-Graphics'
}

{ #category : #writing }
PtIsolatedContext >> postfix [

	^'Q'
]

{ #category : #writing }
PtIsolatedContext >> prefix [
	^'q'
]

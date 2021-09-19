!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VV 9/19/2021 14:28:55'!
test01SentencedFoundShouldBeEmptyIfNotSentenceWithPrefixFound
	|stackOraciones prefijo|
	prefijo:= 'sum'.
	stackOraciones := (OOStack new push: 'Winter') push:'winter'.
	self assert: 	((SentenceFinderByPrefix new withStack: stackOraciones) find: prefijo) isEmpty
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VV 9/17/2021 19:12:11'!
test02SentencedFoundShouldBeSizeOfSentencesWithPrefix
	|stackOraciones prefijo|
	prefijo:= 'win'.
	stackOraciones := (OOStack new push: 'Winter') push:'winter'.
	self assert: 	(((SentenceFinderByPrefix new withStack: stackOraciones) find: prefijo) size = 1)
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VV 9/19/2021 14:31:01'!
test03SentencedFoundShouldBeInSameOrderAnWithPrefix
	|stackOraciones prefijo|
	prefijo:= 'win'.
	stackOraciones := ((OOStack new push: 'win') push: 'winter') push:'Winter'.	
	self assert: 	(((SentenceFinderByPrefix new withStack: stackOraciones) find: prefijo) last = 'winter').
	self assert: 	(((SentenceFinderByPrefix new withStack: stackOraciones) find: prefijo) first = 'win')
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VV 9/19/2021 14:33:04'!
test04SentencedFinderDoesNotChangeTheStack
	|stackOraciones prefijo|
	prefijo:= 'win'.
	stackOraciones := ((OOStack new push: 'win') push: 'Winter') push: 'winter'.	
	(SentenceFinderByPrefix new withStack: stackOraciones) find: prefijo.	
	self assert: stackOraciones pop = 'winter'.
	self assert: stackOraciones pop = 'Winter'.
	self assert: stackOraciones pop = 'win'.
	self assert: stackOraciones isEmpty.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VV 9/19/2021 14:31:34'!
test05prefixCanNotBeBlank
	|stackSentences prefix|
	prefix:= ''.
	stackSentences := ((OOStack new push: 'win') push: 'Winter') push: 'winter'.	
	
	self
		should: [(SentenceFinderByPrefix new withStack: stackSentences) find: prefix. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixBlankErrorDescription ]
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VV 9/19/2021 14:33:37'!
test06prefixCanNotHaveSpaces
	|stackSentences prefix|
	prefix:= 'Winter is'.
	stackSentences := ((OOStack new push: 'win') push: 'Winter') push: 'winter'.	
	
	self
		should: [(SentenceFinderByPrefix new withStack: stackSentences) find: prefix. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHaveSpacesErrorDescription ]
	
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
!OOStack commentStamp: '<historical>' prior: 0!
OOStac!


!OOStack methodsFor: 'Initialization' stamp: 'VV 9/16/2021 22:21:38'!
initialize
	state:= EmptyState new.
	elements:= OrderedCollection new.! !


!OOStack methodsFor: 'checks' stamp: 'VV 9/16/2021 22:22:28'!
isEmpty
	^state empty.! !

!OOStack methodsFor: 'checks' stamp: 'VV 9/16/2021 20:35:42'!
size
	^elements size.! !

!OOStack methodsFor: 'checks' stamp: 'VV 9/16/2021 22:27:26'!
top
	^(state top)value:elements.! !


!OOStack methodsFor: 'modify' stamp: 'VV 9/16/2021 22:23:57'!
pop
	|lastPopped|
	elements := state popContents: elements.
	lastPopped := state poppedElement.
	state := State withSize: elements size.
	^lastPopped
    	
	
	! !

!OOStack methodsFor: 'modify' stamp: 'VV 9/17/2021 18:29:37'!
push: anElement
	state:= NotEmptyState new.
	elements addLast: anElement.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'savedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'enumerating' stamp: 'VV 9/19/2021 14:28:10'!
find: aPrefix
	|sentence sentencesFound sentencesPopped|
	
	sentencesPopped := OrderedCollection new.
	sentencesFound := OrderedCollection new.	
	
	(aPrefix = '') ifTrue:[self error: SentenceFinderByPrefix prefixBlankErrorDescription].
	((aPrefix findString: ' ') > 0) ifTrue:[self error: SentenceFinderByPrefix prefixHaveSpacesErrorDescription].
	
	
	[((savedStack isEmpty) not)] 
		whileTrue:[sentence := savedStack pop.
				(sentence beginsWith: aPrefix) 
					ifTrue:[sentencesFound addFirst: sentence].
				sentencesPopped addFirst: sentence.
				].
			
	self fillSavedStackWith: sentencesPopped.			
	
			
				
	^sentencesFound.
	
	! !


!SentenceFinderByPrefix methodsFor: 'modify' stamp: 'VV 9/19/2021 14:20:56'!
fillSavedStackWith: aCollectionOfSentences
	
	[((aCollectionOfSentences isEmpty) not)] 
		whileTrue:[		savedStack push: aCollectionOfSentences first.
				aCollectionOfSentences removeFirst.
				].! !

!SentenceFinderByPrefix methodsFor: 'modify' stamp: 'VV 9/17/2021 18:54:01'!
withStack: anStack
	savedStack := anStack . 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'VV 9/17/2021 19:25:24'!
prefixBlankErrorDescription
	^'prefix can not be blank'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'VV 9/17/2021 19:27:30'!
prefixHaveSpacesErrorDescription
	^'prefix can not have spaces'! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: 'Stack-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 22:04:11'!
withSize: aSize
	^(self subclasses detect:[:subclass| subclass stateBySize: aSize]) new.! !


!classDefinition: #EmptyState category: 'Stack-Exercise'!
State subclass: #EmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 21:58:41'!
empty
	^ true! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 22:25:51'!
popContents: aContents
	self error: OOStack stackEmptyErrorDescription! !

!EmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 22:26:02'!
top 
	self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyState class' category: 'Stack-Exercise'!
EmptyState class
	instanceVariableNames: ''!

!EmptyState class methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 22:09:23'!
stateBySize: aSize
	^aSize <1.
	! !


!classDefinition: #NotEmptyState category: 'Stack-Exercise'!
State subclass: #NotEmptyState
	instanceVariableNames: 'lastPoppedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 21:58:52'!
empty 
	^false.! !

!NotEmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/17/2021 18:31:31'!
popContents:  aContents 	
	lastPoppedElement :=aContents last.
	aContents removeLast.
	^ aContents.	
 	 ! !

!NotEmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 22:15:34'!
poppedElement
	^	lastPoppedElement.! !

!NotEmptyState methodsFor: 'as yet unclassified' stamp: 'VV 9/17/2021 18:29:19'!
top
	^[:contents | contents last]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyState class' category: 'Stack-Exercise'!
NotEmptyState class
	instanceVariableNames: ''!

!NotEmptyState class methodsFor: 'as yet unclassified' stamp: 'VV 9/16/2021 22:04:51'!
stateBySize: aSize
^aSize>0! !

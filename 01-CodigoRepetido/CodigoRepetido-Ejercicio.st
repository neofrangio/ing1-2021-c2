!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'maxDelayExpected errorType closureOnCatch valuesToCheck'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testingAuxiliary' stamp: 'VV 9/9/2021 00:08:57'!
checkDelay: closureNeededToBeChecked

	| millisecondsBeforeRunning millisecondsAfterRunning |	
		
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	closureNeededToBeChecked value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (maxDelayExpected * millisecond)
	! !

!CustomerBookTest methodsFor: 'testingAuxiliary' stamp: 'VV 9/9/2021 00:28:11'!
checkQuantities: customerBookToCheck
	
	
	self assert: (valuesToCheck at: 1) equals: customerBookToCheck numberOfActiveCustomers.
	self assert: (valuesToCheck at: 2) equals: customerBookToCheck numberOfSuspendedCustomers.
	self assert: (valuesToCheck at: 3) equals: customerBookToCheck numberOfCustomers.
	
	

	
! !

!CustomerBookTest methodsFor: 'testingAuxiliary' stamp: 'VV 9/9/2021 00:17:57'!
tryCatch: closureToTry
	
	
	
	[ closureToTry value.
	self fail ]
		on: errorType 
		do: [
			closureOnCatch]
! !


!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:06:35'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	maxDelayExpected := 50.	
	self checkDelay: [customerBook addCustomerNamed: 'John Lennon'.].
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:06:38'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := CustomerBook new.	
	customerBook addCustomerNamed: 'Paul McCartney'.	  
	
	maxDelayExpected := 100.	
	self checkDelay: [customerBook removeCustomerNamed: 'Paul McCartney'.	].	
	
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:17:41'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	errorType:= Error.
	closureOnCatch:=[ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
		
 	self tryCatch: [ customerBook addCustomerNamed: ''.].
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:19:46'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	errorType:= NotFound.
	closureOnCatch:=[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
		
 	self tryCatch: [ customerBook removeCustomerNamed: 'Paul McCartney'.].
			
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:38:24'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	valuesToCheck :=#(0 1 1).	
	self checkQuantities:customerBook.		
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:38:31'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	valuesToCheck :=#(0 0 0).	
	self checkQuantities:customerBook.			
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:21:36'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	errorType:= CantSuspend.
	closureOnCatch:=[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
		
 	self tryCatch: [ customerBook suspendCustomerNamed: 'George Harrison'.].
			
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VV 9/9/2021 00:22:19'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	errorType:= CantSuspend.
	closureOnCatch:=[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
		
 	self tryCatch: [ customerBook suspendCustomerNamed: johnLennon.].
			

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'maxDelayExpected'!


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'VV 9/9/2021 00:36:33'!
removeCustomerNamed: aName

	active remove: aName ifAbsent:[suspended remove: aName ifAbsent:[^ NotFound signal.].].	
		
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:13'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:09'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!!!!!'! !

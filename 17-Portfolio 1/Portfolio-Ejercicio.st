!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 20:46:50'!
test08PortfolioHaveZeroBalanceWhenCreated 

	| portfolio1 |
	
	portfolio1 := Portfolio new.	
		
	self assert: 0 equals: portfolio1 balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 20:54:20'!
test09PortfolioIncreasesBalanceWithOneAccountDeposit

	| portfolio1 account1|
	
	portfolio1 := Portfolio new.	
	account1 := ReceptiveAccount new.
	portfolio1 addAccount: account1.
	Deposit register: 100 on: account1.
	
	self assert: 100 equals: portfolio1 balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 20:53:58'!
test10PortfolioHaveKnowsBalancesWithTwoAccountDepositDifferenteBalances

	| portfolio1 account1 account2|
	
	portfolio1 := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio1 addAccount: account1.
	portfolio1 addAccount: account2.
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account1.
	
	self assert: 300 equals: portfolio1 balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 21:08:33'!
test11PortfolioHaveKnowsBalancesWithOnePortfolioWithAccountAndTransaction

	| portfolio1 portfolio2 account1|
	
	portfolio1 := Portfolio new.	
	portfolio2 := Portfolio new.	
	account1 := ReceptiveAccount new.
	portfolio2 addAccount: account1.
	portfolio1 addPortfolio: portfolio2.
	Deposit register: 100 on: account1.	
	
	self assert: 100 equals: portfolio1 balance.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 21:12:58'!
test12PortfolioKnowsRegisteredTransactions

	| portfolio1 account1 deposit1|
	
	portfolio1 := Portfolio new.	
	
	account1 := ReceptiveAccount new.	
	portfolio1 addPortfolio: account1.
	deposit1 := Deposit register: 100 on: account1.	
	
	self assert: (portfolio1 hasRegistered: deposit1).
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 21:15:05'!
test13PortfolioDoNotKnowNotRegisteredTransactions

	| portfolio1 account1 deposit1|
	
	portfolio1 := Portfolio new.	
	
	account1 := ReceptiveAccount new.	
	portfolio1 addPortfolio: account1.
	deposit1 := Deposit for: 100.	
	
	self deny: (portfolio1 hasRegistered: deposit1).
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/7/2021 21:28:26'!
test14PortfolioKnowsItsTransactions 

	| portfolio1 account1 deposit1 |
	
	portfolio1 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	
	portfolio1 addAccount: account1.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: portfolio1 transactions size.
	self assert: (portfolio1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'vv 10/7/2021 20:40:01'!
balanceValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'vv 10/7/2021 20:37:49'!
balanceValue

	^ value. ! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'vv 10/7/2021 20:33:19'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'vv 10/7/2021 20:37:58'!
balanceValue

	^ 0 -value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'groupedAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'vv 10/7/2021 21:08:10'!
balance
	groupedAccounts size = 0 ifTrue:[^0].
	^groupedAccounts sum:[ :account| account balance].
	! !


!Portfolio methodsFor: 'modify' stamp: 'vv 10/7/2021 21:08:10'!
addAccount: anAccount
	groupedAccounts add: anAccount.! !

!Portfolio methodsFor: 'modify' stamp: 'vv 10/7/2021 21:08:10'!
addPortfolio: anPortofolio
	groupedAccounts add: anPortofolio.! !


!Portfolio methodsFor: 'initialize' stamp: 'vv 10/7/2021 21:08:10'!
initialize
	groupedAccounts := OrderedCollection new.! !


!Portfolio methodsFor: 'testing' stamp: 'vv 10/7/2021 21:17:49'!
hasRegistered: aTransaction
	groupedAccounts do:[ :aGroupedAccount| (aGroupedAccount hasRegistered: aTransaction) ifTrue: [^true]].
	^false.! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'vv 10/7/2021 21:27:10'!
transactions
	|transactions|
	transactions := OrderedCollection new.
	^ groupedAccounts do: [:aGroupedAccount | transactions addAllLast: (aGroupedAccount transactions)].! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'vv 10/7/2021 20:38:11'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceValue ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!classDefinition: #PortfolioTest category: 'Portfolio-Segunda-Parte'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 12:57:08'!
test16PortfolioWithNoTransactionsZeroBalanceSummary

	| portfolio summary|
	
	
	portfolio := Portfolio new.
	summary := portfolio accountSummary.	
			
	self assert:  'Balance = 0' = summary first.
	self assert:  1 = summary size.! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 13:11:50'!
test17PortfolioWithOneAccountHasSameSummary

	| portfolio account portfolioSummary accountSummary|
	
	
	
	account := ReceptiveAccount new. 
	portfolio := Portfolio with: account.
	Withdraw register: 10 on: account.
	Deposit register: 1000 on: account.
	portfolioSummary := portfolio accountSummary.	
	accountSummary := account accountSummary.		
	
	
			
	self assert:  accountSummary = portfolioSummary.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 13:12:45'!
test18PortfolioWithPortfolioHasSameSummary

	| portfolio1 portfolio2 account portfolio1Summary portfolio2Summary|
	
	
	
	
	account := ReceptiveAccount new. 
	portfolio1 := Portfolio with:account.
	portfolio2 := Portfolio with:portfolio1.

	Withdraw register: 10 on: account.
	Deposit register: 1000 on: account.
	portfolio1Summary := portfolio1 accountSummary.	
	portfolio2Summary := portfolio2 accountSummary.		
	
	
			
	self assert:  portfolio1Summary = portfolio2Summary.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 13:19:34'!
test19PortfolioWithZeroNetValue

	| portfolio account netValue|
	
	
	account := ReceptiveAccount new. 
	portfolio := Portfolio with:account.	
		
	netValue := portfolio transferNet.		
	
			
	self assert:  0 = netValue.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 13:21:08'!
test20PortfolioWithNegativeNetValue

	| portfolio account1 account2 netValue|
	
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	portfolio := Portfolio with:account1.	
	Transference send: 100 from: account1 to: account2	.
		
	netValue := portfolio transferNet.		
	
			
	self assert:  -100 = netValue.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 13:21:41'!
test21PortfolioWithPositiveNetValue

	| portfolio account1 account2 netValue|
	
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	portfolio := Portfolio with:account2.	
	Transference send: 100 from: account1 to: account2	.
		
	netValue := portfolio transferNet.		
	
			
	self assert:  100 = netValue.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'vv 10/25/2021 13:27:43'!
test22PortfolioWithBothEndsOfTransferenceHasZeroNetValue

	| portfolio account1 account2 netValue|
	
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	portfolio := Portfolio with:account1.	
	portfolio add: account2.
	Transference send: 100 from: account1 to: account2	.
		
	netValue := portfolio transferNet.		
	
			
	self assert:  0 = netValue.
	! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Segunda-Parte'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/21/2021 19:53:45'!
test08AccountsSendAndReceiveTransfer

	| account1 account2 transference1|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transference1 := Transference send: 100 from: account1 to: account2.
		
	self assert: 1 equals: account1 transactions size .
	self assert: 1 equals: account2 transactions size .
	self assert: account1 equals: transference1 sender .
	self assert: account2 equals: transference1 receiver .
	self assert: 100 equals: account2 balance.
	self assert: -100 equals: account1 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 11:33:01'!
test09AccountsEmptyAccountSummary

	| account1 |
	
	account1 := ReceptiveAccount new.		
	
	self assert: 'Balance = 0' equals: account1 accountSummary last.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 11:37:54'!
test10AccountsDepositAccountSummary

	| account1 summary|
	
	account1 := ReceptiveAccount new.		
	Deposit register: 100 on: account1.
	summary := account1 accountSummary.
	self assert: 'Depósito por 100.' equals:  summary first.
	self assert: 'Balance = 100' equals: summary last.
	self assert: 2 equals: summary size.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 11:38:34'!
test11AccountsWithdrawAccountSummary

	| account1 summary|
	
	account1 := ReceptiveAccount new.		
	Withdraw register: 100 on: account1.
	summary := account1 accountSummary.
	self assert: 'Extracción por 100.' equals: summary first.
	self assert: 'Balance = -100' equals: summary last.
	self assert: 2 equals: summary size.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 11:40:47'!
test12AccountSendTransferAccountSummaryAndReceiverAccountSummary

	| account1 account2 summary1 summary2|
	
	account1 := ReceptiveAccount new.		
	account2 := ReceptiveAccount new.		
	Transference send: 100 from: account1 to: account2	.
	summary1 := account1 accountSummary.
	summary2 := account2 accountSummary.
	
	self assert: 'Salida por transferencia de 100.' equals: summary1 first.
	self assert: 'Entrada por transferencia de 100.' equals: summary2 first.
	self assert: 'Balance = -100' equals: summary1 last.
	self assert: 'Balance = 100' equals: summary2 last.
	self assert: 2 equals: summary1 size.
	self assert: 2 equals: summary2 size.
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 11:43:52'!
test13AccountManyTransactions

	| account1 account2 summary|
	
	account1 := ReceptiveAccount new.		
	account2 := ReceptiveAccount new.		
	Deposit register: 100 on: account1.
	Withdraw register: 50 on: account1.
	Transference send: 20 from: account1 to: account2	.
	Transference send: 30 from: account2 to: account1.
	summary := account1 accountSummary.
	
	self assert: 'Depósito por 100.' equals: (summary at: 1).	
	self assert: 'Extracción por 50.' equals: (summary at: 2).
	self assert: 'Salida por transferencia de 20.' equals: (summary at: 3).
	self assert: 'Entrada por transferencia de 30.' equals: (summary at: 4).
	self assert: 'Balance = 60' equals: (summary at: 5).
	self assert: 5 equals: summary size.
			
	 
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 12:03:38'!
test14AccountWithNoTransactionsHasZeroTransferNet

	|account1 netValue|
	
	account1 := ReceptiveAccount new.				
	netValue := account1 transferNet.
	
	self assert: 0 equals: netValue.
			
	 
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 12:16:05'!
test15AccountWithOneReceiveTransactionHasPositiveTransferNet

	|account1 account2 netValue|
	
	account1 := ReceptiveAccount new.				
	account2 := ReceptiveAccount new.		
	Transference send: 100 from: account1 to: account2	.
	netValue := account2 transferNet.
	
	self assert: 100 equals: netValue.
			
	 
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 12:15:44'!
test16AccountWithOneSendTransactionHasNegativeTransferNet

	|account1 account2 netValue|
	
	account1 := ReceptiveAccount new.				
	account2 := ReceptiveAccount new.		
	Transference send: 100 from: account1 to: account2	.
	netValue := account1 transferNet.
	
	self assert: -100 equals: netValue.
			
	 
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'vv 10/25/2021 12:41:33'!
test17AccountWithManyTransactions

	|account1 account2 netValue|
	
	account1 := ReceptiveAccount new.				
	account2 := ReceptiveAccount new.		
	Withdraw register: 10 on: account1.
	Deposit register: 1000 on: account1.
	Transference send: 100 from: account1 to: account2	.
	Transference send: 50 from: account2 to: account1	.
	
	netValue := account1 transferNet.
	
	self assert: -50 equals: netValue.
			
	 
	
! !


!classDefinition: #Account category: 'Portfolio-Segunda-Parte'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Segunda-Parte'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reports' stamp: 'vv 10/25/2021 13:07:01'!
accountSummary 
	|summary|
	summary := OrderedCollection new.
	accounts do:[:anAccount| summary addAllLast: anAccount accountSummary.
		 summary removeLast.]. 
	summary add: 'Balance = ', self balance asString.	
	^summary.! !

!Portfolio methodsFor: 'reports' stamp: 'vv 10/25/2021 13:26:05'!
transferNet
	|netValue|
	netValue := 0.
	accounts do:[:anAccount| netValue := netValue + anAccount transferNet]. 	
	^netValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Segunda-Parte'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Segunda-Parte'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'vv 10/25/2021 13:37:39'!
accountSummary	
	|reporter summary|	
	reporter := AccountSummaryReporter new.		
	summary := reporter showReportOf: transactions.
	summary add: 'Balance = ', self balance asString.	
	^summary.
! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'vv 10/25/2021 13:37:46'!
transferNet
	|reporter|
	reporter := TransferNetReporter new.
	 
	^ reporter showReportOf: transactions.! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountReporter category: 'Portfolio-Segunda-Parte'!
Object subclass: #AccountReporter
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!AccountReporter methodsFor: 'as yet unclassified' stamp: 'vv 10/25/2021 12:23:36'!
processReportDeposit: aDeposit With: aVariable
	self subclassResponsibility
! !

!AccountReporter methodsFor: 'as yet unclassified' stamp: 'vv 10/25/2021 12:34:47'!
processReportTransferenceReceiver: aTransferReceiver With: aVariable
	self subclassResponsibility
! !

!AccountReporter methodsFor: 'as yet unclassified' stamp: 'vv 10/25/2021 12:34:52'!
processReportTransferenceSender: aTransferSender With: aVariable
	self subclassResponsibility
! !

!AccountReporter methodsFor: 'as yet unclassified' stamp: 'vv 10/25/2021 12:23:54'!
processReportWithdraw: aWithdraw With: aVariable
	self subclassResponsibility
! !

!AccountReporter methodsFor: 'as yet unclassified' stamp: 'vv 10/25/2021 12:35:07'!
showReportOf: anAccountToReport
	self subclassResponsibility
! !


!classDefinition: #AccountSummaryReporter category: 'Portfolio-Segunda-Parte'!
AccountReporter subclass: #AccountSummaryReporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!AccountSummaryReporter methodsFor: 'report' stamp: 'vv 10/25/2021 13:37:01'!
showReportOf: transactions
	|summary|	
	summary:= OrderedCollection new.
	transactions do:[ :aTransaction | 
	aTransaction processReport: self With: summary.	
	].	
	^summary! !


!AccountSummaryReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 11:57:26'!
processReportDeposit: aDeposit With: aSummary
	aSummary add: 'Depósito por ', aDeposit value asString,'.'! !

!AccountSummaryReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 11:57:22'!
processReportTransferenceReceiver: transaction With: aSummary
	aSummary add:  'Entrada por transferencia de ', transaction value asString,'.'	! !

!AccountSummaryReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 11:57:20'!
processReportTransferenceSender: transaction With: aSummary
	aSummary add:  'Salida por transferencia de ', transaction value asString,'.'	! !

!AccountSummaryReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 11:57:17'!
processReportWithdraw: transaction With: aSummary
	aSummary add: 'Extracción por ', transaction value asString,'.'	! !


!classDefinition: #TransferNetReporter category: 'Portfolio-Segunda-Parte'!
AccountReporter subclass: #TransferNetReporter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!TransferNetReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 12:12:54'!
processReportDeposit: aDeposit With: anetValue
	^anetValue! !

!TransferNetReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 12:15:05'!
processReportTransferenceReceiver: transaction With: anetValue
	^ anetValue + (transaction value)! !

!TransferNetReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 12:14:59'!
processReportTransferenceSender: transaction With: anetValue
	^ anetValue - (transaction value	)! !

!TransferNetReporter methodsFor: 'process transaction' stamp: 'vv 10/25/2021 12:13:09'!
processReportWithdraw: transaction With: anetValue
	^ anetValue! !


!TransferNetReporter methodsFor: 'report' stamp: 'vv 10/25/2021 13:38:07'!
showReportOf: transactions
	|netValue|	
	netValue := 0.
	transactions do:[ :aTransaction | 
	 netValue := (aTransaction processReport: self With: netValue).	
	].	
	^netValue! !


!classDefinition: #AccountTransaction category: 'Portfolio-Segunda-Parte'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Segunda-Parte'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Segunda-Parte'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reports' stamp: 'vv 10/25/2021 12:39:23'!
processReport: aReporter With: aReportVariable

	^aReporter processReportDeposit: self With: aReportVariable.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Segunda-Parte'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Segunda-Parte'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reports' stamp: 'vv 10/25/2021 12:39:28'!
processReport: aReporter With: aReportVariable

	^aReporter processReportWithdraw: self With: aReportVariable.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Segunda-Parte'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'Portfolio-Segunda-Parte'!
Object subclass: #Transference
	instanceVariableNames: 'sender receiver value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!Transference methodsFor: 'initialize' stamp: 'vv 10/21/2021 19:48:10'!
initializeWith: aValue Sender: aSender Receiver: aReceiver
	value := aValue.
	sender := aSender.
	receiver := aReceiver.
 
   ! !


!Transference methodsFor: 'access' stamp: 'vv 10/21/2021 19:52:58'!
receiver
	^ receiver.! !

!Transference methodsFor: 'access' stamp: 'vv 10/21/2021 19:52:53'!
sender
	^ sender.! !

!Transference methodsFor: 'access' stamp: 'vv 10/21/2021 19:38:15'!
value
	^value
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'Portfolio-Segunda-Parte'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'nil' stamp: 'vv 10/21/2021 19:49:57'!
send: aValue from: aSender to: aReceiver	
	|transference|
	transference := Transference new  initializeWith: aValue Sender: aSender Receiver: aReceiver.
	aSender register: (TransferenceSender new initializeWith: transference).
	aReceiver register: (TransferenceReceiver new initializeWith: transference).
	^ transference.! !


!classDefinition: #TransferenceReceiver category: 'Portfolio-Segunda-Parte'!
Object subclass: #TransferenceReceiver
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!TransferenceReceiver methodsFor: 'initialize' stamp: 'vv 10/21/2021 19:54:34'!
initializeWith: aTransference
	transference := aTransference.! !


!TransferenceReceiver methodsFor: 'access' stamp: 'vv 10/21/2021 19:51:11'!
value
	^transference value.
 ! !


!TransferenceReceiver methodsFor: 'balance' stamp: 'vv 10/21/2021 19:51:27'!
affectBalance: aBalance
	^aBalance + self value.! !


!TransferenceReceiver methodsFor: 'reports' stamp: 'vv 10/25/2021 12:39:36'!
processReport: aReporter With: aReportVariable


	^aReporter processReportTransferenceReceiver: self With: aReportVariable.! !


!classDefinition: #TransferenceSender category: 'Portfolio-Segunda-Parte'!
Object subclass: #TransferenceSender
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Segunda-Parte'!

!TransferenceSender methodsFor: 'initialize' stamp: 'vv 10/21/2021 19:54:29'!
initializeWith: aTransference
	transference := aTransference.! !


!TransferenceSender methodsFor: 'access' stamp: 'vv 10/21/2021 19:51:14'!
value 
	^transference value! !


!TransferenceSender methodsFor: 'balance' stamp: 'vv 10/21/2021 19:51:31'!
affectBalance: aBalance
	^aBalance - self value! !


!TransferenceSender methodsFor: 'reports' stamp: 'vv 10/25/2021 12:39:41'!
processReport: aReporter With: aReportVariable


	^aReporter processReportTransferenceSender: self With: aReportVariable.! !

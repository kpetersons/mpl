#= require ./account_router
#= require ./transaction_router
Mpl.HomeRouter = Ember.Route.extend
  route: '/'

  connectOutlets: (router, event) ->
    router.get('applicationController.user.settings')
    router.get('applicationController').connectOutlet('content', 'homeIndex');

  index: Ember.Route.extend
    route: '/home'

    connectOutlets: (router, event) ->
      router.get('homeIndexController').connectOutlet('accounts', 'accountsIndex', Mpl.Account.find());
      router.get('homeIndexController').connectOutlet('transactions', 'transactionsIndex', Mpl.Transaction.find());
      router.get('homeIndexController').connectOutlet('modal', 'homeIndexEmpty');

  doNewAccount: (router, event) -> router.transitionTo('home.accounts.new')
  doEditAccount: (router, event) -> router.transitionTo('home.accounts.edit', event)

  doNewIncome: (router, event) ->
    router.transaction_type = 'income'
    router.transitionTo('home.transactions.new')
  doNewExpense: (router, event) ->
    router.transaction_type = 'expense'
    router.transitionTo('home.transactions.new')

  doEditTransaction: (router, event) -> router.transitionTo('home.transactions.edit', event)

  #        Routers in other files
  accounts: Mpl.AccountRouter
  transactions: Mpl.TransactionRouter
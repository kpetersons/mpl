Mpl.TransactionRouter = Ember.Route.extend
  route: '/transactions'

  account_transfers: Mpl.AccountTransferRouter

  connectOutlets: (router, event) ->
    router.get('applicationController').set('isHomeActive', '');
    router.get('applicationController').set('isAccountsActive', '');
    router.get('applicationController').set('isTransactionsActive', 'active');
    router.get('applicationController').set('isCategoriesActive', '');
    router.get('applicationController').set('isPlansActive', '');
    router.get('applicationController').set('isSettingsActive', '');

    router.get('applicationController').connectOutlet('content', 'transactionsHome')
    router.get('transactionsHomeController').connectOutlet('transactions', 'transactionsIndex', Mpl.Transaction.find())
    router.get('transactionsHomeController').connectOutlet('modal', 'transactionsIndexEmpty')
    router.get('applicationController').connectOutlet('flash', 'homeIndexEmpty');
    return

  doNewIncome: (router, event) ->
    router.transaction_type = 'income'
    router.transitionTo('transactions.new')
  doNewExpense: (router, event) ->
    router.transaction_type = 'expense'
    router.transitionTo('transactions.new')

  doEditTransaction: (router, event) ->
    unless event.get('account_transfer')
      router.transitionTo('transactions.edit', event)
    else
      router.transitionTo('account_transfers.edit', event.get('account_transfer'))

  doCancel: (router, event) ->
    router.transitionTo('transactions.index')

  doSave: (router, event) ->
    router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
    router.transitionTo('transactions.index')

  index: Ember.Route.extend
    route: '/'

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.set('newTransactionController.setting', router.get('applicationController.user.setting'))
      router.set('newTransactionController.accounts', Mpl.Account.find())
      router.set('newTransactionController.categories', Mpl.Category.find())
      router.set('newTransactionController.type', router.transaction_type)

      router.get('transactionsHomeController').connectOutlet('modal', 'newTransaction')

    exit: ->
      @._super()
      Mpl.store.findQuery(Mpl.Account, {})
      Mpl.store.findQuery(Mpl.Category, {})

  edit: Ember.Route.extend
    route: '/:transaction_id'

    connectOutlets: (router, event) ->
      unless event.get('id')
        router.transitionTo('transactions.index')
        return

      router.set('editTransactionController.setting', router.get('applicationController.user.setting'))
      router.set('editTransactionController.accounts', Mpl.Account.find())
      router.set('editTransactionController.categories', Mpl.Category.find())
      router.set('editTransactionController.user', router.get('applicationController.user'))

      router.get('transactionsHomeController').connectOutlet('modal', 'editTransaction', event)

    exit: ->
      @._super()
      Mpl.store.findQuery(Mpl.Account, {})
      Mpl.store.findQuery(Mpl.Category, {})
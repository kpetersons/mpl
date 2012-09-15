#= require ./account_transfer_router
#= require_self

Mpl.AccountRouter = Ember.Route.extend
  route: '/accounts'

  account_transfers: Mpl.AccountTransferRouter

  connectOutlets: (router, event) ->
    router.get('applicationController').set('isHomeActive', '');
    router.get('applicationController').set('isAccountsActive', 'active');
    router.get('applicationController').set('isTransactionsActive', '');
    router.get('applicationController').set('isCategoriesActive', '');
    router.get('applicationController').set('isPlansActive', '');
    router.get('applicationController').set('isSettingsActive', '');

    router.get('applicationController').connectOutlet('content',    'accountsHome')
    router.get('accountsHomeController').connectOutlet('accounts',  'accountsIndex', Mpl.Account.find())
    router.get('accountsHomeController').connectOutlet('modal',     'accountsIndexEmpty')
    router.get('applicationController').connectOutlet('flash', 'homeIndexEmpty');
    return

  doNewAccount: (router, event) -> router.transitionTo('accounts.new')
  doEditAccount: (router, event) -> router.transitionTo('accounts.edit', event)

  doNewAccountTransfer: (router, event) ->
    router.transitionTo('account_transfers.new')

  index: Ember.Route.extend
    route: '/'
  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.get('accountsHomeController').connectOutlet('modal', 'newAccount', event)

    doCancel: (router, event) ->
      router.transitionTo('accounts.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('accounts.index')

  edit: Ember.Route.extend
    route: '/:account_id'

    connectOutlets: (router, event) ->
      unless event.get('id')
        router.transitionTo('accounts.index')
        return
      router.get('accountsHomeController').connectOutlet('modal', 'editAccount', event)
      router.get('editAccountController').connectOutlet('transactions', 'transactionsNestedIndex', event.get('transactions'))

    doCancel: (router, event) ->
      router.transitionTo('accounts.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('accounts.index')

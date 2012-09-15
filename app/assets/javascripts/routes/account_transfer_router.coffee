Mpl.AccountTransferRouter = Ember.Route.extend

  route: '/account_transfers'

  doEditAccountTransfer: (router, event) -> router.transitionTo('account_transfers.edit', event)

  index: Ember.Route.extend
    route: '/'
    redirectsTo: 'account_transfers.new'

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.get('applicationController').connectOutlet('shared_modal', 'accountTransfersHome')
      router.get('accountTransfersHomeController').connectOutlet('modal', 'newAccountTransfer')
      router.get('newAccountTransferController').set('accounts', Mpl.Account.find())

    doCancel: (router, event) ->
      router.transitionTo(router.currentState.parentState.parentState.name+'.index')


    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo(router.currentState.parentState.parentState.name+'.index')

    exit: ->
      @._super()
      Mpl.store.findQuery(Mpl.Account, {})

  edit: Ember.Route.extend
    route: '/:account_transfer_id'

    connectOutlets: (router, event) ->
      unless event.get('id')
        router.transitionTo('account_transfers.index')
        return
      router.get('applicationController').connectOutlet('shared_modal', 'accountTransfersHome', event)
      router.get('accountTransfersHomeController').connectOutlet('modal', 'editAccountTransfer', event)
      router.get('editAccountTransferController').set('accounts', Mpl.Account.find())

    doCancel: (router, event) ->
      router.transitionTo(router.currentState.parentState.parentState.name+'.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo(router.currentState.parentState.parentState.name+'.index')

    exit: ->
      @._super()
      Mpl.store.findQuery(Mpl.Account, {})
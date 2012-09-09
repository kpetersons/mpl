Mpl.TransactionRouter = Ember.Route.extend
  route: '/transactions'

  index: Ember.Route.extend
    route: '/'

  doCancel: (router, event) ->
    router.transitionTo('home.index')

  doSave: (router, event) ->
    router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
    router.transitionTo('home.index')

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.set('newTransactionController.setting', router.get('applicationController.user.setting'))
      router.set('newTransactionController.accounts', router.get('accountsIndexController.accounts'))
      router.set('newTransactionController.type', router.transaction_type)

      router.get('homeIndexController').connectOutlet('modal', 'newTransaction')


  edit: Ember.Route.extend
    route: '/:transaction_id'

    connectOutlets: (router, event) ->
      router.set('editTransactionController.setting', router.get('applicationController.user.setting'))
      router.set('editTransactionController.accounts', router.get('accountsIndexController.content'))
      router.set('editTransactionController.user', router.get('applicationController.user'))

      router.get('homeIndexController').connectOutlet('modal', 'editTransaction', event)
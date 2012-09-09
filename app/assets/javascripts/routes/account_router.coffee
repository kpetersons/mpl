Mpl.AccountRouter = Ember.Route.extend
  route: '/accounts'

  index: Ember.Route.extend
    route: '/'

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.get('homeIndexController').connectOutlet('modal', 'newAccount', event)

    doCancel: (router, event) ->
      router.transitionTo('home.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('home.index')

  edit: Ember.Route.extend
    route: '/:account_id'

    connectOutlets: (router, event) ->
      router.get('homeIndexController').connectOutlet('modal', 'editAccount', event)
      router.get('editAccountController').connectOutlet('transactions', 'transactionsNestedIndex', event.get('transactions'))

    doCancel: (router, event) ->
      router.transitionTo('home.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('home.index')

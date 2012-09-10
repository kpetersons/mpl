Mpl.CategoryRouter = Ember.Route.extend
  route: '/categories'

  index: Ember.Route.extend
    route: '/'

    enter: (router, event) ->
      router.get('applicationController').connectOutlet('content', 'homeIndex');

    connectOutlets: (router, event) ->
      router.get('applicationController').connectOutlet('content', 'categoriesIndex', Mpl.Category.find())

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.get('homeIndexController').connectOutlet('modal', 'newCategory', event)

    doCancel: (router, event) ->
      router.transitionTo('home.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('home.index')

  edit: Ember.Route.extend
    route: '/:category_id'

    connectOutlets: (router, event) ->
      router.get('homeIndexController').connectOutlet('modal', 'editCategory', event)
      router.get('editCategoryController').connectOutlet('transactions', 'transactionsNestedIndex', event.get('transactions'))

    doCancel: (router, event) ->
      router.transitionTo('home.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('home.index')

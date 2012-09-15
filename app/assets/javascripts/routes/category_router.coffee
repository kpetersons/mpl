Mpl.CategoryRouter = Ember.Route.extend
  route: '/categories'

  connectOutlets: (router, event) ->
    router.get('applicationController').set('isHomeActive', '');
    router.get('applicationController').set('isAccountsActive', '');
    router.get('applicationController').set('isTransactionsActive', '');
    router.get('applicationController').set('isCategoriesActive', 'active');
    router.get('applicationController').set('isPlansActive', '');
    router.get('applicationController').set('isSettingsActive', '');

    router.get('applicationController').connectOutlet('content', 'categoriesHome')
    router.get('categoriesHomeController').connectOutlet('categories', 'categoriesIndex', Mpl.Category.find())
    router.get('categoriesHomeController').connectOutlet('modal', 'categoriesIndexEmpty')
    router.get('applicationController').connectOutlet('flash', 'homeIndexEmpty');
    return

  doNewIncomeCategory: (router, event) ->
    router.category_type = 'income'
    router.transitionTo('categories.new')

  doNewExpenseCategory: (router, event) ->
    router.category_type = 'expense'
    router.transitionTo('categories.new')

  doEditCategory: (router, event) -> router.transitionTo('categories.edit', event)

  index: Ember.Route.extend
    route: '/'

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      router.get('categoriesHomeController').connectOutlet('modal', 'newCategory', event)

      router.set('newCategoryController.type', router.category_type)

    doCancel: (router, event) ->
      router.transitionTo('categories.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('categories.index')

  edit: Ember.Route.extend
    route: '/:category_id'

    connectOutlets: (router, event) ->
      unless event.get('id')
        router.transitionTo('categories.index')
        return
      router.get('editCategoryController').connectOutlet('transactions', 'transactionsNestedIndex', event.get('transactions'))
      router.get('categoriesHomeController').connectOutlet('modal', 'editCategory', event)

    doCancel: (router, event) ->
      router.transitionTo('categories.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('categories.index')

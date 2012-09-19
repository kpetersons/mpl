Mpl.CategoryGroupRouter = Ember.Route.extend

  route: '/category_groups'

  doEditCategory: (router, event) -> router.transitionTo('category_groups.edit', event)

  index: Ember.Route.extend
    route: '/'
    redirects_to: 'category_groups.new'

  new: Ember.Route.extend
    route: '/new'

    connectOutlets: (router, event) ->
      selectedCategories = router.get('categoriesIndexController.categories').filterProperty('isSelected', true)
      router.get('newCategoryGroupController').set('selectedCategories', selectedCategories)
      router.get('categoriesHomeController').connectOutlet('modal', 'newCategoryGroup', event)

    doCancel: (router, event) ->
      router.transitionTo('categories.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('categories.index')

    exit: ->
      @._super()
      Mpl.store.commit()

  edit: Ember.Route.extend
    route: '/:category_group_id'

    connectOutlets: (router, event) ->
      unless event.get('id')
        router.transitionTo('categories.index')
        return
      router.get('editCategoryGroupController').connectOutlet('categories', 'categoriesIndex', event.get('categories'))
      router.get('categoriesHomeController').connectOutlet('modal', 'editCategoryGroup', event)

    doCancel: (router, event) ->
      router.transitionTo('categories.index')

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))
      router.transitionTo('categories.index')

    exit: ->
      @._super()
      Mpl.store.commit()
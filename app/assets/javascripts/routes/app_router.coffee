#= require ./home_router
#= require ./account_router
#= require ./transaction_router
#= require ./category_router
#= require ./plan_router
#= require ./setting_router
#= require_self

Mpl.Router = Ember.Router.extend

  enableLogging: true

  root: Ember.Route.extend
    route: '/'

    index: Ember.Route.extend
      route: '/'

      enter: ()->
        @._super()
        Mpl.store.find(Mpl.Account)
        Mpl.store.find(Mpl.AccountTransfer)
        Mpl.store.find(Mpl.Transaction)
        Mpl.store.find(Mpl.Category)
        Mpl.set('language', I18n.defaultLocale)
      connectOutlets: (router, event) ->
        walkState = (state) ->
          console.log state.get('path')
          state.get('childStates').forEach (childState) ->
            walkState childState

        Mpl.router.get('childStates').forEach (state) ->
          walkState state


        router.get('userController').set('content', Mpl.store.find(Mpl.User, Mpl.user_id))

        router.get('applicationController').connectOutlet('navbar', 'navbar');
        router.get('applicationController').connectOutlet('flash', 'homeIndexEmpty');

      doHome: (router, event) ->
        router.transitionTo('home.index')

      doAccounts: (router, event) ->
        router.transitionTo('accounts.index')

      doTransactions: (router, event) ->
        router.transitionTo('transactions.index')
      doCategories: (router, event) ->
        router.transitionTo('categories.index')
      doPlans: (router, event) ->
        router.transitionTo('plans.index')
      doSettings: (router, event) ->
        router.transitionTo('settings.index')
      doLanguages: (router, event) ->
        $(event.target).parents('.dropdown').toggleClass('open')
        router.get('applicationController').connectOutlet('shared_modal', 'languagesIndex')


      doSignOut: (router, event) ->
        $.ajax(
          url: '/sign_out',
          type: 'DELETE',
          success: (result) ->
            $('body>.container').empty()
            window.location.replace( result.url)
        )

      index: Ember.Route.extend
        route: '/'
        redirectsTo: 'home.index'

      home: Mpl.HomeRouter
      accounts: Mpl.AccountRouter
      transactions: Mpl.TransactionRouter
      categories: Mpl.CategoryRouter
      plans: Mpl.PlanRouter
      settings: Mpl.SettingRouter
      languages: Ember.Route.extend(
        route: '/languages'
        index: Ember.Route.extend(
          route: '/'
          connectOutlets: (router, event) ->
            router.get('applicationController').connectOutlet('shared_modal', 'languagesIndex')
        )
      )
#= require ./home_router
#= require ./plan_router
#= require ./setting_router
#= require_self

Mpl.Router = Ember.Router.extend

#  enableLogging: true

  root: Ember.Route.extend
    route: '/'

    index: Ember.Route.extend
      route: '/'

      connectOutlets: (router, event) ->
        router.get('userController').set('content', Mpl.store.find(Mpl.User, Mpl.user_id))

        router.get('applicationController').connectOutlet('navbar', 'navbar');
        router.get('applicationController').connectOutlet('flash', 'homeIndexEmpty');

      doHome: (router, event) ->
        router.transitionTo('home.index')

      doPlans: (router, event) -> router.transitionTo('plans.index')
      doSettings: (router, event) -> router.transitionTo('settings.index')
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
      plans: Mpl.PlanRouter
      settings: Mpl.SettingRouter
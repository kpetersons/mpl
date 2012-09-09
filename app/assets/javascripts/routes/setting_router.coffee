Mpl.SettingRouter = Ember.Route.extend
  route: '/settings'

  index: Ember.Route.extend
    route: '/'

    connectOutlets: (router, event) ->
      router.get('applicationController').connectOutlet('content', 'settingsIndex', Mpl.Setting.find(Mpl.setting_id))

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))

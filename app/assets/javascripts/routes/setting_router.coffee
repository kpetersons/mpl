Mpl.SettingRouter = Ember.Route.extend
  route: '/settings'

  index: Ember.Route.extend
    route: '/'

    connectOutlets: (router, event) ->
      router.get('applicationController').set('isHomeActive', '');
      router.get('applicationController').set('isAccountsActive', '');
      router.get('applicationController').set('isTransactionsActive', '');
      router.get('applicationController').set('isCategoriesActive', '');
      router.get('applicationController').set('isPlansActive', '');
      router.get('applicationController').set('isSettingsActive', 'active');

      router.get('applicationController').connectOutlet('content', 'settingsIndex', Mpl.Setting.find(Mpl.setting_id))
      router.get('applicationController').connectOutlet('flash', 'homeIndexEmpty');

    doSave: (router, event) ->
      router.get('applicationController').connectOutlet('flash', 'flash', Ember.Object.create(message : 'Success'))

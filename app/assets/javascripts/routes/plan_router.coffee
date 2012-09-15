Mpl.PlanRouter = Ember.Route.extend
  route: '/plans'

  connectOutlets: (router, event) ->
    router.get('applicationController').set('isHomeActive', '');
    router.get('applicationController').set('isAccountsActive', '');
    router.get('applicationController').set('isTransactionsActive', '');
    router.get('applicationController').set('isCategoriesActive', '');
    router.get('applicationController').set('isPlansActive', 'active');
    router.get('applicationController').set('isSettingsActive', '');

    router.get('applicationController').connectOutlet('content', 'plansIndex');

  index: Ember.Route.extend
    route: '/'

  new: Ember.Route.extend
    route: '/new'

  edit: Ember.Route.extend
    route: '/:plan_id'
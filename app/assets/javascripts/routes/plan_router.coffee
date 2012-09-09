Mpl.PlanRouter = Ember.Route.extend
  route: '/plans'

  connectOutlets: (router, event) ->
    router.get('applicationController').connectOutlet('content', 'plansIndex');

  index: Ember.Route.extend
    route: '/'

  new: Ember.Route.extend
    route: '/new'

  edit: Ember.Route.extend
    route: '/:plan_id'
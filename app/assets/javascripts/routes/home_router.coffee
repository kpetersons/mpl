Mpl.HomeRouter = Ember.Route.extend
  route: '/'

  connectOutlets: (router, event) ->
    router.get('applicationController').set('isHomeActive', 'active');
    router.get('applicationController').set('isAccountsActive', '');
    router.get('applicationController').set('isTransactionsActive', '');
    router.get('applicationController').set('isCategoriesActive', '');
    router.get('applicationController').set('isPlansActive', '');
    router.get('applicationController').set('isSettingsActive', '');

    router.get('applicationController.user.settings')
    router.get('applicationController').connectOutlet('content', 'homeIndex');

    router.get('homeIndexController').connectOutlet('accounts', 'accountsIndex', Mpl.Account.find());
    router.get('homeIndexController').connectOutlet('transactions', 'transactionsIndex', Mpl.Transaction.find());

  index: Ember.Route.extend
    route: '/home'

    connectOutlets: (router, event) ->
      router.get('homeIndexController').connectOutlet('modal', 'homeIndexEmpty');

    doNewAccount: (router, event) -> router.transitionTo('accounts.new')
    doEditAccount: (router, event) -> router.transitionTo('accounts.edit', event)
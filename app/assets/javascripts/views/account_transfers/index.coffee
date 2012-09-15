Mpl.AccountTransfersHomeView = Ember.View.extend(
  templateName: 'templates/account_transfers/home'
);

Mpl.AccountTransfersIndexView = Ember.View.extend(
  templateName: 'templates/account_transfers/index'
  tagName: 'table'
  classNames: ['table', 'table-condensed']
);

Mpl.AccountTransfersIndexHeaderView = Ember.View.extend(
  templateName: 'templates/account_transfers/partials/header'
  tagName: 'thead'
);

Mpl.AccountTransfersIndexFooterView = Ember.View.extend(
  templateName: 'templates/account_transfers/partials/footer'
  tagName: 'tfoot'
);

Mpl.AccountTransfersIndexBodyView = Ember.View.extend(
  templateName: 'templates/account_transfers/partials/body'
  tagName: 'tbody'
);

Mpl.AccountTransfersBodyItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/account_transfers/partials/body_item'

  doEditAccount: ->
    @get('controller.target').send('doEditAccountTransfer', @get('account'))
);

Mpl.AccountTransfersIndexEmptyView = Ember.View.extend(
  template: ''
)
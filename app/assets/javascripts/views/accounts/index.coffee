Mpl.AccountsHomeView = Ember.View.extend(
  templateName: 'templates/accounts/home'
);

Mpl.AccountsIndexView = Ember.View.extend(
  templateName: 'templates/accounts/index'
  tagName: 'table'
  classNames: ['table', 'table-condensed']
);

Mpl.AccountsIndexHeaderView = Ember.View.extend(
  templateName: 'templates/accounts/partials/header'
  tagName: 'thead'
);

Mpl.AccountsIndexFooterView = Ember.View.extend(
  templateName: 'templates/accounts/partials/footer'
  tagName: 'tfoot'
);

Mpl.AccountsIndexBodyView = Ember.View.extend(
  templateName: 'templates/accounts/partials/body'
  tagName: 'tbody'
);

Mpl.AccountsBodyItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/accounts/partials/body_item'

  doEditAccount: ->
    @get('controller.target').send('doEditAccount', @get('account'))
);

Mpl.AccountsIndexEmptyView = Ember.View.extend(
  template: ''
)
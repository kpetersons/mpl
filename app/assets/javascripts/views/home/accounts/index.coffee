Mpl.AccountsIndexView = Ember.View.extend(
  templateName: 'templates/home/accounts/index'
  tagName: 'table'
  classNames: ['table', 'table-striped', 'table-condensed']
);

Mpl.AccountsIndexHeaderView = Ember.View.extend(
  templateName: 'templates/home/accounts/partials/header'
  tagName: 'thead'
);

Mpl.AccountsIndexFooterView = Ember.View.extend(
  templateName: 'templates/home/accounts/partials/footer'
  tagName: 'tfoot'
);

Mpl.AccountsIndexBodyView = Ember.View.extend(
  templateName: 'templates/home/accounts/partials/body'
  tagName: 'tbody'
);

Mpl.AccountsBodyItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/home/accounts/partials/body_item'

  doEditAccount: ->
    @get('controller.target').send('doEditAccount', @get('account'))
);
Mpl.TransactionsHomeView = Ember.View.extend(
  templateName: 'templates/transactions/home'
);

Mpl.TransactionsIndexView = Ember.View.extend(
  templateName: 'templates/transactions/index'
  tagName: 'table'
  classNames: ['table', 'table-condensed']
);

Mpl.TransactionsNestedIndexView = Ember.View.extend(
  templateName: 'templates/home/transactions/nested_index'
  tagName: 'table'
  classNames: ['table', 'table-condensed']
  contentBinding: null

);

Mpl.TransactionsIndexHeaderView = Ember.View.extend(
  templateName: 'templates/transactions/partials/header'
  tagName: 'thead'
);

Mpl.TransactionsIndexFooterView = Ember.View.extend(
  templateName: 'templates/transactions/partials/footer'
  tagName: 'tfoot'
);

Mpl.TransactionsIndexBodyView = Ember.View.extend(
  templateName: 'templates/transactions/partials/body'
  tagName: 'tbody'
);

Mpl.TransactionsIndexItemView = Ember.View.extend(
  templateName: 'templates/transactions/partials/body_item'
  tagName: 'tr'

  doEditTransaction: ->
    @get('controller.target').send('doEditTransaction', @get('transaction'))

);

Mpl.TransactionsIndexEmptyView = Ember.View.extend(
  template: ''
)
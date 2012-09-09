Mpl.TransactionsIndexView = Ember.View.extend(
  templateName: 'templates/home/transactions/index'
  tagName: 'table'
  classNames: ['table', 'table-striped']
);

Mpl.TransactionsNestedIndexView = Ember.View.extend(
  templateName: 'templates/home/transactions/nested_index'
  tagName: 'table'
  classNames: ['table', 'table-striped']
  contentBinding: null

);

Mpl.TransactionsIndexHeaderView = Ember.View.extend(
  tagName: 'thead'
);

Mpl.TransactionsIndexFooterView = Ember.View.extend(
  tagName: 'tfoot'
);

Mpl.TransactionsIndexBodyView = Ember.View.extend(
  tagName: 'tbody'
);

Mpl.TransactionsIndexItemView = Ember.View.extend(
  tagName: 'tr'

  doEditTransaction: ->
    @get('controller.target').send('doEditTransaction', @get('transaction'))

#  transactionTypeObserver: (->
#    @classNames.removeObject('error').removeObject('success')
#    if @get('transaction.isIncome')
#      @set('class', 'success')
#    else
#      @set('class', 'error')
#  ).observes('transaction.type')
);
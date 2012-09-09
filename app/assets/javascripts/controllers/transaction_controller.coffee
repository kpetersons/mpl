Mpl.TransactionsIndexController = Ember.Controller.extend(
  transactions: (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')

)
Mpl.TransactionsNestedIndexController = Mpl.TransactionsIndexController.extend()

Mpl.NewTransactionController = Mpl.NewRecordController.extend(

  modelType: Mpl.Transaction
  options: -> {type: @get('type')}
)

Mpl.EditTransactionController = Mpl.EditRecordController.extend(

  modelType: Mpl.Transaction

)
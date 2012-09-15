Mpl.TransactionsHomeController = Ember.Controller.extend()

Mpl.TransactionsIndexController = Ember.Controller.extend(
  transactions: (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')

)
Mpl.TransactionsNestedIndexController = Mpl.TransactionsIndexController.extend()

Mpl.NewTransactionController = Mpl.NewRecordController.extend(

  modelType: Mpl.Transaction
  options: -> {type: @get('type')}

  applicableCategories: (->
    return @get('categories').filterProperty('type', @get('type'))
  ).property('categories.@each.id', 'content.type', 'type')

)

Mpl.EditTransactionController = Mpl.EditRecordController.extend(

  modelType: Mpl.Transaction
  options: -> {type: @get('type')}

  applicableCategories: (->
    return @get('categories').filterProperty('type', @get('content.type'))
  ).property('categories.@each.id', 'content.type', 'type')

)
Mpl.CategoryGroup.reopen(

  transactions: (->
    category_transactions = Ember.A()
    @get('categories').forEach( (category)->
      category.get('transactions').forEach( (transaction)->
        category_transactions.pushObject(transaction)
      )
    )
    return category_transactions
  ).property('categories.@each.total_all')
)
Mpl.CategoryGroup.reopen(Mpl.TransactionSumsMixin)
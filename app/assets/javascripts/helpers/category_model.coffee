Mpl.Category.reopen(Mpl.TransactionSumsMixin)
Mpl.Category.reopen(
  className: (->
    if @totalCalc() > 0
      return 'success'
    if @totalCalc() == 0
      return 'info'
    return 'error'
  ).property('transactions.@each.amount')

)
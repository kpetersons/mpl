Mpl.Category.reopen(Mpl.TransactionSumsMixin)
Mpl.Category.reopen(
  className: (->
    if @totalCalc() > 0
      return 'text-success'
    if @totalCalc() == 0
      return 'text-success'
    return 'text-error'
  ).property('transactions.@each.amount')

)
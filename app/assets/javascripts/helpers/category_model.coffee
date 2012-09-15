Mpl.Category.reopen(Mpl.TransactionSumsMixin)
Mpl.Category.reopen(
  className: (->
    if @totalCalc() > 0
      return 'alert-success'
    if @totalCalc() == 0
      return 'alert-info'
    return 'alert-error'
  ).property('transactions.@each.amount')
)
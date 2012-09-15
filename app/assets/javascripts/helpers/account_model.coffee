Mpl.Account.reopen(Mpl.TransactionSumsMixin)
Mpl.Account.reopen(
  className: (->
    if @totalCalc() > 0
      return 'alert-success'
    if @totalCalc() == 0
      return 'alert-info'
    return 'alert-error'
  ).property('transactions.@each.amount')
)
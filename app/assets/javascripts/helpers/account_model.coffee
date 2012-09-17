Mpl.Account.reopen(Mpl.TransactionSumsMixin)
Mpl.Account.reopen(
  className: (->
    if @totalCalc() > 0
      return 'success'
    if @totalCalc() == 0
      return 'info'
    return 'error'
  ).property('transactions.@each.amount')
)
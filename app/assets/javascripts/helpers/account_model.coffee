Mpl.Account.reopen(Mpl.TransactionSumsMixin)
Mpl.Account.reopen(
  className: (->
    if @totalCalc() > 0
      return 'text-success'
    if @totalCalc() == 0
      return 'text-success'
    return 'text-error'
  ).property('transactions.@each.amount')
)
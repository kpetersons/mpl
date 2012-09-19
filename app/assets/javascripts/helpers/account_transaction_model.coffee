Mpl.AccountTransfer.reopen(
#  accountFromWillChange: (->
#    @set('previousFromAccount', @get('from_account'))
#  ).observesBefore('from_account')
#
#  accountFromDidChange: (->
#    @set('newFromAccount', @get('from_account'))
#  ).observes('from_account')
#
#  accountToWillChange: (->
#    @set('previousToAccount', @get('to_account'))
#  ).observesBefore('to_account')
#
#  accountToDidChange: (->
#    @set('newToAccount', @get('to_account'))
#  ).observes('to_account')
#
#  didLoad: ->
#    prevFromAcct = @get('previousFromAccount')
#    newFromAcct = @get('newFromAccount')
#    if prevFromAcct && prevFromAcct.get('transactions')
#      prevFromAcct.get('transactions').removeObject(@get('from_transaction'))
#    if newFromAcct && newFromAcct.get('transactions')
#      newFromAcct.get('transactions').pushObject(@get('from_transaction'))
#
#    prevToAcct = @get('previousToAccount')
#    newToAcct = @get('newToAccount')
#    if prevToAcct && prevToAcct.get('transactions')
#      prevToAcct.get('transactions').removeObject(@get('to_transaction'))
#    if newToAcct && newToAcct.get('transactions')
#      newToAcct.get('transactions').pushObject(@get('to_transaction'))
#
)
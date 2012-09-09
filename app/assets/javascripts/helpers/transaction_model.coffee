Mpl.Transaction.reopen(

  formatted_date_when: (->
    format = @get('user.setting.date_format')
    date = @get('date_when')
    if format && date
      return moment(date).format(format.toUpperCase())
  ).property('date_when', 'user.setting.date_format')

  formatted_amount: (->
    accounting.formatMoney(
      @get('amount'), { symbol: @get('user.setting.currency'),  format: '%v %s' }
    )
  ).property('amount', 'user.setting.currency')

  isIncome: (->
    @get('type') == 'income'
  ).property('type')

  className: (->
    if @get('type') == 'income'
      return 'success'
    return 'error'
  ).property('type')

  accountWillChanged: (->
    console.log 'previous Account', @get('account')
    @set('previousAccount', @get('account'))
  ).observesBefore('account')

  accountDidChanged: (->
    console.log 'new Account', @get('account')
    @set('newAccount', @get('account'))
  ).observes('account')

)

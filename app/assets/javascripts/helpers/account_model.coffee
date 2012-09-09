Mpl.Account.reopen(

  totalCalc: ->
    incomesSum = @sumArray @incomes().getEach('amount')
    expensesSum = @sumArray @expenses().getEach('amount')
    return incomesSum - expensesSum

  totalToday: ->
    incomesSum = @sumArray(
      @filterRange(
        @incomes(), @rangeToday()
      ).getEach('amount')
    )
    expensesSum = @sumArray(
      @filterRange(
        @expenses(), @rangeToday()
      ).getEach('amount')
    )
    return incomesSum - expensesSum

  totalWeek: ->
    incomesSum = @sumArray(
      @filterRange(
        @incomes(), @rangeWeek()
      ).getEach('amount')
    )
    expensesSum = @sumArray(
      @filterRange(
        @expenses(), @rangeWeek()
      ).getEach('amount')
    )
    return incomesSum - expensesSum

  totalMonth: ->
    incomesSum = @sumArray(
      @filterRange(
        @incomes(), @rangeMonth()
      ).getEach('amount')
    )
    expensesSum = @sumArray(
      @filterRange(
        @expenses(), @rangeMonth()
      ).getEach('amount')
    )
    return incomesSum - expensesSum

  incomes: ->
    @transactionsByType('income')

  expenses: ->
    @transactionsByType('expense')

  filterRange: (transactions, range)->
    transactions.filter((item) ->
      mom = moment(item.get('date_when'))
      range.contains(mom)
    )

  rangeToday: ->
    start = moment().sod()
    end   = moment().eod()
    moment().range(start, end);
  rangeWeek: ->
    start = moment().day(1).sod()
    end   = moment().day(7).eod()
    moment().range(start, end);

  rangeMonth: ->
    start = moment().startOf('month').sod()
    end   = moment().endOf('month').eod()
    moment().range(start, end);

  transactionsByType: (type)->
    @get('transactions').filterProperty('type', type)

  sumArray: (arr) ->
    if arr.length == 0
      arr = [0]
    arr.reduce (t, s) -> t + s

  total_all: (->
    @totalCalc()
  ).property('transactions.@each.amount')

  total_today: (->
    @totalToday()
  ).property('transactions.@each.amount')

  total_week: (->
    @totalWeek()
  ).property('transactions.@each.amount')

  total_month: (->
    @totalMonth()
  ).property('transactions.@each.amount')

  formatted_total_all: (->
    accounting.formatMoney(
      @totalCalc(), { symbol: @get('user.setting.currency'),  format: '%v %s' }
    )
  ).property('transactions', 'transactions.@each.amount', 'user.setting.currency')

  formatted_total_today: (->
    accounting.formatMoney(
      @totalToday(), { symbol: @get('user.setting.currency'),  format: '%v %s' }
    )
  ).property('transactions', 'transactions.@each.amount', 'user.setting.currency')

  formatted_total_week: (->
    accounting.formatMoney(
      @totalWeek(), { symbol: @get('user.setting.currency'),  format: '%v %s' }
    )
  ).property('transactions', 'transactions.@each.amount', 'user.setting.currency')

  formatted_total_month: (->
    accounting.formatMoney(
      @totalMonth(), { symbol: @get('user.setting.currency'),  format: '%v %s' }
    )
  ).property('transactions', 'transactions.@each.amount', 'user.setting.currency')
)
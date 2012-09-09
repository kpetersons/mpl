Mpl.Transaction = DS.Model.extend
  id          : DS.attr('number')
  type        : DS.attr('string')
  amount      : DS.attr('number')
  date_when   : DS.attr('string')

  user        : DS.belongsTo('Mpl.User')
  account     : DS.belongsTo('Mpl.Account')

  isValid: ->
    @set('validationErrors', null)
    errors = Ember.ArrayProxy.create({ content: Ember.A() });
    if @isEmpty(@get('amount'))
      errors.pushObject
        'fieldError': 'Transaction amount is mandatory!'
        'fieldName': 'amount'
    if @isEmpty(@get('date_when'))
      errors.pushObject
        'fieldError': 'Transaction date is mandatory!'
        'fieldName': 'date_when'
    if @get('account') == null
      errors.pushObject
        'fieldError': 'Transaction account is mandatory!'
        'fieldName': 'account'

    unless errors.get('empty')
      @set('validationErrors', errors)
    return errors.get('empty')

  errors: (->
    @get('validationErrors')
  ).property('validationErrors')

  persist: ->
    prevAcct = @get('previousAccount')
    newAcct = @get('newAccount')
    if prevAcct && prevAcct.get('transactions')
      prevAcct.get('transactions').removeObject(@)
    if newAcct && newAcct.get('transactions')
      newAcct.get('transactions').pushObject(@)
    @save()

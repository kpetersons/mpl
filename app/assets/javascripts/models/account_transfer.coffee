Mpl.AccountTransfer = DS.Model.extend
  id          : DS.attr('number')
  description : DS.attr('string')
  date_when   : DS.attr('string')

  user              : DS.belongsTo('Mpl.User')
  from_transaction  : DS.belongsTo('Mpl.Transaction')
  to_transaction    : DS.belongsTo('Mpl.Transaction')

  from_account      : DS.belongsTo('Mpl.Account')
  to_account        : DS.belongsTo('Mpl.Account')
  amount            : DS.attr('number')

  isValid: ->
    @set('validationErrors', null)
    errors = Ember.ArrayProxy.create({ content: Ember.A() });
    if @isEmpty(@get('from_account'))
      errors.pushObject
        'fieldError': 'From account is mandatory!'
        'fieldName': 'from_account'
    if @isEmpty(@get('to_account'))
      errors.pushObject
        'fieldError': 'To account is mandatory!'
        'fieldName': 'to_account'
    if @isEmpty(@get('amount'))
      errors.pushObject
        'fieldError': 'amount is mandatory!'
        'fieldName': 'amount'
    if @isEmpty(@get('date_when'))
      errors.pushObject
        'fieldError': 'transfer date is mandatory!'
        'fieldName': 'date_when'
    unless errors.get('empty')
      @set('validationErrors', errors)
    return errors.get('empty')

  errors: (->
    @get('validationErrors')
  ).property('validationErrors')
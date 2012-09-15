Mpl.Transaction = DS.Model.extend
  id          : DS.attr('number')
  type        : DS.attr('string')
  amount      : DS.attr('number')
  date_when   : DS.attr('string')
  description : DS.attr('string')

  user                : DS.belongsTo('Mpl.User')
  account             : DS.belongsTo('Mpl.Account')
  category            : DS.belongsTo('Mpl.Category')
  account_transfer    : DS.belongsTo('Mpl.AccountTransfer')

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
    if @get('category') == null
      errors.pushObject
        'fieldError': 'Transaction category is mandatory!'
        'fieldName': 'category'

    unless errors.get('empty')
      @set('validationErrors', errors)
    return errors.get('empty')

  errors: (->
    @get('validationErrors')
  ).property('validationErrors')

  persist: ->
#    prevAcct = @get('previousAccount')
#    newAcct = @get('newAccount')
#    prevCat = @get('previousCategory')
#    newCat = @get('newCategory')
#    if prevAcct && prevAcct.get('transactions')
#      prevAcct.get('transactions').removeObject(@)
#    if newAcct && newAcct.get('transactions')
#      newAcct.get('transactions').pushObject(@)
#
#    if prevCat && prevCat.get('transactions')
#      prevCat.get('transactions').removeObject(@)
#    if newCat && newCat.get('transactions')
#      newCat.get('transactions').pushObject(@)

    @save()

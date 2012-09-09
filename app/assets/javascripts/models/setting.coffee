Mpl.Setting = DS.Model.extend

  id                  : DS.attr('number')
  date_format         : DS.attr('string')
  currency_format     : DS.attr('string')
  currency            : DS.attr('string')

  user        : DS.belongsTo('Mpl.User')

  isValid: ->
    @set('validationErrors', null)
    errors = Ember.ArrayProxy.create({ content: Ember.A() });
    if @isEmpty(@get('date_format'))
      errors.pushObject
        'fieldError': 'Date format is mandatory!'
        'fieldName': 'date_format'
#    if @isEmpty(@get('currency_format'))
#      errors.pushObject
#        'fieldError': 'Currency format is mandatory!'
#        'fieldName': 'currency_format'
    if @isEmpty(@get('currency'))
      errors.pushObject
        'fieldError': 'Currency is mandatory!'
        'fieldName': 'currency'
    unless errors.get('empty')
      @set('validationErrors', errors)
    return errors.get('empty')

  errors: (->
    @get('validationErrors')
  ).property('validationErrors')

  persist: ->
    @save()
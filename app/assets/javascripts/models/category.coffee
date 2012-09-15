Mpl.Category = DS.Model.extend(

  id          : DS.attr('number')
  name        : DS.attr('string')
  description : DS.attr('string')
  type        : DS.attr('string')

  user         : DS.belongsTo('Mpl.User')
  transactions : DS.hasMany('Mpl.Transaction', key: 'transaction_ids')

  isValid: ->
    @set('validationErrors', null)
    errors = Ember.ArrayProxy.create({ content: Ember.A() });
    if @isEmpty(@get('name'))
      errors.pushObject
        'fieldError': 'Category name is mandatory!'
        'fieldName': 'name'
    unless errors.get('empty')
      @set('validationErrors', errors)
    return errors.get('empty')

  errors: (->
    @get('validationErrors')
  ).property('validationErrors')

  persist: ->
    @save()

)
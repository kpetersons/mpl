Mpl.CategoryGroup = DS.Model.extend
  id          : DS.attr('number')
  name        : DS.attr('string')

  user         : DS.belongsTo('Mpl.User')
  categories   : DS.hasMany('Mpl.Category', key: 'category_ids')

  isValid: ->
    @set('validationErrors', null)
    errors = Ember.ArrayProxy.create({ content: Ember.A() });
    if @isEmpty(@get('name'))
      errors.pushObject
        'fieldError': 'Group name is mandatory!'
        'fieldName': 'name'
    unless errors.get('empty')
      @set('validationErrors', errors)
    return errors.get('empty')

  errors: (->
    @get('validationErrors')
  ).property('validationErrors')

  toJSON: (options)->
    unless options
      options = {associations: true}
    if Ember.typeOf(options) == 'object'
      options['associations'] = true
    @._super(options)


  persist: ->
    @save()
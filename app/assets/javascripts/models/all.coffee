#= require_self
#= require_tree .

Ember.MutableArray.reopen
  empty: (->
    return this.get('length') == 0
  ).property('length')


#Validations
DS.Model.reopen
  isEmpty: (obj) ->
    if (obj == undefined || obj == '' || obj == null)
      return true
    return false

  isNotNumber: (obj) ->
    return !$.isNumeric(obj)

  isNotString: (obj) ->
    return @isEmpty()

#Saving
DS.Model.reopen
  save: ->
    Mpl.store.commit()

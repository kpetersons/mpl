Mpl.DateField = Ember.TextField.extend(
  classNames: ['date']
  attributeBindings: ['type', 'value', 'size', 'format']

  didInsertElement: ->
    $('.datepicker.dropdown-menu').remove()
    _self = @
    val = @get('value')
    unless val
      val = new Date()
    @set('value', moment(val).format(@get('format').toUpperCase()))
    @$().datepicker(
      format: @get('format')
    ).on('changeDate', (evt)->
      _self.set('value', moment(evt.date).format(_self.get('format').toUpperCase()))
      return true
    ).on('hide', (evt)->
      _self.set('value', moment(evt.date).format(_self.get('format').toUpperCase()))
      return true
    )
    return
)
Handlebars.registerHelper('I18n',
  (str) ->
    if I18n != undefined
      return I18n.t(str)
    return str
)

Handlebars.registerHelper('I18nt',
  (property, options) ->
    val = property
    if I18n != undefined
      val = I18n.t(property)
    options.hash.contentBinding = val
    return Ember.Handlebars.ViewHelper.helper(this, val, options);
)

Mpl.I18nView = Ember.View.extend (

  tagName: 'span'
  template: Ember.Handlebars.compile('{{view.t}}')

  t: (->
    if @get('value') != undefined
      return I18n.translate(@get('value'))
  ).property('Mpl.language', 'value')

)
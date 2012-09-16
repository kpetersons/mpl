Mpl.LanguagesIndexView = Ember.View.extend (
  templateName: 'templates/languages/index'
  classNames: ['modal']

  didInsertElement: ->
    Mpl.previousLanguage = I18n.locale || I18n.defaultLocale
    @open()
    _self = @
    @$('td .well').on('click', (evt)->
      _self.$('td .well').addClass('like-well')
      $(evt.target).toggleClass('like-well')
      I18n.locale = $(evt.target).attr('data-language')
    )
    @$("[data-language=#{Mpl.previousLanguage}]").removeClass('like-well')

  open: ->
    @$().modal(
      backdrop: 'static'
      keyboard: false
      show: false
    ).modal('show')

  close: ->
    @$().modal('hide')


  doCancel: (event)->
    I18n.locale = Mpl.previousLanguage
    Mpl.set('language', I18n.locale)
    @close()

  doSave: ->
    Mpl.set('language', I18n.locale)
    @close()
    return
)
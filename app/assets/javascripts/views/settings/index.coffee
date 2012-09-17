Mpl.SettingsIndexView = Ember.View.extend(
  templateName: 'templates/settings/index'
  classNames: ['modal']

  didInsertElement: ->
    @open()
    @get('controller').newRecordInstance()

  open: ->
    @$().modal(
      backdrop: 'static'
      keyboard: false
      show: false
    ).modal('show')

  close: ->
    @$().modal('hide')


  doCancel: (event)->
    @close()
    @get('controller').releaseRecordInstance()


  doSave: ->
    if @get('controller').persistRecordInstance()
      @close()
)
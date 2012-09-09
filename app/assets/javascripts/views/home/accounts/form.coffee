Mpl.AccountFormView = Ember.View.extend(
  templateName: 'templates/home/accounts/partials/form'
)

Mpl.NewAccountView = Ember.View.extend(
  templateName: 'templates/home/accounts/new'
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
    @get('controller.target').send('doCancel', event)


  doSave: ->
    if @get('controller').persistRecordInstance()
      @get('controller.target').send('doSave', event)
      @close()
      return
)

Mpl.EditAccountView = Mpl.NewAccountView.extend(
  templateName: 'templates/home/accounts/edit'
)
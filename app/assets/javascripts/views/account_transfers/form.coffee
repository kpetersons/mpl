Mpl.AccountTransferFormView = Ember.View.extend(
  templateName: 'templates/account_transfers/partials/form'
)

Mpl.NewAccountTransferView = Ember.View.extend(
  templateName: 'templates/account_transfers/new'
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

Mpl.EditAccountTransferView = Mpl.NewAccountTransferView.extend(
  templateName: 'templates/account_transfers/edit'
)
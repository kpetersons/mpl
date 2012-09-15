Mpl.TransactionFormView = Ember.View.extend(
  templateName: 'templates/transactions/partials/form'
)

Mpl.NewTransactionView = Ember.View.extend(
  templateName: 'templates/transactions/new'
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

Mpl.EditTransactionView = Mpl.NewTransactionView.extend(
  templateName: 'templates/transactions/edit'
)
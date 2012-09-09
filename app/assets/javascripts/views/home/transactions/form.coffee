Mpl.TransactionFormView = Ember.View.extend(
  templateName: 'templates/home/transactions/form'
)

Mpl.NewTransactionView = Ember.View.extend(
  templateName: 'templates/home/transactions/new'
  classNames: ['modal']

  accounts: (->
    @get('controller.accounts')
  ).property('controller.accounts')

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
  templateName: 'templates/home/transactions/edit'
)
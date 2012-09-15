Mpl.AccountTransfersHomeController = Ember.Controller.extend()

Mpl.AccountTransfersIndexController = Ember.Controller.extend(
  account_transfers : (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')
)

Mpl.NewAccountTransferController = Mpl.NewRecordController.extend(

  modelType: Mpl.AccountTransfer
)

Mpl.EditAccountTransferController = Mpl.EditRecordController.extend(

  modelType: Mpl.AccountTransfers

)
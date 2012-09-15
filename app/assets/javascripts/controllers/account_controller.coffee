Mpl.AccountsHomeController = Ember.Controller.extend()

Mpl.AccountsIndexController = Ember.Controller.extend(
  accounts : (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')
)

Mpl.NewAccountController = Mpl.NewRecordController.extend(

  modelType: Mpl.Account
)

Mpl.EditAccountController = Mpl.EditRecordController.extend(

  modelType: Mpl.Account

)
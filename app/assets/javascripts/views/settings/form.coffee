Mpl.SettingFormView = Ember.View.extend(
  templateName: 'templates/settings/form'
)

Mpl.NewSettingView = Ember.View.extend(

  didInsertElement: ->
    @get('controller').newRecordInstance()

  doSave: ->
    if @get('controller').persistRecordInstance()
      @get('controller.target').send('doSave', event)
      return
)

Mpl.EditSettingView = Mpl.NewSettingView.extend(
  templateName: 'templates/settings/edit'
)
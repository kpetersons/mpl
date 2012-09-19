Mpl.CategoryGroupFormView = Ember.View.extend(
  templateName: 'templates/categories/groups/partials/form'
)

Mpl.NewCategoryGroupView = Ember.View.extend(
  templateName: 'templates/categories/groups/new'
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

Mpl.EditCategoryGroupView = Mpl.NewCategoryGroupView.extend(
  templateName: 'templates/categories/groups/edit'
)
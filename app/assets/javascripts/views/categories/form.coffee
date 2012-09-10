Mpl.CategoryFormView = Ember.View.extend(
  templateName: 'templates/home/categories/partials/form'
)

Mpl.NewCategoryView = Ember.View.extend(
  templateName: 'templates/home/categories/new'
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

Mpl.EditCategoryView = Mpl.NewCategoryView.extend(
  templateName: 'templates/home/categories/edit'
)
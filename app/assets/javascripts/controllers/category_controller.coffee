Mpl.CategoriesHomeController = Ember.Controller.extend()

Mpl.CategoriesIndexController = Ember.Controller.extend(
  categories : (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')

)

Mpl.NewCategoryController = Mpl.NewRecordController.extend(

  options: -> {type: @get('type')}
  modelType: Mpl.Category

)

Mpl.EditCategoryController = Mpl.EditRecordController.extend(

  modelType: Mpl.Category

)
Mpl.CategoriesIndexController = Ember.Controller.extend(
  categories : (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')
)

Mpl.NewCategoryController = Mpl.NewRecordController.extend(

  modelType: Mpl.Category
)

Mpl.EditCategoryController = Mpl.EditRecordController.extend(

  modelType: Mpl.Category

)
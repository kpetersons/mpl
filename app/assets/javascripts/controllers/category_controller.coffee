Mpl.CategoriesHomeController = Ember.Controller.extend()

Mpl.CategoriesIndexController = Ember.Controller.extend(
  categories : (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')

  isAnySelected: (->
    selected = @get('categories').filterProperty('isSelected', true)
    if selected.get('length') > 0
      return true
    return false
  ).property('categories.@each.isSelected')

  categoryGroups: (->
    @get('content').getEach('category_group').uniq().without(null)
  ).property('content.@each.category_group.id')

  grouplessCategories: (->
    @get('content').filterProperty('category_group', null)
  ).property('content.@each.id')

)

Mpl.NewCategoryController = Mpl.NewRecordController.extend(

  options: -> {type: @get('type')}
  modelType: Mpl.Category

)

Mpl.EditCategoryController = Mpl.EditRecordController.extend(

  modelType: Mpl.Category

)
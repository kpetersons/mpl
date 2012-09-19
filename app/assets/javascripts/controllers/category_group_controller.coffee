Mpl.CategoryGroupsIndexController = Ember.Controller.extend(

  categoryGroups : (->
    @get('content').filterProperty('id')
  ).property('content.@each.id')

)

Mpl.NewCategoryGroupController = Mpl.NewRecordController.extend(
  options: -> {}
  modelType: Mpl.CategoryGroup

  persistRecordInstance: ->
    record = @record()
    @get('selectedCategories').forEach((item) ->
      record.get('categories').pushObject(item)
    )
    return @._super()
)

Mpl.EditCategoryGroupController = Mpl.EditRecordController.extend(
  modelType: Mpl.CategoryGroup
)
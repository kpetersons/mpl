Mpl.CategoryGroupsHomeView = Ember.View.extend(
  templateName: 'templates/category/groups/home'
)

Mpl.CategoryGroupsIndexView = Ember.View.extend(
  templateName: 'templates/category/groups/index'
  tagName: 'table'
  classNames: ['table', 'table-condensed']

  anySelected: (->
    console.log 'changes in isSelected'
  ).property('controller.CategoryGroups.@each.isSelected')

)

Mpl.CategoryGroupsIndexHeaderView = Ember.View.extend(
  templateName: 'templates/category/groups/partials/header'
  tagName: 'thead'
)

Mpl.CategoryGroupsIndexFooterView = Ember.View.extend(
  templateName: 'templates/category/groups/partials/footer'
  tagName: 'tfoot'
)

Mpl.CategoryGroupsIndexBodyView = Ember.View.extend(
  templateName: 'templates/category/groups/partials/body'
  tagName: 'tbody'

  didInsertElement: ->
    _self = @
    @$().selectable
      filter: "tr"
      cancel: 'a'
      selecting: (event, obj, ui) ->
        _self.$('tr.ui-selecting').trigger('selecting.empl')
        return true
    return @
)

Mpl.CategoryGroupsBodyItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/category/groups/partials/body_item'

  doEditCategoryGroup: ->
    @get('controller.target').send('doEditCategoryGroup', @get('CategoryGroup'))

  didInsertElement: ->
    _self = this
    @$().on('selecting.empl', (evt)->
      _self.$().toggleClass('info')
      _self.get('CategoryGroup').set('isSelected', !_self.get('CategoryGroup.isSelected'))
      return true
    )
    return @
)

Mpl.CategoryGroupsIndexEmptyView = Ember.View.extend(
  template: ''
)
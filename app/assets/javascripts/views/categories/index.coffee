Mpl.CategoriesHomeView = Ember.View.extend(
  templateName: 'templates/categories/home'
)

Mpl.CategoriesIndexView = Ember.View.extend(
  templateName: 'templates/categories/index'
  tagName: 'table'
  classNames: ['table', 'table-condensed']

  anySelected: (->
    console.log 'changes in isSelected'
  ).property('controller.categories.@each.isSelected')

)

Mpl.CategoriesIndexHeaderView = Ember.View.extend(
  templateName: 'templates/categories/partials/header'
  tagName: 'thead'
)

Mpl.CategoriesIndexFooterView = Ember.View.extend(
  templateName: 'templates/categories/partials/footer'
  tagName: 'tfoot'
)

Mpl.CategoriesIndexBodyView = Ember.View.extend(
  templateName: 'templates/categories/partials/body'
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

Mpl.CategoriesBodyItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/categories/partials/body_item'

  doEditCategory: ->
    @get('controller.target').send('doEditCategory', @get('category'))

  didInsertElement: ->
    _self = this
    @$().on('selecting.empl', (evt)->
      _self.$().toggleClass('info')
      _self.get('category').set('isSelected', !_self.get('category.isSelected'))
      return true
    )
    return @
)

Mpl.CategoriesIndexEmptyView = Ember.View.extend(
  template: ''
)
Mpl.CategoriesIndexView = Ember.View.extend(
  templateName: 'templates/categories/index'
  tagName: 'table'
  classNames: ['table', 'table-striped', 'table-condensed']
);

Mpl.CategoriesIndexHeaderView = Ember.View.extend(
  templateName: 'templates/categories/partials/header'
  tagName: 'thead'
);

Mpl.CategoriesIndexFooterView = Ember.View.extend(
  templateName: 'templates/categories/partials/footer'
  tagName: 'tfoot'
);

Mpl.CategoriesIndexBodyView = Ember.View.extend(
  templateName: 'templates/categories/partials/body'
  tagName: 'tbody'
);

Mpl.CategoriesBodyItemView = Ember.View.extend(
  tagName: 'tr'
  templateName: 'templates/categories/partials/body_item'

  doEditCategory: ->
    @get('controller.target').send('doEditCategory', @get('category'))
);
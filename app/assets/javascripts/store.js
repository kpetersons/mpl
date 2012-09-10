Mpl.Store = DS.Store.extend({
  revision: 4,
  adapter: DS.RESTAdapter.create({
    plurals: {
    'category': 'categories'
    }
  })
});

Mpl.store = Mpl.Store.create({});
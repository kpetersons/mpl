Mpl.Store = DS.Store.extend({
  revision: 4,
  adapter: DS.RESTAdapter.create()
});

Mpl.store = Mpl.Store.create()
Mpl.Category = DS.Model.extend(

  id          : DS.attr('number')
  name        : DS.attr('string')
  description : DS.attr('string')
  type        : DS.attr('string')

  user         : DS.belongsTo('Mpl.User')
  transactions : DS.hasMany('Mpl.Transaction', key: 'transaction_ids')

)
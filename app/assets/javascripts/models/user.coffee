Mpl.User = DS.Model.extend
  id    : DS.attr('number')
  email : DS.attr('string')

  setting     : DS.belongsTo('Mpl.Setting')

  accounts     : DS.hasMany('Mpl.Account', key: 'account_ids')
  transactions : DS.hasMany('Mpl.Transaction', key: 'transaction_ids')
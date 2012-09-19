Mpl.User = DS.Model.extend
  id    : DS.attr('number')
  email : DS.attr('string')

  setting     : DS.belongsTo('Mpl.Setting')

  accounts          : DS.hasMany('Mpl.Account',      key: 'account_ids')
  account_transfers : DS.hasMany('Mpl.AccountTransfer',      key: 'account_transfer_ids')
  transactions      : DS.hasMany('Mpl.Transaction',  key: 'transaction_ids')
  categories        : DS.hasMany('Mpl.Category',     key: 'category_ids')
  category_groups   : DS.hasMany('Mpl.CategoryGroup',     key: 'category_group_ids')
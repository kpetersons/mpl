# == Schema Information
#
# Table name: categories
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string(255)
#  description       :string(255)
#  type              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_group_id :integer
#  user_type         :boolean          default(TRUE)
#

class Category < ActiveRecord::Base

  self.inheritance_column='inh_type'

  attr_accessible :user_id, :name, :description, :type, :category_group_id, :user_type

  belongs_to :user
  belongs_to :category_group

  has_many :transactions

  validates :name, :presence => true
  validates :name, :uniqueness => {:scope => [:user_id, :type]}

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:errors, :transaction_ids])
  end

  CATEGORY_AT_INCOME = 'category.income.account_transfer'
  CATEGORY_AT_EXPENSE = 'category.expense.account_transfer'

end


# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  account_id :integer
#  type       :string(255)
#  amount     :decimal(8, 2)
#  date_when  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ActiveRecord::Base
  set_inheritance_column :inh_type
  attr_accessible :user_id, :account_id, :type, :amount, :date_when

  belongs_to :user
  belongs_to :account

  validates :user_id,     :presence => true
  validates :account_id,  :presence => true
  validates :amount,      :presence => true
  validates :date_when,   :presence => true

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:errors])
  end

end

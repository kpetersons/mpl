# == Schema Information
#
# Table name: account_transfers
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  from_transaction_id :integer
#  to_transaction_id   :integer
#  description         :string(255)
#  date_when           :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class AccountTransfer < ActiveRecord::Base
  attr_accessible :user_id, :from_transaction_id, :to_transaction_id, :description, :date_when, :from_account_id, :to_account_id, :amount

  belongs_to :user
  belongs_to :from_transaction, :class_name => 'Transaction'
  belongs_to :to_transaction, :class_name => 'Transaction'

  validates :from_transaction_id, :presence => true
  validates :to_transaction_id, :presence => true
  validates :user_id, :presence => true
  validates :date_when, :presence => true

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:errors, :from_account_id, :to_account_id, :amount])
  end

  def from_account_id
    from_transaction.account.id
  end

  def to_account_id
    to_transaction.account.id
  end

  def amount
    from_transaction.amount
  end

end

# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  account_id  :integer
#  type        :string(255)
#  amount      :decimal(8, 2)
#  date_when   :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  description :text
#

class Transaction < ActiveRecord::Base
  set_inheritance_column :inh_type
  attr_accessible :user_id, :account_id, :type, :amount, :date_when, :category_id, :description, :account_transfer_id
  attr_accessor :account_transfer_id

  belongs_to :user
  belongs_to :account

  has_one :from_account_transfer, :class_name => 'AccountTransfer',    :foreign_key => :from_transaction_id
  has_one :to_account_transfer,   :class_name => 'AccountTransfer',    :foreign_key => :to_transaction_id

  validates :user_id,     :presence => true
  validates :account_id,  :presence => true
  validates :amount,      :presence => true
  validates :date_when,   :presence => true


  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:errors, :account_transfer_id])
  end

  def account_transfer_id
    if from_account_transfer
      return from_account_transfer.id
    end
    if to_account_transfer
      return to_account_transfer.id
    end
  end


end

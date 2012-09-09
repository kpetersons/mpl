# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Account < ActiveRecord::Base

  attr_accessible :description, :name, :user_id

  belongs_to :user

  has_many :transactions

  validates :name, :presence => true
  validates :name, :uniqueness => {:scope => :user_id}

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:errors, :transaction_ids])
  end

end

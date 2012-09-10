# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :string(255)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  set_inheritance_column :inh_type
  attr_accessible :user_id, :name, :description, :type

  belongs_to :user

  has_many :transactions

  validates :name, :presence => true
  validates :name, :uniqueness => {:scope => [:user_id, :type]}

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:errors, :transaction_ids])
  end

end


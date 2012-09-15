# == Schema Information
#
# Table name: category_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CategoryGroup < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :categories

end

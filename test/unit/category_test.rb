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

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: settings
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  date_format     :string(255)
#  currency_format :string(255)
#  currency        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  language        :string(255)      default("en")
#

require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

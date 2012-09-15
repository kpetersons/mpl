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

require 'test_helper'

class AccountTransferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

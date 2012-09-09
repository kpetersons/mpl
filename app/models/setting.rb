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
#

class Setting < ActiveRecord::Base
  attr_accessible :user_id, :date_format, :currency_format, :currency

  belongs_to :user

end

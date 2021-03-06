# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  encrypted_password :string(128)
#  salt               :string(128)
#  confirmation_token :string(128)
#  remember_token     :string(128)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base
  include Clearance::User

  after_create :init_settings, :init_accounts

  has_many :accounts
  has_many :transactions
  has_many :account_transfers
  has_many :settings
  has_many :categories
  has_many :category_groups

  def as_json(options = nil)
    super(:only => [:id, :email], :methods => [:account_ids, :transaction_ids, :setting_id, :account_transfer_ids, :category_ids, :category_group_ids])
  end

  def setting_id
    settings.first.id
  end

  def init_settings
    if self.settings.empty?
      settings = self.settings.build({:date_format => 'YYYY-MM-DD', :currency => '$', :currency_format => '%v %s'})
      unless settings.save
        settings.errors.full_messages.each do |error|
          puts "ERROR: #{error}"
        end
      end
    end
  end

  def init_accounts
    account = self.accounts.build(:name => 'account.name.default', :description => 'account.name.default_description')
    unless account.save
      inst.errors.full_messages.each do |error|
        puts "ERROR: #{inst.name} errors #{error}"
      end
    end
  end
end

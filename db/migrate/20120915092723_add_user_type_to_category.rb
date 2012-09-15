class AddUserTypeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :user_type, :boolean, :default => true
  end
end

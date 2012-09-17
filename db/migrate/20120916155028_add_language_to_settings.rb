class AddLanguageToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :language, :string, :default => 'en'
  end
end

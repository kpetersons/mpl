class AddDescriptionToTransaction < ActiveRecord::Migration
  def change
    change_table :transactions do |t|
      t.text :description
    end
  end
end

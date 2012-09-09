class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references      :user
      t.string          :date_format
      t.string          :currency_format
      t.string          :currency
      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :account
      t.string :type
      t.decimal :amount, :precision => 8, :scale => 2
      t.date :date_when
      t.timestamps
    end
  end
end

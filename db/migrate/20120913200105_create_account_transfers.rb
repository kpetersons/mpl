class CreateAccountTransfers < ActiveRecord::Migration
  def change
    create_table :account_transfers do |t|
      t.references :user
      t.integer :from_transaction_id
      t.integer :to_transaction_id

      t.string      :description
      t.date :date_when

      t.timestamps
    end
  end
end

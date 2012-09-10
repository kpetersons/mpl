class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references  :user
      t.string      :name
      t.string      :description
      t.string      :type
      t.timestamps
    end

    change_table :transactions do |t|
      t.references :category
    end
  end
end

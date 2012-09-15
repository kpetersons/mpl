class CreateCategoryGroups < ActiveRecord::Migration
  def change

    create_table :category_groups do |t|
      t.references :user
      t.string :name

      t.timestamps
    end

    change_table :categories do |t|
      t.references :category_group
    end

  end
end

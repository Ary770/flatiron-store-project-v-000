class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |f|
      f.string :title
      f.integer :inventory
      f.integer :price
      f.integer :category_id
    end
  end
end

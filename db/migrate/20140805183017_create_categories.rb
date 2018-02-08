class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |f|
      f.string :title
    end
  end
end

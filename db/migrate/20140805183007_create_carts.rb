class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |f|
      f.integer :user_id
    end
  end
end

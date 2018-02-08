class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user 
  
  def total
    total_price = self.items.map{|item| item.price}.sum
  end
  
  def add_item(new_item_id)
    self.line_items.map do |line_item|
      if line_item.item_id == new_item_id
        line_item.quantity += 1
        line_item
      else
        self.line_items.build(item_id: new_item_id)
      end
    end.first
  end
  
end

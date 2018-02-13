class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(id: params[:id])
  end
  
  def checkout
    current_user.current_cart.status = "submitted"
    current_user.current_cart.save
    update_inventory
    @submitted_cart_id = current_user.current_cart
    reset_current_cart
    redirect_to cart_path(@submitted_cart_id)
  end
  
  private
  
  def update_inventory
    current_user.current_cart.items.each do |item|
      @line_item = current_user.current_cart.line_items.find_by(item_id: item.id)
      item.inventory -= @line_item. quantity
      item.save
    end
  end
  
  def reset_current_cart
    current_user.current_cart= nil
    current_user.save
  end
  
end
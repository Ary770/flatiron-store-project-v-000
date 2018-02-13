class LineItemsController < ApplicationController
  
  def create
    if user_signed_in?
      current_user.current_cart ||= current_user.carts.create
      current_user.current_cart.add_item(params[:item_id])
      current_user.current_cart.save
      current_user.save
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to root_path
    end
  end
  
end

class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :checkout]
  
  def show
    @current_cart = current_user.current_cart
  end
 
  def checkout
    remove_items
    current_user.remove_cart
    redirect_to cart_path(@cart)
  end
 
  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
 
  def remove_items
    current_user.current_cart.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory -= line_item.quantity
      item.save
    end
  end

end

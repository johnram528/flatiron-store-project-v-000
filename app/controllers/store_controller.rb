class StoreController < ApplicationController
  def index
    @user = current_user
    @categories = Category.all
    @items = Item.available_items
  end

end

class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to public_cart_items_path
  end

  def destroy
  end

  def update
  end

  private

  def cart_item_params
    params.permit(:item_id, :customer_id, :amount)
  end

end

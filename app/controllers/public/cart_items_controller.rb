class Public::CartItemsController < ApplicationController

  def index
    @total = 0
    @cart_items = CartItem.where(customer_id: current_customer)
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: cart_item.item_id).present?
      cart_item.amount = cart_item.amount + params[:amount].to_i
      cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.where(customer_id: current_customer)
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.permit(:item_id, :customer_id, :amount)
  end

end

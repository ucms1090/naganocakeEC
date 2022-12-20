class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders.each do |order|
      @order_details = OrderDetail.where(order_id: order.id)
      order_details_item_amount = 0
      @order_details.each do |order_detail|
        @order_details_item_amount = order_details_item_amount + order_detail.items_amount
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total = 0
  end

  def edit
  end

  def update
  end

end
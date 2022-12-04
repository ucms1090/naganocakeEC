class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end
end

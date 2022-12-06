class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
  end

  def create
    order = Order.new
    order.customer_id = current_customer.id
    order.save
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.postal_address = current_customer.address
      @order.postal_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address]  == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.postal_address = @address.address
      @order.postal_name = @address.name
    else
      # select_address == 2
    end
    @cart_items = CartItem.where(customer_id: current_customer)
    @total = 0
  end

  def complete
    @order = Order.new
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:method_payment, :postal_code, :postal_address, :postal_name)
  end

end

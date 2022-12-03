class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :postal_address
      t.string :postal_name
      t.integer :billing_amount
      t.integer :shipping_cost
      t.integer :method_payment
      t.integer :order_status

      t.timestamps
    end
  end
end

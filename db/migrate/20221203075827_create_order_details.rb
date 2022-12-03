class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :items_amount
      t.integer :making_status

      t.timestamps
    end
  end
end

class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id,                    null: false
      t.integer :order_id,                   null: false
      t.integer :crafting_status,            null: false, default: 0
      t.integer :quantity,                   null: false
      t.integer :transaction_price,          null: false
      
      t.timestamps
    end
  end
end

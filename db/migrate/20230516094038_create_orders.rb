class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

    t.integer      :customer_id,         null: false
    t.string       :post_code,           null: false
    t.string       :address,             null: false
    t.string       :name,                null: false
    t.integer      :order_status,        null: false, default: 0
    t.integer      :payment_method,      null: false, default: 1
    t.integer      :billing_amount,      null: false
    t.integer      :postage,             null: false, default: 800


      t.timestamps
    end
  end
end

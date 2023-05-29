class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum crafting_status: {cannot_start: 0, preparing_for_crafting: 1, crafting: 2, have_crafted: 3}
  
  def subtotal
    item.with_tax_price * quantity
  end
end

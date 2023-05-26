class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

validates :item_description,        presence: true
validates :price,                   presence: true
validates :item_name,               presence: true

end

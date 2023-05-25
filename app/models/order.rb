class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {credit_card: 0,transfer:1}
  enum order_status: { shipped: 4, preparing_for_shipping: 3, in_production: 2, payment_confirmed: 1, payment_pending: 0 }
end

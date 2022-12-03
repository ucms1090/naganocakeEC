class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum method_payment: { credit_card: 0, transfer: 1}


end

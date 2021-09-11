class CartItem < ApplicationRecord
  # has_many :products, dependent: :destroy
  belongs_to :product
  belongs_to :customer

def subtotal
    product.with_tax_price * amount
end
end

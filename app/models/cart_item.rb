class CartItem < ApplicationRecord
  # has_many :products, dependent: :destroy
  belongs_to :product
end

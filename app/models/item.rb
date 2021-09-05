class Item < ApplicationRecord
  has_many :products, dependent: :destroy
  attachment :image
end

class Item < ApplicationRecord
  has_many :products, dependent: :destroy
end

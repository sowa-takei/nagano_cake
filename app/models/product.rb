class Product < ApplicationRecord
   attachment :image

   belongs_to :genre

   # belongs_to :cart_item
   has_many :cart_items, dependent: :destroy
end

class PostImage < ApplicationRecord
   belongs_to :ad
   attachment :image
end

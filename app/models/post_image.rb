class PostImage < ApplicationRecord
   belongs_to :admin
   attachment :image
end

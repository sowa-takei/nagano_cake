class PostImage < ApplicationRecord
   belongs_to :admin
   belongs_to :public
   # attachment :image
end

class Listing < ApplicationRecord
    enum condition: {New: 1, Used: 0}
    belongs_to :location 
    belongs_to :user
    belongs_to :size
    has_many_attached :picture
    
    validates :brand, :price,:condition, :location_id, :size_id, :picture, presence: true
   
    def listing_attachment 
        picture[0]
    end

end

class Size < ApplicationRecord
    has_many :listings, dependent: :destroy  
end

class Listing < ApplicationRecord
    enum condition: {New: 1, Used: 0}
    belongs_to :location 
    belongs_to :user
    
end

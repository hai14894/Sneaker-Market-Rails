class User < ApplicationRecord
  has_many :listings, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end

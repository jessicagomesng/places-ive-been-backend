class UsersCountry < ApplicationRecord
    belongs_to :user
    belongs_to :country 
    
    validates :user_id, :presence => true 
    validates :country_id, :presence => true 
end

class UsersCountry < ApplicationRecord
    belongs_to :user
    belongs_to :country 
    
    validates :user_id, :country_id, :presence => true 
end

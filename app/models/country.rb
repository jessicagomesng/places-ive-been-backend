class Country < ApplicationRecord
    has_many :users_countries 
    has_many :users, through: :users_countries 
    
    validates :name, :presence => true
    validates :name, :uniqueness => true
    # consolidate on one line
    validates :abbreviation, :presence => true
    validates :path, :presence => true 
end

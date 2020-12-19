class User < ApplicationRecord
    has_secure_password
    has_many :users_countries
    has_many :countries, through: :users_countries 
    has_many :pins

    validates :username, presence: true
    validates :username, length: { minimum: 4 }
    validates_uniqueness_of :username, :case_sensitive => false
    validates_uniqueness_of :email, :case_sensitive => false
    validates :password, :confirmation => true, :presence => true 
    validates :email, :presence => true 
end

class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true
    validates :username, length: { minimum: 4 }
    validates_uniqueness_of :username, :case_sensitive => false
    validates_uniqueness_of :email, :case_sensitive => false
end

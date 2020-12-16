class Pin < ApplicationRecord
    belongs_to :user

    validates :img, :location, :caption, :xCoord, :yCoord, :presence => true
end

class Pin < ApplicationRecord
    belongs_to :user

    validates :img, :location, :caption, :xPerc, :yPerc, :presence => true
end

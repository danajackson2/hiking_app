class Hiker < ApplicationRecord
    has_many :trips
    has_many :trails, through: :trips
end

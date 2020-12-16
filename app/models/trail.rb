class Trail < ApplicationRecord
    has_many :trips
    has_many :hikers, through: :trips
end

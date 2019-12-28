class UserRestaurant < ApplicationRecord
	validates :user_id, :uniqueness => {:scope => :restaurant_id}
    validates :user_id, presence: true
    validates :restaurant_id, presence: true
    has_one :restaurant, foreign_key: "restaurant_id"
    belongs_to :user
end

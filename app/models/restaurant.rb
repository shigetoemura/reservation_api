class Restaurant < ApplicationRecord
	belongs_to :user_restaurant, optional: true

    validates :name, :area, :tel, :price, :address, presence: true
end

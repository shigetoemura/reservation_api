class User < ApplicationRecord
	before_validation :assign_token

	has_many :user_images, dependent: :destroy

	def assign_token
		self.token ||= SecureRandom.uuid
	end
end

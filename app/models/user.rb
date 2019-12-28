class User < ApplicationRecord
	before_validation :assign_token

	def assign_token
		self.token ||= SecureRandom.uuid
	end
end

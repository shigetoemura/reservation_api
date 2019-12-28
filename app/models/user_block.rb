class UserBlock < ApplicationRecord
	validates :user_id, :uniqueness => {:scope => :block_user_id}

    belongs_to :user
end

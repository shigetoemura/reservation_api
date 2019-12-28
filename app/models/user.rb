class User < ApplicationRecord
	before_validation :assign_token

    has_many :user_restaurants, dependent: :destroy
    has_many :restaurants, through: :user_restaurants, dependent: :destroy
    has_many :user_images, dependent: :destroy


    has_many :user_reports, foreign_key: "user_id", dependent: :destroy
    has_many :user_reports, foreign_key: "report_user_id", dependent: :destroy

    has_many :user_blocks, foreign_key: "user_id", dependent: :destroy
    has_many :user_blocks, foreign_key: "block_user_id", dependent: :destroy

    has_many :match_requests, foreign_key: "from_user_id", dependent: :destroy
    has_many :match_requests, foreign_key: "to_user_id", dependent: :destroy

    has_one :user_age_verification, dependent: :destroy

    def assign_token
        self.token ||= SecureRandom.uuid
    end

end

class MatchRequest < ApplicationRecord
	validates :from_user_id, :uniqueness => {:scope => :to_user_id}
    validates :from_user_id, :to_user_id, :user_restaurant_id, presence: true

    belongs_to :match, foreign_key: "match_request_id"

    belongs_to :user, foreign_key: "to_user_id"
    belongs_to :user, foreign_key: "from_user_id"
end

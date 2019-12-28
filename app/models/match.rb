class Match < ApplicationRecord
	has_one :chat, dependent: :destroy
    has_many :candidate_dates, dependent: :destroy
    has_one :match_request
    has_one :reservation


    validates :match_request_id, presence: true
end

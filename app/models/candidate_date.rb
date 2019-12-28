class CandidateDate < ApplicationRecord
	belongs_to :match
    has_one :reservation
end

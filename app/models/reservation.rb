class Reservation < ApplicationRecord
	belongs_to :match
    belongs_to :candidate_date
end

class Candidate < ApplicationRecord
	has_one :recommendation
	has_many :interviews
	has_one :firm, -> { where(recruiter: true)}, through: :recommendation
	has_many :firms, through: :interviews
end

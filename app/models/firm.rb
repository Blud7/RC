class Firm < ApplicationRecord
	has_many :recommendations
	has_many :interviews
	has_many :candidates, through: :recommendations
	has_many :candidates, through: :interviews
end

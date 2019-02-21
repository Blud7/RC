class Recommendation < ApplicationRecord
	belongs_to :firm
	belongs_to :candidate
end

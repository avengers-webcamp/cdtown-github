class Arrival < ApplicationRecord
	belongs_to :cd, optional: true

	validates :arrive_count, presence: true
end

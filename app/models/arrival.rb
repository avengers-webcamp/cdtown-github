class Arrival < ApplicationRecord
	acts_as_paranoid
	belongs_to :cd, optional: true
end

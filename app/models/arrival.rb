class Arrival < ApplicationRecord
	acts_as_paranoid
	has_many :cds
end

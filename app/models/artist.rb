class Artist < ApplicationRecord
	has_many :cds

	validates :name ,presence: true
end

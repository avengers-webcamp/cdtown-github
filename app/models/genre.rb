class Genre < ApplicationRecord
	has_many :cds

	validates :name ,presence: true
end

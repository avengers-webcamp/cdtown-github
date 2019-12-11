class Disc < ApplicationRecord
	belongs_to :cd
	has_many :songs
end

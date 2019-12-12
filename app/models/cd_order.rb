class CdOrder < ApplicationRecord
	acts_as_paranoid
	belongs_to :cd
	belongs_to :order
end

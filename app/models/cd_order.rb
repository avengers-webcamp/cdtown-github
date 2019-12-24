class CdOrder < ApplicationRecord
	acts_as_paranoid
	belongs_to :cd, -> { with_deleted }
	belongs_to :order
end

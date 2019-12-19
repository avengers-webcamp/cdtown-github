class UserCd < ApplicationRecord
	belongs_to :user
	belongs_to :cd
	default_scope -> { order(created_at: :desc) }
end

class DeliverAddress < ApplicationRecord
	belongs_to :user

	validates :deliver_post_front, presence: true
	validates :deliver_post_back, presence: true
	validates :deliver_prefecture, presence: true
	validates :deliver_town, presence: true
	validates :deliver_post_number, presence: true
end

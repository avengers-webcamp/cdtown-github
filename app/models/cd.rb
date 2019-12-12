class Cd < ApplicationRecord

    attachment :jacket_image

	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	belongs_to :arrival
	has_many :discs
	has_many :user_cds
	has_many :users, through: :user_cds, source: :user
	has_many :cd_orders
	has_many :orders, through: :cd_orders, source: :order
end

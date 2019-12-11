class Cd < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	belongs_to :arrival
	has_many :discs
	has_many :user_cds
	has_many :users, throuth: :user_cds, source: :user
	has_many :cd_orders
	has_many :orders, throuth: :cd_orders, source: :order
end

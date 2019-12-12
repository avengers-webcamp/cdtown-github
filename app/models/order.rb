class Order < ApplicationRecord
	acts_as_paranoid
	belongs_to :user
	has_many :cd_orders
	has_many :cds, through: :cd_orders, source: :cd
end

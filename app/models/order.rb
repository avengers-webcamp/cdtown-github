class Order < ApplicationRecord
	belongs_to :user
	has_many :cd_orders
	has_many :cds, throuth: :cd_orders, source: :cd
end

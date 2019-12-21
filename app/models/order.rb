class Order < ApplicationRecord
	acts_as_paranoid
	belongs_to :user
	has_many :cd_orders
	has_many :cds, through: :cd_orders, source: :cd

	enum status: {
		発送中: 0,
		発送済み: 1
		 }

   validates :user_id, presence: true
   validates :shipping_day, presence: true
   validates :payment, presence: true
end

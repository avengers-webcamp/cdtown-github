class Order < ApplicationRecord
	acts_as_paranoid
	belongs_to :user
	has_many :cd_orders
	has_many :cds, through: :cd_orders, source: :cd

	enum status: {
		発送中: 0,
		発送済み: 1,
		発送準備中: 2
		 }

   validates :user_id, presence: true
   validates :shipping_day, presence: true
   validates :payment, presence: true

   validates :last_name, presence: true
   validates :first_name, presence: true
   validates :post_front, presence: true
   validates :post_back, presence: true
   validates :prefecture, presence: true
   validates :town, presence: true
   validates :post_number, presence: true
   validates :condo, presence: true
end

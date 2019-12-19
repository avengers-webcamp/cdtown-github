class Cd < ApplicationRecord
    acts_as_paranoid
    attachment :jacket_image

	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	has_many :arrivals

	has_many :discs, inverse_of: :cd
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	has_many :user_cds
	has_many :users, through: :user_cds, source: :user
	has_many :cd_orders
	has_many :orders, through: :cd_orders, source: :order


	enum status: {
		sold: 0,
		soldout: 1
		 }


end
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

    def incart(user)
        user_cds.create(user_id: user.id)
    end

<<<<<<< HEAD
	enum status: {
		sold: 0,
		soldout: 1
		 }


=======
    def uniine(user)
        user_cds.find_by(user_id: user.id).destroy
    end
>>>>>>> a5e9173dba6b725591d2b99e0d84e8bd5e2c17b1
end
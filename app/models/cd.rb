class Cd < ApplicationRecord
    acts_as_paranoid
    attachment :jacket_image

	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	has_many :arrivals

	has_many :discs, inverse_of: :cd
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

	has_many :user_cds, foreign_key: 'Cd_id'
	has_many :users, through: :user_cds, source: :user
	has_many :cd_orders
	has_many :orders, through: :cd_orders, source: :order
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

	default_scope -> { order(created_at: :desc) }

    def incart(user)
        user_cds.create(user_id: user.id)
    end

    def self.search(search)
    if search
      Cd.where(['name LIKE ?', "%#{search}%"])
    else
      Cd.all
    end
    end

	enum status: {
		販売中: 0,
		販売停止中: 1
		 }

    validates :price, presence: true
    validates :released_at, presence: true
    validates :name, presence: true
    validates :genre_id, presence: true
    validates :label_id, presence: true
    validates :artist_id, presence: true
    validates :status, presence: true


    def uniine(user)
        user_cds.find_by(user_id: user.id).destroy
    end
end
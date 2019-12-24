class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliver_addresses, dependent: :destroy
  has_many :orders
  has_many :user_cds, foreign_key: 'User_id',dependent: :destroy
  has_many :cds , through: :user_cds, source: :cd
  has_many :likes, dependent: :destroy
  has_many :liked_cds, through: :likes, source: :cd

  validates :last_name, presence: true

  validates :first_name, presence: true

  validates :post_front, presence: true

  validates :post_back, presence: true

  validates :prefecture, presence: true

  validates :town, presence: true

  validates :post_number, presence: true

  validates :phone_number, presence: true, uniqueness: true

  validates :encrypted_password, presence: true, uniqueness: true, confirmation: true, length: { minimum: 6 }

  validates :email,presence: true


end


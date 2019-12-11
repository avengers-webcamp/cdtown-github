class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliver_addresses, dependent: :destroy
  has_many :orders
  has_many :user_cds
  has_many :cds , through: :user_cds, source: :cd
end

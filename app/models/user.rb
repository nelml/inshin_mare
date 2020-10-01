class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favgenres, dependent: :destroy
  has_many :favarticles, dependent: :destroy
  has_many :genres
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :contact_us
  attachment :image
end

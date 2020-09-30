class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre
  has_many :favarticles, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image
end

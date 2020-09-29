class Article < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre
  has_many :favarticles
  has_many :comments
  attachment :image
end

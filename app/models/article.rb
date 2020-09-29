class Article < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favarticles
  has_many :comments
  attachment :image_id
end

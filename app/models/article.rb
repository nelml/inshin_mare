class Article < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :favarticles
  has_many :comments
end

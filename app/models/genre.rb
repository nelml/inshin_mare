class Genre < ApplicationRecord
  belongs_to :user
  has_many :articles
  has_many :favgenres
end

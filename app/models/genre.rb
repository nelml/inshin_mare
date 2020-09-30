class Genre < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :favgenres, dependent: :destroy
end

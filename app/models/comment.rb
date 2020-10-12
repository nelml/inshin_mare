class Comment < ApplicationRecord
  belongs_to :article
  attachment :image
end

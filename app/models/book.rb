class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :profile_image

  validates :title, presence: true
  validates :body, length: { in: 1..200 }
end

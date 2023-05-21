class Comic < ApplicationRecord
  belongs_to :work
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many_attached :images
end

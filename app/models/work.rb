class Work < ApplicationRecord
  belongs_to :user
  has_many :comics, dependent: :destroy
  has_many :users, through: :book_marks
  has_one_attached :image
end

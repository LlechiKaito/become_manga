class Comic < ApplicationRecord
  belongs_to :work
  has_many_attached :images
end

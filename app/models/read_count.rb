class ReadCount < ApplicationRecord
  belongs_to :user
  belongs_to :comic
end

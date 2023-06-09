class Inquiry < ApplicationRecord
    belongs_to :user

    validates :inquiry, length: { minimum: 1, maximum: 100, message: "is more than 100characters" }
end

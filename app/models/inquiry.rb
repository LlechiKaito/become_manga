class Inquiry < ApplicationRecord
    belongs_to :user

    validates :inquiry, presence: true
    validates :inquiry, length: { minimum: 1, maximum: 70000, message: "は1文字以上70000文字以下にしてください" }
end

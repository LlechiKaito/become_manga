class Work < ApplicationRecord
  belongs_to :user
  has_many :comics, dependent: :destroy
  has_many :users, through: :book_marks
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :main_title, presence: true
  validates :main_title, length: { minimum: 1, maximum: 100, message: "is more than 100characters" }
  validates :explanation, presence: true
  validates :explanation, length: { minimum: 1, maximum: 70000, message: "is more than 70000characters" }

end

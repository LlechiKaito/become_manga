class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  has_many :works
  has_many :works, through: :book_marks
  has_many :book_marks
  
  validates :nickname, presence: true
  validates :profile, presence: true
end
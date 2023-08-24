class Comic < ApplicationRecord
  belongs_to :work
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many_attached :images
  has_many :read_counts, dependent: :destroy

  validates :image, presence: true
  validates :images, presence: true
  validate :validate_image_count
  def validate_image_count
    errors.add(:images, "は1枚以上50枚以下にしてください") if images.length < 1 || images.length > 50
  end
  validates :subtitle, length: { minimum: 1, maximum: 100, message: "は1文字以上100文字以下にしてください" }
  validates :work_id, presence: true
  validates :explanation, length: { minimum: 1, maximum: 70000, message: "は1文字以上70000文字以下にしてください" }

    # @comic = Comic.find(params[:id])
    # # unlessは、ifの逆です。見つからなかったら実行、つまり一人１カウントって意味です。
    # unless ReadCount.find_by(user_id: current_user.id, comic_id: @comic.id)
    #   current_user.read_counts.create(comic_id: @comic.id)
    # end
    # # これは、comicのコントローラーに書くやつね（間違えていたらすみません）

  # @comic.view_countとすることで、閲覧者数が返り値として返ってきます。（comicは、一つのデータね。）
  def view_count
    read_counts.count
  end

end

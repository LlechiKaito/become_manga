class Comic < ApplicationRecord
  belongs_to :work
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many_attached :images

  has_many :read_counts, dependent: :destroy

  validates :images, presence: true

  validates :images, length: { minimum: 1, maximum: 50, message: "は1枚以上50枚以下にしてください" }

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

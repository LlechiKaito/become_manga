# アプリケーション名
become_manga
# アプリケーション概要
漫画家になる人のための無料漫画投稿サービス
# URL
<a href="https://github.com/LlechiKaito/become_manga.git">githubのリンク</a>

# テスト用アカウント
・ Basic認証パスワード : <br>
・ Basic認証ID : <br>
・ メールアドレス : <br>
・ パスワード : 
# 利用方法

# アプリケーションを作成した背景
私の幼馴染が漫画家を目指しているのもあり、漫画家になる大変さを話を聞いて感じました。そこで私は、漫画家になる人の助けが何かできないかと考え、なろう小説家というwebアプリの漫画版を作れば助けになるのではないかと考え、作るに至りました。

# 洗い出した要件
<a href="https://docs.google.com/spreadsheets/d/17prS8yajtzsJHzNQzjTCSOqvt1RCIXKI8bRgmZyi3mI/edit#gid=982722306">要件を定義したシート</a>

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計
<img src="https://i.gyazo.com/0793fb855ad8f8ab2ec4a7f5d0f42102.png" alt="データベース設計の図" title="サンプル">

## テーブル設計

### usersテーブル
| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | text   | null: false               |

has_many :works<br>
has_many :inquiries<br>
has_many :works, through: :book_marks<br>
has_many :book_marks<br>
has_one_attached :image<br>

フォローをした、されたの関係<br>
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy<br>
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy<br>
<br>
一覧画面で使う<br>
has_many :followings, through: :relationships, source: :followed<br>
has_many :followers, through: :reverse_of_relationships, source: :follower

### worksテーブル
| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| main_title  | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

belongs_to :user<br>
has_many :comics, dependent: :destroy<br>
has_many :users, through: :book_marks<br>
has_many :book_marks, dependent: :destroy<br>
has_one_attached :image

### comicsテーブル
| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| subtitle | string     | null: false                    |
| work     | references | null: false, foreign_key: true |

belongs_to :work<br>
has_many :comments, dependent: :destroy<br>
has_one_attached :image<br>
has_many_attached :images

### relationshipsテーブル
| Column   | Type    | Option                         |
| -------- | ------- | ------------------------------ |
| follower | integer | null: false, foreign_key: true |
| followed | integer | null: false, foreign_key: true |

belongs_to :follower, class_name: "User"<br>
belongs_to :followed, class_name: "User"

### book_marksテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| work   | references | null: false, foreign_key: true |

belongs_to :user<br>
belongs_to :comic

### commentsテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| work    | references | null: false, foreign_key: true |

belongs_to :comic

### inquiriesテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| inquiry | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

belongs_to :user

# 画面遷移図
<img src="https://i.gyazo.com/fbd7ec014bfbfbae31f57c6526c7d191.png" alt="画面遷移図" title="サンプル">

# 開発環境
・ フロントエンド<br>
・ バックエンド<br>
・ インフラ<br>
・ テスト<br>
・ テキストエディタ<br>
・ タスク管理
# ローカルでの動作方法
以下のコマンドを実行。<br>
% git clone https://github.com/LlechiKaito/become_manga.git<br>
% cd become_manga<br>
% bundle install<br>
% yarn install

# 工夫したポイント
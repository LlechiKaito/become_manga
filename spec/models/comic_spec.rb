require 'rails_helper'

RSpec.describe Comic, type: :model do
  before do
    @comic = FactoryBot.build(:comic)
  end

  describe '漫画(comic)を新規登録' do
    context '漫画(comic)を新規登録できる場合' do
      it "全てのアソシエーションができている場合" do
        expect(@comic).to be_valid
      end
    end

    context '漫画(comic)を新規登録できない場合' do
      it "subtitleが空では登録できない場合" do
        @comic.subtitle = ''
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Subtitle は1文字以上100文字以下にしてください")
      end
      it "subtitleが101字以上では登録できない場合" do
        @comic.subtitle = Faker::Lorem.characters(number: 101)
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Subtitle は1文字以上100文字以下にしてください")
      end
      it "workのアソシエーションができていない場合登録できない場合" do
        @comic.work_id = nil
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Work must exist")
      end
      it "explanationが空では登録できない場合" do
        @comic.explanation = ''
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Explanation は1文字以上70000文字以下にしてください")
      end
      it "explanationが70001字以上では登録できない場合" do
        @comic.explanation = Faker::Lorem.characters(number: 70001)
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Explanation は1文字以上70000文字以下にしてください")
      end
      it "imageが空では登録できない場合" do
        @comic.image.attach(nil)
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Image can't be blank")
      end
      it "imagesがでは登録できない場合" do
        @comic.images = []
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Images can't be blank")
      end
      it "imagesが51枚以上では登録できない場合" do
        50.times do
          @comic.images.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
        end
        @comic.valid?
        expect(@comic.errors.full_messages).to include("Images は1枚以上50枚以下にしてください")
      end
    end
  end

end

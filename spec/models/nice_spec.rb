require 'rails_helper'

RSpec.describe Nice, type: :model do
  before do
    @nice = FactoryBot.build(:nice)
  end

  describe '閲覧者数登録' do
    context '閲覧者数を登録できる場合' do
      it "全てのアソシエーションができている場合登録できる" do
        expect(@nice).to be_valid
      end
    end

    context '閲覧者数を登録できない場合' do
      it "userのアソシエーションができていない場合登録できない" do
        @nice.user_id = nil
        @nice.valid?
        expect(@nice.errors.full_messages).to include("User must exist")
      end
      it "comicのアソシエーションができていない場合登録できない" do
        @nice.comic_id = nil
        @nice.valid?
        expect(@nice.errors.full_messages).to include("Comic must exist")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe BookMark, type: :model do
  before do
    @book_mark = FactoryBot.build(:book_mark)
  end

  describe 'ブックマーク登録' do
    context 'ブックマーク登録できる場合' do
      it "全てのアソシエーションができている場合登録できる" do
        expect(@book_mark).to be_valid
      end
    end

    context 'ブックマーク登録できない場合' do
      it "userのアソシエーションができていない場合登録できない" do
        @book_mark.user_id = nil
        @book_mark.valid?
        expect(@book_mark.errors.full_messages).to include("User can't be blank")
      end
      it "workのアソシエーションができていない場合登録できない" do
        @book_mark.work_id = nil
        @book_mark.valid?
        expect(@book_mark.errors.full_messages).to include("Work can't be blank")
      end
    end
  end
end

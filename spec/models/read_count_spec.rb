require 'rails_helper'

RSpec.describe ReadCount, type: :model do
  before do
    @read_count = FactoryBot.build(:read_count)
  end

  describe '閲覧者数登録' do
    context '閲覧者数を登録できる場合' do
      it "全てのアソシエーションができている場合登録できる" do
        expect(@read_count).to be_valid
      end
    end

    context '閲覧者数を登録できない場合' do
      it "userのアソシエーションができていない場合登録できない" do
        @read_count.user_id = nil
        @read_count.valid?
        expect(@read_count.errors.full_messages).to include("User must exist")
      end
      it "comicのアソシエーションができていない場合登録できない" do
        @read_count.work_id = nil
        @read_count.valid?
        expect(@read_count.errors.full_messages).to include("Comic must exist")
      end
    end
  end
end
